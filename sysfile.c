//
// File-system system calls.
// Mostly argument checking, since we don't trust
// user code, and calls into file.c and fs.c.
//

#include "types.h"
#include "defs.h"
#include "param.h"
#include "stat.h"
#include "mmu.h"
#include "proc.h"
#include "fs.h"
#include "file.h"
#include "fcntl.h"

#ifndef MAXPATH
#define MAXPATH 128
#endif

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int argfd(int n, int *pfd, struct file **pf)
{
    int fd;
    struct file *f;

    if(argint(n, &fd) < 0) {
        return -1;
    }

    if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0) {
        return -1;
    }

    if(pfd) {
        *pfd = fd;
    }

    if(pf) {
        *pf = f;
    }

    return 0;
}

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int fdalloc(struct file *f)
{
    int fd;

    for(fd = 0; fd < NOFILE; fd++){
        if(proc->ofile[fd] == 0){
            proc->ofile[fd] = f;
            return fd;
        }
    }

    return -1;
}

int sys_dup(void)
{
    struct file *f;
    int fd;

    if(argfd(0, 0, &f) < 0) {
        return -1;
    }

    if((fd=fdalloc(f)) < 0) {
        return -1;
    }

    filedup(f);

    return fd;
}

int sys_read(void)
{
    struct file *f;
    int n;
    char *p;

    if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0) {
        return -1;
    }

    return fileread(f, p, n);
}

int sys_write(void)
{
    struct file *f;
    int n;
    char *p;

    if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0) {
        return -1;
    }

    return filewrite(f, p, n);
}

int sys_close(void)
{
    int fd;
    struct file *f;

    if(argfd(0, &fd, &f) < 0) {
        return -1;
    }

    proc->ofile[fd] = 0;
    fileclose(f);

    return 0;
}

int sys_fstat(void)
{
    struct file *f;
    struct stat *st;

    if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0) {
        return -1;
    }

    return filestat(f, st);
}

// Create the path new as a link to the same inode as old.
int sys_link(void)
{
    char name[DIRSIZ], *new, *old;
    struct inode *dp, *ip;

    if(argstr(0, &old) < 0 || argstr(1, &new) < 0) {
        return -1;
    }

    if((ip = namei(old)) == 0) {
        return -1;
    }

    begin_trans();

    ilock(ip);

    if(ip->type == T_DIR){
        iunlockput(ip);
        commit_trans();
        return -1;
    }

    ip->nlink++;
    iupdate(ip);
    iunlock(ip);

    if((dp = nameiparent(new, name)) == 0) {
        goto bad;
    }

    ilock(dp);

    if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
        iunlockput(dp);
        goto bad;
    }

    iunlockput(dp);
    iput(ip);

    commit_trans();

    return 0;

    bad:
    ilock(ip);
    ip->nlink--;
    iupdate(ip);
    iunlockput(ip);
    commit_trans();
    return -1;
}

// Is the directory dp empty except for "." and ".." ?
static int isdirempty(struct inode *dp)
{
    int off;
    struct dirent de;

    for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
        if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
            panic("isdirempty: readi");
        }

        if(de.inum != 0) {
            return 0;
        }
    }
    return 1;
}

//PAGEBREAK!
int sys_unlink(void)
{
    struct inode *ip, *dp;
    struct dirent de;
    char name[DIRSIZ], *path;
    uint off;

    if(argstr(0, &path) < 0) {
        return -1;
    }

    if((dp = nameiparent(path, name)) == 0) {
        return -1;
    }

    begin_trans();

    ilock(dp);

    // Cannot unlink "." or "..".
    if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0) {
        goto bad;
    }

    if((ip = dirlookup(dp, name, &off)) == 0) {
        goto bad;
    }

    ilock(ip);

    if(ip->nlink < 1) {
        panic("unlink: nlink < 1");
    }

    if(ip->type == T_DIR && !isdirempty(ip)){
        iunlockput(ip);
        goto bad;
    }

    memset(&de, 0, sizeof(de));

    if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
        panic("unlink: writei");
    }

    if(ip->type == T_DIR){
        dp->nlink--;
        iupdate(dp);
    }

    iunlockput(dp);

    ip->nlink--;
    iupdate(ip);
    iunlockput(ip);

    commit_trans();

    return 0;

    bad:
    iunlockput(dp);
    commit_trans();
    return -1;
}

static struct inode* create(char *path, short type, short major, short minor)
{
    uint off;
    struct inode *ip, *dp;
    char name[DIRSIZ];

    if((dp = nameiparent(path, name)) == 0) {
        return 0;
    }

    ilock(dp);

    if((ip = dirlookup(dp, name, &off)) != 0){
        iunlockput(dp);
        ilock(ip);

        if(type == T_FILE && ip->type == T_FILE) {
            return ip;
        }

        iunlockput(ip);

        return 0;
    }

    if((ip = ialloc(dp->dev, type)) == 0) {
        panic("create: ialloc");
    }

    ilock(ip);
    ip->major = major;
    ip->minor = minor;
    ip->nlink = 1;
    iupdate(ip);

    if(type == T_DIR){  // Create . and .. entries.
        dp->nlink++;  // for ".."
        iupdate(dp);

        // No ip->nlink++ for ".": avoid cyclic ref count.
        if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0) {
            panic("create dots");
        }
    }

    if(dirlink(dp, name, ip->inum) < 0) {
        panic("create: dirlink");
    }

    iunlockput(dp);

    return ip;
}

int sys_open(void)
{
    char *path;
    int fd, omode;
    struct file *f;
    struct inode *ip;

    if(argstr(0, &path) < 0 || argint(1, &omode) < 0) {
        return -1;
    }

    if(omode & O_CREATE){
        begin_trans();
        ip = create(path, T_FILE, 0, 0);
        commit_trans();

        if(ip == 0) {
            return -1;
        }

    } else {
        if((ip = namei(path)) == 0) {
            return -1;
        }

        ilock(ip);
        // Follow symbolic links until a non-symlink inode is reached
        while (ip->type == T_SYMLINK) {
            char link_target[MAXPATH];   // Buffer to store the symlink target path
            int bytes_read;

            // Read the target path from the symlink's inode data
            bytes_read = readi(ip, link_target, 0, sizeof(link_target) - 1);
            if (bytes_read <= 0) {
                // Failed to read the symlink target
                iunlockput(ip);
                return -1;
            }

            // Null-terminate the target string
            link_target[bytes_read] = '\0';

            // Release current symlink inode before following the next link
            iunlockput(ip);

            // Look up the inode of the target path
            ip = namei(link_target);
            if (ip == 0) {
                // Target path doesn't exist
                return -1;
            }

            // Lock the new inode (it may itself be another symlink)
            ilock(ip);
        }
        if(ip->type == T_DIR && omode != O_RDONLY){
            iunlockput(ip);
            return -1;
        }
    }

    if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
        if(f) {
            fileclose(f);
        }

        iunlockput(ip);
        return -1;
    }

    iunlock(ip);

    f->type = FD_INODE;
    f->ip = ip;
    f->off = 0;
    f->readable = !(omode & O_WRONLY);
    f->writable = (omode & O_WRONLY) || (omode & O_RDWR);

    return fd;
}

int sys_mkdir(void)
{
    char *path;
    struct inode *ip;

    begin_trans();

    if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
        commit_trans();
        return -1;
    }

    iunlockput(ip);
    commit_trans();

    return 0;
}

int sys_mknod(void)
{
    struct inode *ip;
    char *path;
    int len;
    int major, minor;

    begin_trans();

    if((len=argstr(0, &path)) < 0 ||
            argint(1, &major) < 0 || argint(2, &minor) < 0 ||
            (ip = create(path, T_DEV, major, minor)) == 0){

        commit_trans();
        return -1;
    }

    iunlockput(ip);
    commit_trans();

    return 0;
}

int sys_chdir(void)
{
    char *path;
    struct inode *ip;

    if(argstr(0, &path) < 0 || (ip = namei(path)) == 0) {
        return -1;
    }

    ilock(ip);

    if(ip->type != T_DIR){
        iunlockput(ip);
        return -1;
    }

    iunlock(ip);

    iput(proc->cwd);
    proc->cwd = ip;

    return 0;
}

int sys_exec(void)
{
    char *path, *argv[MAXARG];
    int i;
    uint uargv, uarg;

    if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
        return -1;
    }

    memset(argv, 0, sizeof(argv));

    for(i=0;; i++){
        if(i >= NELEM(argv)) {
            return -1;
        }

        if(fetchint(uargv+4*i, (int*)&uarg) < 0) {
            return -1;
        }

        if(uarg == 0){
            argv[i] = 0;
            break;
        }

        if(fetchstr(uarg, &argv[i]) < 0) {
            return -1;
        }
    }

    return exec(path, argv);
}

int sys_pipe(void)
{
    int *fd;
    struct file *rf, *wf;
    int fd0, fd1;

    if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0) {
        return -1;
    }

    if(pipealloc(&rf, &wf) < 0) {
        return -1;
    }

    fd0 = -1;

    if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
        if(fd0 >= 0) {
            proc->ofile[fd0] = 0;
        }

        fileclose(rf);
        fileclose(wf);

        return -1;
    }

    fd[0] = fd0;
    fd[1] = fd1;

    return 0;
}


// sys_symlink - System call to create a symbolic link
//   target : path that the symlink should point to
//   path  : location/name of the symbolic link to be created
// Returns 0 on success, -1 on failure
int sys_symlink(void) {
    char *target_path;        // The destination the symlink points to
    char *link_path;          // The name/path of the symlink file
    struct inode *parent_dir; // Parent directory inode of the new link
    struct inode *link_inode; // Inode for the symbolic link
    char name[DIRSIZ];        // Name of the new symbolic link file

    // Retrieve arguments from user space
    if (argstr(0, &target_path) < 0 || argstr(1, &link_path) < 0) {
        return -1;
    }

    // Get parent directory and final name of the symlink
    parent_dir = nameiparent(link_path, name);
    if (parent_dir == 0)
        return -1;

    // Begin file system transaction
    begin_trans();
    ilock(parent_dir);

    // Check if a file with the same name already exists
    if (dirlookup(parent_dir, name, 0) != 0) {
        iunlockput(parent_dir);
        commit_trans();
        return -1;
    }

    // Allocate a new inode for the symbolic link
    link_inode = ialloc(parent_dir->dev, T_SYMLINK);
    if (link_inode == 0) {
        iunlock(parent_dir);
        commit_trans();
        return -1;
    }

    // Initialize the inode
    ilock(link_inode);
    link_inode->nlink = 1;
    link_inode->size = strlen(target_path);
    iupdate(link_inode);

    // Write the target path into the symlink file's data block
    if (writei(link_inode, target_path, 0, link_inode->size) != link_inode->size) {
        // Writing failed → clean up
        link_inode->nlink = 0;
        iupdate(link_inode);
        iunlockput(link_inode);
        iunlockput(parent_dir);
        commit_trans();
        return -1;
    }

    // Done writing → unlock the inode
    iunlock(link_inode);

    // Add the new symlink entry into the parent directory
    if (dirlink(parent_dir, name, link_inode->inum) < 0) {
        // Directory entry creation failed → clean up
        link_inode->nlink = 0;
        iupdate(link_inode);
        iput(link_inode);
        iunlockput(parent_dir);
        commit_trans();
        return -1;
    }

    // Success: cleanup and commit transaction
    iunlockput(parent_dir);
    commit_trans();

    return 0;
}
