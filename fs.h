// On-disk file system format.
// Both the kernel and user programs use this header file.

// Block 0 is unused.
// Block 1 is super block.
// Blocks 2 through sb.ninodes/IPB hold inodes.
// Then free bitmap blocks holding sb.size bits.
// Then sb.nblocks data blocks.
// Then sb.nlog log blocks.

#ifndef MAXPATH
#define SYMLINK_MAX 128
#else
#define SYMLINK_MAX MAXPATH
#endif


#define T_UNALLOC 0
#define T_DIR     1   // directory
#define T_FILE    2   // file
#define T_DEV     3   // device
#define T_SYMLINK 4   // symbolic link (new)

#define ROOTINO 1 // root i-number
#define BSIZE 512 // block size

// File system super block
struct superblock {
  uint size;    // Size of file system image (blocks)
  uint nblocks; // Number of data blocks
  uint ninodes; // Number of inodes.
  uint nlog;    // Number of log blocks
};

// MODIFIED NDIRECT to 11
#define NDIRECT 11
#define NINDIRECT (BSIZE / sizeof(uint))
// MODIFIED MAXFILE to direct (11) + single indirect + double indirect
#define MAXFILE (NDIRECT + NINDIRECT + NINDIRECT * NINDIRECT)

// On-disk inode structure
struct dinode {
  short type;  // File type
  short major; // Major device number (T_DEV only)
  short minor; // Minor device number (T_DEV only)
  short nlink; // Number of links to inode in file system
  uint size;   // Size of file (bytes)
  // MODIFIED addrs to have one more entry for double indirect
  uint addrs[NDIRECT + 2]; // Data block addresses
};

// Inodes per block.
#define IPB (BSIZE / sizeof(struct dinode))

// Block containing inode i
#define IBLOCK(i) ((i) / IPB + 2)

// Bitmap bits per block
#define BPB (BSIZE * 8)

// Block containing bit for block b
#define BBLOCK(b, ninodes) (b / BPB + (ninodes) / IPB + 3)

// Directory is a file containing a sequence of dirent structures.
#define DIRSIZ 14

struct dirent {
  ushort inum;
  char name[DIRSIZ];
};
