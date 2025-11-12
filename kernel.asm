
kernel.elf:     file format elf32-littlearm


Disassembly of section .start_sec:

00010000 <_start>:
   10000:	e59f1030 	ldr	r1, [pc, #48]	@ 10038 <jump_stack+0x10>
   10004:	e59f2030 	ldr	r2, [pc, #48]	@ 1003c <jump_stack+0x14>
   10008:	e3a03000 	mov	r3, #0
   1000c:	e1510002 	cmp	r1, r2
   10010:	b8a10008 	stmialt	r1!, {r3}
   10014:	bafffffc 	blt	1000c <_start+0xc>
   10018:	e32ff0d3 	msr	CPSR_fsxc, #211	@ 0xd3
   1001c:	e59fd01c 	ldr	sp, [pc, #28]	@ 10040 <jump_stack+0x18>
   10020:	eb0000f9 	bl	1040c <start>
   10024:	eafffffe 	b	10024 <_start+0x24>

00010028 <jump_stack>:
   10028:	e1a0000d 	mov	r0, sp
   1002c:	e2800102 	add	r0, r0, #-2147483648	@ 0x80000000
   10030:	e1a0d000 	mov	sp, r0
   10034:	e1a0f00e 	mov	pc, lr
   10038:	00010570 	.word	0x00010570
   1003c:	00019000 	.word	0x00019000
   10040:	00012000 	.word	0x00012000

00010044 <_uart_putc>:
   10044:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
   10048:	e28db000 	add	fp, sp, #0
   1004c:	e24dd014 	sub	sp, sp, #20
   10050:	e50b0010 	str	r0, [fp, #-16]
   10054:	e59f3020 	ldr	r3, [pc, #32]	@ 1007c <_uart_putc+0x38>
   10058:	e50b3008 	str	r3, [fp, #-8]
   1005c:	e51b3010 	ldr	r3, [fp, #-16]
   10060:	e6ef2073 	uxtb	r2, r3
   10064:	e51b3008 	ldr	r3, [fp, #-8]
   10068:	e5c32000 	strb	r2, [r3]
   1006c:	e1a00000 	nop			@ (mov r0, r0)
   10070:	e28bd000 	add	sp, fp, #0
   10074:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
   10078:	e12fff1e 	bx	lr
   1007c:	101f1000 	.word	0x101f1000

00010080 <_puts>:
   10080:	e92d4800 	push	{fp, lr}
   10084:	e28db004 	add	fp, sp, #4
   10088:	e24dd008 	sub	sp, sp, #8
   1008c:	e50b0008 	str	r0, [fp, #-8]
   10090:	ea000006 	b	100b0 <_puts+0x30>
   10094:	e51b3008 	ldr	r3, [fp, #-8]
   10098:	e5d33000 	ldrb	r3, [r3]
   1009c:	e1a00003 	mov	r0, r3
   100a0:	ebffffe7 	bl	10044 <_uart_putc>
   100a4:	e51b3008 	ldr	r3, [fp, #-8]
   100a8:	e2833001 	add	r3, r3, #1
   100ac:	e50b3008 	str	r3, [fp, #-8]
   100b0:	e51b3008 	ldr	r3, [fp, #-8]
   100b4:	e5d33000 	ldrb	r3, [r3]
   100b8:	e3530000 	cmp	r3, #0
   100bc:	1afffff4 	bne	10094 <_puts+0x14>
   100c0:	e1a00000 	nop			@ (mov r0, r0)
   100c4:	e1a00000 	nop			@ (mov r0, r0)
   100c8:	e24bd004 	sub	sp, fp, #4
   100cc:	e8bd8800 	pop	{fp, pc}

000100d0 <_putint>:
   100d0:	e92d4800 	push	{fp, lr}
   100d4:	e28db004 	add	fp, sp, #4
   100d8:	e24dd018 	sub	sp, sp, #24
   100dc:	e50b0010 	str	r0, [fp, #-16]
   100e0:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
   100e4:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
   100e8:	e59f307c 	ldr	r3, [pc, #124]	@ 1016c <_putint+0x9c>
   100ec:	e50b300c 	str	r3, [fp, #-12]
   100f0:	e51b3010 	ldr	r3, [fp, #-16]
   100f4:	e3530000 	cmp	r3, #0
   100f8:	0a000001 	beq	10104 <_putint+0x34>
   100fc:	e51b0010 	ldr	r0, [fp, #-16]
   10100:	ebffffde 	bl	10080 <_puts>
   10104:	e3a0301c 	mov	r3, #28
   10108:	e50b3008 	str	r3, [fp, #-8]
   1010c:	ea00000b 	b	10140 <_putint+0x70>
   10110:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
   10114:	e51b3008 	ldr	r3, [fp, #-8]
   10118:	e1a03332 	lsr	r3, r2, r3
   1011c:	e203300f 	and	r3, r3, #15
   10120:	e51b200c 	ldr	r2, [fp, #-12]
   10124:	e0823003 	add	r3, r2, r3
   10128:	e5d33000 	ldrb	r3, [r3]
   1012c:	e1a00003 	mov	r0, r3
   10130:	ebffffc3 	bl	10044 <_uart_putc>
   10134:	e51b3008 	ldr	r3, [fp, #-8]
   10138:	e2433004 	sub	r3, r3, #4
   1013c:	e50b3008 	str	r3, [fp, #-8]
   10140:	e51b3008 	ldr	r3, [fp, #-8]
   10144:	e3530000 	cmp	r3, #0
   10148:	aafffff0 	bge	10110 <_putint+0x40>
   1014c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
   10150:	e3530000 	cmp	r3, #0
   10154:	0a000001 	beq	10160 <_putint+0x90>
   10158:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
   1015c:	ebffffc7 	bl	10080 <_puts>
   10160:	e1a00000 	nop			@ (mov r0, r0)
   10164:	e24bd004 	sub	sp, fp, #4
   10168:	e8bd8800 	pop	{fp, pc}
   1016c:	000104f8 	.word	0x000104f8

00010170 <get_pde>:
   10170:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
   10174:	e28db000 	add	fp, sp, #0
   10178:	e24dd00c 	sub	sp, sp, #12
   1017c:	e50b0008 	str	r0, [fp, #-8]
   10180:	e51b3008 	ldr	r3, [fp, #-8]
   10184:	e1a03a23 	lsr	r3, r3, #20
   10188:	e50b3008 	str	r3, [fp, #-8]
   1018c:	e59f3020 	ldr	r3, [pc, #32]	@ 101b4 <get_pde+0x44>
   10190:	e5932000 	ldr	r2, [r3]
   10194:	e51b3008 	ldr	r3, [fp, #-8]
   10198:	e1a03103 	lsl	r3, r3, #2
   1019c:	e0823003 	add	r3, r2, r3
   101a0:	e5933000 	ldr	r3, [r3]
   101a4:	e1a00003 	mov	r0, r3
   101a8:	e28bd000 	add	sp, fp, #0
   101ac:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
   101b0:	e12fff1e 	bx	lr
   101b4:	00010568 	.word	0x00010568

000101b8 <set_bootpgtbl>:
   101b8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
   101bc:	e28db000 	add	fp, sp, #0
   101c0:	e24dd01c 	sub	sp, sp, #28
   101c4:	e50b0010 	str	r0, [fp, #-16]
   101c8:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
   101cc:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
   101d0:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
   101d4:	e51b3010 	ldr	r3, [fp, #-16]
   101d8:	e1a03a23 	lsr	r3, r3, #20
   101dc:	e50b3010 	str	r3, [fp, #-16]
   101e0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
   101e4:	e1a03a23 	lsr	r3, r3, #20
   101e8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
   101ec:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
   101f0:	e1a03a23 	lsr	r3, r3, #20
   101f4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
   101f8:	e3a03000 	mov	r3, #0
   101fc:	e50b300c 	str	r3, [fp, #-12]
   10200:	ea000029 	b	102ac <set_bootpgtbl+0xf4>
   10204:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
   10208:	e1a03a03 	lsl	r3, r3, #20
   1020c:	e50b3008 	str	r3, [fp, #-8]
   10210:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
   10214:	e3530000 	cmp	r3, #0
   10218:	1a000004 	bne	10230 <set_bootpgtbl+0x78>
   1021c:	e51b3008 	ldr	r3, [fp, #-8]
   10220:	e3833b01 	orr	r3, r3, #1024	@ 0x400
   10224:	e383300e 	orr	r3, r3, #14
   10228:	e50b3008 	str	r3, [fp, #-8]
   1022c:	ea000003 	b	10240 <set_bootpgtbl+0x88>
   10230:	e51b3008 	ldr	r3, [fp, #-8]
   10234:	e3833b01 	orr	r3, r3, #1024	@ 0x400
   10238:	e3833002 	orr	r3, r3, #2
   1023c:	e50b3008 	str	r3, [fp, #-8]
   10240:	e51b3010 	ldr	r3, [fp, #-16]
   10244:	e35300ff 	cmp	r3, #255	@ 0xff
   10248:	8a000007 	bhi	1026c <set_bootpgtbl+0xb4>
   1024c:	e59f307c 	ldr	r3, [pc, #124]	@ 102d0 <set_bootpgtbl+0x118>
   10250:	e5932000 	ldr	r2, [r3]
   10254:	e51b3010 	ldr	r3, [fp, #-16]
   10258:	e1a03103 	lsl	r3, r3, #2
   1025c:	e0823003 	add	r3, r2, r3
   10260:	e51b2008 	ldr	r2, [fp, #-8]
   10264:	e5832000 	str	r2, [r3]
   10268:	ea000006 	b	10288 <set_bootpgtbl+0xd0>
   1026c:	e59f3060 	ldr	r3, [pc, #96]	@ 102d4 <set_bootpgtbl+0x11c>
   10270:	e5932000 	ldr	r2, [r3]
   10274:	e51b3010 	ldr	r3, [fp, #-16]
   10278:	e1a03103 	lsl	r3, r3, #2
   1027c:	e0823003 	add	r3, r2, r3
   10280:	e51b2008 	ldr	r2, [fp, #-8]
   10284:	e5832000 	str	r2, [r3]
   10288:	e51b3010 	ldr	r3, [fp, #-16]
   1028c:	e2833001 	add	r3, r3, #1
   10290:	e50b3010 	str	r3, [fp, #-16]
   10294:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
   10298:	e2833001 	add	r3, r3, #1
   1029c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
   102a0:	e51b300c 	ldr	r3, [fp, #-12]
   102a4:	e2833001 	add	r3, r3, #1
   102a8:	e50b300c 	str	r3, [fp, #-12]
   102ac:	e51b300c 	ldr	r3, [fp, #-12]
   102b0:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
   102b4:	e1520003 	cmp	r2, r3
   102b8:	8affffd1 	bhi	10204 <set_bootpgtbl+0x4c>
   102bc:	e1a00000 	nop			@ (mov r0, r0)
   102c0:	e1a00000 	nop			@ (mov r0, r0)
   102c4:	e28bd000 	add	sp, fp, #0
   102c8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
   102cc:	e12fff1e 	bx	lr
   102d0:	0001056c 	.word	0x0001056c
   102d4:	00010568 	.word	0x00010568

000102d8 <_flush_all>:
   102d8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
   102dc:	e28db000 	add	fp, sp, #0
   102e0:	e24dd00c 	sub	sp, sp, #12
   102e4:	e3a03000 	mov	r3, #0
   102e8:	e50b3008 	str	r3, [fp, #-8]
   102ec:	e51b3008 	ldr	r3, [fp, #-8]
   102f0:	ee083f17 	mcr	15, 0, r3, cr8, cr7, {0}
   102f4:	e1a00000 	nop			@ (mov r0, r0)
   102f8:	e28bd000 	add	sp, fp, #0
   102fc:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
   10300:	e12fff1e 	bx	lr

00010304 <load_pgtlb>:
   10304:	e92d4800 	push	{fp, lr}
   10308:	e28db004 	add	fp, sp, #4
   1030c:	e24dd018 	sub	sp, sp, #24
   10310:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
   10314:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
   10318:	ee103f10 	mrc	15, 0, r3, cr0, cr0, {0}
   1031c:	e50b3008 	str	r3, [fp, #-8]
   10320:	e51b3008 	ldr	r3, [fp, #-8]
   10324:	e1a03823 	lsr	r3, r3, #16
   10328:	e6ef3073 	uxtb	r3, r3
   1032c:	e203300f 	and	r3, r3, #15
   10330:	e54b3009 	strb	r3, [fp, #-9]
   10334:	e55b3009 	ldrb	r3, [fp, #-9]
   10338:	e3530007 	cmp	r3, #7
   1033c:	0a000004 	beq	10354 <load_pgtlb+0x50>
   10340:	e55b3009 	ldrb	r3, [fp, #-9]
   10344:	e353000f 	cmp	r3, #15
   10348:	0a000001 	beq	10354 <load_pgtlb+0x50>
   1034c:	e59f0074 	ldr	r0, [pc, #116]	@ 103c8 <load_pgtlb+0xc4>
   10350:	ebffff4a 	bl	10080 <_puts>
   10354:	e59f3070 	ldr	r3, [pc, #112]	@ 103cc <load_pgtlb+0xc8>
   10358:	e50b3010 	str	r3, [fp, #-16]
   1035c:	e51b3010 	ldr	r3, [fp, #-16]
   10360:	ee033f10 	mcr	15, 0, r3, cr3, cr0, {0}
   10364:	e3a03004 	mov	r3, #4
   10368:	e50b3010 	str	r3, [fp, #-16]
   1036c:	e51b3010 	ldr	r3, [fp, #-16]
   10370:	ee023f50 	mcr	15, 0, r3, cr2, cr0, {2}
   10374:	e59f3054 	ldr	r3, [pc, #84]	@ 103d0 <load_pgtlb+0xcc>
   10378:	e5933000 	ldr	r3, [r3]
   1037c:	e50b3010 	str	r3, [fp, #-16]
   10380:	e51b3010 	ldr	r3, [fp, #-16]
   10384:	ee023f30 	mcr	15, 0, r3, cr2, cr0, {1}
   10388:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
   1038c:	e50b3010 	str	r3, [fp, #-16]
   10390:	e51b3010 	ldr	r3, [fp, #-16]
   10394:	ee023f10 	mcr	15, 0, r3, cr2, cr0, {0}
   10398:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
   1039c:	e50b3010 	str	r3, [fp, #-16]
   103a0:	e51b2010 	ldr	r2, [fp, #-16]
   103a4:	e59f3028 	ldr	r3, [pc, #40]	@ 103d4 <load_pgtlb+0xd0>
   103a8:	e1823003 	orr	r3, r2, r3
   103ac:	e50b3010 	str	r3, [fp, #-16]
   103b0:	e51b3010 	ldr	r3, [fp, #-16]
   103b4:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
   103b8:	ebffffc6 	bl	102d8 <_flush_all>
   103bc:	e1a00000 	nop			@ (mov r0, r0)
   103c0:	e24bd004 	sub	sp, fp, #4
   103c4:	e8bd8800 	pop	{fp, pc}
   103c8:	0001050c 	.word	0x0001050c
   103cc:	55555555 	.word	0x55555555
   103d0:	00010568 	.word	0x00010568
   103d4:	0080300d 	.word	0x0080300d

000103d8 <clear_bss>:
   103d8:	e92d4800 	push	{fp, lr}
   103dc:	e28db004 	add	fp, sp, #4
   103e0:	e59f201c 	ldr	r2, [pc, #28]	@ 10404 <clear_bss+0x2c>
   103e4:	e59f301c 	ldr	r3, [pc, #28]	@ 10408 <clear_bss+0x30>
   103e8:	e0423003 	sub	r3, r2, r3
   103ec:	e1a02003 	mov	r2, r3
   103f0:	e3a01000 	mov	r1, #0
   103f4:	e59f000c 	ldr	r0, [pc, #12]	@ 10408 <clear_bss+0x30>
   103f8:	eb000038 	bl	104e0 <__memset_veneer>
   103fc:	e1a00000 	nop			@ (mov r0, r0)
   10400:	e8bd8800 	pop	{fp, pc}
   10404:	800da000 	.word	0x800da000
   10408:	800d3724 	.word	0x800d3724

0001040c <start>:
   1040c:	e92d4800 	push	{fp, lr}
   10410:	e28db004 	add	fp, sp, #4
   10414:	e24dd008 	sub	sp, sp, #8
   10418:	e59f00a4 	ldr	r0, [pc, #164]	@ 104c4 <start+0xb8>
   1041c:	ebffff17 	bl	10080 <_puts>
   10420:	e3a03000 	mov	r3, #0
   10424:	e3a02601 	mov	r2, #1048576	@ 0x100000
   10428:	e3a01000 	mov	r1, #0
   1042c:	e3a00000 	mov	r0, #0
   10430:	ebffff60 	bl	101b8 <set_bootpgtbl>
   10434:	e3a03000 	mov	r3, #0
   10438:	e3a02601 	mov	r2, #1048576	@ 0x100000
   1043c:	e3a01000 	mov	r1, #0
   10440:	e3a00102 	mov	r0, #-2147483648	@ 0x80000000
   10444:	ebffff5b 	bl	101b8 <set_bootpgtbl>
   10448:	e59f3078 	ldr	r3, [pc, #120]	@ 104c8 <start+0xbc>
   1044c:	e50b3008 	str	r3, [fp, #-8]
   10450:	e59f2074 	ldr	r2, [pc, #116]	@ 104cc <start+0xc0>
   10454:	e51b3008 	ldr	r3, [fp, #-8]
   10458:	e1530002 	cmp	r3, r2
   1045c:	8a000001 	bhi	10468 <start+0x5c>
   10460:	e59f0068 	ldr	r0, [pc, #104]	@ 104d0 <start+0xc4>
   10464:	eb00001f 	bl	104e8 <__cprintf_veneer>
   10468:	e3a03000 	mov	r3, #0
   1046c:	e3a02601 	mov	r2, #1048576	@ 0x100000
   10470:	e3a01000 	mov	r1, #0
   10474:	e59f0058 	ldr	r0, [pc, #88]	@ 104d4 <start+0xc8>
   10478:	ebffff4e 	bl	101b8 <set_bootpgtbl>
   1047c:	e3a03001 	mov	r3, #1
   10480:	e3a02302 	mov	r2, #134217728	@ 0x8000000
   10484:	e3a01201 	mov	r1, #268435456	@ 0x10000000
   10488:	e3a00209 	mov	r0, #-1879048192	@ 0x90000000
   1048c:	ebffff49 	bl	101b8 <set_bootpgtbl>
   10490:	e59f3040 	ldr	r3, [pc, #64]	@ 104d8 <start+0xcc>
   10494:	e5933000 	ldr	r3, [r3]
   10498:	e59f203c 	ldr	r2, [pc, #60]	@ 104dc <start+0xd0>
   1049c:	e5922000 	ldr	r2, [r2]
   104a0:	e1a01002 	mov	r1, r2
   104a4:	e1a00003 	mov	r0, r3
   104a8:	ebffff95 	bl	10304 <load_pgtlb>
   104ac:	ebfffedd 	bl	10028 <jump_stack>
   104b0:	ebffffc8 	bl	103d8 <clear_bss>
   104b4:	eb00000d 	bl	104f0 <__kmain_veneer>
   104b8:	e1a00000 	nop			@ (mov r0, r0)
   104bc:	e24bd004 	sub	sp, fp, #4
   104c0:	e8bd8800 	pop	{fp, pc}
   104c4:	00010524 	.word	0x00010524
   104c8:	800f0000 	.word	0x800f0000
   104cc:	800da000 	.word	0x800da000
   104d0:	00010540 	.word	0x00010540
   104d4:	ffff0000 	.word	0xffff0000
   104d8:	00010568 	.word	0x00010568
   104dc:	0001056c 	.word	0x0001056c

000104e0 <__memset_veneer>:
   104e0:	e51ff004 	ldr	pc, [pc, #-4]	@ 104e4 <__memset_veneer+0x4>
   104e4:	80020000 	.word	0x80020000

000104e8 <__cprintf_veneer>:
   104e8:	e51ff004 	ldr	pc, [pc, #-4]	@ 104ec <__cprintf_veneer+0x4>
   104ec:	80021894 	.word	0x80021894

000104f0 <__kmain_veneer>:
   104f0:	e51ff004 	ldr	pc, [pc, #-4]	@ 104f4 <__kmain_veneer+0x4>
   104f4:	80024954 	.word	0x80024954
   104f8:	33323130 	.word	0x33323130
   104fc:	37363534 	.word	0x37363534
   10500:	42413938 	.word	0x42413938
   10504:	46454443 	.word	0x46454443
   10508:	00000000 	.word	0x00000000
   1050c:	6465656e 	.word	0x6465656e
   10510:	52414120 	.word	0x52414120
   10514:	3676204d 	.word	0x3676204d
   10518:	20726f20 	.word	0x20726f20
   1051c:	68676968 	.word	0x68676968
   10520:	000a7265 	.word	0x000a7265
   10524:	72617473 	.word	0x72617473
   10528:	676e6974 	.word	0x676e6974
   1052c:	36767820 	.word	0x36767820
   10530:	726f6620 	.word	0x726f6620
   10534:	4d524120 	.word	0x4d524120
   10538:	0a2e2e2e 	.word	0x0a2e2e2e
   1053c:	00000000 	.word	0x00000000
   10540:	6f727265 	.word	0x6f727265
   10544:	76203a72 	.word	0x76203a72
   10548:	6f746365 	.word	0x6f746365
   1054c:	61742072 	.word	0x61742072
   10550:	20656c62 	.word	0x20656c62
   10554:	7265766f 	.word	0x7265766f
   10558:	7370616c 	.word	0x7370616c
   1055c:	72656b20 	.word	0x72656b20
   10560:	0a6c656e 	.word	0x0a6c656e
   10564:	00000000 	.word	0x00000000

00010568 <kernel_pgtbl>:
   10568:	00014000                                .@..

0001056c <user_pgtbl>:
   1056c:	00018000                                ....

00010570 <edata_entry>:
	...

00012000 <svc_stktop>:
	...

00014000 <_kernel_pgtbl>:
	...

00018000 <_user_pgtbl>:
	...

Disassembly of section .text:

80020000 <memset>:
80020000:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80020004:	e28db000 	add	fp, sp, #0
80020008:	e24dd024 	sub	sp, sp, #36	@ 0x24
8002000c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80020010:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
80020014:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
80020018:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002001c:	e50b3008 	str	r3, [fp, #-8]
80020020:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80020024:	e54b300d 	strb	r3, [fp, #-13]
80020028:	e55b200d 	ldrb	r2, [fp, #-13]
8002002c:	e1a03002 	mov	r3, r2
80020030:	e1a03403 	lsl	r3, r3, #8
80020034:	e0833002 	add	r3, r3, r2
80020038:	e1a03803 	lsl	r3, r3, #16
8002003c:	e1a02003 	mov	r2, r3
80020040:	e55b300d 	ldrb	r3, [fp, #-13]
80020044:	e1a03403 	lsl	r3, r3, #8
80020048:	e1822003 	orr	r2, r2, r3
8002004c:	e55b300d 	ldrb	r3, [fp, #-13]
80020050:	e1823003 	orr	r3, r2, r3
80020054:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80020058:	ea000008 	b	80020080 <memset+0x80>
8002005c:	e51b3008 	ldr	r3, [fp, #-8]
80020060:	e55b200d 	ldrb	r2, [fp, #-13]
80020064:	e5c32000 	strb	r2, [r3]
80020068:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8002006c:	e2433001 	sub	r3, r3, #1
80020070:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80020074:	e51b3008 	ldr	r3, [fp, #-8]
80020078:	e2833001 	add	r3, r3, #1
8002007c:	e50b3008 	str	r3, [fp, #-8]
80020080:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80020084:	e3530000 	cmp	r3, #0
80020088:	da000003 	ble	8002009c <memset+0x9c>
8002008c:	e51b3008 	ldr	r3, [fp, #-8]
80020090:	e2033003 	and	r3, r3, #3
80020094:	e3530000 	cmp	r3, #0
80020098:	1affffef 	bne	8002005c <memset+0x5c>
8002009c:	e51b3008 	ldr	r3, [fp, #-8]
800200a0:	e50b300c 	str	r3, [fp, #-12]
800200a4:	ea000008 	b	800200cc <memset+0xcc>
800200a8:	e51b300c 	ldr	r3, [fp, #-12]
800200ac:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800200b0:	e5832000 	str	r2, [r3]
800200b4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800200b8:	e2433004 	sub	r3, r3, #4
800200bc:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
800200c0:	e51b300c 	ldr	r3, [fp, #-12]
800200c4:	e2833004 	add	r3, r3, #4
800200c8:	e50b300c 	str	r3, [fp, #-12]
800200cc:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800200d0:	e3530003 	cmp	r3, #3
800200d4:	cafffff3 	bgt	800200a8 <memset+0xa8>
800200d8:	e51b300c 	ldr	r3, [fp, #-12]
800200dc:	e50b3008 	str	r3, [fp, #-8]
800200e0:	ea000008 	b	80020108 <memset+0x108>
800200e4:	e51b3008 	ldr	r3, [fp, #-8]
800200e8:	e55b200d 	ldrb	r2, [fp, #-13]
800200ec:	e5c32000 	strb	r2, [r3]
800200f0:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800200f4:	e2433001 	sub	r3, r3, #1
800200f8:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
800200fc:	e51b3008 	ldr	r3, [fp, #-8]
80020100:	e2833001 	add	r3, r3, #1
80020104:	e50b3008 	str	r3, [fp, #-8]
80020108:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8002010c:	e3530000 	cmp	r3, #0
80020110:	cafffff3 	bgt	800200e4 <memset+0xe4>
80020114:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80020118:	e1a00003 	mov	r0, r3
8002011c:	e28bd000 	add	sp, fp, #0
80020120:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80020124:	e12fff1e 	bx	lr

80020128 <memcmp>:
80020128:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
8002012c:	e28db000 	add	fp, sp, #0
80020130:	e24dd01c 	sub	sp, sp, #28
80020134:	e50b0010 	str	r0, [fp, #-16]
80020138:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
8002013c:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80020140:	e51b3010 	ldr	r3, [fp, #-16]
80020144:	e50b3008 	str	r3, [fp, #-8]
80020148:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8002014c:	e50b300c 	str	r3, [fp, #-12]
80020150:	ea000012 	b	800201a0 <memcmp+0x78>
80020154:	e51b3008 	ldr	r3, [fp, #-8]
80020158:	e5d32000 	ldrb	r2, [r3]
8002015c:	e51b300c 	ldr	r3, [fp, #-12]
80020160:	e5d33000 	ldrb	r3, [r3]
80020164:	e1520003 	cmp	r2, r3
80020168:	0a000006 	beq	80020188 <memcmp+0x60>
8002016c:	e51b3008 	ldr	r3, [fp, #-8]
80020170:	e5d33000 	ldrb	r3, [r3]
80020174:	e1a02003 	mov	r2, r3
80020178:	e51b300c 	ldr	r3, [fp, #-12]
8002017c:	e5d33000 	ldrb	r3, [r3]
80020180:	e0423003 	sub	r3, r2, r3
80020184:	ea00000b 	b	800201b8 <memcmp+0x90>
80020188:	e51b3008 	ldr	r3, [fp, #-8]
8002018c:	e2833001 	add	r3, r3, #1
80020190:	e50b3008 	str	r3, [fp, #-8]
80020194:	e51b300c 	ldr	r3, [fp, #-12]
80020198:	e2833001 	add	r3, r3, #1
8002019c:	e50b300c 	str	r3, [fp, #-12]
800201a0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800201a4:	e2432001 	sub	r2, r3, #1
800201a8:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
800201ac:	e3530000 	cmp	r3, #0
800201b0:	1affffe7 	bne	80020154 <memcmp+0x2c>
800201b4:	e3a03000 	mov	r3, #0
800201b8:	e1a00003 	mov	r0, r3
800201bc:	e28bd000 	add	sp, fp, #0
800201c0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
800201c4:	e12fff1e 	bx	lr

800201c8 <memmove>:
800201c8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
800201cc:	e28db000 	add	fp, sp, #0
800201d0:	e24dd01c 	sub	sp, sp, #28
800201d4:	e50b0010 	str	r0, [fp, #-16]
800201d8:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
800201dc:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
800201e0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800201e4:	e50b3008 	str	r3, [fp, #-8]
800201e8:	e51b3010 	ldr	r3, [fp, #-16]
800201ec:	e50b300c 	str	r3, [fp, #-12]
800201f0:	e51b2008 	ldr	r2, [fp, #-8]
800201f4:	e51b300c 	ldr	r3, [fp, #-12]
800201f8:	e1520003 	cmp	r2, r3
800201fc:	2a000026 	bcs	8002029c <memmove+0xd4>
80020200:	e51b2008 	ldr	r2, [fp, #-8]
80020204:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80020208:	e0823003 	add	r3, r2, r3
8002020c:	e51b200c 	ldr	r2, [fp, #-12]
80020210:	e1520003 	cmp	r2, r3
80020214:	2a000020 	bcs	8002029c <memmove+0xd4>
80020218:	e51b2008 	ldr	r2, [fp, #-8]
8002021c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80020220:	e0823003 	add	r3, r2, r3
80020224:	e50b3008 	str	r3, [fp, #-8]
80020228:	e51b200c 	ldr	r2, [fp, #-12]
8002022c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80020230:	e0823003 	add	r3, r2, r3
80020234:	e50b300c 	str	r3, [fp, #-12]
80020238:	ea000009 	b	80020264 <memmove+0x9c>
8002023c:	e51b3008 	ldr	r3, [fp, #-8]
80020240:	e2433001 	sub	r3, r3, #1
80020244:	e50b3008 	str	r3, [fp, #-8]
80020248:	e51b300c 	ldr	r3, [fp, #-12]
8002024c:	e2433001 	sub	r3, r3, #1
80020250:	e50b300c 	str	r3, [fp, #-12]
80020254:	e51b3008 	ldr	r3, [fp, #-8]
80020258:	e5d32000 	ldrb	r2, [r3]
8002025c:	e51b300c 	ldr	r3, [fp, #-12]
80020260:	e5c32000 	strb	r2, [r3]
80020264:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80020268:	e2432001 	sub	r2, r3, #1
8002026c:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80020270:	e3530000 	cmp	r3, #0
80020274:	1afffff0 	bne	8002023c <memmove+0x74>
80020278:	ea00000c 	b	800202b0 <memmove+0xe8>
8002027c:	e51b2008 	ldr	r2, [fp, #-8]
80020280:	e2823001 	add	r3, r2, #1
80020284:	e50b3008 	str	r3, [fp, #-8]
80020288:	e51b300c 	ldr	r3, [fp, #-12]
8002028c:	e2831001 	add	r1, r3, #1
80020290:	e50b100c 	str	r1, [fp, #-12]
80020294:	e5d22000 	ldrb	r2, [r2]
80020298:	e5c32000 	strb	r2, [r3]
8002029c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800202a0:	e2432001 	sub	r2, r3, #1
800202a4:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
800202a8:	e3530000 	cmp	r3, #0
800202ac:	1afffff2 	bne	8002027c <memmove+0xb4>
800202b0:	e51b3010 	ldr	r3, [fp, #-16]
800202b4:	e1a00003 	mov	r0, r3
800202b8:	e28bd000 	add	sp, fp, #0
800202bc:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
800202c0:	e12fff1e 	bx	lr

800202c4 <memcpy>:
800202c4:	e92d4800 	push	{fp, lr}
800202c8:	e28db004 	add	fp, sp, #4
800202cc:	e24dd010 	sub	sp, sp, #16
800202d0:	e50b0008 	str	r0, [fp, #-8]
800202d4:	e50b100c 	str	r1, [fp, #-12]
800202d8:	e50b2010 	str	r2, [fp, #-16]
800202dc:	e51b2010 	ldr	r2, [fp, #-16]
800202e0:	e51b100c 	ldr	r1, [fp, #-12]
800202e4:	e51b0008 	ldr	r0, [fp, #-8]
800202e8:	ebffffb6 	bl	800201c8 <memmove>
800202ec:	e1a03000 	mov	r3, r0
800202f0:	e1a00003 	mov	r0, r3
800202f4:	e24bd004 	sub	sp, fp, #4
800202f8:	e8bd8800 	pop	{fp, pc}

800202fc <strncmp>:
800202fc:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80020300:	e28db000 	add	fp, sp, #0
80020304:	e24dd014 	sub	sp, sp, #20
80020308:	e50b0008 	str	r0, [fp, #-8]
8002030c:	e50b100c 	str	r1, [fp, #-12]
80020310:	e50b2010 	str	r2, [fp, #-16]
80020314:	ea000008 	b	8002033c <strncmp+0x40>
80020318:	e51b3010 	ldr	r3, [fp, #-16]
8002031c:	e2433001 	sub	r3, r3, #1
80020320:	e50b3010 	str	r3, [fp, #-16]
80020324:	e51b3008 	ldr	r3, [fp, #-8]
80020328:	e2833001 	add	r3, r3, #1
8002032c:	e50b3008 	str	r3, [fp, #-8]
80020330:	e51b300c 	ldr	r3, [fp, #-12]
80020334:	e2833001 	add	r3, r3, #1
80020338:	e50b300c 	str	r3, [fp, #-12]
8002033c:	e51b3010 	ldr	r3, [fp, #-16]
80020340:	e3530000 	cmp	r3, #0
80020344:	0a000009 	beq	80020370 <strncmp+0x74>
80020348:	e51b3008 	ldr	r3, [fp, #-8]
8002034c:	e5d33000 	ldrb	r3, [r3]
80020350:	e3530000 	cmp	r3, #0
80020354:	0a000005 	beq	80020370 <strncmp+0x74>
80020358:	e51b3008 	ldr	r3, [fp, #-8]
8002035c:	e5d32000 	ldrb	r2, [r3]
80020360:	e51b300c 	ldr	r3, [fp, #-12]
80020364:	e5d33000 	ldrb	r3, [r3]
80020368:	e1520003 	cmp	r2, r3
8002036c:	0affffe9 	beq	80020318 <strncmp+0x1c>
80020370:	e51b3010 	ldr	r3, [fp, #-16]
80020374:	e3530000 	cmp	r3, #0
80020378:	1a000001 	bne	80020384 <strncmp+0x88>
8002037c:	e3a03000 	mov	r3, #0
80020380:	ea000005 	b	8002039c <strncmp+0xa0>
80020384:	e51b3008 	ldr	r3, [fp, #-8]
80020388:	e5d33000 	ldrb	r3, [r3]
8002038c:	e1a02003 	mov	r2, r3
80020390:	e51b300c 	ldr	r3, [fp, #-12]
80020394:	e5d33000 	ldrb	r3, [r3]
80020398:	e0423003 	sub	r3, r2, r3
8002039c:	e1a00003 	mov	r0, r3
800203a0:	e28bd000 	add	sp, fp, #0
800203a4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
800203a8:	e12fff1e 	bx	lr

800203ac <strncpy>:
800203ac:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
800203b0:	e28db000 	add	fp, sp, #0
800203b4:	e24dd01c 	sub	sp, sp, #28
800203b8:	e50b0010 	str	r0, [fp, #-16]
800203bc:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
800203c0:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
800203c4:	e51b3010 	ldr	r3, [fp, #-16]
800203c8:	e50b3008 	str	r3, [fp, #-8]
800203cc:	e1a00000 	nop			@ (mov r0, r0)
800203d0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800203d4:	e2432001 	sub	r2, r3, #1
800203d8:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
800203dc:	e3530000 	cmp	r3, #0
800203e0:	da000010 	ble	80020428 <strncpy+0x7c>
800203e4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800203e8:	e2823001 	add	r3, r2, #1
800203ec:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800203f0:	e51b3010 	ldr	r3, [fp, #-16]
800203f4:	e2831001 	add	r1, r3, #1
800203f8:	e50b1010 	str	r1, [fp, #-16]
800203fc:	e5d22000 	ldrb	r2, [r2]
80020400:	e5c32000 	strb	r2, [r3]
80020404:	e5d33000 	ldrb	r3, [r3]
80020408:	e3530000 	cmp	r3, #0
8002040c:	1affffef 	bne	800203d0 <strncpy+0x24>
80020410:	ea000004 	b	80020428 <strncpy+0x7c>
80020414:	e51b3010 	ldr	r3, [fp, #-16]
80020418:	e2832001 	add	r2, r3, #1
8002041c:	e50b2010 	str	r2, [fp, #-16]
80020420:	e3a02000 	mov	r2, #0
80020424:	e5c32000 	strb	r2, [r3]
80020428:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002042c:	e2432001 	sub	r2, r3, #1
80020430:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80020434:	e3530000 	cmp	r3, #0
80020438:	cafffff5 	bgt	80020414 <strncpy+0x68>
8002043c:	e51b3008 	ldr	r3, [fp, #-8]
80020440:	e1a00003 	mov	r0, r3
80020444:	e28bd000 	add	sp, fp, #0
80020448:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
8002044c:	e12fff1e 	bx	lr

80020450 <safestrcpy>:
80020450:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80020454:	e28db000 	add	fp, sp, #0
80020458:	e24dd01c 	sub	sp, sp, #28
8002045c:	e50b0010 	str	r0, [fp, #-16]
80020460:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80020464:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80020468:	e51b3010 	ldr	r3, [fp, #-16]
8002046c:	e50b3008 	str	r3, [fp, #-8]
80020470:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80020474:	e3530000 	cmp	r3, #0
80020478:	ca000001 	bgt	80020484 <safestrcpy+0x34>
8002047c:	e51b3008 	ldr	r3, [fp, #-8]
80020480:	ea000015 	b	800204dc <safestrcpy+0x8c>
80020484:	e1a00000 	nop			@ (mov r0, r0)
80020488:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002048c:	e2433001 	sub	r3, r3, #1
80020490:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80020494:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80020498:	e3530000 	cmp	r3, #0
8002049c:	da00000a 	ble	800204cc <safestrcpy+0x7c>
800204a0:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800204a4:	e2823001 	add	r3, r2, #1
800204a8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800204ac:	e51b3010 	ldr	r3, [fp, #-16]
800204b0:	e2831001 	add	r1, r3, #1
800204b4:	e50b1010 	str	r1, [fp, #-16]
800204b8:	e5d22000 	ldrb	r2, [r2]
800204bc:	e5c32000 	strb	r2, [r3]
800204c0:	e5d33000 	ldrb	r3, [r3]
800204c4:	e3530000 	cmp	r3, #0
800204c8:	1affffee 	bne	80020488 <safestrcpy+0x38>
800204cc:	e51b3010 	ldr	r3, [fp, #-16]
800204d0:	e3a02000 	mov	r2, #0
800204d4:	e5c32000 	strb	r2, [r3]
800204d8:	e51b3008 	ldr	r3, [fp, #-8]
800204dc:	e1a00003 	mov	r0, r3
800204e0:	e28bd000 	add	sp, fp, #0
800204e4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
800204e8:	e12fff1e 	bx	lr

800204ec <strlen>:
800204ec:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
800204f0:	e28db000 	add	fp, sp, #0
800204f4:	e24dd014 	sub	sp, sp, #20
800204f8:	e50b0010 	str	r0, [fp, #-16]
800204fc:	e3a03000 	mov	r3, #0
80020500:	e50b3008 	str	r3, [fp, #-8]
80020504:	ea000002 	b	80020514 <strlen+0x28>
80020508:	e51b3008 	ldr	r3, [fp, #-8]
8002050c:	e2833001 	add	r3, r3, #1
80020510:	e50b3008 	str	r3, [fp, #-8]
80020514:	e51b3008 	ldr	r3, [fp, #-8]
80020518:	e51b2010 	ldr	r2, [fp, #-16]
8002051c:	e0823003 	add	r3, r2, r3
80020520:	e5d33000 	ldrb	r3, [r3]
80020524:	e3530000 	cmp	r3, #0
80020528:	1afffff6 	bne	80020508 <strlen+0x1c>
8002052c:	e51b3008 	ldr	r3, [fp, #-8]
80020530:	e1a00003 	mov	r0, r3
80020534:	e28bd000 	add	sp, fp, #0
80020538:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
8002053c:	e12fff1e 	bx	lr

80020540 <cli>:
80020540:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80020544:	e28db000 	add	fp, sp, #0
80020548:	e24dd00c 	sub	sp, sp, #12
8002054c:	e10f3000 	mrs	r3, CPSR
80020550:	e50b3008 	str	r3, [fp, #-8]
80020554:	e51b3008 	ldr	r3, [fp, #-8]
80020558:	e3833080 	orr	r3, r3, #128	@ 0x80
8002055c:	e50b3008 	str	r3, [fp, #-8]
80020560:	e51b3008 	ldr	r3, [fp, #-8]
80020564:	e12ff003 	msr	CPSR_fsxc, r3
80020568:	e1a00000 	nop			@ (mov r0, r0)
8002056c:	e28bd000 	add	sp, fp, #0
80020570:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80020574:	e12fff1e 	bx	lr

80020578 <sti>:
80020578:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
8002057c:	e28db000 	add	fp, sp, #0
80020580:	e24dd00c 	sub	sp, sp, #12
80020584:	e10f3000 	mrs	r3, CPSR
80020588:	e50b3008 	str	r3, [fp, #-8]
8002058c:	e51b3008 	ldr	r3, [fp, #-8]
80020590:	e3c33080 	bic	r3, r3, #128	@ 0x80
80020594:	e50b3008 	str	r3, [fp, #-8]
80020598:	e51b3008 	ldr	r3, [fp, #-8]
8002059c:	e12ff003 	msr	CPSR_fsxc, r3
800205a0:	e1a00000 	nop			@ (mov r0, r0)
800205a4:	e28bd000 	add	sp, fp, #0
800205a8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
800205ac:	e12fff1e 	bx	lr

800205b0 <spsr_usr>:
800205b0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
800205b4:	e28db000 	add	fp, sp, #0
800205b8:	e24dd00c 	sub	sp, sp, #12
800205bc:	e10f3000 	mrs	r3, CPSR
800205c0:	e50b3008 	str	r3, [fp, #-8]
800205c4:	e51b3008 	ldr	r3, [fp, #-8]
800205c8:	e3c3301f 	bic	r3, r3, #31
800205cc:	e50b3008 	str	r3, [fp, #-8]
800205d0:	e51b3008 	ldr	r3, [fp, #-8]
800205d4:	e3833010 	orr	r3, r3, #16
800205d8:	e50b3008 	str	r3, [fp, #-8]
800205dc:	e51b3008 	ldr	r3, [fp, #-8]
800205e0:	e1a00003 	mov	r0, r3
800205e4:	e28bd000 	add	sp, fp, #0
800205e8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
800205ec:	e12fff1e 	bx	lr

800205f0 <int_enabled>:
800205f0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
800205f4:	e28db000 	add	fp, sp, #0
800205f8:	e24dd00c 	sub	sp, sp, #12
800205fc:	e10f3000 	mrs	r3, CPSR
80020600:	e50b3008 	str	r3, [fp, #-8]
80020604:	e51b3008 	ldr	r3, [fp, #-8]
80020608:	e2033080 	and	r3, r3, #128	@ 0x80
8002060c:	e3530000 	cmp	r3, #0
80020610:	03a03001 	moveq	r3, #1
80020614:	13a03000 	movne	r3, #0
80020618:	e6ef3073 	uxtb	r3, r3
8002061c:	e1a00003 	mov	r0, r3
80020620:	e28bd000 	add	sp, fp, #0
80020624:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80020628:	e12fff1e 	bx	lr

8002062c <pushcli>:
8002062c:	e92d4800 	push	{fp, lr}
80020630:	e28db004 	add	fp, sp, #4
80020634:	e24dd008 	sub	sp, sp, #8
80020638:	ebffffec 	bl	800205f0 <int_enabled>
8002063c:	e50b0008 	str	r0, [fp, #-8]
80020640:	ebffffbe 	bl	80020540 <cli>
80020644:	e59f3030 	ldr	r3, [pc, #48]	@ 8002067c <pushcli+0x50>
80020648:	e5932000 	ldr	r2, [r3]
8002064c:	e592300c 	ldr	r3, [r2, #12]
80020650:	e2831001 	add	r1, r3, #1
80020654:	e582100c 	str	r1, [r2, #12]
80020658:	e3530000 	cmp	r3, #0
8002065c:	1a000003 	bne	80020670 <pushcli+0x44>
80020660:	e59f3014 	ldr	r3, [pc, #20]	@ 8002067c <pushcli+0x50>
80020664:	e5933000 	ldr	r3, [r3]
80020668:	e51b2008 	ldr	r2, [fp, #-8]
8002066c:	e5832010 	str	r2, [r3, #16]
80020670:	e1a00000 	nop			@ (mov r0, r0)
80020674:	e24bd004 	sub	sp, fp, #4
80020678:	e8bd8800 	pop	{fp, pc}
8002067c:	800d6c60 	.word	0x800d6c60

80020680 <popcli>:
80020680:	e92d4800 	push	{fp, lr}
80020684:	e28db004 	add	fp, sp, #4
80020688:	ebffffd8 	bl	800205f0 <int_enabled>
8002068c:	e1a03000 	mov	r3, r0
80020690:	e3530000 	cmp	r3, #0
80020694:	0a000001 	beq	800206a0 <popcli+0x20>
80020698:	e59f007c 	ldr	r0, [pc, #124]	@ 8002071c <popcli+0x9c>
8002069c:	eb000514 	bl	80021af4 <panic>
800206a0:	e59f3078 	ldr	r3, [pc, #120]	@ 80020720 <popcli+0xa0>
800206a4:	e5933000 	ldr	r3, [r3]
800206a8:	e593200c 	ldr	r2, [r3, #12]
800206ac:	e2422001 	sub	r2, r2, #1
800206b0:	e583200c 	str	r2, [r3, #12]
800206b4:	e593300c 	ldr	r3, [r3, #12]
800206b8:	e3530000 	cmp	r3, #0
800206bc:	aa000009 	bge	800206e8 <popcli+0x68>
800206c0:	e59f3058 	ldr	r3, [pc, #88]	@ 80020720 <popcli+0xa0>
800206c4:	e5931000 	ldr	r1, [r3]
800206c8:	e59f3050 	ldr	r3, [pc, #80]	@ 80020720 <popcli+0xa0>
800206cc:	e5933000 	ldr	r3, [r3]
800206d0:	e593300c 	ldr	r3, [r3, #12]
800206d4:	e1a02003 	mov	r2, r3
800206d8:	e59f0044 	ldr	r0, [pc, #68]	@ 80020724 <popcli+0xa4>
800206dc:	eb00046c 	bl	80021894 <cprintf>
800206e0:	e59f0040 	ldr	r0, [pc, #64]	@ 80020728 <popcli+0xa8>
800206e4:	eb000502 	bl	80021af4 <panic>
800206e8:	e59f3030 	ldr	r3, [pc, #48]	@ 80020720 <popcli+0xa0>
800206ec:	e5933000 	ldr	r3, [r3]
800206f0:	e593300c 	ldr	r3, [r3, #12]
800206f4:	e3530000 	cmp	r3, #0
800206f8:	1a000005 	bne	80020714 <popcli+0x94>
800206fc:	e59f301c 	ldr	r3, [pc, #28]	@ 80020720 <popcli+0xa0>
80020700:	e5933000 	ldr	r3, [r3]
80020704:	e5933010 	ldr	r3, [r3, #16]
80020708:	e3530000 	cmp	r3, #0
8002070c:	0a000000 	beq	80020714 <popcli+0x94>
80020710:	ebffff98 	bl	80020578 <sti>
80020714:	e1a00000 	nop			@ (mov r0, r0)
80020718:	e8bd8800 	pop	{fp, pc}
8002071c:	8002aae8 	.word	0x8002aae8
80020720:	800d6c60 	.word	0x800d6c60
80020724:	8002ab00 	.word	0x8002ab00
80020728:	8002ab14 	.word	0x8002ab14

8002072c <getcallerpcs>:
8002072c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80020730:	e28db000 	add	fp, sp, #0
80020734:	e24dd014 	sub	sp, sp, #20
80020738:	e50b0010 	str	r0, [fp, #-16]
8002073c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80020740:	e51b3010 	ldr	r3, [fp, #-16]
80020744:	e50b3008 	str	r3, [fp, #-8]
80020748:	e3a03000 	mov	r3, #0
8002074c:	e50b300c 	str	r3, [fp, #-12]
80020750:	ea000018 	b	800207b8 <getcallerpcs+0x8c>
80020754:	e51b3008 	ldr	r3, [fp, #-8]
80020758:	e3530000 	cmp	r3, #0
8002075c:	0a000022 	beq	800207ec <getcallerpcs+0xc0>
80020760:	e51b3008 	ldr	r3, [fp, #-8]
80020764:	e3730106 	cmn	r3, #-2147483647	@ 0x80000001
80020768:	9a00001f 	bls	800207ec <getcallerpcs+0xc0>
8002076c:	e51b3008 	ldr	r3, [fp, #-8]
80020770:	e3730001 	cmn	r3, #1
80020774:	0a00001c 	beq	800207ec <getcallerpcs+0xc0>
80020778:	e51b3008 	ldr	r3, [fp, #-8]
8002077c:	e2433004 	sub	r3, r3, #4
80020780:	e50b3008 	str	r3, [fp, #-8]
80020784:	e51b300c 	ldr	r3, [fp, #-12]
80020788:	e1a03103 	lsl	r3, r3, #2
8002078c:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
80020790:	e0823003 	add	r3, r2, r3
80020794:	e51b2008 	ldr	r2, [fp, #-8]
80020798:	e5922004 	ldr	r2, [r2, #4]
8002079c:	e5832000 	str	r2, [r3]
800207a0:	e51b3008 	ldr	r3, [fp, #-8]
800207a4:	e5933000 	ldr	r3, [r3]
800207a8:	e50b3008 	str	r3, [fp, #-8]
800207ac:	e51b300c 	ldr	r3, [fp, #-12]
800207b0:	e2833001 	add	r3, r3, #1
800207b4:	e50b300c 	str	r3, [fp, #-12]
800207b8:	e51b300c 	ldr	r3, [fp, #-12]
800207bc:	e353000e 	cmp	r3, #14
800207c0:	daffffe3 	ble	80020754 <getcallerpcs+0x28>
800207c4:	ea000008 	b	800207ec <getcallerpcs+0xc0>
800207c8:	e51b300c 	ldr	r3, [fp, #-12]
800207cc:	e1a03103 	lsl	r3, r3, #2
800207d0:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800207d4:	e0823003 	add	r3, r2, r3
800207d8:	e3a02000 	mov	r2, #0
800207dc:	e5832000 	str	r2, [r3]
800207e0:	e51b300c 	ldr	r3, [fp, #-12]
800207e4:	e2833001 	add	r3, r3, #1
800207e8:	e50b300c 	str	r3, [fp, #-12]
800207ec:	e51b300c 	ldr	r3, [fp, #-12]
800207f0:	e353000e 	cmp	r3, #14
800207f4:	dafffff3 	ble	800207c8 <getcallerpcs+0x9c>
800207f8:	e1a00000 	nop			@ (mov r0, r0)
800207fc:	e1a00000 	nop			@ (mov r0, r0)
80020800:	e28bd000 	add	sp, fp, #0
80020804:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80020808:	e12fff1e 	bx	lr

8002080c <show_callstk>:
8002080c:	e92d4800 	push	{fp, lr}
80020810:	e28db004 	add	fp, sp, #4
80020814:	e24dd048 	sub	sp, sp, #72	@ 0x48
80020818:	e50b0048 	str	r0, [fp, #-72]	@ 0xffffffb8
8002081c:	e51b1048 	ldr	r1, [fp, #-72]	@ 0xffffffb8
80020820:	e59f0074 	ldr	r0, [pc, #116]	@ 8002089c <show_callstk+0x90>
80020824:	eb00041a 	bl	80021894 <cprintf>
80020828:	eb000026 	bl	800208c8 <get_fp>
8002082c:	e1a02000 	mov	r2, r0
80020830:	e24b3044 	sub	r3, fp, #68	@ 0x44
80020834:	e1a01003 	mov	r1, r3
80020838:	e1a00002 	mov	r0, r2
8002083c:	ebffffba 	bl	8002072c <getcallerpcs>
80020840:	e3a0300e 	mov	r3, #14
80020844:	e50b3008 	str	r3, [fp, #-8]
80020848:	ea00000c 	b	80020880 <show_callstk+0x74>
8002084c:	e51b3008 	ldr	r3, [fp, #-8]
80020850:	e2831001 	add	r1, r3, #1
80020854:	e51b3008 	ldr	r3, [fp, #-8]
80020858:	e1a03103 	lsl	r3, r3, #2
8002085c:	e2433004 	sub	r3, r3, #4
80020860:	e083300b 	add	r3, r3, fp
80020864:	e5133040 	ldr	r3, [r3, #-64]	@ 0xffffffc0
80020868:	e1a02003 	mov	r2, r3
8002086c:	e59f002c 	ldr	r0, [pc, #44]	@ 800208a0 <show_callstk+0x94>
80020870:	eb000407 	bl	80021894 <cprintf>
80020874:	e51b3008 	ldr	r3, [fp, #-8]
80020878:	e2433001 	sub	r3, r3, #1
8002087c:	e50b3008 	str	r3, [fp, #-8]
80020880:	e51b3008 	ldr	r3, [fp, #-8]
80020884:	e3530000 	cmp	r3, #0
80020888:	aaffffef 	bge	8002084c <show_callstk+0x40>
8002088c:	e1a00000 	nop			@ (mov r0, r0)
80020890:	e1a00000 	nop			@ (mov r0, r0)
80020894:	e24bd004 	sub	sp, fp, #4
80020898:	e8bd8800 	pop	{fp, pc}
8002089c:	8002ab28 	.word	0x8002ab28
800208a0:	8002ab2c 	.word	0x8002ab2c

800208a4 <set_stk>:
800208a4:	e10f2000 	mrs	r2, CPSR
800208a8:	e3c2201f 	bic	r2, r2, #31
800208ac:	e1822000 	orr	r2, r2, r0
800208b0:	e12ff002 	msr	CPSR_fsxc, r2
800208b4:	e1a0d001 	mov	sp, r1
800208b8:	e3c2201f 	bic	r2, r2, #31
800208bc:	e3822013 	orr	r2, r2, #19
800208c0:	e12ff002 	msr	CPSR_fsxc, r2
800208c4:	e12fff1e 	bx	lr

800208c8 <get_fp>:
800208c8:	e1a0000b 	mov	r0, fp
800208cc:	e12fff1e 	bx	lr

800208d0 <binit>:
800208d0:	e92d4800 	push	{fp, lr}
800208d4:	e28db004 	add	fp, sp, #4
800208d8:	e24dd008 	sub	sp, sp, #8
800208dc:	e59f10b8 	ldr	r1, [pc, #184]	@ 8002099c <binit+0xcc>
800208e0:	e59f00b8 	ldr	r0, [pc, #184]	@ 800209a0 <binit+0xd0>
800208e4:	eb001838 	bl	800269cc <initlock>
800208e8:	e59f30b0 	ldr	r3, [pc, #176]	@ 800209a0 <binit+0xd0>
800208ec:	e2833a01 	add	r3, r3, #4096	@ 0x1000
800208f0:	e1a02003 	mov	r2, r3
800208f4:	e59f30a8 	ldr	r3, [pc, #168]	@ 800209a4 <binit+0xd4>
800208f8:	e5823530 	str	r3, [r2, #1328]	@ 0x530
800208fc:	e59f309c 	ldr	r3, [pc, #156]	@ 800209a0 <binit+0xd0>
80020900:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80020904:	e1a02003 	mov	r2, r3
80020908:	e59f3094 	ldr	r3, [pc, #148]	@ 800209a4 <binit+0xd4>
8002090c:	e5823534 	str	r3, [r2, #1332]	@ 0x534
80020910:	e59f3090 	ldr	r3, [pc, #144]	@ 800209a8 <binit+0xd8>
80020914:	e50b3008 	str	r3, [fp, #-8]
80020918:	ea000017 	b	8002097c <binit+0xac>
8002091c:	e59f307c 	ldr	r3, [pc, #124]	@ 800209a0 <binit+0xd0>
80020920:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80020924:	e5932534 	ldr	r2, [r3, #1332]	@ 0x534
80020928:	e51b3008 	ldr	r3, [fp, #-8]
8002092c:	e5832010 	str	r2, [r3, #16]
80020930:	e51b3008 	ldr	r3, [fp, #-8]
80020934:	e59f2068 	ldr	r2, [pc, #104]	@ 800209a4 <binit+0xd4>
80020938:	e583200c 	str	r2, [r3, #12]
8002093c:	e51b3008 	ldr	r3, [fp, #-8]
80020940:	e3e02000 	mvn	r2, #0
80020944:	e5832004 	str	r2, [r3, #4]
80020948:	e59f3050 	ldr	r3, [pc, #80]	@ 800209a0 <binit+0xd0>
8002094c:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80020950:	e5933534 	ldr	r3, [r3, #1332]	@ 0x534
80020954:	e51b2008 	ldr	r2, [fp, #-8]
80020958:	e583200c 	str	r2, [r3, #12]
8002095c:	e59f303c 	ldr	r3, [pc, #60]	@ 800209a0 <binit+0xd0>
80020960:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80020964:	e1a02003 	mov	r2, r3
80020968:	e51b3008 	ldr	r3, [fp, #-8]
8002096c:	e5823534 	str	r3, [r2, #1332]	@ 0x534
80020970:	e51b3008 	ldr	r3, [fp, #-8]
80020974:	e2833f86 	add	r3, r3, #536	@ 0x218
80020978:	e50b3008 	str	r3, [fp, #-8]
8002097c:	e59f2020 	ldr	r2, [pc, #32]	@ 800209a4 <binit+0xd4>
80020980:	e51b3008 	ldr	r3, [fp, #-8]
80020984:	e1530002 	cmp	r3, r2
80020988:	3affffe3 	bcc	8002091c <binit+0x4c>
8002098c:	e1a00000 	nop			@ (mov r0, r0)
80020990:	e1a00000 	nop			@ (mov r0, r0)
80020994:	e24bd004 	sub	sp, fp, #4
80020998:	e8bd8800 	pop	{fp, pc}
8002099c:	8002ab38 	.word	0x8002ab38
800209a0:	800d3724 	.word	0x800d3724
800209a4:	800d4c48 	.word	0x800d4c48
800209a8:	800d3758 	.word	0x800d3758

800209ac <bget>:
800209ac:	e92d4800 	push	{fp, lr}
800209b0:	e28db004 	add	fp, sp, #4
800209b4:	e24dd010 	sub	sp, sp, #16
800209b8:	e50b0010 	str	r0, [fp, #-16]
800209bc:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
800209c0:	e59f0140 	ldr	r0, [pc, #320]	@ 80020b08 <bget+0x15c>
800209c4:	eb001812 	bl	80026a14 <acquire>
800209c8:	e59f3138 	ldr	r3, [pc, #312]	@ 80020b08 <bget+0x15c>
800209cc:	e2833a01 	add	r3, r3, #4096	@ 0x1000
800209d0:	e5933534 	ldr	r3, [r3, #1332]	@ 0x534
800209d4:	e50b3008 	str	r3, [fp, #-8]
800209d8:	ea00001e 	b	80020a58 <bget+0xac>
800209dc:	e51b3008 	ldr	r3, [fp, #-8]
800209e0:	e5933004 	ldr	r3, [r3, #4]
800209e4:	e51b2010 	ldr	r2, [fp, #-16]
800209e8:	e1520003 	cmp	r2, r3
800209ec:	1a000016 	bne	80020a4c <bget+0xa0>
800209f0:	e51b3008 	ldr	r3, [fp, #-8]
800209f4:	e5933008 	ldr	r3, [r3, #8]
800209f8:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800209fc:	e1520003 	cmp	r2, r3
80020a00:	1a000011 	bne	80020a4c <bget+0xa0>
80020a04:	e51b3008 	ldr	r3, [fp, #-8]
80020a08:	e5933000 	ldr	r3, [r3]
80020a0c:	e2033001 	and	r3, r3, #1
80020a10:	e3530000 	cmp	r3, #0
80020a14:	1a000008 	bne	80020a3c <bget+0x90>
80020a18:	e51b3008 	ldr	r3, [fp, #-8]
80020a1c:	e5933000 	ldr	r3, [r3]
80020a20:	e3832001 	orr	r2, r3, #1
80020a24:	e51b3008 	ldr	r3, [fp, #-8]
80020a28:	e5832000 	str	r2, [r3]
80020a2c:	e59f00d4 	ldr	r0, [pc, #212]	@ 80020b08 <bget+0x15c>
80020a30:	eb001802 	bl	80026a40 <release>
80020a34:	e51b3008 	ldr	r3, [fp, #-8]
80020a38:	ea00002f 	b	80020afc <bget+0x150>
80020a3c:	e59f10c4 	ldr	r1, [pc, #196]	@ 80020b08 <bget+0x15c>
80020a40:	e51b0008 	ldr	r0, [fp, #-8]
80020a44:	eb0014df 	bl	80025dc8 <sleep>
80020a48:	eaffffde 	b	800209c8 <bget+0x1c>
80020a4c:	e51b3008 	ldr	r3, [fp, #-8]
80020a50:	e5933010 	ldr	r3, [r3, #16]
80020a54:	e50b3008 	str	r3, [fp, #-8]
80020a58:	e51b3008 	ldr	r3, [fp, #-8]
80020a5c:	e59f20a8 	ldr	r2, [pc, #168]	@ 80020b0c <bget+0x160>
80020a60:	e1530002 	cmp	r3, r2
80020a64:	1affffdc 	bne	800209dc <bget+0x30>
80020a68:	e59f3098 	ldr	r3, [pc, #152]	@ 80020b08 <bget+0x15c>
80020a6c:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80020a70:	e5933530 	ldr	r3, [r3, #1328]	@ 0x530
80020a74:	e50b3008 	str	r3, [fp, #-8]
80020a78:	ea000019 	b	80020ae4 <bget+0x138>
80020a7c:	e51b3008 	ldr	r3, [fp, #-8]
80020a80:	e5933000 	ldr	r3, [r3]
80020a84:	e2033001 	and	r3, r3, #1
80020a88:	e3530000 	cmp	r3, #0
80020a8c:	1a000011 	bne	80020ad8 <bget+0x12c>
80020a90:	e51b3008 	ldr	r3, [fp, #-8]
80020a94:	e5933000 	ldr	r3, [r3]
80020a98:	e2033004 	and	r3, r3, #4
80020a9c:	e3530000 	cmp	r3, #0
80020aa0:	1a00000c 	bne	80020ad8 <bget+0x12c>
80020aa4:	e51b3008 	ldr	r3, [fp, #-8]
80020aa8:	e51b2010 	ldr	r2, [fp, #-16]
80020aac:	e5832004 	str	r2, [r3, #4]
80020ab0:	e51b3008 	ldr	r3, [fp, #-8]
80020ab4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
80020ab8:	e5832008 	str	r2, [r3, #8]
80020abc:	e51b3008 	ldr	r3, [fp, #-8]
80020ac0:	e3a02001 	mov	r2, #1
80020ac4:	e5832000 	str	r2, [r3]
80020ac8:	e59f0038 	ldr	r0, [pc, #56]	@ 80020b08 <bget+0x15c>
80020acc:	eb0017db 	bl	80026a40 <release>
80020ad0:	e51b3008 	ldr	r3, [fp, #-8]
80020ad4:	ea000008 	b	80020afc <bget+0x150>
80020ad8:	e51b3008 	ldr	r3, [fp, #-8]
80020adc:	e593300c 	ldr	r3, [r3, #12]
80020ae0:	e50b3008 	str	r3, [fp, #-8]
80020ae4:	e51b3008 	ldr	r3, [fp, #-8]
80020ae8:	e59f201c 	ldr	r2, [pc, #28]	@ 80020b0c <bget+0x160>
80020aec:	e1530002 	cmp	r3, r2
80020af0:	1affffe1 	bne	80020a7c <bget+0xd0>
80020af4:	e59f0014 	ldr	r0, [pc, #20]	@ 80020b10 <bget+0x164>
80020af8:	eb0003fd 	bl	80021af4 <panic>
80020afc:	e1a00003 	mov	r0, r3
80020b00:	e24bd004 	sub	sp, fp, #4
80020b04:	e8bd8800 	pop	{fp, pc}
80020b08:	800d3724 	.word	0x800d3724
80020b0c:	800d4c48 	.word	0x800d4c48
80020b10:	8002ab40 	.word	0x8002ab40

80020b14 <bread>:
80020b14:	e92d4800 	push	{fp, lr}
80020b18:	e28db004 	add	fp, sp, #4
80020b1c:	e24dd010 	sub	sp, sp, #16
80020b20:	e50b0010 	str	r0, [fp, #-16]
80020b24:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80020b28:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
80020b2c:	e51b0010 	ldr	r0, [fp, #-16]
80020b30:	ebffff9d 	bl	800209ac <bget>
80020b34:	e50b0008 	str	r0, [fp, #-8]
80020b38:	e51b3008 	ldr	r3, [fp, #-8]
80020b3c:	e5933000 	ldr	r3, [r3]
80020b40:	e2033002 	and	r3, r3, #2
80020b44:	e3530000 	cmp	r3, #0
80020b48:	1a000001 	bne	80020b54 <bread+0x40>
80020b4c:	e51b0008 	ldr	r0, [fp, #-8]
80020b50:	eb000fcc 	bl	80024a88 <iderw>
80020b54:	e51b3008 	ldr	r3, [fp, #-8]
80020b58:	e1a00003 	mov	r0, r3
80020b5c:	e24bd004 	sub	sp, fp, #4
80020b60:	e8bd8800 	pop	{fp, pc}

80020b64 <bwrite>:
80020b64:	e92d4800 	push	{fp, lr}
80020b68:	e28db004 	add	fp, sp, #4
80020b6c:	e24dd008 	sub	sp, sp, #8
80020b70:	e50b0008 	str	r0, [fp, #-8]
80020b74:	e51b3008 	ldr	r3, [fp, #-8]
80020b78:	e5933000 	ldr	r3, [r3]
80020b7c:	e2033001 	and	r3, r3, #1
80020b80:	e3530000 	cmp	r3, #0
80020b84:	1a000001 	bne	80020b90 <bwrite+0x2c>
80020b88:	e59f0028 	ldr	r0, [pc, #40]	@ 80020bb8 <bwrite+0x54>
80020b8c:	eb0003d8 	bl	80021af4 <panic>
80020b90:	e51b3008 	ldr	r3, [fp, #-8]
80020b94:	e5933000 	ldr	r3, [r3]
80020b98:	e3832004 	orr	r2, r3, #4
80020b9c:	e51b3008 	ldr	r3, [fp, #-8]
80020ba0:	e5832000 	str	r2, [r3]
80020ba4:	e51b0008 	ldr	r0, [fp, #-8]
80020ba8:	eb000fb6 	bl	80024a88 <iderw>
80020bac:	e1a00000 	nop			@ (mov r0, r0)
80020bb0:	e24bd004 	sub	sp, fp, #4
80020bb4:	e8bd8800 	pop	{fp, pc}
80020bb8:	8002ab54 	.word	0x8002ab54

80020bbc <brelse>:
80020bbc:	e92d4800 	push	{fp, lr}
80020bc0:	e28db004 	add	fp, sp, #4
80020bc4:	e24dd008 	sub	sp, sp, #8
80020bc8:	e50b0008 	str	r0, [fp, #-8]
80020bcc:	e51b3008 	ldr	r3, [fp, #-8]
80020bd0:	e5933000 	ldr	r3, [r3]
80020bd4:	e2033001 	and	r3, r3, #1
80020bd8:	e3530000 	cmp	r3, #0
80020bdc:	1a000001 	bne	80020be8 <brelse+0x2c>
80020be0:	e59f00a8 	ldr	r0, [pc, #168]	@ 80020c90 <brelse+0xd4>
80020be4:	eb0003c2 	bl	80021af4 <panic>
80020be8:	e59f00a4 	ldr	r0, [pc, #164]	@ 80020c94 <brelse+0xd8>
80020bec:	eb001788 	bl	80026a14 <acquire>
80020bf0:	e51b3008 	ldr	r3, [fp, #-8]
80020bf4:	e5933010 	ldr	r3, [r3, #16]
80020bf8:	e51b2008 	ldr	r2, [fp, #-8]
80020bfc:	e592200c 	ldr	r2, [r2, #12]
80020c00:	e583200c 	str	r2, [r3, #12]
80020c04:	e51b3008 	ldr	r3, [fp, #-8]
80020c08:	e593300c 	ldr	r3, [r3, #12]
80020c0c:	e51b2008 	ldr	r2, [fp, #-8]
80020c10:	e5922010 	ldr	r2, [r2, #16]
80020c14:	e5832010 	str	r2, [r3, #16]
80020c18:	e59f3074 	ldr	r3, [pc, #116]	@ 80020c94 <brelse+0xd8>
80020c1c:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80020c20:	e5932534 	ldr	r2, [r3, #1332]	@ 0x534
80020c24:	e51b3008 	ldr	r3, [fp, #-8]
80020c28:	e5832010 	str	r2, [r3, #16]
80020c2c:	e51b3008 	ldr	r3, [fp, #-8]
80020c30:	e59f2060 	ldr	r2, [pc, #96]	@ 80020c98 <brelse+0xdc>
80020c34:	e583200c 	str	r2, [r3, #12]
80020c38:	e59f3054 	ldr	r3, [pc, #84]	@ 80020c94 <brelse+0xd8>
80020c3c:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80020c40:	e5933534 	ldr	r3, [r3, #1332]	@ 0x534
80020c44:	e51b2008 	ldr	r2, [fp, #-8]
80020c48:	e583200c 	str	r2, [r3, #12]
80020c4c:	e59f3040 	ldr	r3, [pc, #64]	@ 80020c94 <brelse+0xd8>
80020c50:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80020c54:	e1a02003 	mov	r2, r3
80020c58:	e51b3008 	ldr	r3, [fp, #-8]
80020c5c:	e5823534 	str	r3, [r2, #1332]	@ 0x534
80020c60:	e51b3008 	ldr	r3, [fp, #-8]
80020c64:	e5933000 	ldr	r3, [r3]
80020c68:	e3c32001 	bic	r2, r3, #1
80020c6c:	e51b3008 	ldr	r3, [fp, #-8]
80020c70:	e5832000 	str	r2, [r3]
80020c74:	e51b0008 	ldr	r0, [fp, #-8]
80020c78:	eb0014c6 	bl	80025f98 <wakeup>
80020c7c:	e59f0010 	ldr	r0, [pc, #16]	@ 80020c94 <brelse+0xd8>
80020c80:	eb00176e 	bl	80026a40 <release>
80020c84:	e1a00000 	nop			@ (mov r0, r0)
80020c88:	e24bd004 	sub	sp, fp, #4
80020c8c:	e8bd8800 	pop	{fp, pc}
80020c90:	8002ab5c 	.word	0x8002ab5c
80020c94:	800d3724 	.word	0x800d3724
80020c98:	800d4c48 	.word	0x800d4c48

80020c9c <get_mark>:
80020c9c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80020ca0:	e28db000 	add	fp, sp, #0
80020ca4:	e24dd00c 	sub	sp, sp, #12
80020ca8:	e50b0008 	str	r0, [fp, #-8]
80020cac:	e50b100c 	str	r1, [fp, #-12]
80020cb0:	e51b3008 	ldr	r3, [fp, #-8]
80020cb4:	e2433006 	sub	r3, r3, #6
80020cb8:	e59f2034 	ldr	r2, [pc, #52]	@ 80020cf4 <get_mark+0x58>
80020cbc:	e2833008 	add	r3, r3, #8
80020cc0:	e1a03183 	lsl	r3, r3, #3
80020cc4:	e0823003 	add	r3, r2, r3
80020cc8:	e5932004 	ldr	r2, [r3, #4]
80020ccc:	e51b300c 	ldr	r3, [fp, #-12]
80020cd0:	e0823003 	add	r3, r2, r3
80020cd4:	e1a02183 	lsl	r2, r3, #3
80020cd8:	e59f3014 	ldr	r3, [pc, #20]	@ 80020cf4 <get_mark+0x58>
80020cdc:	e5933034 	ldr	r3, [r3, #52]	@ 0x34
80020ce0:	e0823003 	add	r3, r2, r3
80020ce4:	e1a00003 	mov	r0, r3
80020ce8:	e28bd000 	add	sp, fp, #0
80020cec:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80020cf0:	e12fff1e 	bx	lr
80020cf4:	800d4e60 	.word	0x800d4e60

80020cf8 <blkid2mem>:
80020cf8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80020cfc:	e28db000 	add	fp, sp, #0
80020d00:	e24dd00c 	sub	sp, sp, #12
80020d04:	e50b0008 	str	r0, [fp, #-8]
80020d08:	e50b100c 	str	r1, [fp, #-12]
80020d0c:	e59f3020 	ldr	r3, [pc, #32]	@ 80020d34 <blkid2mem+0x3c>
80020d10:	e5933038 	ldr	r3, [r3, #56]	@ 0x38
80020d14:	e51b100c 	ldr	r1, [fp, #-12]
80020d18:	e51b2008 	ldr	r2, [fp, #-8]
80020d1c:	e1a02211 	lsl	r2, r1, r2
80020d20:	e0833002 	add	r3, r3, r2
80020d24:	e1a00003 	mov	r0, r3
80020d28:	e28bd000 	add	sp, fp, #0
80020d2c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80020d30:	e12fff1e 	bx	lr
80020d34:	800d4e60 	.word	0x800d4e60

80020d38 <mem2blkid>:
80020d38:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80020d3c:	e28db000 	add	fp, sp, #0
80020d40:	e24dd00c 	sub	sp, sp, #12
80020d44:	e50b0008 	str	r0, [fp, #-8]
80020d48:	e50b100c 	str	r1, [fp, #-12]
80020d4c:	e51b200c 	ldr	r2, [fp, #-12]
80020d50:	e59f301c 	ldr	r3, [pc, #28]	@ 80020d74 <mem2blkid+0x3c>
80020d54:	e5933038 	ldr	r3, [r3, #56]	@ 0x38
80020d58:	e0422003 	sub	r2, r2, r3
80020d5c:	e51b3008 	ldr	r3, [fp, #-8]
80020d60:	e1a03332 	lsr	r3, r2, r3
80020d64:	e1a00003 	mov	r0, r3
80020d68:	e28bd000 	add	sp, fp, #0
80020d6c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80020d70:	e12fff1e 	bx	lr
80020d74:	800d4e60 	.word	0x800d4e60

80020d78 <available>:
80020d78:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80020d7c:	e28db000 	add	fp, sp, #0
80020d80:	e24dd00c 	sub	sp, sp, #12
80020d84:	e50b0008 	str	r0, [fp, #-8]
80020d88:	e50b100c 	str	r1, [fp, #-12]
80020d8c:	e51b300c 	ldr	r3, [fp, #-12]
80020d90:	e203301f 	and	r3, r3, #31
80020d94:	e3a02001 	mov	r2, #1
80020d98:	e1a03312 	lsl	r3, r2, r3
80020d9c:	e1a02003 	mov	r2, r3
80020da0:	e51b3008 	ldr	r3, [fp, #-8]
80020da4:	e0033002 	and	r3, r3, r2
80020da8:	e1a00003 	mov	r0, r3
80020dac:	e28bd000 	add	sp, fp, #0
80020db0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80020db4:	e12fff1e 	bx	lr

80020db8 <kmem_init>:
80020db8:	e92d4800 	push	{fp, lr}
80020dbc:	e28db004 	add	fp, sp, #4
80020dc0:	e59f100c 	ldr	r1, [pc, #12]	@ 80020dd4 <kmem_init+0x1c>
80020dc4:	e59f000c 	ldr	r0, [pc, #12]	@ 80020dd8 <kmem_init+0x20>
80020dc8:	eb0016ff 	bl	800269cc <initlock>
80020dcc:	e1a00000 	nop			@ (mov r0, r0)
80020dd0:	e8bd8800 	pop	{fp, pc}
80020dd4:	8002ab64 	.word	0x8002ab64
80020dd8:	800d4e60 	.word	0x800d4e60

80020ddc <kmem_init2>:
80020ddc:	e92d4800 	push	{fp, lr}
80020de0:	e28db004 	add	fp, sp, #4
80020de4:	e24dd028 	sub	sp, sp, #40	@ 0x28
80020de8:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
80020dec:	e50b102c 	str	r1, [fp, #-44]	@ 0xffffffd4
80020df0:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80020df4:	e59f217c 	ldr	r2, [pc, #380]	@ 80020f78 <kmem_init2+0x19c>
80020df8:	e5823034 	str	r3, [r2, #52]	@ 0x34
80020dfc:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80020e00:	e59f2170 	ldr	r2, [pc, #368]	@ 80020f78 <kmem_init2+0x19c>
80020e04:	e582303c 	str	r3, [r2, #60]	@ 0x3c
80020e08:	e59f3168 	ldr	r3, [pc, #360]	@ 80020f78 <kmem_init2+0x19c>
80020e0c:	e593203c 	ldr	r2, [r3, #60]	@ 0x3c
80020e10:	e59f3160 	ldr	r3, [pc, #352]	@ 80020f78 <kmem_init2+0x19c>
80020e14:	e5933034 	ldr	r3, [r3, #52]	@ 0x34
80020e18:	e0423003 	sub	r3, r2, r3
80020e1c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80020e20:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80020e24:	e1a038a3 	lsr	r3, r3, #17
80020e28:	e2833001 	add	r3, r3, #1
80020e2c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80020e30:	e3a03000 	mov	r3, #0
80020e34:	e50b3010 	str	r3, [fp, #-16]
80020e38:	e3a03006 	mov	r3, #6
80020e3c:	e50b3008 	str	r3, [fp, #-8]
80020e40:	ea00002a 	b	80020ef0 <kmem_init2+0x114>
80020e44:	e51b3008 	ldr	r3, [fp, #-8]
80020e48:	e1a03183 	lsl	r3, r3, #3
80020e4c:	e59f2128 	ldr	r2, [pc, #296]	@ 80020f7c <kmem_init2+0x1a0>
80020e50:	e0833002 	add	r3, r3, r2
80020e54:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80020e58:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80020e5c:	e51b2010 	ldr	r2, [fp, #-16]
80020e60:	e5832004 	str	r2, [r3, #4]
80020e64:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80020e68:	e59f2110 	ldr	r2, [pc, #272]	@ 80020f80 <kmem_init2+0x1a4>
80020e6c:	e5832000 	str	r2, [r3]
80020e70:	e3a03000 	mov	r3, #0
80020e74:	e50b300c 	str	r3, [fp, #-12]
80020e78:	ea00000e 	b	80020eb8 <kmem_init2+0xdc>
80020e7c:	e51b3008 	ldr	r3, [fp, #-8]
80020e80:	e2833006 	add	r3, r3, #6
80020e84:	e51b100c 	ldr	r1, [fp, #-12]
80020e88:	e1a00003 	mov	r0, r3
80020e8c:	ebffff82 	bl	80020c9c <get_mark>
80020e90:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80020e94:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80020e98:	e3e02000 	mvn	r2, #0
80020e9c:	e5832000 	str	r2, [r3]
80020ea0:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80020ea4:	e3a02000 	mov	r2, #0
80020ea8:	e5832004 	str	r2, [r3, #4]
80020eac:	e51b300c 	ldr	r3, [fp, #-12]
80020eb0:	e2833001 	add	r3, r3, #1
80020eb4:	e50b300c 	str	r3, [fp, #-12]
80020eb8:	e51b300c 	ldr	r3, [fp, #-12]
80020ebc:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
80020ec0:	e1520003 	cmp	r2, r3
80020ec4:	8affffec 	bhi	80020e7c <kmem_init2+0xa0>
80020ec8:	e51b2010 	ldr	r2, [fp, #-16]
80020ecc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80020ed0:	e0823003 	add	r3, r2, r3
80020ed4:	e50b3010 	str	r3, [fp, #-16]
80020ed8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80020edc:	e1a03083 	lsl	r3, r3, #1
80020ee0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80020ee4:	e51b3008 	ldr	r3, [fp, #-8]
80020ee8:	e2433001 	sub	r3, r3, #1
80020eec:	e50b3008 	str	r3, [fp, #-8]
80020ef0:	e51b3008 	ldr	r3, [fp, #-8]
80020ef4:	e3530000 	cmp	r3, #0
80020ef8:	aaffffd1 	bge	80020e44 <kmem_init2+0x68>
80020efc:	e59f3074 	ldr	r3, [pc, #116]	@ 80020f78 <kmem_init2+0x19c>
80020f00:	e5932034 	ldr	r2, [r3, #52]	@ 0x34
80020f04:	e51b3010 	ldr	r3, [fp, #-16]
80020f08:	e1a03183 	lsl	r3, r3, #3
80020f0c:	e0823003 	add	r3, r2, r3
80020f10:	e2833eff 	add	r3, r3, #4080	@ 0xff0
80020f14:	e283300f 	add	r3, r3, #15
80020f18:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80020f1c:	e3c3300f 	bic	r3, r3, #15
80020f20:	e59f2050 	ldr	r2, [pc, #80]	@ 80020f78 <kmem_init2+0x19c>
80020f24:	e5823038 	str	r3, [r2, #56]	@ 0x38
80020f28:	e59f3048 	ldr	r3, [pc, #72]	@ 80020f78 <kmem_init2+0x19c>
80020f2c:	e5933038 	ldr	r3, [r3, #56]	@ 0x38
80020f30:	e50b3008 	str	r3, [fp, #-8]
80020f34:	ea000006 	b	80020f54 <kmem_init2+0x178>
80020f38:	e51b3008 	ldr	r3, [fp, #-8]
80020f3c:	e3a0100c 	mov	r1, #12
80020f40:	e1a00003 	mov	r0, r3
80020f44:	eb00018d 	bl	80021580 <kfree>
80020f48:	e51b3008 	ldr	r3, [fp, #-8]
80020f4c:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80020f50:	e50b3008 	str	r3, [fp, #-8]
80020f54:	e59f301c 	ldr	r3, [pc, #28]	@ 80020f78 <kmem_init2+0x19c>
80020f58:	e593203c 	ldr	r2, [r3, #60]	@ 0x3c
80020f5c:	e51b3008 	ldr	r3, [fp, #-8]
80020f60:	e1520003 	cmp	r2, r3
80020f64:	8afffff3 	bhi	80020f38 <kmem_init2+0x15c>
80020f68:	e1a00000 	nop			@ (mov r0, r0)
80020f6c:	e1a00000 	nop			@ (mov r0, r0)
80020f70:	e24bd004 	sub	sp, fp, #4
80020f74:	e8bd8800 	pop	{fp, pc}
80020f78:	800d4e60 	.word	0x800d4e60
80020f7c:	800d4ea0 	.word	0x800d4ea0
80020f80:	0000ffff 	.word	0x0000ffff

80020f84 <unmark_blk>:
80020f84:	e92d4800 	push	{fp, lr}
80020f88:	e28db004 	add	fp, sp, #4
80020f8c:	e24dd020 	sub	sp, sp, #32
80020f90:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80020f94:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
80020f98:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80020f9c:	e2433006 	sub	r3, r3, #6
80020fa0:	e2833008 	add	r3, r3, #8
80020fa4:	e1a03183 	lsl	r3, r3, #3
80020fa8:	e59f2168 	ldr	r2, [pc, #360]	@ 80021118 <unmark_blk+0x194>
80020fac:	e0833002 	add	r3, r3, r2
80020fb0:	e50b3008 	str	r3, [fp, #-8]
80020fb4:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80020fb8:	e1a032c3 	asr	r3, r3, #5
80020fbc:	e1a01003 	mov	r1, r3
80020fc0:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80020fc4:	ebffff34 	bl	80020c9c <get_mark>
80020fc8:	e50b000c 	str	r0, [fp, #-12]
80020fcc:	e51b300c 	ldr	r3, [fp, #-12]
80020fd0:	e5933004 	ldr	r3, [r3, #4]
80020fd4:	e51b1024 	ldr	r1, [fp, #-36]	@ 0xffffffdc
80020fd8:	e1a00003 	mov	r0, r3
80020fdc:	ebffff65 	bl	80020d78 <available>
80020fe0:	e1a03000 	mov	r3, r0
80020fe4:	e3530000 	cmp	r3, #0
80020fe8:	1a000001 	bne	80020ff4 <unmark_blk+0x70>
80020fec:	e59f0128 	ldr	r0, [pc, #296]	@ 8002111c <unmark_blk+0x198>
80020ff0:	eb0002bf 	bl	80021af4 <panic>
80020ff4:	e51b300c 	ldr	r3, [fp, #-12]
80020ff8:	e5933004 	ldr	r3, [r3, #4]
80020ffc:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
80021000:	e202201f 	and	r2, r2, #31
80021004:	e3a01001 	mov	r1, #1
80021008:	e1a02211 	lsl	r2, r1, r2
8002100c:	e1e02002 	mvn	r2, r2
80021010:	e0022003 	and	r2, r2, r3
80021014:	e51b300c 	ldr	r3, [fp, #-12]
80021018:	e5832004 	str	r2, [r3, #4]
8002101c:	e51b300c 	ldr	r3, [fp, #-12]
80021020:	e5933004 	ldr	r3, [r3, #4]
80021024:	e3530000 	cmp	r3, #0
80021028:	1a000037 	bne	8002110c <unmark_blk+0x188>
8002102c:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80021030:	e1a032c3 	asr	r3, r3, #5
80021034:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80021038:	e51b300c 	ldr	r3, [fp, #-12]
8002103c:	e5933000 	ldr	r3, [r3]
80021040:	e1a03823 	lsr	r3, r3, #16
80021044:	e50b3010 	str	r3, [fp, #-16]
80021048:	e51b300c 	ldr	r3, [fp, #-12]
8002104c:	e5933000 	ldr	r3, [r3]
80021050:	e6ff3073 	uxth	r3, r3
80021054:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80021058:	e51b3010 	ldr	r3, [fp, #-16]
8002105c:	e59f20bc 	ldr	r2, [pc, #188]	@ 80021120 <unmark_blk+0x19c>
80021060:	e1530002 	cmp	r3, r2
80021064:	0a00000d 	beq	800210a0 <unmark_blk+0x11c>
80021068:	e51b1010 	ldr	r1, [fp, #-16]
8002106c:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80021070:	ebffff09 	bl	80020c9c <get_mark>
80021074:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80021078:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002107c:	e5933000 	ldr	r3, [r3]
80021080:	e1a03823 	lsr	r3, r3, #16
80021084:	e1a03803 	lsl	r3, r3, #16
80021088:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8002108c:	e6ff2072 	uxth	r2, r2
80021090:	e1832002 	orr	r2, r3, r2
80021094:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80021098:	e5832000 	str	r2, [r3]
8002109c:	ea000007 	b	800210c0 <unmark_blk+0x13c>
800210a0:	e51b3008 	ldr	r3, [fp, #-8]
800210a4:	e5932000 	ldr	r2, [r3]
800210a8:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
800210ac:	e1520003 	cmp	r2, r3
800210b0:	1a000002 	bne	800210c0 <unmark_blk+0x13c>
800210b4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800210b8:	e51b3008 	ldr	r3, [fp, #-8]
800210bc:	e5832000 	str	r2, [r3]
800210c0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800210c4:	e59f2054 	ldr	r2, [pc, #84]	@ 80021120 <unmark_blk+0x19c>
800210c8:	e1530002 	cmp	r3, r2
800210cc:	0a00000b 	beq	80021100 <unmark_blk+0x17c>
800210d0:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
800210d4:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
800210d8:	ebfffeef 	bl	80020c9c <get_mark>
800210dc:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
800210e0:	e51b3010 	ldr	r3, [fp, #-16]
800210e4:	e1a02803 	lsl	r2, r3, #16
800210e8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800210ec:	e5933000 	ldr	r3, [r3]
800210f0:	e6ff3073 	uxth	r3, r3
800210f4:	e1822003 	orr	r2, r2, r3
800210f8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800210fc:	e5832000 	str	r2, [r3]
80021100:	e51b300c 	ldr	r3, [fp, #-12]
80021104:	e3e02000 	mvn	r2, #0
80021108:	e5832000 	str	r2, [r3]
8002110c:	e1a00000 	nop			@ (mov r0, r0)
80021110:	e24bd004 	sub	sp, fp, #4
80021114:	e8bd8800 	pop	{fp, pc}
80021118:	800d4e60 	.word	0x800d4e60
8002111c:	8002ab6c 	.word	0x8002ab6c
80021120:	0000ffff 	.word	0x0000ffff

80021124 <mark_blk>:
80021124:	e92d4800 	push	{fp, lr}
80021128:	e28db004 	add	fp, sp, #4
8002112c:	e24dd018 	sub	sp, sp, #24
80021130:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80021134:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
80021138:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002113c:	e2433006 	sub	r3, r3, #6
80021140:	e2833008 	add	r3, r3, #8
80021144:	e1a03183 	lsl	r3, r3, #3
80021148:	e59f2118 	ldr	r2, [pc, #280]	@ 80021268 <mark_blk+0x144>
8002114c:	e0833002 	add	r3, r3, r2
80021150:	e50b3008 	str	r3, [fp, #-8]
80021154:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80021158:	e1a032c3 	asr	r3, r3, #5
8002115c:	e1a01003 	mov	r1, r3
80021160:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80021164:	ebfffecc 	bl	80020c9c <get_mark>
80021168:	e50b000c 	str	r0, [fp, #-12]
8002116c:	e51b300c 	ldr	r3, [fp, #-12]
80021170:	e5933004 	ldr	r3, [r3, #4]
80021174:	e3530000 	cmp	r3, #0
80021178:	03a03001 	moveq	r3, #1
8002117c:	13a03000 	movne	r3, #0
80021180:	e6ef3073 	uxtb	r3, r3
80021184:	e50b3010 	str	r3, [fp, #-16]
80021188:	e51b300c 	ldr	r3, [fp, #-12]
8002118c:	e5933004 	ldr	r3, [r3, #4]
80021190:	e51b101c 	ldr	r1, [fp, #-28]	@ 0xffffffe4
80021194:	e1a00003 	mov	r0, r3
80021198:	ebfffef6 	bl	80020d78 <available>
8002119c:	e1a03000 	mov	r3, r0
800211a0:	e3530000 	cmp	r3, #0
800211a4:	0a000001 	beq	800211b0 <mark_blk+0x8c>
800211a8:	e59f00bc 	ldr	r0, [pc, #188]	@ 8002126c <mark_blk+0x148>
800211ac:	eb000250 	bl	80021af4 <panic>
800211b0:	e51b300c 	ldr	r3, [fp, #-12]
800211b4:	e5933004 	ldr	r3, [r3, #4]
800211b8:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
800211bc:	e202201f 	and	r2, r2, #31
800211c0:	e3a01001 	mov	r1, #1
800211c4:	e1a02211 	lsl	r2, r1, r2
800211c8:	e1832002 	orr	r2, r3, r2
800211cc:	e51b300c 	ldr	r3, [fp, #-12]
800211d0:	e5832004 	str	r2, [r3, #4]
800211d4:	e51b3010 	ldr	r3, [fp, #-16]
800211d8:	e3530000 	cmp	r3, #0
800211dc:	0a00001e 	beq	8002125c <mark_blk+0x138>
800211e0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
800211e4:	e1a032c3 	asr	r3, r3, #5
800211e8:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
800211ec:	e51b3008 	ldr	r3, [fp, #-8]
800211f0:	e5933000 	ldr	r3, [r3]
800211f4:	e1e03803 	mvn	r3, r3, lsl #16
800211f8:	e1e03823 	mvn	r3, r3, lsr #16
800211fc:	e51b200c 	ldr	r2, [fp, #-12]
80021200:	e5823000 	str	r3, [r2]
80021204:	e51b3008 	ldr	r3, [fp, #-8]
80021208:	e5933000 	ldr	r3, [r3]
8002120c:	e59f205c 	ldr	r2, [pc, #92]	@ 80021270 <mark_blk+0x14c>
80021210:	e1530002 	cmp	r3, r2
80021214:	0a00000d 	beq	80021250 <mark_blk+0x12c>
80021218:	e51b3008 	ldr	r3, [fp, #-8]
8002121c:	e5933000 	ldr	r3, [r3]
80021220:	e1a01003 	mov	r1, r3
80021224:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80021228:	ebfffe9b 	bl	80020c9c <get_mark>
8002122c:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80021230:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80021234:	e1a02803 	lsl	r2, r3, #16
80021238:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8002123c:	e5933000 	ldr	r3, [r3]
80021240:	e6ff3073 	uxth	r3, r3
80021244:	e1822003 	orr	r2, r2, r3
80021248:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8002124c:	e5832000 	str	r2, [r3]
80021250:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
80021254:	e51b3008 	ldr	r3, [fp, #-8]
80021258:	e5832000 	str	r2, [r3]
8002125c:	e1a00000 	nop			@ (mov r0, r0)
80021260:	e24bd004 	sub	sp, fp, #4
80021264:	e8bd8800 	pop	{fp, pc}
80021268:	800d4e60 	.word	0x800d4e60
8002126c:	8002ab7c 	.word	0x8002ab7c
80021270:	0000ffff 	.word	0x0000ffff

80021274 <get_blk>:
80021274:	e92d4800 	push	{fp, lr}
80021278:	e28db004 	add	fp, sp, #4
8002127c:	e24dd018 	sub	sp, sp, #24
80021280:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80021284:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80021288:	e2433006 	sub	r3, r3, #6
8002128c:	e2833008 	add	r3, r3, #8
80021290:	e1a03183 	lsl	r3, r3, #3
80021294:	e59f20c0 	ldr	r2, [pc, #192]	@ 8002135c <get_blk+0xe8>
80021298:	e0833002 	add	r3, r3, r2
8002129c:	e50b300c 	str	r3, [fp, #-12]
800212a0:	e51b300c 	ldr	r3, [fp, #-12]
800212a4:	e5933000 	ldr	r3, [r3]
800212a8:	e1a01003 	mov	r1, r3
800212ac:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
800212b0:	ebfffe79 	bl	80020c9c <get_mark>
800212b4:	e50b0010 	str	r0, [fp, #-16]
800212b8:	e51b3010 	ldr	r3, [fp, #-16]
800212bc:	e5933004 	ldr	r3, [r3, #4]
800212c0:	e3530000 	cmp	r3, #0
800212c4:	1a000001 	bne	800212d0 <get_blk+0x5c>
800212c8:	e59f0090 	ldr	r0, [pc, #144]	@ 80021360 <get_blk+0xec>
800212cc:	eb000208 	bl	80021af4 <panic>
800212d0:	e3a03000 	mov	r3, #0
800212d4:	e50b3008 	str	r3, [fp, #-8]
800212d8:	ea000018 	b	80021340 <get_blk+0xcc>
800212dc:	e51b3010 	ldr	r3, [fp, #-16]
800212e0:	e5933004 	ldr	r3, [r3, #4]
800212e4:	e3a01001 	mov	r1, #1
800212e8:	e51b2008 	ldr	r2, [fp, #-8]
800212ec:	e1a02211 	lsl	r2, r1, r2
800212f0:	e0033002 	and	r3, r3, r2
800212f4:	e3530000 	cmp	r3, #0
800212f8:	0a00000d 	beq	80021334 <get_blk+0xc0>
800212fc:	e51b300c 	ldr	r3, [fp, #-12]
80021300:	e5933000 	ldr	r3, [r3]
80021304:	e1a02283 	lsl	r2, r3, #5
80021308:	e51b3008 	ldr	r3, [fp, #-8]
8002130c:	e0823003 	add	r3, r2, r3
80021310:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80021314:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
80021318:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
8002131c:	ebffff18 	bl	80020f84 <unmark_blk>
80021320:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
80021324:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80021328:	ebfffe72 	bl	80020cf8 <blkid2mem>
8002132c:	e1a03000 	mov	r3, r0
80021330:	ea000006 	b	80021350 <get_blk+0xdc>
80021334:	e51b3008 	ldr	r3, [fp, #-8]
80021338:	e2833001 	add	r3, r3, #1
8002133c:	e50b3008 	str	r3, [fp, #-8]
80021340:	e51b3008 	ldr	r3, [fp, #-8]
80021344:	e353001f 	cmp	r3, #31
80021348:	daffffe3 	ble	800212dc <get_blk+0x68>
8002134c:	e3a03000 	mov	r3, #0
80021350:	e1a00003 	mov	r0, r3
80021354:	e24bd004 	sub	sp, fp, #4
80021358:	e8bd8800 	pop	{fp, pc}
8002135c:	800d4e60 	.word	0x800d4e60
80021360:	8002ab8c 	.word	0x8002ab8c

80021364 <_kmalloc>:
80021364:	e92d4800 	push	{fp, lr}
80021368:	e28db004 	add	fp, sp, #4
8002136c:	e24dd010 	sub	sp, sp, #16
80021370:	e50b0010 	str	r0, [fp, #-16]
80021374:	e51b3010 	ldr	r3, [fp, #-16]
80021378:	e2433006 	sub	r3, r3, #6
8002137c:	e2833008 	add	r3, r3, #8
80021380:	e1a03183 	lsl	r3, r3, #3
80021384:	e59f2090 	ldr	r2, [pc, #144]	@ 8002141c <_kmalloc+0xb8>
80021388:	e0833002 	add	r3, r3, r2
8002138c:	e50b300c 	str	r3, [fp, #-12]
80021390:	e3a03000 	mov	r3, #0
80021394:	e50b3008 	str	r3, [fp, #-8]
80021398:	e51b300c 	ldr	r3, [fp, #-12]
8002139c:	e5933000 	ldr	r3, [r3]
800213a0:	e59f2078 	ldr	r2, [pc, #120]	@ 80021420 <_kmalloc+0xbc>
800213a4:	e1530002 	cmp	r3, r2
800213a8:	0a000003 	beq	800213bc <_kmalloc+0x58>
800213ac:	e51b0010 	ldr	r0, [fp, #-16]
800213b0:	ebffffaf 	bl	80021274 <get_blk>
800213b4:	e50b0008 	str	r0, [fp, #-8]
800213b8:	ea000013 	b	8002140c <_kmalloc+0xa8>
800213bc:	e51b3010 	ldr	r3, [fp, #-16]
800213c0:	e353000b 	cmp	r3, #11
800213c4:	ca000010 	bgt	8002140c <_kmalloc+0xa8>
800213c8:	e51b3010 	ldr	r3, [fp, #-16]
800213cc:	e2833001 	add	r3, r3, #1
800213d0:	e1a00003 	mov	r0, r3
800213d4:	ebffffe2 	bl	80021364 <_kmalloc>
800213d8:	e50b0008 	str	r0, [fp, #-8]
800213dc:	e51b3008 	ldr	r3, [fp, #-8]
800213e0:	e3530000 	cmp	r3, #0
800213e4:	0a000008 	beq	8002140c <_kmalloc+0xa8>
800213e8:	e3a02001 	mov	r2, #1
800213ec:	e51b3010 	ldr	r3, [fp, #-16]
800213f0:	e1a03312 	lsl	r3, r2, r3
800213f4:	e1a02003 	mov	r2, r3
800213f8:	e51b3008 	ldr	r3, [fp, #-8]
800213fc:	e0833002 	add	r3, r3, r2
80021400:	e51b1010 	ldr	r1, [fp, #-16]
80021404:	e1a00003 	mov	r0, r3
80021408:	eb00001e 	bl	80021488 <_kfree>
8002140c:	e51b3008 	ldr	r3, [fp, #-8]
80021410:	e1a00003 	mov	r0, r3
80021414:	e24bd004 	sub	sp, fp, #4
80021418:	e8bd8800 	pop	{fp, pc}
8002141c:	800d4e60 	.word	0x800d4e60
80021420:	0000ffff 	.word	0x0000ffff

80021424 <kmalloc>:
80021424:	e92d4800 	push	{fp, lr}
80021428:	e28db004 	add	fp, sp, #4
8002142c:	e24dd010 	sub	sp, sp, #16
80021430:	e50b0010 	str	r0, [fp, #-16]
80021434:	e51b3010 	ldr	r3, [fp, #-16]
80021438:	e353000c 	cmp	r3, #12
8002143c:	ca000002 	bgt	8002144c <kmalloc+0x28>
80021440:	e51b3010 	ldr	r3, [fp, #-16]
80021444:	e3530005 	cmp	r3, #5
80021448:	ca000001 	bgt	80021454 <kmalloc+0x30>
8002144c:	e59f002c 	ldr	r0, [pc, #44]	@ 80021480 <kmalloc+0x5c>
80021450:	eb0001a7 	bl	80021af4 <panic>
80021454:	e59f0028 	ldr	r0, [pc, #40]	@ 80021484 <kmalloc+0x60>
80021458:	eb00156d 	bl	80026a14 <acquire>
8002145c:	e51b0010 	ldr	r0, [fp, #-16]
80021460:	ebffffbf 	bl	80021364 <_kmalloc>
80021464:	e50b0008 	str	r0, [fp, #-8]
80021468:	e59f0014 	ldr	r0, [pc, #20]	@ 80021484 <kmalloc+0x60>
8002146c:	eb001573 	bl	80026a40 <release>
80021470:	e51b3008 	ldr	r3, [fp, #-8]
80021474:	e1a00003 	mov	r0, r3
80021478:	e24bd004 	sub	sp, fp, #4
8002147c:	e8bd8800 	pop	{fp, pc}
80021480:	8002aba4 	.word	0x8002aba4
80021484:	800d4e60 	.word	0x800d4e60

80021488 <_kfree>:
80021488:	e92d4800 	push	{fp, lr}
8002148c:	e28db004 	add	fp, sp, #4
80021490:	e24dd018 	sub	sp, sp, #24
80021494:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80021498:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8002149c:	e51b1018 	ldr	r1, [fp, #-24]	@ 0xffffffe8
800214a0:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
800214a4:	ebfffe23 	bl	80020d38 <mem2blkid>
800214a8:	e50b0008 	str	r0, [fp, #-8]
800214ac:	e51b3008 	ldr	r3, [fp, #-8]
800214b0:	e1a032c3 	asr	r3, r3, #5
800214b4:	e1a01003 	mov	r1, r3
800214b8:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
800214bc:	ebfffdf6 	bl	80020c9c <get_mark>
800214c0:	e50b000c 	str	r0, [fp, #-12]
800214c4:	e51b300c 	ldr	r3, [fp, #-12]
800214c8:	e5933004 	ldr	r3, [r3, #4]
800214cc:	e51b1008 	ldr	r1, [fp, #-8]
800214d0:	e1a00003 	mov	r0, r3
800214d4:	ebfffe27 	bl	80020d78 <available>
800214d8:	e1a03000 	mov	r3, r0
800214dc:	e3530000 	cmp	r3, #0
800214e0:	0a000001 	beq	800214ec <_kfree+0x64>
800214e4:	e59f0090 	ldr	r0, [pc, #144]	@ 8002157c <_kfree+0xf4>
800214e8:	eb000181 	bl	80021af4 <panic>
800214ec:	e51b3008 	ldr	r3, [fp, #-8]
800214f0:	e2233001 	eor	r3, r3, #1
800214f4:	e50b3010 	str	r3, [fp, #-16]
800214f8:	e51b300c 	ldr	r3, [fp, #-12]
800214fc:	e5933004 	ldr	r3, [r3, #4]
80021500:	e51b1010 	ldr	r1, [fp, #-16]
80021504:	e1a00003 	mov	r0, r3
80021508:	ebfffe1a 	bl	80020d78 <available>
8002150c:	e1a03000 	mov	r3, r0
80021510:	e3530000 	cmp	r3, #0
80021514:	0a000002 	beq	80021524 <_kfree+0x9c>
80021518:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8002151c:	e353000c 	cmp	r3, #12
80021520:	1a000003 	bne	80021534 <_kfree+0xac>
80021524:	e51b1008 	ldr	r1, [fp, #-8]
80021528:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
8002152c:	ebfffefc 	bl	80021124 <mark_blk>
80021530:	ea00000e 	b	80021570 <_kfree+0xe8>
80021534:	e51b1010 	ldr	r1, [fp, #-16]
80021538:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
8002153c:	ebfffe90 	bl	80020f84 <unmark_blk>
80021540:	e51b3008 	ldr	r3, [fp, #-8]
80021544:	e3c33001 	bic	r3, r3, #1
80021548:	e1a01003 	mov	r1, r3
8002154c:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
80021550:	ebfffde8 	bl	80020cf8 <blkid2mem>
80021554:	e1a02000 	mov	r2, r0
80021558:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8002155c:	e2833001 	add	r3, r3, #1
80021560:	e1a01003 	mov	r1, r3
80021564:	e1a00002 	mov	r0, r2
80021568:	ebffffc6 	bl	80021488 <_kfree>
8002156c:	e1a00000 	nop			@ (mov r0, r0)
80021570:	e1a00000 	nop			@ (mov r0, r0)
80021574:	e24bd004 	sub	sp, fp, #4
80021578:	e8bd8800 	pop	{fp, pc}
8002157c:	8002abc4 	.word	0x8002abc4

80021580 <kfree>:
80021580:	e92d4800 	push	{fp, lr}
80021584:	e28db004 	add	fp, sp, #4
80021588:	e24dd008 	sub	sp, sp, #8
8002158c:	e50b0008 	str	r0, [fp, #-8]
80021590:	e50b100c 	str	r1, [fp, #-12]
80021594:	e51b300c 	ldr	r3, [fp, #-12]
80021598:	e353000c 	cmp	r3, #12
8002159c:	ca00000b 	bgt	800215d0 <kfree+0x50>
800215a0:	e51b300c 	ldr	r3, [fp, #-12]
800215a4:	e3530005 	cmp	r3, #5
800215a8:	da000008 	ble	800215d0 <kfree+0x50>
800215ac:	e3a02001 	mov	r2, #1
800215b0:	e51b300c 	ldr	r3, [fp, #-12]
800215b4:	e1a03312 	lsl	r3, r2, r3
800215b8:	e2433001 	sub	r3, r3, #1
800215bc:	e1a02003 	mov	r2, r3
800215c0:	e51b3008 	ldr	r3, [fp, #-8]
800215c4:	e0033002 	and	r3, r3, r2
800215c8:	e3530000 	cmp	r3, #0
800215cc:	0a000001 	beq	800215d8 <kfree+0x58>
800215d0:	e59f0028 	ldr	r0, [pc, #40]	@ 80021600 <kfree+0x80>
800215d4:	eb000146 	bl	80021af4 <panic>
800215d8:	e59f0024 	ldr	r0, [pc, #36]	@ 80021604 <kfree+0x84>
800215dc:	eb00150c 	bl	80026a14 <acquire>
800215e0:	e51b100c 	ldr	r1, [fp, #-12]
800215e4:	e51b0008 	ldr	r0, [fp, #-8]
800215e8:	ebffffa6 	bl	80021488 <_kfree>
800215ec:	e59f0010 	ldr	r0, [pc, #16]	@ 80021604 <kfree+0x84>
800215f0:	eb001512 	bl	80026a40 <release>
800215f4:	e1a00000 	nop			@ (mov r0, r0)
800215f8:	e24bd004 	sub	sp, fp, #4
800215fc:	e8bd8800 	pop	{fp, pc}
80021600:	8002abd8 	.word	0x8002abd8
80021604:	800d4e60 	.word	0x800d4e60

80021608 <free_page>:
80021608:	e92d4800 	push	{fp, lr}
8002160c:	e28db004 	add	fp, sp, #4
80021610:	e24dd008 	sub	sp, sp, #8
80021614:	e50b0008 	str	r0, [fp, #-8]
80021618:	e3a0100c 	mov	r1, #12
8002161c:	e51b0008 	ldr	r0, [fp, #-8]
80021620:	ebffffd6 	bl	80021580 <kfree>
80021624:	e1a00000 	nop			@ (mov r0, r0)
80021628:	e24bd004 	sub	sp, fp, #4
8002162c:	e8bd8800 	pop	{fp, pc}

80021630 <alloc_page>:
80021630:	e92d4800 	push	{fp, lr}
80021634:	e28db004 	add	fp, sp, #4
80021638:	e3a0000c 	mov	r0, #12
8002163c:	ebffff78 	bl	80021424 <kmalloc>
80021640:	e1a03000 	mov	r3, r0
80021644:	e1a00003 	mov	r0, r3
80021648:	e8bd8800 	pop	{fp, pc}

8002164c <get_order>:
8002164c:	e92d4800 	push	{fp, lr}
80021650:	e28db004 	add	fp, sp, #4
80021654:	e24dd010 	sub	sp, sp, #16
80021658:	e50b0010 	str	r0, [fp, #-16]
8002165c:	e51b3010 	ldr	r3, [fp, #-16]
80021660:	e2433001 	sub	r3, r3, #1
80021664:	e50b3010 	str	r3, [fp, #-16]
80021668:	e51b3010 	ldr	r3, [fp, #-16]
8002166c:	e1a030a3 	lsr	r3, r3, #1
80021670:	e51b2010 	ldr	r2, [fp, #-16]
80021674:	e1823003 	orr	r3, r2, r3
80021678:	e50b3010 	str	r3, [fp, #-16]
8002167c:	e51b3010 	ldr	r3, [fp, #-16]
80021680:	e1a03123 	lsr	r3, r3, #2
80021684:	e51b2010 	ldr	r2, [fp, #-16]
80021688:	e1823003 	orr	r3, r2, r3
8002168c:	e50b3010 	str	r3, [fp, #-16]
80021690:	e51b3010 	ldr	r3, [fp, #-16]
80021694:	e1a03223 	lsr	r3, r3, #4
80021698:	e51b2010 	ldr	r2, [fp, #-16]
8002169c:	e1823003 	orr	r3, r2, r3
800216a0:	e50b3010 	str	r3, [fp, #-16]
800216a4:	e51b3010 	ldr	r3, [fp, #-16]
800216a8:	e1a03423 	lsr	r3, r3, #8
800216ac:	e51b2010 	ldr	r2, [fp, #-16]
800216b0:	e1823003 	orr	r3, r2, r3
800216b4:	e50b3010 	str	r3, [fp, #-16]
800216b8:	e51b3010 	ldr	r3, [fp, #-16]
800216bc:	e1a03823 	lsr	r3, r3, #16
800216c0:	e51b2010 	ldr	r2, [fp, #-16]
800216c4:	e1823003 	orr	r3, r2, r3
800216c8:	e50b3010 	str	r3, [fp, #-16]
800216cc:	e51b3010 	ldr	r3, [fp, #-16]
800216d0:	e2833001 	add	r3, r3, #1
800216d4:	e50b3010 	str	r3, [fp, #-16]
800216d8:	e3a03000 	mov	r3, #0
800216dc:	e50b3008 	str	r3, [fp, #-8]
800216e0:	ea00000a 	b	80021710 <get_order+0xc4>
800216e4:	e3a02001 	mov	r2, #1
800216e8:	e51b3008 	ldr	r3, [fp, #-8]
800216ec:	e1a03312 	lsl	r3, r2, r3
800216f0:	e1a02003 	mov	r2, r3
800216f4:	e51b3010 	ldr	r3, [fp, #-16]
800216f8:	e0033002 	and	r3, r3, r2
800216fc:	e3530000 	cmp	r3, #0
80021700:	1a000006 	bne	80021720 <get_order+0xd4>
80021704:	e51b3008 	ldr	r3, [fp, #-8]
80021708:	e2833001 	add	r3, r3, #1
8002170c:	e50b3008 	str	r3, [fp, #-8]
80021710:	e51b3008 	ldr	r3, [fp, #-8]
80021714:	e353001f 	cmp	r3, #31
80021718:	9afffff1 	bls	800216e4 <get_order+0x98>
8002171c:	ea000000 	b	80021724 <get_order+0xd8>
80021720:	e1a00000 	nop			@ (mov r0, r0)
80021724:	e51b3008 	ldr	r3, [fp, #-8]
80021728:	e3530005 	cmp	r3, #5
8002172c:	8a000002 	bhi	8002173c <get_order+0xf0>
80021730:	e3a03006 	mov	r3, #6
80021734:	e50b3008 	str	r3, [fp, #-8]
80021738:	ea000004 	b	80021750 <get_order+0x104>
8002173c:	e51b3008 	ldr	r3, [fp, #-8]
80021740:	e353000c 	cmp	r3, #12
80021744:	9a000001 	bls	80021750 <get_order+0x104>
80021748:	e59f0010 	ldr	r0, [pc, #16]	@ 80021760 <get_order+0x114>
8002174c:	eb0000e8 	bl	80021af4 <panic>
80021750:	e51b3008 	ldr	r3, [fp, #-8]
80021754:	e1a00003 	mov	r0, r3
80021758:	e24bd004 	sub	sp, fp, #4
8002175c:	e8bd8800 	pop	{fp, pc}
80021760:	8002ac08 	.word	0x8002ac08

80021764 <printint>:
80021764:	e92d4800 	push	{fp, lr}
80021768:	e28db004 	add	fp, sp, #4
8002176c:	e24dd028 	sub	sp, sp, #40	@ 0x28
80021770:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80021774:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
80021778:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
8002177c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80021780:	e3530000 	cmp	r3, #0
80021784:	0a00000a 	beq	800217b4 <printint+0x50>
80021788:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8002178c:	e1a03fa3 	lsr	r3, r3, #31
80021790:	e6ef3073 	uxtb	r3, r3
80021794:	e50b3028 	str	r3, [fp, #-40]	@ 0xffffffd8
80021798:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8002179c:	e3530000 	cmp	r3, #0
800217a0:	0a000003 	beq	800217b4 <printint+0x50>
800217a4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800217a8:	e2633000 	rsb	r3, r3, #0
800217ac:	e50b300c 	str	r3, [fp, #-12]
800217b0:	ea000001 	b	800217bc <printint+0x58>
800217b4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800217b8:	e50b300c 	str	r3, [fp, #-12]
800217bc:	e3a03000 	mov	r3, #0
800217c0:	e50b3008 	str	r3, [fp, #-8]
800217c4:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
800217c8:	e51b300c 	ldr	r3, [fp, #-12]
800217cc:	e1a01002 	mov	r1, r2
800217d0:	e1a00003 	mov	r0, r3
800217d4:	eb002468 	bl	8002a97c <__aeabi_uidivmod>
800217d8:	e1a03001 	mov	r3, r1
800217dc:	e1a01003 	mov	r1, r3
800217e0:	e51b3008 	ldr	r3, [fp, #-8]
800217e4:	e2832001 	add	r2, r3, #1
800217e8:	e50b2008 	str	r2, [fp, #-8]
800217ec:	e59f209c 	ldr	r2, [pc, #156]	@ 80021890 <printint+0x12c>
800217f0:	e7d22001 	ldrb	r2, [r2, r1]
800217f4:	e2433004 	sub	r3, r3, #4
800217f8:	e083300b 	add	r3, r3, fp
800217fc:	e5432018 	strb	r2, [r3, #-24]	@ 0xffffffe8
80021800:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80021804:	e1a01003 	mov	r1, r3
80021808:	e51b000c 	ldr	r0, [fp, #-12]
8002180c:	eb00241d 	bl	8002a888 <__udivsi3>
80021810:	e1a03000 	mov	r3, r0
80021814:	e50b300c 	str	r3, [fp, #-12]
80021818:	e51b300c 	ldr	r3, [fp, #-12]
8002181c:	e3530000 	cmp	r3, #0
80021820:	1affffe7 	bne	800217c4 <printint+0x60>
80021824:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80021828:	e3530000 	cmp	r3, #0
8002182c:	0a00000d 	beq	80021868 <printint+0x104>
80021830:	e51b3008 	ldr	r3, [fp, #-8]
80021834:	e2832001 	add	r2, r3, #1
80021838:	e50b2008 	str	r2, [fp, #-8]
8002183c:	e2433004 	sub	r3, r3, #4
80021840:	e083300b 	add	r3, r3, fp
80021844:	e3a0202d 	mov	r2, #45	@ 0x2d
80021848:	e5432018 	strb	r2, [r3, #-24]	@ 0xffffffe8
8002184c:	ea000005 	b	80021868 <printint+0x104>
80021850:	e24b201c 	sub	r2, fp, #28
80021854:	e51b3008 	ldr	r3, [fp, #-8]
80021858:	e0823003 	add	r3, r2, r3
8002185c:	e5d33000 	ldrb	r3, [r3]
80021860:	e1a00003 	mov	r0, r3
80021864:	eb0000bb 	bl	80021b58 <consputc>
80021868:	e51b3008 	ldr	r3, [fp, #-8]
8002186c:	e2433001 	sub	r3, r3, #1
80021870:	e50b3008 	str	r3, [fp, #-8]
80021874:	e51b3008 	ldr	r3, [fp, #-8]
80021878:	e3530000 	cmp	r3, #0
8002187c:	aafffff3 	bge	80021850 <printint+0xec>
80021880:	e1a00000 	nop			@ (mov r0, r0)
80021884:	e1a00000 	nop			@ (mov r0, r0)
80021888:	e24bd004 	sub	sp, fp, #4
8002188c:	e8bd8800 	pop	{fp, pc}
80021890:	8002c000 	.word	0x8002c000

80021894 <cprintf>:
80021894:	e92d000f 	push	{r0, r1, r2, r3}
80021898:	e92d4800 	push	{fp, lr}
8002189c:	e28db004 	add	fp, sp, #4
800218a0:	e24dd018 	sub	sp, sp, #24
800218a4:	e59f323c 	ldr	r3, [pc, #572]	@ 80021ae8 <cprintf+0x254>
800218a8:	e5933034 	ldr	r3, [r3, #52]	@ 0x34
800218ac:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800218b0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800218b4:	e3530000 	cmp	r3, #0
800218b8:	0a000001 	beq	800218c4 <cprintf+0x30>
800218bc:	e59f0224 	ldr	r0, [pc, #548]	@ 80021ae8 <cprintf+0x254>
800218c0:	eb001453 	bl	80026a14 <acquire>
800218c4:	e59b3004 	ldr	r3, [fp, #4]
800218c8:	e3530000 	cmp	r3, #0
800218cc:	1a000001 	bne	800218d8 <cprintf+0x44>
800218d0:	e59f0214 	ldr	r0, [pc, #532]	@ 80021aec <cprintf+0x258>
800218d4:	eb000086 	bl	80021af4 <panic>
800218d8:	e28b3008 	add	r3, fp, #8
800218dc:	e50b300c 	str	r3, [fp, #-12]
800218e0:	e3a03000 	mov	r3, #0
800218e4:	e50b3008 	str	r3, [fp, #-8]
800218e8:	ea00006a 	b	80021a98 <cprintf+0x204>
800218ec:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800218f0:	e3530025 	cmp	r3, #37	@ 0x25
800218f4:	0a000002 	beq	80021904 <cprintf+0x70>
800218f8:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
800218fc:	eb000095 	bl	80021b58 <consputc>
80021900:	ea000061 	b	80021a8c <cprintf+0x1f8>
80021904:	e59b2004 	ldr	r2, [fp, #4]
80021908:	e51b3008 	ldr	r3, [fp, #-8]
8002190c:	e2833001 	add	r3, r3, #1
80021910:	e50b3008 	str	r3, [fp, #-8]
80021914:	e51b3008 	ldr	r3, [fp, #-8]
80021918:	e0823003 	add	r3, r2, r3
8002191c:	e5d33000 	ldrb	r3, [r3]
80021920:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80021924:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80021928:	e3530000 	cmp	r3, #0
8002192c:	0a000062 	beq	80021abc <cprintf+0x228>
80021930:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80021934:	e3530025 	cmp	r3, #37	@ 0x25
80021938:	0a00004b 	beq	80021a6c <cprintf+0x1d8>
8002193c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80021940:	e3530025 	cmp	r3, #37	@ 0x25
80021944:	ba00004b 	blt	80021a78 <cprintf+0x1e4>
80021948:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002194c:	e3530078 	cmp	r3, #120	@ 0x78
80021950:	ca000048 	bgt	80021a78 <cprintf+0x1e4>
80021954:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80021958:	e3530064 	cmp	r3, #100	@ 0x64
8002195c:	ba000045 	blt	80021a78 <cprintf+0x1e4>
80021960:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80021964:	e2433064 	sub	r3, r3, #100	@ 0x64
80021968:	e3530014 	cmp	r3, #20
8002196c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
80021970:	ea000040 	b	80021a78 <cprintf+0x1e4>
80021974:	800219c8 	.word	0x800219c8
80021978:	80021a78 	.word	0x80021a78
8002197c:	80021a78 	.word	0x80021a78
80021980:	80021a78 	.word	0x80021a78
80021984:	80021a78 	.word	0x80021a78
80021988:	80021a78 	.word	0x80021a78
8002198c:	80021a78 	.word	0x80021a78
80021990:	80021a78 	.word	0x80021a78
80021994:	80021a78 	.word	0x80021a78
80021998:	80021a78 	.word	0x80021a78
8002199c:	80021a78 	.word	0x80021a78
800219a0:	80021a78 	.word	0x80021a78
800219a4:	800219ec 	.word	0x800219ec
800219a8:	80021a78 	.word	0x80021a78
800219ac:	80021a78 	.word	0x80021a78
800219b0:	80021a10 	.word	0x80021a10
800219b4:	80021a78 	.word	0x80021a78
800219b8:	80021a78 	.word	0x80021a78
800219bc:	80021a78 	.word	0x80021a78
800219c0:	80021a78 	.word	0x80021a78
800219c4:	800219ec 	.word	0x800219ec
800219c8:	e51b300c 	ldr	r3, [fp, #-12]
800219cc:	e2832004 	add	r2, r3, #4
800219d0:	e50b200c 	str	r2, [fp, #-12]
800219d4:	e5933000 	ldr	r3, [r3]
800219d8:	e3a02001 	mov	r2, #1
800219dc:	e3a0100a 	mov	r1, #10
800219e0:	e1a00003 	mov	r0, r3
800219e4:	ebffff5e 	bl	80021764 <printint>
800219e8:	ea000027 	b	80021a8c <cprintf+0x1f8>
800219ec:	e51b300c 	ldr	r3, [fp, #-12]
800219f0:	e2832004 	add	r2, r3, #4
800219f4:	e50b200c 	str	r2, [fp, #-12]
800219f8:	e5933000 	ldr	r3, [r3]
800219fc:	e3a02000 	mov	r2, #0
80021a00:	e3a01010 	mov	r1, #16
80021a04:	e1a00003 	mov	r0, r3
80021a08:	ebffff55 	bl	80021764 <printint>
80021a0c:	ea00001e 	b	80021a8c <cprintf+0x1f8>
80021a10:	e51b300c 	ldr	r3, [fp, #-12]
80021a14:	e2832004 	add	r2, r3, #4
80021a18:	e50b200c 	str	r2, [fp, #-12]
80021a1c:	e5933000 	ldr	r3, [r3]
80021a20:	e50b3010 	str	r3, [fp, #-16]
80021a24:	e51b3010 	ldr	r3, [fp, #-16]
80021a28:	e3530000 	cmp	r3, #0
80021a2c:	1a000009 	bne	80021a58 <cprintf+0x1c4>
80021a30:	e59f30b8 	ldr	r3, [pc, #184]	@ 80021af0 <cprintf+0x25c>
80021a34:	e50b3010 	str	r3, [fp, #-16]
80021a38:	ea000006 	b	80021a58 <cprintf+0x1c4>
80021a3c:	e51b3010 	ldr	r3, [fp, #-16]
80021a40:	e5d33000 	ldrb	r3, [r3]
80021a44:	e1a00003 	mov	r0, r3
80021a48:	eb000042 	bl	80021b58 <consputc>
80021a4c:	e51b3010 	ldr	r3, [fp, #-16]
80021a50:	e2833001 	add	r3, r3, #1
80021a54:	e50b3010 	str	r3, [fp, #-16]
80021a58:	e51b3010 	ldr	r3, [fp, #-16]
80021a5c:	e5d33000 	ldrb	r3, [r3]
80021a60:	e3530000 	cmp	r3, #0
80021a64:	1afffff4 	bne	80021a3c <cprintf+0x1a8>
80021a68:	ea000007 	b	80021a8c <cprintf+0x1f8>
80021a6c:	e3a00025 	mov	r0, #37	@ 0x25
80021a70:	eb000038 	bl	80021b58 <consputc>
80021a74:	ea000004 	b	80021a8c <cprintf+0x1f8>
80021a78:	e3a00025 	mov	r0, #37	@ 0x25
80021a7c:	eb000035 	bl	80021b58 <consputc>
80021a80:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80021a84:	eb000033 	bl	80021b58 <consputc>
80021a88:	e1a00000 	nop			@ (mov r0, r0)
80021a8c:	e51b3008 	ldr	r3, [fp, #-8]
80021a90:	e2833001 	add	r3, r3, #1
80021a94:	e50b3008 	str	r3, [fp, #-8]
80021a98:	e59b2004 	ldr	r2, [fp, #4]
80021a9c:	e51b3008 	ldr	r3, [fp, #-8]
80021aa0:	e0823003 	add	r3, r2, r3
80021aa4:	e5d33000 	ldrb	r3, [r3]
80021aa8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80021aac:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80021ab0:	e3530000 	cmp	r3, #0
80021ab4:	1affff8c 	bne	800218ec <cprintf+0x58>
80021ab8:	ea000000 	b	80021ac0 <cprintf+0x22c>
80021abc:	e1a00000 	nop			@ (mov r0, r0)
80021ac0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80021ac4:	e3530000 	cmp	r3, #0
80021ac8:	0a000001 	beq	80021ad4 <cprintf+0x240>
80021acc:	e59f0014 	ldr	r0, [pc, #20]	@ 80021ae8 <cprintf+0x254>
80021ad0:	eb0013da 	bl	80026a40 <release>
80021ad4:	e1a00000 	nop			@ (mov r0, r0)
80021ad8:	e24bd004 	sub	sp, fp, #4
80021adc:	e8bd4800 	pop	{fp, lr}
80021ae0:	e28dd010 	add	sp, sp, #16
80021ae4:	e12fff1e 	bx	lr
80021ae8:	800d4edc 	.word	0x800d4edc
80021aec:	8002ac18 	.word	0x8002ac18
80021af0:	8002ac24 	.word	0x8002ac24

80021af4 <panic>:
80021af4:	e92d4800 	push	{fp, lr}
80021af8:	e28db004 	add	fp, sp, #4
80021afc:	e24dd008 	sub	sp, sp, #8
80021b00:	e50b0008 	str	r0, [fp, #-8]
80021b04:	ebfffa8d 	bl	80020540 <cli>
80021b08:	e59f3038 	ldr	r3, [pc, #56]	@ 80021b48 <panic+0x54>
80021b0c:	e3a02000 	mov	r2, #0
80021b10:	e5832034 	str	r2, [r3, #52]	@ 0x34
80021b14:	e59f3030 	ldr	r3, [pc, #48]	@ 80021b4c <panic+0x58>
80021b18:	e5933000 	ldr	r3, [r3]
80021b1c:	e5d33000 	ldrb	r3, [r3]
80021b20:	e1a01003 	mov	r1, r3
80021b24:	e59f0024 	ldr	r0, [pc, #36]	@ 80021b50 <panic+0x5c>
80021b28:	ebffff59 	bl	80021894 <cprintf>
80021b2c:	e51b0008 	ldr	r0, [fp, #-8]
80021b30:	ebfffb35 	bl	8002080c <show_callstk>
80021b34:	e59f3018 	ldr	r3, [pc, #24]	@ 80021b54 <panic+0x60>
80021b38:	e3a02001 	mov	r2, #1
80021b3c:	e5832000 	str	r2, [r3]
80021b40:	e1a00000 	nop			@ (mov r0, r0)
80021b44:	eafffffd 	b	80021b40 <panic+0x4c>
80021b48:	800d4edc 	.word	0x800d4edc
80021b4c:	800d6c60 	.word	0x800d6c60
80021b50:	8002ac2c 	.word	0x8002ac2c
80021b54:	800d4ed8 	.word	0x800d4ed8

80021b58 <consputc>:
80021b58:	e92d4800 	push	{fp, lr}
80021b5c:	e28db004 	add	fp, sp, #4
80021b60:	e24dd008 	sub	sp, sp, #8
80021b64:	e50b0008 	str	r0, [fp, #-8]
80021b68:	e59f3050 	ldr	r3, [pc, #80]	@ 80021bc0 <consputc+0x68>
80021b6c:	e5933000 	ldr	r3, [r3]
80021b70:	e3530000 	cmp	r3, #0
80021b74:	0a000002 	beq	80021b84 <consputc+0x2c>
80021b78:	ebfffa70 	bl	80020540 <cli>
80021b7c:	e1a00000 	nop			@ (mov r0, r0)
80021b80:	eafffffd 	b	80021b7c <consputc+0x24>
80021b84:	e51b3008 	ldr	r3, [fp, #-8]
80021b88:	e3530c01 	cmp	r3, #256	@ 0x100
80021b8c:	1a000006 	bne	80021bac <consputc+0x54>
80021b90:	e3a00008 	mov	r0, #8
80021b94:	eb0022fa 	bl	8002a784 <uartputc>
80021b98:	e3a00020 	mov	r0, #32
80021b9c:	eb0022f8 	bl	8002a784 <uartputc>
80021ba0:	e3a00008 	mov	r0, #8
80021ba4:	eb0022f6 	bl	8002a784 <uartputc>
80021ba8:	ea000001 	b	80021bb4 <consputc+0x5c>
80021bac:	e51b0008 	ldr	r0, [fp, #-8]
80021bb0:	eb0022f3 	bl	8002a784 <uartputc>
80021bb4:	e1a00000 	nop			@ (mov r0, r0)
80021bb8:	e24bd004 	sub	sp, fp, #4
80021bbc:	e8bd8800 	pop	{fp, pc}
80021bc0:	800d4ed8 	.word	0x800d4ed8

80021bc4 <consoleintr>:
80021bc4:	e92d4800 	push	{fp, lr}
80021bc8:	e28db004 	add	fp, sp, #4
80021bcc:	e24dd010 	sub	sp, sp, #16
80021bd0:	e50b0010 	str	r0, [fp, #-16]
80021bd4:	e59f032c 	ldr	r0, [pc, #812]	@ 80021f08 <consoleintr+0x344>
80021bd8:	eb00138d 	bl	80026a14 <acquire>
80021bdc:	ea0000be 	b	80021edc <consoleintr+0x318>
80021be0:	e51b3008 	ldr	r3, [fp, #-8]
80021be4:	e353007f 	cmp	r3, #127	@ 0x7f
80021be8:	0a000028 	beq	80021c90 <consoleintr+0xcc>
80021bec:	e51b3008 	ldr	r3, [fp, #-8]
80021bf0:	e353007f 	cmp	r3, #127	@ 0x7f
80021bf4:	ca00005a 	bgt	80021d64 <consoleintr+0x1a0>
80021bf8:	e51b3008 	ldr	r3, [fp, #-8]
80021bfc:	e3530015 	cmp	r3, #21
80021c00:	0a000011 	beq	80021c4c <consoleintr+0x88>
80021c04:	e51b3008 	ldr	r3, [fp, #-8]
80021c08:	e3530015 	cmp	r3, #21
80021c0c:	ca000054 	bgt	80021d64 <consoleintr+0x1a0>
80021c10:	e51b3008 	ldr	r3, [fp, #-8]
80021c14:	e3530008 	cmp	r3, #8
80021c18:	0a00001c 	beq	80021c90 <consoleintr+0xcc>
80021c1c:	e51b3008 	ldr	r3, [fp, #-8]
80021c20:	e3530010 	cmp	r3, #16
80021c24:	1a00004e 	bne	80021d64 <consoleintr+0x1a0>
80021c28:	eb001114 	bl	80026080 <procdump>
80021c2c:	ea0000aa 	b	80021edc <consoleintr+0x318>
80021c30:	e59f32d0 	ldr	r3, [pc, #720]	@ 80021f08 <consoleintr+0x344>
80021c34:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80021c38:	e2433001 	sub	r3, r3, #1
80021c3c:	e59f22c4 	ldr	r2, [pc, #708]	@ 80021f08 <consoleintr+0x344>
80021c40:	e582323c 	str	r3, [r2, #572]	@ 0x23c
80021c44:	e3a00c01 	mov	r0, #256	@ 0x100
80021c48:	ebffffc2 	bl	80021b58 <consputc>
80021c4c:	e59f32b4 	ldr	r3, [pc, #692]	@ 80021f08 <consoleintr+0x344>
80021c50:	e593223c 	ldr	r2, [r3, #572]	@ 0x23c
80021c54:	e59f32ac 	ldr	r3, [pc, #684]	@ 80021f08 <consoleintr+0x344>
80021c58:	e5933238 	ldr	r3, [r3, #568]	@ 0x238
80021c5c:	e1520003 	cmp	r2, r3
80021c60:	0a000098 	beq	80021ec8 <consoleintr+0x304>
80021c64:	e59f329c 	ldr	r3, [pc, #668]	@ 80021f08 <consoleintr+0x344>
80021c68:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80021c6c:	e2433001 	sub	r3, r3, #1
80021c70:	e1a03b83 	lsl	r3, r3, #23
80021c74:	e1a03ba3 	lsr	r3, r3, #23
80021c78:	e59f2288 	ldr	r2, [pc, #648]	@ 80021f08 <consoleintr+0x344>
80021c7c:	e0823003 	add	r3, r2, r3
80021c80:	e5d33034 	ldrb	r3, [r3, #52]	@ 0x34
80021c84:	e353000a 	cmp	r3, #10
80021c88:	1affffe8 	bne	80021c30 <consoleintr+0x6c>
80021c8c:	ea00008d 	b	80021ec8 <consoleintr+0x304>
80021c90:	e59f3270 	ldr	r3, [pc, #624]	@ 80021f08 <consoleintr+0x344>
80021c94:	e593223c 	ldr	r2, [r3, #572]	@ 0x23c
80021c98:	e59f3268 	ldr	r3, [pc, #616]	@ 80021f08 <consoleintr+0x344>
80021c9c:	e5933238 	ldr	r3, [r3, #568]	@ 0x238
80021ca0:	e1520003 	cmp	r2, r3
80021ca4:	0a00000d 	beq	80021ce0 <consoleintr+0x11c>
80021ca8:	e59f3258 	ldr	r3, [pc, #600]	@ 80021f08 <consoleintr+0x344>
80021cac:	e593223c 	ldr	r2, [r3, #572]	@ 0x23c
80021cb0:	e59f3250 	ldr	r3, [pc, #592]	@ 80021f08 <consoleintr+0x344>
80021cb4:	e5933234 	ldr	r3, [r3, #564]	@ 0x234
80021cb8:	e1520003 	cmp	r2, r3
80021cbc:	0a000007 	beq	80021ce0 <consoleintr+0x11c>
80021cc0:	e59f3240 	ldr	r3, [pc, #576]	@ 80021f08 <consoleintr+0x344>
80021cc4:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80021cc8:	e2433001 	sub	r3, r3, #1
80021ccc:	e59f2234 	ldr	r2, [pc, #564]	@ 80021f08 <consoleintr+0x344>
80021cd0:	e582323c 	str	r3, [r2, #572]	@ 0x23c
80021cd4:	e3a00c01 	mov	r0, #256	@ 0x100
80021cd8:	ebffff9e 	bl	80021b58 <consputc>
80021cdc:	ea00007b 	b	80021ed0 <consoleintr+0x30c>
80021ce0:	e59f3220 	ldr	r3, [pc, #544]	@ 80021f08 <consoleintr+0x344>
80021ce4:	e5933240 	ldr	r3, [r3, #576]	@ 0x240
80021ce8:	e3530000 	cmp	r3, #0
80021cec:	0a000077 	beq	80021ed0 <consoleintr+0x30c>
80021cf0:	e59f3210 	ldr	r3, [pc, #528]	@ 80021f08 <consoleintr+0x344>
80021cf4:	e593223c 	ldr	r2, [r3, #572]	@ 0x23c
80021cf8:	e59f3208 	ldr	r3, [pc, #520]	@ 80021f08 <consoleintr+0x344>
80021cfc:	e5933234 	ldr	r3, [r3, #564]	@ 0x234
80021d00:	e0423003 	sub	r3, r2, r3
80021d04:	e3530c02 	cmp	r3, #512	@ 0x200
80021d08:	2a000070 	bcs	80021ed0 <consoleintr+0x30c>
80021d0c:	e59f31f4 	ldr	r3, [pc, #500]	@ 80021f08 <consoleintr+0x344>
80021d10:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80021d14:	e2832001 	add	r2, r3, #1
80021d18:	e59f11e8 	ldr	r1, [pc, #488]	@ 80021f08 <consoleintr+0x344>
80021d1c:	e581223c 	str	r2, [r1, #572]	@ 0x23c
80021d20:	e1a03b83 	lsl	r3, r3, #23
80021d24:	e1a03ba3 	lsr	r3, r3, #23
80021d28:	e51b2008 	ldr	r2, [fp, #-8]
80021d2c:	e6ef1072 	uxtb	r1, r2
80021d30:	e59f21d0 	ldr	r2, [pc, #464]	@ 80021f08 <consoleintr+0x344>
80021d34:	e0823003 	add	r3, r2, r3
80021d38:	e1a02001 	mov	r2, r1
80021d3c:	e5c32034 	strb	r2, [r3, #52]	@ 0x34
80021d40:	e3a00c01 	mov	r0, #256	@ 0x100
80021d44:	ebffff83 	bl	80021b58 <consputc>
80021d48:	e59f31b8 	ldr	r3, [pc, #440]	@ 80021f08 <consoleintr+0x344>
80021d4c:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80021d50:	e59f21b0 	ldr	r2, [pc, #432]	@ 80021f08 <consoleintr+0x344>
80021d54:	e5823238 	str	r3, [r2, #568]	@ 0x238
80021d58:	e59f01ac 	ldr	r0, [pc, #428]	@ 80021f0c <consoleintr+0x348>
80021d5c:	eb00108d 	bl	80025f98 <wakeup>
80021d60:	ea00005a 	b	80021ed0 <consoleintr+0x30c>
80021d64:	e51b3008 	ldr	r3, [fp, #-8]
80021d68:	e3530000 	cmp	r3, #0
80021d6c:	0a000059 	beq	80021ed8 <consoleintr+0x314>
80021d70:	e59f3190 	ldr	r3, [pc, #400]	@ 80021f08 <consoleintr+0x344>
80021d74:	e593223c 	ldr	r2, [r3, #572]	@ 0x23c
80021d78:	e59f3188 	ldr	r3, [pc, #392]	@ 80021f08 <consoleintr+0x344>
80021d7c:	e5933234 	ldr	r3, [r3, #564]	@ 0x234
80021d80:	e0423003 	sub	r3, r2, r3
80021d84:	e3530c02 	cmp	r3, #512	@ 0x200
80021d88:	2a000052 	bcs	80021ed8 <consoleintr+0x314>
80021d8c:	e51b3008 	ldr	r3, [fp, #-8]
80021d90:	e353000d 	cmp	r3, #13
80021d94:	0a000001 	beq	80021da0 <consoleintr+0x1dc>
80021d98:	e51b3008 	ldr	r3, [fp, #-8]
80021d9c:	ea000000 	b	80021da4 <consoleintr+0x1e0>
80021da0:	e3a0300a 	mov	r3, #10
80021da4:	e50b3008 	str	r3, [fp, #-8]
80021da8:	e59f3158 	ldr	r3, [pc, #344]	@ 80021f08 <consoleintr+0x344>
80021dac:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80021db0:	e2832001 	add	r2, r3, #1
80021db4:	e59f114c 	ldr	r1, [pc, #332]	@ 80021f08 <consoleintr+0x344>
80021db8:	e581223c 	str	r2, [r1, #572]	@ 0x23c
80021dbc:	e1a03b83 	lsl	r3, r3, #23
80021dc0:	e1a03ba3 	lsr	r3, r3, #23
80021dc4:	e51b2008 	ldr	r2, [fp, #-8]
80021dc8:	e6ef1072 	uxtb	r1, r2
80021dcc:	e59f2134 	ldr	r2, [pc, #308]	@ 80021f08 <consoleintr+0x344>
80021dd0:	e0823003 	add	r3, r2, r3
80021dd4:	e1a02001 	mov	r2, r1
80021dd8:	e5c32034 	strb	r2, [r3, #52]	@ 0x34
80021ddc:	e51b3008 	ldr	r3, [fp, #-8]
80021de0:	e3530009 	cmp	r3, #9
80021de4:	0a000001 	beq	80021df0 <consoleintr+0x22c>
80021de8:	e51b0008 	ldr	r0, [fp, #-8]
80021dec:	ebffff59 	bl	80021b58 <consputc>
80021df0:	e51b3008 	ldr	r3, [fp, #-8]
80021df4:	e3530009 	cmp	r3, #9
80021df8:	1a000009 	bne	80021e24 <consoleintr+0x260>
80021dfc:	e59f3104 	ldr	r3, [pc, #260]	@ 80021f08 <consoleintr+0x344>
80021e00:	e3a02001 	mov	r2, #1
80021e04:	e5832240 	str	r2, [r3, #576]	@ 0x240
80021e08:	e59f30f8 	ldr	r3, [pc, #248]	@ 80021f08 <consoleintr+0x344>
80021e0c:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80021e10:	e59f20f0 	ldr	r2, [pc, #240]	@ 80021f08 <consoleintr+0x344>
80021e14:	e5823238 	str	r3, [r2, #568]	@ 0x238
80021e18:	e59f00ec 	ldr	r0, [pc, #236]	@ 80021f0c <consoleintr+0x348>
80021e1c:	eb00105d 	bl	80025f98 <wakeup>
80021e20:	ea00002c 	b	80021ed8 <consoleintr+0x314>
80021e24:	e51b3008 	ldr	r3, [fp, #-8]
80021e28:	e353000a 	cmp	r3, #10
80021e2c:	0a000002 	beq	80021e3c <consoleintr+0x278>
80021e30:	e51b3008 	ldr	r3, [fp, #-8]
80021e34:	e3530004 	cmp	r3, #4
80021e38:	1a000009 	bne	80021e64 <consoleintr+0x2a0>
80021e3c:	e59f30c4 	ldr	r3, [pc, #196]	@ 80021f08 <consoleintr+0x344>
80021e40:	e3a02000 	mov	r2, #0
80021e44:	e5832240 	str	r2, [r3, #576]	@ 0x240
80021e48:	e59f30b8 	ldr	r3, [pc, #184]	@ 80021f08 <consoleintr+0x344>
80021e4c:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80021e50:	e59f20b0 	ldr	r2, [pc, #176]	@ 80021f08 <consoleintr+0x344>
80021e54:	e5823238 	str	r3, [r2, #568]	@ 0x238
80021e58:	e59f00ac 	ldr	r0, [pc, #172]	@ 80021f0c <consoleintr+0x348>
80021e5c:	eb00104d 	bl	80025f98 <wakeup>
80021e60:	ea00001c 	b	80021ed8 <consoleintr+0x314>
80021e64:	e59f309c 	ldr	r3, [pc, #156]	@ 80021f08 <consoleintr+0x344>
80021e68:	e5933240 	ldr	r3, [r3, #576]	@ 0x240
80021e6c:	e3530000 	cmp	r3, #0
80021e70:	0a000006 	beq	80021e90 <consoleintr+0x2cc>
80021e74:	e59f308c 	ldr	r3, [pc, #140]	@ 80021f08 <consoleintr+0x344>
80021e78:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80021e7c:	e59f2084 	ldr	r2, [pc, #132]	@ 80021f08 <consoleintr+0x344>
80021e80:	e5823238 	str	r3, [r2, #568]	@ 0x238
80021e84:	e59f0080 	ldr	r0, [pc, #128]	@ 80021f0c <consoleintr+0x348>
80021e88:	eb001042 	bl	80025f98 <wakeup>
80021e8c:	ea000011 	b	80021ed8 <consoleintr+0x314>
80021e90:	e59f3070 	ldr	r3, [pc, #112]	@ 80021f08 <consoleintr+0x344>
80021e94:	e593223c 	ldr	r2, [r3, #572]	@ 0x23c
80021e98:	e59f3068 	ldr	r3, [pc, #104]	@ 80021f08 <consoleintr+0x344>
80021e9c:	e5933234 	ldr	r3, [r3, #564]	@ 0x234
80021ea0:	e2833c02 	add	r3, r3, #512	@ 0x200
80021ea4:	e1520003 	cmp	r2, r3
80021ea8:	1a00000a 	bne	80021ed8 <consoleintr+0x314>
80021eac:	e59f3054 	ldr	r3, [pc, #84]	@ 80021f08 <consoleintr+0x344>
80021eb0:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80021eb4:	e59f204c 	ldr	r2, [pc, #76]	@ 80021f08 <consoleintr+0x344>
80021eb8:	e5823238 	str	r3, [r2, #568]	@ 0x238
80021ebc:	e59f0048 	ldr	r0, [pc, #72]	@ 80021f0c <consoleintr+0x348>
80021ec0:	eb001034 	bl	80025f98 <wakeup>
80021ec4:	ea000003 	b	80021ed8 <consoleintr+0x314>
80021ec8:	e1a00000 	nop			@ (mov r0, r0)
80021ecc:	ea000002 	b	80021edc <consoleintr+0x318>
80021ed0:	e1a00000 	nop			@ (mov r0, r0)
80021ed4:	ea000000 	b	80021edc <consoleintr+0x318>
80021ed8:	e1a00000 	nop			@ (mov r0, r0)
80021edc:	e51b3010 	ldr	r3, [fp, #-16]
80021ee0:	e12fff33 	blx	r3
80021ee4:	e50b0008 	str	r0, [fp, #-8]
80021ee8:	e51b3008 	ldr	r3, [fp, #-8]
80021eec:	e3530000 	cmp	r3, #0
80021ef0:	aaffff3a 	bge	80021be0 <consoleintr+0x1c>
80021ef4:	e59f000c 	ldr	r0, [pc, #12]	@ 80021f08 <consoleintr+0x344>
80021ef8:	eb0012d0 	bl	80026a40 <release>
80021efc:	e1a00000 	nop			@ (mov r0, r0)
80021f00:	e24bd004 	sub	sp, fp, #4
80021f04:	e8bd8800 	pop	{fp, pc}
80021f08:	800d4f14 	.word	0x800d4f14
80021f0c:	800d5148 	.word	0x800d5148

80021f10 <consoleread>:
80021f10:	e92d4800 	push	{fp, lr}
80021f14:	e28db004 	add	fp, sp, #4
80021f18:	e24dd018 	sub	sp, sp, #24
80021f1c:	e50b0010 	str	r0, [fp, #-16]
80021f20:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80021f24:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80021f28:	e51b0010 	ldr	r0, [fp, #-16]
80021f2c:	eb000534 	bl	80023404 <iunlock>
80021f30:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80021f34:	e50b3008 	str	r3, [fp, #-8]
80021f38:	e59f0128 	ldr	r0, [pc, #296]	@ 80022068 <consoleread+0x158>
80021f3c:	eb0012b4 	bl	80026a14 <acquire>
80021f40:	ea000037 	b	80022024 <consoleread+0x114>
80021f44:	e59f3120 	ldr	r3, [pc, #288]	@ 8002206c <consoleread+0x15c>
80021f48:	e5933000 	ldr	r3, [r3]
80021f4c:	e5933024 	ldr	r3, [r3, #36]	@ 0x24
80021f50:	e3530000 	cmp	r3, #0
80021f54:	0a000005 	beq	80021f70 <consoleread+0x60>
80021f58:	e59f0108 	ldr	r0, [pc, #264]	@ 80022068 <consoleread+0x158>
80021f5c:	eb0012b7 	bl	80026a40 <release>
80021f60:	e51b0010 	ldr	r0, [fp, #-16]
80021f64:	eb0004c2 	bl	80023274 <ilock>
80021f68:	e3e03000 	mvn	r3, #0
80021f6c:	ea00003a 	b	8002205c <consoleread+0x14c>
80021f70:	e59f10f0 	ldr	r1, [pc, #240]	@ 80022068 <consoleread+0x158>
80021f74:	e59f00f4 	ldr	r0, [pc, #244]	@ 80022070 <consoleread+0x160>
80021f78:	eb000f92 	bl	80025dc8 <sleep>
80021f7c:	e59f30e4 	ldr	r3, [pc, #228]	@ 80022068 <consoleread+0x158>
80021f80:	e5932234 	ldr	r2, [r3, #564]	@ 0x234
80021f84:	e59f30dc 	ldr	r3, [pc, #220]	@ 80022068 <consoleread+0x158>
80021f88:	e5933238 	ldr	r3, [r3, #568]	@ 0x238
80021f8c:	e1520003 	cmp	r2, r3
80021f90:	0affffeb 	beq	80021f44 <consoleread+0x34>
80021f94:	e59f30cc 	ldr	r3, [pc, #204]	@ 80022068 <consoleread+0x158>
80021f98:	e5933234 	ldr	r3, [r3, #564]	@ 0x234
80021f9c:	e2832001 	add	r2, r3, #1
80021fa0:	e59f10c0 	ldr	r1, [pc, #192]	@ 80022068 <consoleread+0x158>
80021fa4:	e5812234 	str	r2, [r1, #564]	@ 0x234
80021fa8:	e1a03b83 	lsl	r3, r3, #23
80021fac:	e1a03ba3 	lsr	r3, r3, #23
80021fb0:	e59f20b0 	ldr	r2, [pc, #176]	@ 80022068 <consoleread+0x158>
80021fb4:	e0823003 	add	r3, r2, r3
80021fb8:	e5d33034 	ldrb	r3, [r3, #52]	@ 0x34
80021fbc:	e50b300c 	str	r3, [fp, #-12]
80021fc0:	e51b300c 	ldr	r3, [fp, #-12]
80021fc4:	e3530004 	cmp	r3, #4
80021fc8:	1a000009 	bne	80021ff4 <consoleread+0xe4>
80021fcc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80021fd0:	e51b2008 	ldr	r2, [fp, #-8]
80021fd4:	e1520003 	cmp	r2, r3
80021fd8:	9a000015 	bls	80022034 <consoleread+0x124>
80021fdc:	e59f3084 	ldr	r3, [pc, #132]	@ 80022068 <consoleread+0x158>
80021fe0:	e5933234 	ldr	r3, [r3, #564]	@ 0x234
80021fe4:	e2433001 	sub	r3, r3, #1
80021fe8:	e59f2078 	ldr	r2, [pc, #120]	@ 80022068 <consoleread+0x158>
80021fec:	e5823234 	str	r3, [r2, #564]	@ 0x234
80021ff0:	ea00000f 	b	80022034 <consoleread+0x124>
80021ff4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80021ff8:	e2832001 	add	r2, r3, #1
80021ffc:	e50b2014 	str	r2, [fp, #-20]	@ 0xffffffec
80022000:	e51b200c 	ldr	r2, [fp, #-12]
80022004:	e6ef2072 	uxtb	r2, r2
80022008:	e5c32000 	strb	r2, [r3]
8002200c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022010:	e2433001 	sub	r3, r3, #1
80022014:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80022018:	e51b300c 	ldr	r3, [fp, #-12]
8002201c:	e353000a 	cmp	r3, #10
80022020:	0a000005 	beq	8002203c <consoleread+0x12c>
80022024:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022028:	e3530000 	cmp	r3, #0
8002202c:	caffffd2 	bgt	80021f7c <consoleread+0x6c>
80022030:	ea000002 	b	80022040 <consoleread+0x130>
80022034:	e1a00000 	nop			@ (mov r0, r0)
80022038:	ea000000 	b	80022040 <consoleread+0x130>
8002203c:	e1a00000 	nop			@ (mov r0, r0)
80022040:	e59f0020 	ldr	r0, [pc, #32]	@ 80022068 <consoleread+0x158>
80022044:	eb00127d 	bl	80026a40 <release>
80022048:	e51b0010 	ldr	r0, [fp, #-16]
8002204c:	eb000488 	bl	80023274 <ilock>
80022050:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022054:	e51b2008 	ldr	r2, [fp, #-8]
80022058:	e0423003 	sub	r3, r2, r3
8002205c:	e1a00003 	mov	r0, r3
80022060:	e24bd004 	sub	sp, fp, #4
80022064:	e8bd8800 	pop	{fp, pc}
80022068:	800d4f14 	.word	0x800d4f14
8002206c:	800d97a8 	.word	0x800d97a8
80022070:	800d5148 	.word	0x800d5148

80022074 <consolewrite>:
80022074:	e92d4800 	push	{fp, lr}
80022078:	e28db004 	add	fp, sp, #4
8002207c:	e24dd018 	sub	sp, sp, #24
80022080:	e50b0010 	str	r0, [fp, #-16]
80022084:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80022088:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
8002208c:	e51b0010 	ldr	r0, [fp, #-16]
80022090:	eb0004db 	bl	80023404 <iunlock>
80022094:	e59f0060 	ldr	r0, [pc, #96]	@ 800220fc <consolewrite+0x88>
80022098:	eb00125d 	bl	80026a14 <acquire>
8002209c:	e3a03000 	mov	r3, #0
800220a0:	e50b3008 	str	r3, [fp, #-8]
800220a4:	ea000008 	b	800220cc <consolewrite+0x58>
800220a8:	e51b3008 	ldr	r3, [fp, #-8]
800220ac:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800220b0:	e0823003 	add	r3, r2, r3
800220b4:	e5d33000 	ldrb	r3, [r3]
800220b8:	e1a00003 	mov	r0, r3
800220bc:	ebfffea5 	bl	80021b58 <consputc>
800220c0:	e51b3008 	ldr	r3, [fp, #-8]
800220c4:	e2833001 	add	r3, r3, #1
800220c8:	e50b3008 	str	r3, [fp, #-8]
800220cc:	e51b2008 	ldr	r2, [fp, #-8]
800220d0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800220d4:	e1520003 	cmp	r2, r3
800220d8:	bafffff2 	blt	800220a8 <consolewrite+0x34>
800220dc:	e59f0018 	ldr	r0, [pc, #24]	@ 800220fc <consolewrite+0x88>
800220e0:	eb001256 	bl	80026a40 <release>
800220e4:	e51b0010 	ldr	r0, [fp, #-16]
800220e8:	eb000461 	bl	80023274 <ilock>
800220ec:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800220f0:	e1a00003 	mov	r0, r3
800220f4:	e24bd004 	sub	sp, fp, #4
800220f8:	e8bd8800 	pop	{fp, pc}
800220fc:	800d4edc 	.word	0x800d4edc

80022100 <consoleinit>:
80022100:	e92d4800 	push	{fp, lr}
80022104:	e28db004 	add	fp, sp, #4
80022108:	e59f103c 	ldr	r1, [pc, #60]	@ 8002214c <consoleinit+0x4c>
8002210c:	e59f003c 	ldr	r0, [pc, #60]	@ 80022150 <consoleinit+0x50>
80022110:	eb00122d 	bl	800269cc <initlock>
80022114:	e59f1038 	ldr	r1, [pc, #56]	@ 80022154 <consoleinit+0x54>
80022118:	e59f0038 	ldr	r0, [pc, #56]	@ 80022158 <consoleinit+0x58>
8002211c:	eb00122a 	bl	800269cc <initlock>
80022120:	e59f3034 	ldr	r3, [pc, #52]	@ 8002215c <consoleinit+0x5c>
80022124:	e59f2034 	ldr	r2, [pc, #52]	@ 80022160 <consoleinit+0x60>
80022128:	e583200c 	str	r2, [r3, #12]
8002212c:	e59f3028 	ldr	r3, [pc, #40]	@ 8002215c <consoleinit+0x5c>
80022130:	e59f202c 	ldr	r2, [pc, #44]	@ 80022164 <consoleinit+0x64>
80022134:	e5832008 	str	r2, [r3, #8]
80022138:	e59f3010 	ldr	r3, [pc, #16]	@ 80022150 <consoleinit+0x50>
8002213c:	e3a02001 	mov	r2, #1
80022140:	e5832034 	str	r2, [r3, #52]	@ 0x34
80022144:	e1a00000 	nop			@ (mov r0, r0)
80022148:	e8bd8800 	pop	{fp, pc}
8002214c:	8002ac3c 	.word	0x8002ac3c
80022150:	800d4edc 	.word	0x800d4edc
80022154:	8002ac44 	.word	0x8002ac44
80022158:	800d4f14 	.word	0x800d4f14
8002215c:	800d5158 	.word	0x800d5158
80022160:	80022074 	.word	0x80022074
80022164:	80021f10 	.word	0x80021f10

80022168 <exec>:
80022168:	e92d4810 	push	{r4, fp, lr}
8002216c:	e28db008 	add	fp, sp, #8
80022170:	e24ddf49 	sub	sp, sp, #292	@ 0x124
80022174:	e50b0120 	str	r0, [fp, #-288]	@ 0xfffffee0
80022178:	e50b1124 	str	r1, [fp, #-292]	@ 0xfffffedc
8002217c:	e51b0120 	ldr	r0, [fp, #-288]	@ 0xfffffee0
80022180:	eb00086d 	bl	8002433c <namei>
80022184:	e50b0010 	str	r0, [fp, #-16]
80022188:	e51b3010 	ldr	r3, [fp, #-16]
8002218c:	e3530000 	cmp	r3, #0
80022190:	1a000001 	bne	8002219c <exec+0x34>
80022194:	e3e03000 	mvn	r3, #0
80022198:	ea000120 	b	80022620 <exec+0x4b8>
8002219c:	e51b0010 	ldr	r0, [fp, #-16]
800221a0:	eb000433 	bl	80023274 <ilock>
800221a4:	e24b1068 	sub	r1, fp, #104	@ 0x68
800221a8:	e3a03034 	mov	r3, #52	@ 0x34
800221ac:	e3a02000 	mov	r2, #0
800221b0:	e51b0010 	ldr	r0, [fp, #-16]
800221b4:	eb000637 	bl	80023a98 <readi>
800221b8:	e1a03000 	mov	r3, r0
800221bc:	e3530033 	cmp	r3, #51	@ 0x33
800221c0:	9a0000f6 	bls	800225a0 <exec+0x438>
800221c4:	e51b3068 	ldr	r3, [fp, #-104]	@ 0xffffff98
800221c8:	e59f245c 	ldr	r2, [pc, #1116]	@ 8002262c <exec+0x4c4>
800221cc:	e1530002 	cmp	r3, r2
800221d0:	1a0000f4 	bne	800225a8 <exec+0x440>
800221d4:	e3a03000 	mov	r3, #0
800221d8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800221dc:	eb001c68 	bl	80029384 <kpt_alloc>
800221e0:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
800221e4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800221e8:	e3530000 	cmp	r3, #0
800221ec:	0a0000ef 	beq	800225b0 <exec+0x448>
800221f0:	e3a03000 	mov	r3, #0
800221f4:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
800221f8:	e3a03000 	mov	r3, #0
800221fc:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80022200:	e51b304c 	ldr	r3, [fp, #-76]	@ 0xffffffb4
80022204:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80022208:	ea00002e 	b	800222c8 <exec+0x160>
8002220c:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
80022210:	e24b1088 	sub	r1, fp, #136	@ 0x88
80022214:	e3a03020 	mov	r3, #32
80022218:	e51b0010 	ldr	r0, [fp, #-16]
8002221c:	eb00061d 	bl	80023a98 <readi>
80022220:	e1a03000 	mov	r3, r0
80022224:	e3530020 	cmp	r3, #32
80022228:	1a0000e2 	bne	800225b8 <exec+0x450>
8002222c:	e51b3088 	ldr	r3, [fp, #-136]	@ 0xffffff78
80022230:	e3530001 	cmp	r3, #1
80022234:	1a00001c 	bne	800222ac <exec+0x144>
80022238:	e51b2074 	ldr	r2, [fp, #-116]	@ 0xffffff8c
8002223c:	e51b3078 	ldr	r3, [fp, #-120]	@ 0xffffff88
80022240:	e1520003 	cmp	r2, r3
80022244:	3a0000dd 	bcc	800225c0 <exec+0x458>
80022248:	e51b2080 	ldr	r2, [fp, #-128]	@ 0xffffff80
8002224c:	e51b3074 	ldr	r3, [fp, #-116]	@ 0xffffff8c
80022250:	e0823003 	add	r3, r2, r3
80022254:	e1a02003 	mov	r2, r3
80022258:	e51b102c 	ldr	r1, [fp, #-44]	@ 0xffffffd4
8002225c:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80022260:	eb001d73 	bl	80029834 <allocuvm>
80022264:	e1a03000 	mov	r3, r0
80022268:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
8002226c:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80022270:	e3530000 	cmp	r3, #0
80022274:	0a0000d3 	beq	800225c8 <exec+0x460>
80022278:	e51b3080 	ldr	r3, [fp, #-128]	@ 0xffffff80
8002227c:	e1a01003 	mov	r1, r3
80022280:	e51b2084 	ldr	r2, [fp, #-132]	@ 0xffffff7c
80022284:	e51b3078 	ldr	r3, [fp, #-120]	@ 0xffffff88
80022288:	e58d3000 	str	r3, [sp]
8002228c:	e1a03002 	mov	r3, r2
80022290:	e51b2010 	ldr	r2, [fp, #-16]
80022294:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80022298:	eb001d19 	bl	80029704 <loaduvm>
8002229c:	e1a03000 	mov	r3, r0
800222a0:	e3530000 	cmp	r3, #0
800222a4:	ba0000c9 	blt	800225d0 <exec+0x468>
800222a8:	ea000000 	b	800222b0 <exec+0x148>
800222ac:	e1a00000 	nop			@ (mov r0, r0)
800222b0:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800222b4:	e2833001 	add	r3, r3, #1
800222b8:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
800222bc:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
800222c0:	e2833020 	add	r3, r3, #32
800222c4:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
800222c8:	e15b33bc 	ldrh	r3, [fp, #-60]	@ 0xffffffc4
800222cc:	e1a02003 	mov	r2, r3
800222d0:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800222d4:	e1530002 	cmp	r3, r2
800222d8:	baffffcb 	blt	8002220c <exec+0xa4>
800222dc:	e51b0010 	ldr	r0, [fp, #-16]
800222e0:	eb0004a4 	bl	80023578 <iunlockput>
800222e4:	e3a03000 	mov	r3, #0
800222e8:	e50b3010 	str	r3, [fp, #-16]
800222ec:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
800222f0:	e2833eff 	add	r3, r3, #4080	@ 0xff0
800222f4:	e283300f 	add	r3, r3, #15
800222f8:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
800222fc:	e3c3300f 	bic	r3, r3, #15
80022300:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
80022304:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80022308:	e2833a02 	add	r3, r3, #8192	@ 0x2000
8002230c:	e1a02003 	mov	r2, r3
80022310:	e51b102c 	ldr	r1, [fp, #-44]	@ 0xffffffd4
80022314:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80022318:	eb001d45 	bl	80029834 <allocuvm>
8002231c:	e1a03000 	mov	r3, r0
80022320:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
80022324:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80022328:	e3530000 	cmp	r3, #0
8002232c:	0a0000a9 	beq	800225d8 <exec+0x470>
80022330:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80022334:	e2433a02 	sub	r3, r3, #8192	@ 0x2000
80022338:	e1a01003 	mov	r1, r3
8002233c:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80022340:	eb001df0 	bl	80029b08 <clearpteu>
80022344:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80022348:	e50b3030 	str	r3, [fp, #-48]	@ 0xffffffd0
8002234c:	e3a03000 	mov	r3, #0
80022350:	e50b3028 	str	r3, [fp, #-40]	@ 0xffffffd8
80022354:	ea00002e 	b	80022414 <exec+0x2ac>
80022358:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8002235c:	e353001f 	cmp	r3, #31
80022360:	8a00009e 	bhi	800225e0 <exec+0x478>
80022364:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80022368:	e1a03103 	lsl	r3, r3, #2
8002236c:	e51b2124 	ldr	r2, [fp, #-292]	@ 0xfffffedc
80022370:	e0823003 	add	r3, r2, r3
80022374:	e5933000 	ldr	r3, [r3]
80022378:	e1a00003 	mov	r0, r3
8002237c:	ebfff85a 	bl	800204ec <strlen>
80022380:	e1a03000 	mov	r3, r0
80022384:	e1a02003 	mov	r2, r3
80022388:	e51b3030 	ldr	r3, [fp, #-48]	@ 0xffffffd0
8002238c:	e0433002 	sub	r3, r3, r2
80022390:	e2433001 	sub	r3, r3, #1
80022394:	e3c33003 	bic	r3, r3, #3
80022398:	e50b3030 	str	r3, [fp, #-48]	@ 0xffffffd0
8002239c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
800223a0:	e1a03103 	lsl	r3, r3, #2
800223a4:	e51b2124 	ldr	r2, [fp, #-292]	@ 0xfffffedc
800223a8:	e0823003 	add	r3, r2, r3
800223ac:	e5934000 	ldr	r4, [r3]
800223b0:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
800223b4:	e1a03103 	lsl	r3, r3, #2
800223b8:	e51b2124 	ldr	r2, [fp, #-292]	@ 0xfffffedc
800223bc:	e0823003 	add	r3, r2, r3
800223c0:	e5933000 	ldr	r3, [r3]
800223c4:	e1a00003 	mov	r0, r3
800223c8:	ebfff847 	bl	800204ec <strlen>
800223cc:	e1a03000 	mov	r3, r0
800223d0:	e2833001 	add	r3, r3, #1
800223d4:	e1a02004 	mov	r2, r4
800223d8:	e51b1030 	ldr	r1, [fp, #-48]	@ 0xffffffd0
800223dc:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
800223e0:	eb001e5d 	bl	80029d5c <copyout>
800223e4:	e1a03000 	mov	r3, r0
800223e8:	e3530000 	cmp	r3, #0
800223ec:	ba00007d 	blt	800225e8 <exec+0x480>
800223f0:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
800223f4:	e1a03103 	lsl	r3, r3, #2
800223f8:	e243300c 	sub	r3, r3, #12
800223fc:	e083300b 	add	r3, r3, fp
80022400:	e51b2030 	ldr	r2, [fp, #-48]	@ 0xffffffd0
80022404:	e503210c 	str	r2, [r3, #-268]	@ 0xfffffef4
80022408:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8002240c:	e2833001 	add	r3, r3, #1
80022410:	e50b3028 	str	r3, [fp, #-40]	@ 0xffffffd8
80022414:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80022418:	e1a03103 	lsl	r3, r3, #2
8002241c:	e51b2124 	ldr	r2, [fp, #-292]	@ 0xfffffedc
80022420:	e0823003 	add	r3, r2, r3
80022424:	e5933000 	ldr	r3, [r3]
80022428:	e3530000 	cmp	r3, #0
8002242c:	1affffc9 	bne	80022358 <exec+0x1f0>
80022430:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80022434:	e1a03103 	lsl	r3, r3, #2
80022438:	e243300c 	sub	r3, r3, #12
8002243c:	e083300b 	add	r3, r3, fp
80022440:	e3a02000 	mov	r2, #0
80022444:	e503210c 	str	r2, [r3, #-268]	@ 0xfffffef4
80022448:	e59f31e0 	ldr	r3, [pc, #480]	@ 80022630 <exec+0x4c8>
8002244c:	e5933000 	ldr	r3, [r3]
80022450:	e5933018 	ldr	r3, [r3, #24]
80022454:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80022458:	e5832010 	str	r2, [r3, #16]
8002245c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80022460:	e2833001 	add	r3, r3, #1
80022464:	e1a02103 	lsl	r2, r3, #2
80022468:	e59f31c0 	ldr	r3, [pc, #448]	@ 80022630 <exec+0x4c8>
8002246c:	e5933000 	ldr	r3, [r3]
80022470:	e5933018 	ldr	r3, [r3, #24]
80022474:	e51b1030 	ldr	r1, [fp, #-48]	@ 0xffffffd0
80022478:	e0412002 	sub	r2, r1, r2
8002247c:	e5832014 	str	r2, [r3, #20]
80022480:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80022484:	e2833001 	add	r3, r3, #1
80022488:	e1a03103 	lsl	r3, r3, #2
8002248c:	e51b2030 	ldr	r2, [fp, #-48]	@ 0xffffffd0
80022490:	e0423003 	sub	r3, r2, r3
80022494:	e50b3030 	str	r3, [fp, #-48]	@ 0xffffffd0
80022498:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8002249c:	e2833001 	add	r3, r3, #1
800224a0:	e1a03103 	lsl	r3, r3, #2
800224a4:	e24b2f46 	sub	r2, fp, #280	@ 0x118
800224a8:	e51b1030 	ldr	r1, [fp, #-48]	@ 0xffffffd0
800224ac:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
800224b0:	eb001e29 	bl	80029d5c <copyout>
800224b4:	e1a03000 	mov	r3, r0
800224b8:	e3530000 	cmp	r3, #0
800224bc:	ba00004b 	blt	800225f0 <exec+0x488>
800224c0:	e51b3120 	ldr	r3, [fp, #-288]	@ 0xfffffee0
800224c4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800224c8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800224cc:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
800224d0:	ea000009 	b	800224fc <exec+0x394>
800224d4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800224d8:	e5d33000 	ldrb	r3, [r3]
800224dc:	e353002f 	cmp	r3, #47	@ 0x2f
800224e0:	1a000002 	bne	800224f0 <exec+0x388>
800224e4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800224e8:	e2833001 	add	r3, r3, #1
800224ec:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
800224f0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800224f4:	e2833001 	add	r3, r3, #1
800224f8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800224fc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022500:	e5d33000 	ldrb	r3, [r3]
80022504:	e3530000 	cmp	r3, #0
80022508:	1afffff1 	bne	800224d4 <exec+0x36c>
8002250c:	e59f311c 	ldr	r3, [pc, #284]	@ 80022630 <exec+0x4c8>
80022510:	e5933000 	ldr	r3, [r3]
80022514:	e283306c 	add	r3, r3, #108	@ 0x6c
80022518:	e3a02010 	mov	r2, #16
8002251c:	e51b101c 	ldr	r1, [fp, #-28]	@ 0xffffffe4
80022520:	e1a00003 	mov	r0, r3
80022524:	ebfff7c9 	bl	80020450 <safestrcpy>
80022528:	e59f3100 	ldr	r3, [pc, #256]	@ 80022630 <exec+0x4c8>
8002252c:	e5933000 	ldr	r3, [r3]
80022530:	e5933004 	ldr	r3, [r3, #4]
80022534:	e50b3034 	str	r3, [fp, #-52]	@ 0xffffffcc
80022538:	e59f30f0 	ldr	r3, [pc, #240]	@ 80022630 <exec+0x4c8>
8002253c:	e5933000 	ldr	r3, [r3]
80022540:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
80022544:	e5832004 	str	r2, [r3, #4]
80022548:	e59f30e0 	ldr	r3, [pc, #224]	@ 80022630 <exec+0x4c8>
8002254c:	e5933000 	ldr	r3, [r3]
80022550:	e51b202c 	ldr	r2, [fp, #-44]	@ 0xffffffd4
80022554:	e5832000 	str	r2, [r3]
80022558:	e59f30d0 	ldr	r3, [pc, #208]	@ 80022630 <exec+0x4c8>
8002255c:	e5933000 	ldr	r3, [r3]
80022560:	e5933018 	ldr	r3, [r3, #24]
80022564:	e51b2050 	ldr	r2, [fp, #-80]	@ 0xffffffb0
80022568:	e5832044 	str	r2, [r3, #68]	@ 0x44
8002256c:	e59f30bc 	ldr	r3, [pc, #188]	@ 80022630 <exec+0x4c8>
80022570:	e5933000 	ldr	r3, [r3]
80022574:	e5933018 	ldr	r3, [r3, #24]
80022578:	e51b2030 	ldr	r2, [fp, #-48]	@ 0xffffffd0
8002257c:	e5832000 	str	r2, [r3]
80022580:	e59f30a8 	ldr	r3, [pc, #168]	@ 80022630 <exec+0x4c8>
80022584:	e5933000 	ldr	r3, [r3]
80022588:	e1a00003 	mov	r0, r3
8002258c:	eb001c23 	bl	80029620 <switchuvm>
80022590:	e51b0034 	ldr	r0, [fp, #-52]	@ 0xffffffcc
80022594:	eb001d2b 	bl	80029a48 <freevm>
80022598:	e3a03000 	mov	r3, #0
8002259c:	ea00001f 	b	80022620 <exec+0x4b8>
800225a0:	e1a00000 	nop			@ (mov r0, r0)
800225a4:	ea000012 	b	800225f4 <exec+0x48c>
800225a8:	e1a00000 	nop			@ (mov r0, r0)
800225ac:	ea000010 	b	800225f4 <exec+0x48c>
800225b0:	e1a00000 	nop			@ (mov r0, r0)
800225b4:	ea00000e 	b	800225f4 <exec+0x48c>
800225b8:	e1a00000 	nop			@ (mov r0, r0)
800225bc:	ea00000c 	b	800225f4 <exec+0x48c>
800225c0:	e1a00000 	nop			@ (mov r0, r0)
800225c4:	ea00000a 	b	800225f4 <exec+0x48c>
800225c8:	e1a00000 	nop			@ (mov r0, r0)
800225cc:	ea000008 	b	800225f4 <exec+0x48c>
800225d0:	e1a00000 	nop			@ (mov r0, r0)
800225d4:	ea000006 	b	800225f4 <exec+0x48c>
800225d8:	e1a00000 	nop			@ (mov r0, r0)
800225dc:	ea000004 	b	800225f4 <exec+0x48c>
800225e0:	e1a00000 	nop			@ (mov r0, r0)
800225e4:	ea000002 	b	800225f4 <exec+0x48c>
800225e8:	e1a00000 	nop			@ (mov r0, r0)
800225ec:	ea000000 	b	800225f4 <exec+0x48c>
800225f0:	e1a00000 	nop			@ (mov r0, r0)
800225f4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800225f8:	e3530000 	cmp	r3, #0
800225fc:	0a000001 	beq	80022608 <exec+0x4a0>
80022600:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80022604:	eb001d0f 	bl	80029a48 <freevm>
80022608:	e51b3010 	ldr	r3, [fp, #-16]
8002260c:	e3530000 	cmp	r3, #0
80022610:	0a000001 	beq	8002261c <exec+0x4b4>
80022614:	e51b0010 	ldr	r0, [fp, #-16]
80022618:	eb0003d6 	bl	80023578 <iunlockput>
8002261c:	e3e03000 	mvn	r3, #0
80022620:	e1a00003 	mov	r0, r3
80022624:	e24bd008 	sub	sp, fp, #8
80022628:	e8bd8810 	pop	{r4, fp, pc}
8002262c:	464c457f 	.word	0x464c457f
80022630:	800d97a8 	.word	0x800d97a8

80022634 <fileinit>:
80022634:	e92d4800 	push	{fp, lr}
80022638:	e28db004 	add	fp, sp, #4
8002263c:	e59f100c 	ldr	r1, [pc, #12]	@ 80022650 <fileinit+0x1c>
80022640:	e59f000c 	ldr	r0, [pc, #12]	@ 80022654 <fileinit+0x20>
80022644:	eb0010e0 	bl	800269cc <initlock>
80022648:	e1a00000 	nop			@ (mov r0, r0)
8002264c:	e8bd8800 	pop	{fp, pc}
80022650:	8002ac4c 	.word	0x8002ac4c
80022654:	800d51a8 	.word	0x800d51a8

80022658 <filealloc>:
80022658:	e92d4800 	push	{fp, lr}
8002265c:	e28db004 	add	fp, sp, #4
80022660:	e24dd008 	sub	sp, sp, #8
80022664:	e59f006c 	ldr	r0, [pc, #108]	@ 800226d8 <filealloc+0x80>
80022668:	eb0010e9 	bl	80026a14 <acquire>
8002266c:	e59f3068 	ldr	r3, [pc, #104]	@ 800226dc <filealloc+0x84>
80022670:	e50b3008 	str	r3, [fp, #-8]
80022674:	ea00000d 	b	800226b0 <filealloc+0x58>
80022678:	e51b3008 	ldr	r3, [fp, #-8]
8002267c:	e5933004 	ldr	r3, [r3, #4]
80022680:	e3530000 	cmp	r3, #0
80022684:	1a000006 	bne	800226a4 <filealloc+0x4c>
80022688:	e51b3008 	ldr	r3, [fp, #-8]
8002268c:	e3a02001 	mov	r2, #1
80022690:	e5832004 	str	r2, [r3, #4]
80022694:	e59f003c 	ldr	r0, [pc, #60]	@ 800226d8 <filealloc+0x80>
80022698:	eb0010e8 	bl	80026a40 <release>
8002269c:	e51b3008 	ldr	r3, [fp, #-8]
800226a0:	ea000009 	b	800226cc <filealloc+0x74>
800226a4:	e51b3008 	ldr	r3, [fp, #-8]
800226a8:	e2833018 	add	r3, r3, #24
800226ac:	e50b3008 	str	r3, [fp, #-8]
800226b0:	e59f2028 	ldr	r2, [pc, #40]	@ 800226e0 <filealloc+0x88>
800226b4:	e51b3008 	ldr	r3, [fp, #-8]
800226b8:	e1530002 	cmp	r3, r2
800226bc:	3affffed 	bcc	80022678 <filealloc+0x20>
800226c0:	e59f0010 	ldr	r0, [pc, #16]	@ 800226d8 <filealloc+0x80>
800226c4:	eb0010dd 	bl	80026a40 <release>
800226c8:	e3a03000 	mov	r3, #0
800226cc:	e1a00003 	mov	r0, r3
800226d0:	e24bd004 	sub	sp, fp, #4
800226d4:	e8bd8800 	pop	{fp, pc}
800226d8:	800d51a8 	.word	0x800d51a8
800226dc:	800d51dc 	.word	0x800d51dc
800226e0:	800d5b3c 	.word	0x800d5b3c

800226e4 <filedup>:
800226e4:	e92d4800 	push	{fp, lr}
800226e8:	e28db004 	add	fp, sp, #4
800226ec:	e24dd008 	sub	sp, sp, #8
800226f0:	e50b0008 	str	r0, [fp, #-8]
800226f4:	e59f0044 	ldr	r0, [pc, #68]	@ 80022740 <filedup+0x5c>
800226f8:	eb0010c5 	bl	80026a14 <acquire>
800226fc:	e51b3008 	ldr	r3, [fp, #-8]
80022700:	e5933004 	ldr	r3, [r3, #4]
80022704:	e3530000 	cmp	r3, #0
80022708:	ca000001 	bgt	80022714 <filedup+0x30>
8002270c:	e59f0030 	ldr	r0, [pc, #48]	@ 80022744 <filedup+0x60>
80022710:	ebfffcf7 	bl	80021af4 <panic>
80022714:	e51b3008 	ldr	r3, [fp, #-8]
80022718:	e5933004 	ldr	r3, [r3, #4]
8002271c:	e2832001 	add	r2, r3, #1
80022720:	e51b3008 	ldr	r3, [fp, #-8]
80022724:	e5832004 	str	r2, [r3, #4]
80022728:	e59f0010 	ldr	r0, [pc, #16]	@ 80022740 <filedup+0x5c>
8002272c:	eb0010c3 	bl	80026a40 <release>
80022730:	e51b3008 	ldr	r3, [fp, #-8]
80022734:	e1a00003 	mov	r0, r3
80022738:	e24bd004 	sub	sp, fp, #4
8002273c:	e8bd8800 	pop	{fp, pc}
80022740:	800d51a8 	.word	0x800d51a8
80022744:	8002ac54 	.word	0x8002ac54

80022748 <fileclose>:
80022748:	e92d4800 	push	{fp, lr}
8002274c:	e28db004 	add	fp, sp, #4
80022750:	e24dd020 	sub	sp, sp, #32
80022754:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80022758:	e59f00d0 	ldr	r0, [pc, #208]	@ 80022830 <fileclose+0xe8>
8002275c:	eb0010ac 	bl	80026a14 <acquire>
80022760:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80022764:	e5933004 	ldr	r3, [r3, #4]
80022768:	e3530000 	cmp	r3, #0
8002276c:	ca000001 	bgt	80022778 <fileclose+0x30>
80022770:	e59f00bc 	ldr	r0, [pc, #188]	@ 80022834 <fileclose+0xec>
80022774:	ebfffcde 	bl	80021af4 <panic>
80022778:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8002277c:	e5933004 	ldr	r3, [r3, #4]
80022780:	e2432001 	sub	r2, r3, #1
80022784:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80022788:	e5832004 	str	r2, [r3, #4]
8002278c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80022790:	e5933004 	ldr	r3, [r3, #4]
80022794:	e3530000 	cmp	r3, #0
80022798:	da000002 	ble	800227a8 <fileclose+0x60>
8002279c:	e59f008c 	ldr	r0, [pc, #140]	@ 80022830 <fileclose+0xe8>
800227a0:	eb0010a6 	bl	80026a40 <release>
800227a4:	ea00001f 	b	80022828 <fileclose+0xe0>
800227a8:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800227ac:	e24bc01c 	sub	ip, fp, #28
800227b0:	e1a0e003 	mov	lr, r3
800227b4:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
800227b8:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
800227bc:	e89e0003 	ldm	lr, {r0, r1}
800227c0:	e88c0003 	stm	ip, {r0, r1}
800227c4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800227c8:	e3a02000 	mov	r2, #0
800227cc:	e5832004 	str	r2, [r3, #4]
800227d0:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800227d4:	e3a02000 	mov	r2, #0
800227d8:	e5c32000 	strb	r2, [r3]
800227dc:	e59f004c 	ldr	r0, [pc, #76]	@ 80022830 <fileclose+0xe8>
800227e0:	eb001096 	bl	80026a40 <release>
800227e4:	e55b301c 	ldrb	r3, [fp, #-28]	@ 0xffffffe4
800227e8:	e3530001 	cmp	r3, #1
800227ec:	1a000005 	bne	80022808 <fileclose+0xc0>
800227f0:	e51b3010 	ldr	r3, [fp, #-16]
800227f4:	e55b2013 	ldrb	r2, [fp, #-19]	@ 0xffffffed
800227f8:	e1a01002 	mov	r1, r2
800227fc:	e1a00003 	mov	r0, r3
80022800:	eb000966 	bl	80024da0 <pipeclose>
80022804:	ea000007 	b	80022828 <fileclose+0xe0>
80022808:	e55b301c 	ldrb	r3, [fp, #-28]	@ 0xffffffe4
8002280c:	e3530002 	cmp	r3, #2
80022810:	1a000004 	bne	80022828 <fileclose+0xe0>
80022814:	eb0007c0 	bl	8002471c <begin_trans>
80022818:	e51b300c 	ldr	r3, [fp, #-12]
8002281c:	e1a00003 	mov	r0, r3
80022820:	eb000319 	bl	8002348c <iput>
80022824:	eb0007d0 	bl	8002476c <commit_trans>
80022828:	e24bd004 	sub	sp, fp, #4
8002282c:	e8bd8800 	pop	{fp, pc}
80022830:	800d51a8 	.word	0x800d51a8
80022834:	8002ac5c 	.word	0x8002ac5c

80022838 <filestat>:
80022838:	e92d4800 	push	{fp, lr}
8002283c:	e28db004 	add	fp, sp, #4
80022840:	e24dd008 	sub	sp, sp, #8
80022844:	e50b0008 	str	r0, [fp, #-8]
80022848:	e50b100c 	str	r1, [fp, #-12]
8002284c:	e51b3008 	ldr	r3, [fp, #-8]
80022850:	e5d33000 	ldrb	r3, [r3]
80022854:	e3530002 	cmp	r3, #2
80022858:	1a00000e 	bne	80022898 <filestat+0x60>
8002285c:	e51b3008 	ldr	r3, [fp, #-8]
80022860:	e5933010 	ldr	r3, [r3, #16]
80022864:	e1a00003 	mov	r0, r3
80022868:	eb000281 	bl	80023274 <ilock>
8002286c:	e51b3008 	ldr	r3, [fp, #-8]
80022870:	e5933010 	ldr	r3, [r3, #16]
80022874:	e51b100c 	ldr	r1, [fp, #-12]
80022878:	e1a00003 	mov	r0, r3
8002287c:	eb000467 	bl	80023a20 <stati>
80022880:	e51b3008 	ldr	r3, [fp, #-8]
80022884:	e5933010 	ldr	r3, [r3, #16]
80022888:	e1a00003 	mov	r0, r3
8002288c:	eb0002dc 	bl	80023404 <iunlock>
80022890:	e3a03000 	mov	r3, #0
80022894:	ea000000 	b	8002289c <filestat+0x64>
80022898:	e3e03000 	mvn	r3, #0
8002289c:	e1a00003 	mov	r0, r3
800228a0:	e24bd004 	sub	sp, fp, #4
800228a4:	e8bd8800 	pop	{fp, pc}

800228a8 <fileread>:
800228a8:	e92d4800 	push	{fp, lr}
800228ac:	e28db004 	add	fp, sp, #4
800228b0:	e24dd018 	sub	sp, sp, #24
800228b4:	e50b0010 	str	r0, [fp, #-16]
800228b8:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
800228bc:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
800228c0:	e51b3010 	ldr	r3, [fp, #-16]
800228c4:	e5d33008 	ldrb	r3, [r3, #8]
800228c8:	e3530000 	cmp	r3, #0
800228cc:	1a000001 	bne	800228d8 <fileread+0x30>
800228d0:	e3e03000 	mvn	r3, #0
800228d4:	ea00002c 	b	8002298c <fileread+0xe4>
800228d8:	e51b3010 	ldr	r3, [fp, #-16]
800228dc:	e5d33000 	ldrb	r3, [r3]
800228e0:	e3530001 	cmp	r3, #1
800228e4:	1a000007 	bne	80022908 <fileread+0x60>
800228e8:	e51b3010 	ldr	r3, [fp, #-16]
800228ec:	e593300c 	ldr	r3, [r3, #12]
800228f0:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
800228f4:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
800228f8:	e1a00003 	mov	r0, r3
800228fc:	eb0009a1 	bl	80024f88 <piperead>
80022900:	e1a03000 	mov	r3, r0
80022904:	ea000020 	b	8002298c <fileread+0xe4>
80022908:	e51b3010 	ldr	r3, [fp, #-16]
8002290c:	e5d33000 	ldrb	r3, [r3]
80022910:	e3530002 	cmp	r3, #2
80022914:	1a00001a 	bne	80022984 <fileread+0xdc>
80022918:	e51b3010 	ldr	r3, [fp, #-16]
8002291c:	e5933010 	ldr	r3, [r3, #16]
80022920:	e1a00003 	mov	r0, r3
80022924:	eb000252 	bl	80023274 <ilock>
80022928:	e51b3010 	ldr	r3, [fp, #-16]
8002292c:	e5930010 	ldr	r0, [r3, #16]
80022930:	e51b3010 	ldr	r3, [fp, #-16]
80022934:	e5932014 	ldr	r2, [r3, #20]
80022938:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002293c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
80022940:	eb000454 	bl	80023a98 <readi>
80022944:	e50b0008 	str	r0, [fp, #-8]
80022948:	e51b3008 	ldr	r3, [fp, #-8]
8002294c:	e3530000 	cmp	r3, #0
80022950:	da000005 	ble	8002296c <fileread+0xc4>
80022954:	e51b3010 	ldr	r3, [fp, #-16]
80022958:	e5932014 	ldr	r2, [r3, #20]
8002295c:	e51b3008 	ldr	r3, [fp, #-8]
80022960:	e0822003 	add	r2, r2, r3
80022964:	e51b3010 	ldr	r3, [fp, #-16]
80022968:	e5832014 	str	r2, [r3, #20]
8002296c:	e51b3010 	ldr	r3, [fp, #-16]
80022970:	e5933010 	ldr	r3, [r3, #16]
80022974:	e1a00003 	mov	r0, r3
80022978:	eb0002a1 	bl	80023404 <iunlock>
8002297c:	e51b3008 	ldr	r3, [fp, #-8]
80022980:	ea000001 	b	8002298c <fileread+0xe4>
80022984:	e59f000c 	ldr	r0, [pc, #12]	@ 80022998 <fileread+0xf0>
80022988:	ebfffc59 	bl	80021af4 <panic>
8002298c:	e1a00003 	mov	r0, r3
80022990:	e24bd004 	sub	sp, fp, #4
80022994:	e8bd8800 	pop	{fp, pc}
80022998:	8002ac68 	.word	0x8002ac68

8002299c <filewrite>:
8002299c:	e92d4800 	push	{fp, lr}
800229a0:	e28db004 	add	fp, sp, #4
800229a4:	e24dd020 	sub	sp, sp, #32
800229a8:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
800229ac:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
800229b0:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
800229b4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800229b8:	e5d33009 	ldrb	r3, [r3, #9]
800229bc:	e3530000 	cmp	r3, #0
800229c0:	1a000001 	bne	800229cc <filewrite+0x30>
800229c4:	e3e03000 	mvn	r3, #0
800229c8:	ea000058 	b	80022b30 <filewrite+0x194>
800229cc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800229d0:	e5d33000 	ldrb	r3, [r3]
800229d4:	e3530001 	cmp	r3, #1
800229d8:	1a000007 	bne	800229fc <filewrite+0x60>
800229dc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800229e0:	e593300c 	ldr	r3, [r3, #12]
800229e4:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
800229e8:	e51b101c 	ldr	r1, [fp, #-28]	@ 0xffffffe4
800229ec:	e1a00003 	mov	r0, r3
800229f0:	eb00091d 	bl	80024e6c <pipewrite>
800229f4:	e1a03000 	mov	r3, r0
800229f8:	ea00004c 	b	80022b30 <filewrite+0x194>
800229fc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022a00:	e5d33000 	ldrb	r3, [r3]
80022a04:	e3530002 	cmp	r3, #2
80022a08:	1a000046 	bne	80022b28 <filewrite+0x18c>
80022a0c:	e3a03c06 	mov	r3, #1536	@ 0x600
80022a10:	e50b3010 	str	r3, [fp, #-16]
80022a14:	e3a03000 	mov	r3, #0
80022a18:	e50b3008 	str	r3, [fp, #-8]
80022a1c:	ea000033 	b	80022af0 <filewrite+0x154>
80022a20:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
80022a24:	e51b3008 	ldr	r3, [fp, #-8]
80022a28:	e0423003 	sub	r3, r2, r3
80022a2c:	e50b300c 	str	r3, [fp, #-12]
80022a30:	e51b200c 	ldr	r2, [fp, #-12]
80022a34:	e51b3010 	ldr	r3, [fp, #-16]
80022a38:	e1520003 	cmp	r2, r3
80022a3c:	da000001 	ble	80022a48 <filewrite+0xac>
80022a40:	e51b3010 	ldr	r3, [fp, #-16]
80022a44:	e50b300c 	str	r3, [fp, #-12]
80022a48:	eb000733 	bl	8002471c <begin_trans>
80022a4c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022a50:	e5933010 	ldr	r3, [r3, #16]
80022a54:	e1a00003 	mov	r0, r3
80022a58:	eb000205 	bl	80023274 <ilock>
80022a5c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022a60:	e5930010 	ldr	r0, [r3, #16]
80022a64:	e51b3008 	ldr	r3, [fp, #-8]
80022a68:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
80022a6c:	e0821003 	add	r1, r2, r3
80022a70:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022a74:	e5932014 	ldr	r2, [r3, #20]
80022a78:	e51b300c 	ldr	r3, [fp, #-12]
80022a7c:	eb000480 	bl	80023c84 <writei>
80022a80:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80022a84:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80022a88:	e3530000 	cmp	r3, #0
80022a8c:	da000005 	ble	80022aa8 <filewrite+0x10c>
80022a90:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022a94:	e5932014 	ldr	r2, [r3, #20]
80022a98:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80022a9c:	e0822003 	add	r2, r2, r3
80022aa0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022aa4:	e5832014 	str	r2, [r3, #20]
80022aa8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022aac:	e5933010 	ldr	r3, [r3, #16]
80022ab0:	e1a00003 	mov	r0, r3
80022ab4:	eb000252 	bl	80023404 <iunlock>
80022ab8:	eb00072b 	bl	8002476c <commit_trans>
80022abc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80022ac0:	e3530000 	cmp	r3, #0
80022ac4:	ba00000e 	blt	80022b04 <filewrite+0x168>
80022ac8:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
80022acc:	e51b300c 	ldr	r3, [fp, #-12]
80022ad0:	e1520003 	cmp	r2, r3
80022ad4:	0a000001 	beq	80022ae0 <filewrite+0x144>
80022ad8:	e59f005c 	ldr	r0, [pc, #92]	@ 80022b3c <filewrite+0x1a0>
80022adc:	ebfffc04 	bl	80021af4 <panic>
80022ae0:	e51b2008 	ldr	r2, [fp, #-8]
80022ae4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80022ae8:	e0823003 	add	r3, r2, r3
80022aec:	e50b3008 	str	r3, [fp, #-8]
80022af0:	e51b2008 	ldr	r2, [fp, #-8]
80022af4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80022af8:	e1520003 	cmp	r2, r3
80022afc:	baffffc7 	blt	80022a20 <filewrite+0x84>
80022b00:	ea000000 	b	80022b08 <filewrite+0x16c>
80022b04:	e1a00000 	nop			@ (mov r0, r0)
80022b08:	e51b2008 	ldr	r2, [fp, #-8]
80022b0c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80022b10:	e1520003 	cmp	r2, r3
80022b14:	1a000001 	bne	80022b20 <filewrite+0x184>
80022b18:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80022b1c:	ea000003 	b	80022b30 <filewrite+0x194>
80022b20:	e3e03000 	mvn	r3, #0
80022b24:	ea000001 	b	80022b30 <filewrite+0x194>
80022b28:	e59f0010 	ldr	r0, [pc, #16]	@ 80022b40 <filewrite+0x1a4>
80022b2c:	ebfffbf0 	bl	80021af4 <panic>
80022b30:	e1a00003 	mov	r0, r3
80022b34:	e24bd004 	sub	sp, fp, #4
80022b38:	e8bd8800 	pop	{fp, pc}
80022b3c:	8002ac74 	.word	0x8002ac74
80022b40:	8002ac84 	.word	0x8002ac84

80022b44 <readsb>:
80022b44:	e92d4800 	push	{fp, lr}
80022b48:	e28db004 	add	fp, sp, #4
80022b4c:	e24dd010 	sub	sp, sp, #16
80022b50:	e50b0010 	str	r0, [fp, #-16]
80022b54:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80022b58:	e51b3010 	ldr	r3, [fp, #-16]
80022b5c:	e3a01001 	mov	r1, #1
80022b60:	e1a00003 	mov	r0, r3
80022b64:	ebfff7ea 	bl	80020b14 <bread>
80022b68:	e50b0008 	str	r0, [fp, #-8]
80022b6c:	e51b3008 	ldr	r3, [fp, #-8]
80022b70:	e2833018 	add	r3, r3, #24
80022b74:	e3a02010 	mov	r2, #16
80022b78:	e1a01003 	mov	r1, r3
80022b7c:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80022b80:	ebfff590 	bl	800201c8 <memmove>
80022b84:	e51b0008 	ldr	r0, [fp, #-8]
80022b88:	ebfff80b 	bl	80020bbc <brelse>
80022b8c:	e1a00000 	nop			@ (mov r0, r0)
80022b90:	e24bd004 	sub	sp, fp, #4
80022b94:	e8bd8800 	pop	{fp, pc}

80022b98 <bzero>:
80022b98:	e92d4800 	push	{fp, lr}
80022b9c:	e28db004 	add	fp, sp, #4
80022ba0:	e24dd010 	sub	sp, sp, #16
80022ba4:	e50b0010 	str	r0, [fp, #-16]
80022ba8:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80022bac:	e51b3010 	ldr	r3, [fp, #-16]
80022bb0:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
80022bb4:	e1a01002 	mov	r1, r2
80022bb8:	e1a00003 	mov	r0, r3
80022bbc:	ebfff7d4 	bl	80020b14 <bread>
80022bc0:	e50b0008 	str	r0, [fp, #-8]
80022bc4:	e51b3008 	ldr	r3, [fp, #-8]
80022bc8:	e2833018 	add	r3, r3, #24
80022bcc:	e3a02c02 	mov	r2, #512	@ 0x200
80022bd0:	e3a01000 	mov	r1, #0
80022bd4:	e1a00003 	mov	r0, r3
80022bd8:	ebfff508 	bl	80020000 <memset>
80022bdc:	e51b0008 	ldr	r0, [fp, #-8]
80022be0:	eb0006f9 	bl	800247cc <log_write>
80022be4:	e51b0008 	ldr	r0, [fp, #-8]
80022be8:	ebfff7f3 	bl	80020bbc <brelse>
80022bec:	e1a00000 	nop			@ (mov r0, r0)
80022bf0:	e24bd004 	sub	sp, fp, #4
80022bf4:	e8bd8800 	pop	{fp, pc}

80022bf8 <balloc>:
80022bf8:	e92d4800 	push	{fp, lr}
80022bfc:	e28db004 	add	fp, sp, #4
80022c00:	e24dd028 	sub	sp, sp, #40	@ 0x28
80022c04:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
80022c08:	e3a03000 	mov	r3, #0
80022c0c:	e50b3010 	str	r3, [fp, #-16]
80022c10:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80022c14:	e24b2024 	sub	r2, fp, #36	@ 0x24
80022c18:	e1a01002 	mov	r1, r2
80022c1c:	e1a00003 	mov	r0, r3
80022c20:	ebffffc7 	bl	80022b44 <readsb>
80022c24:	e3a03000 	mov	r3, #0
80022c28:	e50b3008 	str	r3, [fp, #-8]
80022c2c:	ea000059 	b	80022d98 <balloc+0x1a0>
80022c30:	e51b3008 	ldr	r3, [fp, #-8]
80022c34:	e2832eff 	add	r2, r3, #4080	@ 0xff0
80022c38:	e282200f 	add	r2, r2, #15
80022c3c:	e3530000 	cmp	r3, #0
80022c40:	b1a03002 	movlt	r3, r2
80022c44:	a1a03003 	movge	r3, r3
80022c48:	e1a03643 	asr	r3, r3, #12
80022c4c:	e1a02003 	mov	r2, r3
80022c50:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80022c54:	e1a031a3 	lsr	r3, r3, #3
80022c58:	e0823003 	add	r3, r2, r3
80022c5c:	e2833003 	add	r3, r3, #3
80022c60:	e1a01003 	mov	r1, r3
80022c64:	e51b0028 	ldr	r0, [fp, #-40]	@ 0xffffffd8
80022c68:	ebfff7a9 	bl	80020b14 <bread>
80022c6c:	e50b0010 	str	r0, [fp, #-16]
80022c70:	e3a03000 	mov	r3, #0
80022c74:	e50b300c 	str	r3, [fp, #-12]
80022c78:	ea000037 	b	80022d5c <balloc+0x164>
80022c7c:	e51b300c 	ldr	r3, [fp, #-12]
80022c80:	e2033007 	and	r3, r3, #7
80022c84:	e3a02001 	mov	r2, #1
80022c88:	e1a03312 	lsl	r3, r2, r3
80022c8c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80022c90:	e51b300c 	ldr	r3, [fp, #-12]
80022c94:	e2832007 	add	r2, r3, #7
80022c98:	e3530000 	cmp	r3, #0
80022c9c:	b1a03002 	movlt	r3, r2
80022ca0:	a1a03003 	movge	r3, r3
80022ca4:	e1a031c3 	asr	r3, r3, #3
80022ca8:	e1a02003 	mov	r2, r3
80022cac:	e51b3010 	ldr	r3, [fp, #-16]
80022cb0:	e0833002 	add	r3, r3, r2
80022cb4:	e5d33018 	ldrb	r3, [r3, #24]
80022cb8:	e1a02003 	mov	r2, r3
80022cbc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80022cc0:	e0033002 	and	r3, r3, r2
80022cc4:	e3530000 	cmp	r3, #0
80022cc8:	1a000020 	bne	80022d50 <balloc+0x158>
80022ccc:	e51b300c 	ldr	r3, [fp, #-12]
80022cd0:	e2832007 	add	r2, r3, #7
80022cd4:	e3530000 	cmp	r3, #0
80022cd8:	b1a03002 	movlt	r3, r2
80022cdc:	a1a03003 	movge	r3, r3
80022ce0:	e1a031c3 	asr	r3, r3, #3
80022ce4:	e51b2010 	ldr	r2, [fp, #-16]
80022ce8:	e0822003 	add	r2, r2, r3
80022cec:	e5d22018 	ldrb	r2, [r2, #24]
80022cf0:	e6af1072 	sxtb	r1, r2
80022cf4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
80022cf8:	e6af2072 	sxtb	r2, r2
80022cfc:	e1812002 	orr	r2, r1, r2
80022d00:	e6af2072 	sxtb	r2, r2
80022d04:	e6ef1072 	uxtb	r1, r2
80022d08:	e51b2010 	ldr	r2, [fp, #-16]
80022d0c:	e0823003 	add	r3, r2, r3
80022d10:	e1a02001 	mov	r2, r1
80022d14:	e5c32018 	strb	r2, [r3, #24]
80022d18:	e51b0010 	ldr	r0, [fp, #-16]
80022d1c:	eb0006aa 	bl	800247cc <log_write>
80022d20:	e51b0010 	ldr	r0, [fp, #-16]
80022d24:	ebfff7a4 	bl	80020bbc <brelse>
80022d28:	e51b0028 	ldr	r0, [fp, #-40]	@ 0xffffffd8
80022d2c:	e51b2008 	ldr	r2, [fp, #-8]
80022d30:	e51b300c 	ldr	r3, [fp, #-12]
80022d34:	e0823003 	add	r3, r2, r3
80022d38:	e1a01003 	mov	r1, r3
80022d3c:	ebffff95 	bl	80022b98 <bzero>
80022d40:	e51b2008 	ldr	r2, [fp, #-8]
80022d44:	e51b300c 	ldr	r3, [fp, #-12]
80022d48:	e0823003 	add	r3, r2, r3
80022d4c:	ea000017 	b	80022db0 <balloc+0x1b8>
80022d50:	e51b300c 	ldr	r3, [fp, #-12]
80022d54:	e2833001 	add	r3, r3, #1
80022d58:	e50b300c 	str	r3, [fp, #-12]
80022d5c:	e51b300c 	ldr	r3, [fp, #-12]
80022d60:	e3530a01 	cmp	r3, #4096	@ 0x1000
80022d64:	aa000006 	bge	80022d84 <balloc+0x18c>
80022d68:	e51b2008 	ldr	r2, [fp, #-8]
80022d6c:	e51b300c 	ldr	r3, [fp, #-12]
80022d70:	e0823003 	add	r3, r2, r3
80022d74:	e1a02003 	mov	r2, r3
80022d78:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80022d7c:	e1520003 	cmp	r2, r3
80022d80:	3affffbd 	bcc	80022c7c <balloc+0x84>
80022d84:	e51b0010 	ldr	r0, [fp, #-16]
80022d88:	ebfff78b 	bl	80020bbc <brelse>
80022d8c:	e51b3008 	ldr	r3, [fp, #-8]
80022d90:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80022d94:	e50b3008 	str	r3, [fp, #-8]
80022d98:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
80022d9c:	e51b3008 	ldr	r3, [fp, #-8]
80022da0:	e1520003 	cmp	r2, r3
80022da4:	8affffa1 	bhi	80022c30 <balloc+0x38>
80022da8:	e59f000c 	ldr	r0, [pc, #12]	@ 80022dbc <balloc+0x1c4>
80022dac:	ebfffb50 	bl	80021af4 <panic>
80022db0:	e1a00003 	mov	r0, r3
80022db4:	e24bd004 	sub	sp, fp, #4
80022db8:	e8bd8800 	pop	{fp, pc}
80022dbc:	8002ac90 	.word	0x8002ac90

80022dc0 <bfree>:
80022dc0:	e92d4800 	push	{fp, lr}
80022dc4:	e28db004 	add	fp, sp, #4
80022dc8:	e24dd028 	sub	sp, sp, #40	@ 0x28
80022dcc:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
80022dd0:	e50b102c 	str	r1, [fp, #-44]	@ 0xffffffd4
80022dd4:	e24b3020 	sub	r3, fp, #32
80022dd8:	e1a01003 	mov	r1, r3
80022ddc:	e51b0028 	ldr	r0, [fp, #-40]	@ 0xffffffd8
80022de0:	ebffff57 	bl	80022b44 <readsb>
80022de4:	e51b0028 	ldr	r0, [fp, #-40]	@ 0xffffffd8
80022de8:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80022dec:	e1a02623 	lsr	r2, r3, #12
80022df0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80022df4:	e1a031a3 	lsr	r3, r3, #3
80022df8:	e0823003 	add	r3, r2, r3
80022dfc:	e2833003 	add	r3, r3, #3
80022e00:	e1a01003 	mov	r1, r3
80022e04:	ebfff742 	bl	80020b14 <bread>
80022e08:	e50b0008 	str	r0, [fp, #-8]
80022e0c:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80022e10:	e1a03a03 	lsl	r3, r3, #20
80022e14:	e1a03a23 	lsr	r3, r3, #20
80022e18:	e50b300c 	str	r3, [fp, #-12]
80022e1c:	e51b300c 	ldr	r3, [fp, #-12]
80022e20:	e2033007 	and	r3, r3, #7
80022e24:	e3a02001 	mov	r2, #1
80022e28:	e1a03312 	lsl	r3, r2, r3
80022e2c:	e50b3010 	str	r3, [fp, #-16]
80022e30:	e51b300c 	ldr	r3, [fp, #-12]
80022e34:	e2832007 	add	r2, r3, #7
80022e38:	e3530000 	cmp	r3, #0
80022e3c:	b1a03002 	movlt	r3, r2
80022e40:	a1a03003 	movge	r3, r3
80022e44:	e1a031c3 	asr	r3, r3, #3
80022e48:	e1a02003 	mov	r2, r3
80022e4c:	e51b3008 	ldr	r3, [fp, #-8]
80022e50:	e0833002 	add	r3, r3, r2
80022e54:	e5d33018 	ldrb	r3, [r3, #24]
80022e58:	e1a02003 	mov	r2, r3
80022e5c:	e51b3010 	ldr	r3, [fp, #-16]
80022e60:	e0033002 	and	r3, r3, r2
80022e64:	e3530000 	cmp	r3, #0
80022e68:	1a000001 	bne	80022e74 <bfree+0xb4>
80022e6c:	e59f0070 	ldr	r0, [pc, #112]	@ 80022ee4 <bfree+0x124>
80022e70:	ebfffb1f 	bl	80021af4 <panic>
80022e74:	e51b300c 	ldr	r3, [fp, #-12]
80022e78:	e2832007 	add	r2, r3, #7
80022e7c:	e3530000 	cmp	r3, #0
80022e80:	b1a03002 	movlt	r3, r2
80022e84:	a1a03003 	movge	r3, r3
80022e88:	e1a031c3 	asr	r3, r3, #3
80022e8c:	e51b2008 	ldr	r2, [fp, #-8]
80022e90:	e0822003 	add	r2, r2, r3
80022e94:	e5d22018 	ldrb	r2, [r2, #24]
80022e98:	e6af1072 	sxtb	r1, r2
80022e9c:	e51b2010 	ldr	r2, [fp, #-16]
80022ea0:	e6af2072 	sxtb	r2, r2
80022ea4:	e1e02002 	mvn	r2, r2
80022ea8:	e6af2072 	sxtb	r2, r2
80022eac:	e0022001 	and	r2, r2, r1
80022eb0:	e6af2072 	sxtb	r2, r2
80022eb4:	e6ef1072 	uxtb	r1, r2
80022eb8:	e51b2008 	ldr	r2, [fp, #-8]
80022ebc:	e0823003 	add	r3, r2, r3
80022ec0:	e1a02001 	mov	r2, r1
80022ec4:	e5c32018 	strb	r2, [r3, #24]
80022ec8:	e51b0008 	ldr	r0, [fp, #-8]
80022ecc:	eb00063e 	bl	800247cc <log_write>
80022ed0:	e51b0008 	ldr	r0, [fp, #-8]
80022ed4:	ebfff738 	bl	80020bbc <brelse>
80022ed8:	e1a00000 	nop			@ (mov r0, r0)
80022edc:	e24bd004 	sub	sp, fp, #4
80022ee0:	e8bd8800 	pop	{fp, pc}
80022ee4:	8002aca8 	.word	0x8002aca8

80022ee8 <iinit>:
80022ee8:	e92d4800 	push	{fp, lr}
80022eec:	e28db004 	add	fp, sp, #4
80022ef0:	e59f100c 	ldr	r1, [pc, #12]	@ 80022f04 <iinit+0x1c>
80022ef4:	e59f000c 	ldr	r0, [pc, #12]	@ 80022f08 <iinit+0x20>
80022ef8:	eb000eb3 	bl	800269cc <initlock>
80022efc:	e1a00000 	nop			@ (mov r0, r0)
80022f00:	e8bd8800 	pop	{fp, pc}
80022f04:	8002acbc 	.word	0x8002acbc
80022f08:	800d5b3c 	.word	0x800d5b3c

80022f0c <ialloc>:
80022f0c:	e92d4800 	push	{fp, lr}
80022f10:	e28db004 	add	fp, sp, #4
80022f14:	e24dd028 	sub	sp, sp, #40	@ 0x28
80022f18:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
80022f1c:	e1a03001 	mov	r3, r1
80022f20:	e14b32ba 	strh	r3, [fp, #-42]	@ 0xffffffd6
80022f24:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80022f28:	e24b2020 	sub	r2, fp, #32
80022f2c:	e1a01002 	mov	r1, r2
80022f30:	e1a00003 	mov	r0, r3
80022f34:	ebffff02 	bl	80022b44 <readsb>
80022f38:	e3a03001 	mov	r3, #1
80022f3c:	e50b3008 	str	r3, [fp, #-8]
80022f40:	ea000027 	b	80022fe4 <ialloc+0xd8>
80022f44:	e51b3008 	ldr	r3, [fp, #-8]
80022f48:	e1a031a3 	lsr	r3, r3, #3
80022f4c:	e2833002 	add	r3, r3, #2
80022f50:	e1a01003 	mov	r1, r3
80022f54:	e51b0028 	ldr	r0, [fp, #-40]	@ 0xffffffd8
80022f58:	ebfff6ed 	bl	80020b14 <bread>
80022f5c:	e50b000c 	str	r0, [fp, #-12]
80022f60:	e51b300c 	ldr	r3, [fp, #-12]
80022f64:	e2832018 	add	r2, r3, #24
80022f68:	e51b3008 	ldr	r3, [fp, #-8]
80022f6c:	e2033007 	and	r3, r3, #7
80022f70:	e1a03303 	lsl	r3, r3, #6
80022f74:	e0823003 	add	r3, r2, r3
80022f78:	e50b3010 	str	r3, [fp, #-16]
80022f7c:	e51b3010 	ldr	r3, [fp, #-16]
80022f80:	e1d330f0 	ldrsh	r3, [r3]
80022f84:	e3530000 	cmp	r3, #0
80022f88:	1a000010 	bne	80022fd0 <ialloc+0xc4>
80022f8c:	e3a02040 	mov	r2, #64	@ 0x40
80022f90:	e3a01000 	mov	r1, #0
80022f94:	e51b0010 	ldr	r0, [fp, #-16]
80022f98:	ebfff418 	bl	80020000 <memset>
80022f9c:	e51b3010 	ldr	r3, [fp, #-16]
80022fa0:	e15b22ba 	ldrh	r2, [fp, #-42]	@ 0xffffffd6
80022fa4:	e1c320b0 	strh	r2, [r3]
80022fa8:	e51b000c 	ldr	r0, [fp, #-12]
80022fac:	eb000606 	bl	800247cc <log_write>
80022fb0:	e51b000c 	ldr	r0, [fp, #-12]
80022fb4:	ebfff700 	bl	80020bbc <brelse>
80022fb8:	e51b3008 	ldr	r3, [fp, #-8]
80022fbc:	e1a01003 	mov	r1, r3
80022fc0:	e51b0028 	ldr	r0, [fp, #-40]	@ 0xffffffd8
80022fc4:	eb000048 	bl	800230ec <iget>
80022fc8:	e1a03000 	mov	r3, r0
80022fcc:	ea00000a 	b	80022ffc <ialloc+0xf0>
80022fd0:	e51b000c 	ldr	r0, [fp, #-12]
80022fd4:	ebfff6f8 	bl	80020bbc <brelse>
80022fd8:	e51b3008 	ldr	r3, [fp, #-8]
80022fdc:	e2833001 	add	r3, r3, #1
80022fe0:	e50b3008 	str	r3, [fp, #-8]
80022fe4:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80022fe8:	e51b3008 	ldr	r3, [fp, #-8]
80022fec:	e1520003 	cmp	r2, r3
80022ff0:	8affffd3 	bhi	80022f44 <ialloc+0x38>
80022ff4:	e59f000c 	ldr	r0, [pc, #12]	@ 80023008 <ialloc+0xfc>
80022ff8:	ebfffabd 	bl	80021af4 <panic>
80022ffc:	e1a00003 	mov	r0, r3
80023000:	e24bd004 	sub	sp, fp, #4
80023004:	e8bd8800 	pop	{fp, pc}
80023008:	8002acc4 	.word	0x8002acc4

8002300c <iupdate>:
8002300c:	e92d4800 	push	{fp, lr}
80023010:	e28db004 	add	fp, sp, #4
80023014:	e24dd010 	sub	sp, sp, #16
80023018:	e50b0010 	str	r0, [fp, #-16]
8002301c:	e51b3010 	ldr	r3, [fp, #-16]
80023020:	e5932000 	ldr	r2, [r3]
80023024:	e51b3010 	ldr	r3, [fp, #-16]
80023028:	e5933004 	ldr	r3, [r3, #4]
8002302c:	e1a031a3 	lsr	r3, r3, #3
80023030:	e2833002 	add	r3, r3, #2
80023034:	e1a01003 	mov	r1, r3
80023038:	e1a00002 	mov	r0, r2
8002303c:	ebfff6b4 	bl	80020b14 <bread>
80023040:	e50b0008 	str	r0, [fp, #-8]
80023044:	e51b3008 	ldr	r3, [fp, #-8]
80023048:	e2832018 	add	r2, r3, #24
8002304c:	e51b3010 	ldr	r3, [fp, #-16]
80023050:	e5933004 	ldr	r3, [r3, #4]
80023054:	e2033007 	and	r3, r3, #7
80023058:	e1a03303 	lsl	r3, r3, #6
8002305c:	e0823003 	add	r3, r2, r3
80023060:	e50b300c 	str	r3, [fp, #-12]
80023064:	e51b3010 	ldr	r3, [fp, #-16]
80023068:	e1d321f0 	ldrsh	r2, [r3, #16]
8002306c:	e51b300c 	ldr	r3, [fp, #-12]
80023070:	e1c320b0 	strh	r2, [r3]
80023074:	e51b3010 	ldr	r3, [fp, #-16]
80023078:	e1d321f2 	ldrsh	r2, [r3, #18]
8002307c:	e51b300c 	ldr	r3, [fp, #-12]
80023080:	e1c320b2 	strh	r2, [r3, #2]
80023084:	e51b3010 	ldr	r3, [fp, #-16]
80023088:	e1d321f4 	ldrsh	r2, [r3, #20]
8002308c:	e51b300c 	ldr	r3, [fp, #-12]
80023090:	e1c320b4 	strh	r2, [r3, #4]
80023094:	e51b3010 	ldr	r3, [fp, #-16]
80023098:	e1d321f6 	ldrsh	r2, [r3, #22]
8002309c:	e51b300c 	ldr	r3, [fp, #-12]
800230a0:	e1c320b6 	strh	r2, [r3, #6]
800230a4:	e51b3010 	ldr	r3, [fp, #-16]
800230a8:	e5932018 	ldr	r2, [r3, #24]
800230ac:	e51b300c 	ldr	r3, [fp, #-12]
800230b0:	e5832008 	str	r2, [r3, #8]
800230b4:	e51b300c 	ldr	r3, [fp, #-12]
800230b8:	e283000c 	add	r0, r3, #12
800230bc:	e51b3010 	ldr	r3, [fp, #-16]
800230c0:	e283301c 	add	r3, r3, #28
800230c4:	e3a02034 	mov	r2, #52	@ 0x34
800230c8:	e1a01003 	mov	r1, r3
800230cc:	ebfff43d 	bl	800201c8 <memmove>
800230d0:	e51b0008 	ldr	r0, [fp, #-8]
800230d4:	eb0005bc 	bl	800247cc <log_write>
800230d8:	e51b0008 	ldr	r0, [fp, #-8]
800230dc:	ebfff6b6 	bl	80020bbc <brelse>
800230e0:	e1a00000 	nop			@ (mov r0, r0)
800230e4:	e24bd004 	sub	sp, fp, #4
800230e8:	e8bd8800 	pop	{fp, pc}

800230ec <iget>:
800230ec:	e92d4800 	push	{fp, lr}
800230f0:	e28db004 	add	fp, sp, #4
800230f4:	e24dd010 	sub	sp, sp, #16
800230f8:	e50b0010 	str	r0, [fp, #-16]
800230fc:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80023100:	e59f0114 	ldr	r0, [pc, #276]	@ 8002321c <iget+0x130>
80023104:	eb000e42 	bl	80026a14 <acquire>
80023108:	e3a03000 	mov	r3, #0
8002310c:	e50b300c 	str	r3, [fp, #-12]
80023110:	e59f3108 	ldr	r3, [pc, #264]	@ 80023220 <iget+0x134>
80023114:	e50b3008 	str	r3, [fp, #-8]
80023118:	ea000022 	b	800231a8 <iget+0xbc>
8002311c:	e51b3008 	ldr	r3, [fp, #-8]
80023120:	e5933008 	ldr	r3, [r3, #8]
80023124:	e3530000 	cmp	r3, #0
80023128:	da000012 	ble	80023178 <iget+0x8c>
8002312c:	e51b3008 	ldr	r3, [fp, #-8]
80023130:	e5933000 	ldr	r3, [r3]
80023134:	e51b2010 	ldr	r2, [fp, #-16]
80023138:	e1520003 	cmp	r2, r3
8002313c:	1a00000d 	bne	80023178 <iget+0x8c>
80023140:	e51b3008 	ldr	r3, [fp, #-8]
80023144:	e5933004 	ldr	r3, [r3, #4]
80023148:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8002314c:	e1520003 	cmp	r2, r3
80023150:	1a000008 	bne	80023178 <iget+0x8c>
80023154:	e51b3008 	ldr	r3, [fp, #-8]
80023158:	e5933008 	ldr	r3, [r3, #8]
8002315c:	e2832001 	add	r2, r3, #1
80023160:	e51b3008 	ldr	r3, [fp, #-8]
80023164:	e5832008 	str	r2, [r3, #8]
80023168:	e59f00ac 	ldr	r0, [pc, #172]	@ 8002321c <iget+0x130>
8002316c:	eb000e33 	bl	80026a40 <release>
80023170:	e51b3008 	ldr	r3, [fp, #-8]
80023174:	ea000025 	b	80023210 <iget+0x124>
80023178:	e51b300c 	ldr	r3, [fp, #-12]
8002317c:	e3530000 	cmp	r3, #0
80023180:	1a000005 	bne	8002319c <iget+0xb0>
80023184:	e51b3008 	ldr	r3, [fp, #-8]
80023188:	e5933008 	ldr	r3, [r3, #8]
8002318c:	e3530000 	cmp	r3, #0
80023190:	1a000001 	bne	8002319c <iget+0xb0>
80023194:	e51b3008 	ldr	r3, [fp, #-8]
80023198:	e50b300c 	str	r3, [fp, #-12]
8002319c:	e51b3008 	ldr	r3, [fp, #-8]
800231a0:	e2833050 	add	r3, r3, #80	@ 0x50
800231a4:	e50b3008 	str	r3, [fp, #-8]
800231a8:	e51b3008 	ldr	r3, [fp, #-8]
800231ac:	e59f2070 	ldr	r2, [pc, #112]	@ 80023224 <iget+0x138>
800231b0:	e1530002 	cmp	r3, r2
800231b4:	3affffd8 	bcc	8002311c <iget+0x30>
800231b8:	e51b300c 	ldr	r3, [fp, #-12]
800231bc:	e3530000 	cmp	r3, #0
800231c0:	1a000001 	bne	800231cc <iget+0xe0>
800231c4:	e59f005c 	ldr	r0, [pc, #92]	@ 80023228 <iget+0x13c>
800231c8:	ebfffa49 	bl	80021af4 <panic>
800231cc:	e51b300c 	ldr	r3, [fp, #-12]
800231d0:	e50b3008 	str	r3, [fp, #-8]
800231d4:	e51b3008 	ldr	r3, [fp, #-8]
800231d8:	e51b2010 	ldr	r2, [fp, #-16]
800231dc:	e5832000 	str	r2, [r3]
800231e0:	e51b3008 	ldr	r3, [fp, #-8]
800231e4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800231e8:	e5832004 	str	r2, [r3, #4]
800231ec:	e51b3008 	ldr	r3, [fp, #-8]
800231f0:	e3a02001 	mov	r2, #1
800231f4:	e5832008 	str	r2, [r3, #8]
800231f8:	e51b3008 	ldr	r3, [fp, #-8]
800231fc:	e3a02000 	mov	r2, #0
80023200:	e583200c 	str	r2, [r3, #12]
80023204:	e59f0010 	ldr	r0, [pc, #16]	@ 8002321c <iget+0x130>
80023208:	eb000e0c 	bl	80026a40 <release>
8002320c:	e51b3008 	ldr	r3, [fp, #-8]
80023210:	e1a00003 	mov	r0, r3
80023214:	e24bd004 	sub	sp, fp, #4
80023218:	e8bd8800 	pop	{fp, pc}
8002321c:	800d5b3c 	.word	0x800d5b3c
80023220:	800d5b70 	.word	0x800d5b70
80023224:	800d6b10 	.word	0x800d6b10
80023228:	8002acd8 	.word	0x8002acd8

8002322c <idup>:
8002322c:	e92d4800 	push	{fp, lr}
80023230:	e28db004 	add	fp, sp, #4
80023234:	e24dd008 	sub	sp, sp, #8
80023238:	e50b0008 	str	r0, [fp, #-8]
8002323c:	e59f002c 	ldr	r0, [pc, #44]	@ 80023270 <idup+0x44>
80023240:	eb000df3 	bl	80026a14 <acquire>
80023244:	e51b3008 	ldr	r3, [fp, #-8]
80023248:	e5933008 	ldr	r3, [r3, #8]
8002324c:	e2832001 	add	r2, r3, #1
80023250:	e51b3008 	ldr	r3, [fp, #-8]
80023254:	e5832008 	str	r2, [r3, #8]
80023258:	e59f0010 	ldr	r0, [pc, #16]	@ 80023270 <idup+0x44>
8002325c:	eb000df7 	bl	80026a40 <release>
80023260:	e51b3008 	ldr	r3, [fp, #-8]
80023264:	e1a00003 	mov	r0, r3
80023268:	e24bd004 	sub	sp, fp, #4
8002326c:	e8bd8800 	pop	{fp, pc}
80023270:	800d5b3c 	.word	0x800d5b3c

80023274 <ilock>:
80023274:	e92d4800 	push	{fp, lr}
80023278:	e28db004 	add	fp, sp, #4
8002327c:	e24dd010 	sub	sp, sp, #16
80023280:	e50b0010 	str	r0, [fp, #-16]
80023284:	e51b3010 	ldr	r3, [fp, #-16]
80023288:	e3530000 	cmp	r3, #0
8002328c:	0a000003 	beq	800232a0 <ilock+0x2c>
80023290:	e51b3010 	ldr	r3, [fp, #-16]
80023294:	e5933008 	ldr	r3, [r3, #8]
80023298:	e3530000 	cmp	r3, #0
8002329c:	ca000001 	bgt	800232a8 <ilock+0x34>
800232a0:	e59f0150 	ldr	r0, [pc, #336]	@ 800233f8 <ilock+0x184>
800232a4:	ebfffa12 	bl	80021af4 <panic>
800232a8:	e59f014c 	ldr	r0, [pc, #332]	@ 800233fc <ilock+0x188>
800232ac:	eb000dd8 	bl	80026a14 <acquire>
800232b0:	ea000002 	b	800232c0 <ilock+0x4c>
800232b4:	e59f1140 	ldr	r1, [pc, #320]	@ 800233fc <ilock+0x188>
800232b8:	e51b0010 	ldr	r0, [fp, #-16]
800232bc:	eb000ac1 	bl	80025dc8 <sleep>
800232c0:	e51b3010 	ldr	r3, [fp, #-16]
800232c4:	e593300c 	ldr	r3, [r3, #12]
800232c8:	e2033001 	and	r3, r3, #1
800232cc:	e3530000 	cmp	r3, #0
800232d0:	1afffff7 	bne	800232b4 <ilock+0x40>
800232d4:	e51b3010 	ldr	r3, [fp, #-16]
800232d8:	e593300c 	ldr	r3, [r3, #12]
800232dc:	e3832001 	orr	r2, r3, #1
800232e0:	e51b3010 	ldr	r3, [fp, #-16]
800232e4:	e583200c 	str	r2, [r3, #12]
800232e8:	e59f010c 	ldr	r0, [pc, #268]	@ 800233fc <ilock+0x188>
800232ec:	eb000dd3 	bl	80026a40 <release>
800232f0:	e51b3010 	ldr	r3, [fp, #-16]
800232f4:	e593300c 	ldr	r3, [r3, #12]
800232f8:	e2033002 	and	r3, r3, #2
800232fc:	e3530000 	cmp	r3, #0
80023300:	1a000039 	bne	800233ec <ilock+0x178>
80023304:	e51b3010 	ldr	r3, [fp, #-16]
80023308:	e5932000 	ldr	r2, [r3]
8002330c:	e51b3010 	ldr	r3, [fp, #-16]
80023310:	e5933004 	ldr	r3, [r3, #4]
80023314:	e1a031a3 	lsr	r3, r3, #3
80023318:	e2833002 	add	r3, r3, #2
8002331c:	e1a01003 	mov	r1, r3
80023320:	e1a00002 	mov	r0, r2
80023324:	ebfff5fa 	bl	80020b14 <bread>
80023328:	e50b0008 	str	r0, [fp, #-8]
8002332c:	e51b3008 	ldr	r3, [fp, #-8]
80023330:	e2832018 	add	r2, r3, #24
80023334:	e51b3010 	ldr	r3, [fp, #-16]
80023338:	e5933004 	ldr	r3, [r3, #4]
8002333c:	e2033007 	and	r3, r3, #7
80023340:	e1a03303 	lsl	r3, r3, #6
80023344:	e0823003 	add	r3, r2, r3
80023348:	e50b300c 	str	r3, [fp, #-12]
8002334c:	e51b300c 	ldr	r3, [fp, #-12]
80023350:	e1d320f0 	ldrsh	r2, [r3]
80023354:	e51b3010 	ldr	r3, [fp, #-16]
80023358:	e1c321b0 	strh	r2, [r3, #16]
8002335c:	e51b300c 	ldr	r3, [fp, #-12]
80023360:	e1d320f2 	ldrsh	r2, [r3, #2]
80023364:	e51b3010 	ldr	r3, [fp, #-16]
80023368:	e1c321b2 	strh	r2, [r3, #18]
8002336c:	e51b300c 	ldr	r3, [fp, #-12]
80023370:	e1d320f4 	ldrsh	r2, [r3, #4]
80023374:	e51b3010 	ldr	r3, [fp, #-16]
80023378:	e1c321b4 	strh	r2, [r3, #20]
8002337c:	e51b300c 	ldr	r3, [fp, #-12]
80023380:	e1d320f6 	ldrsh	r2, [r3, #6]
80023384:	e51b3010 	ldr	r3, [fp, #-16]
80023388:	e1c321b6 	strh	r2, [r3, #22]
8002338c:	e51b300c 	ldr	r3, [fp, #-12]
80023390:	e5932008 	ldr	r2, [r3, #8]
80023394:	e51b3010 	ldr	r3, [fp, #-16]
80023398:	e5832018 	str	r2, [r3, #24]
8002339c:	e51b3010 	ldr	r3, [fp, #-16]
800233a0:	e283001c 	add	r0, r3, #28
800233a4:	e51b300c 	ldr	r3, [fp, #-12]
800233a8:	e283300c 	add	r3, r3, #12
800233ac:	e3a02034 	mov	r2, #52	@ 0x34
800233b0:	e1a01003 	mov	r1, r3
800233b4:	ebfff383 	bl	800201c8 <memmove>
800233b8:	e51b0008 	ldr	r0, [fp, #-8]
800233bc:	ebfff5fe 	bl	80020bbc <brelse>
800233c0:	e51b3010 	ldr	r3, [fp, #-16]
800233c4:	e593300c 	ldr	r3, [r3, #12]
800233c8:	e3832002 	orr	r2, r3, #2
800233cc:	e51b3010 	ldr	r3, [fp, #-16]
800233d0:	e583200c 	str	r2, [r3, #12]
800233d4:	e51b3010 	ldr	r3, [fp, #-16]
800233d8:	e1d331f0 	ldrsh	r3, [r3, #16]
800233dc:	e3530000 	cmp	r3, #0
800233e0:	1a000001 	bne	800233ec <ilock+0x178>
800233e4:	e59f0014 	ldr	r0, [pc, #20]	@ 80023400 <ilock+0x18c>
800233e8:	ebfff9c1 	bl	80021af4 <panic>
800233ec:	e1a00000 	nop			@ (mov r0, r0)
800233f0:	e24bd004 	sub	sp, fp, #4
800233f4:	e8bd8800 	pop	{fp, pc}
800233f8:	8002ace8 	.word	0x8002ace8
800233fc:	800d5b3c 	.word	0x800d5b3c
80023400:	8002acf0 	.word	0x8002acf0

80023404 <iunlock>:
80023404:	e92d4800 	push	{fp, lr}
80023408:	e28db004 	add	fp, sp, #4
8002340c:	e24dd008 	sub	sp, sp, #8
80023410:	e50b0008 	str	r0, [fp, #-8]
80023414:	e51b3008 	ldr	r3, [fp, #-8]
80023418:	e3530000 	cmp	r3, #0
8002341c:	0a000008 	beq	80023444 <iunlock+0x40>
80023420:	e51b3008 	ldr	r3, [fp, #-8]
80023424:	e593300c 	ldr	r3, [r3, #12]
80023428:	e2033001 	and	r3, r3, #1
8002342c:	e3530000 	cmp	r3, #0
80023430:	0a000003 	beq	80023444 <iunlock+0x40>
80023434:	e51b3008 	ldr	r3, [fp, #-8]
80023438:	e5933008 	ldr	r3, [r3, #8]
8002343c:	e3530000 	cmp	r3, #0
80023440:	ca000001 	bgt	8002344c <iunlock+0x48>
80023444:	e59f0038 	ldr	r0, [pc, #56]	@ 80023484 <iunlock+0x80>
80023448:	ebfff9a9 	bl	80021af4 <panic>
8002344c:	e59f0034 	ldr	r0, [pc, #52]	@ 80023488 <iunlock+0x84>
80023450:	eb000d6f 	bl	80026a14 <acquire>
80023454:	e51b3008 	ldr	r3, [fp, #-8]
80023458:	e593300c 	ldr	r3, [r3, #12]
8002345c:	e3c32001 	bic	r2, r3, #1
80023460:	e51b3008 	ldr	r3, [fp, #-8]
80023464:	e583200c 	str	r2, [r3, #12]
80023468:	e51b0008 	ldr	r0, [fp, #-8]
8002346c:	eb000ac9 	bl	80025f98 <wakeup>
80023470:	e59f0010 	ldr	r0, [pc, #16]	@ 80023488 <iunlock+0x84>
80023474:	eb000d71 	bl	80026a40 <release>
80023478:	e1a00000 	nop			@ (mov r0, r0)
8002347c:	e24bd004 	sub	sp, fp, #4
80023480:	e8bd8800 	pop	{fp, pc}
80023484:	8002ad00 	.word	0x8002ad00
80023488:	800d5b3c 	.word	0x800d5b3c

8002348c <iput>:
8002348c:	e92d4800 	push	{fp, lr}
80023490:	e28db004 	add	fp, sp, #4
80023494:	e24dd008 	sub	sp, sp, #8
80023498:	e50b0008 	str	r0, [fp, #-8]
8002349c:	e59f00cc 	ldr	r0, [pc, #204]	@ 80023570 <iput+0xe4>
800234a0:	eb000d5b 	bl	80026a14 <acquire>
800234a4:	e51b3008 	ldr	r3, [fp, #-8]
800234a8:	e5933008 	ldr	r3, [r3, #8]
800234ac:	e3530001 	cmp	r3, #1
800234b0:	1a000024 	bne	80023548 <iput+0xbc>
800234b4:	e51b3008 	ldr	r3, [fp, #-8]
800234b8:	e593300c 	ldr	r3, [r3, #12]
800234bc:	e2033002 	and	r3, r3, #2
800234c0:	e3530000 	cmp	r3, #0
800234c4:	0a00001f 	beq	80023548 <iput+0xbc>
800234c8:	e51b3008 	ldr	r3, [fp, #-8]
800234cc:	e1d331f6 	ldrsh	r3, [r3, #22]
800234d0:	e3530000 	cmp	r3, #0
800234d4:	1a00001b 	bne	80023548 <iput+0xbc>
800234d8:	e51b3008 	ldr	r3, [fp, #-8]
800234dc:	e593300c 	ldr	r3, [r3, #12]
800234e0:	e2033001 	and	r3, r3, #1
800234e4:	e3530000 	cmp	r3, #0
800234e8:	0a000001 	beq	800234f4 <iput+0x68>
800234ec:	e59f0080 	ldr	r0, [pc, #128]	@ 80023574 <iput+0xe8>
800234f0:	ebfff97f 	bl	80021af4 <panic>
800234f4:	e51b3008 	ldr	r3, [fp, #-8]
800234f8:	e593300c 	ldr	r3, [r3, #12]
800234fc:	e3832001 	orr	r2, r3, #1
80023500:	e51b3008 	ldr	r3, [fp, #-8]
80023504:	e583200c 	str	r2, [r3, #12]
80023508:	e59f0060 	ldr	r0, [pc, #96]	@ 80023570 <iput+0xe4>
8002350c:	eb000d4b 	bl	80026a40 <release>
80023510:	e51b0008 	ldr	r0, [fp, #-8]
80023514:	eb0000dc 	bl	8002388c <itrunc>
80023518:	e51b3008 	ldr	r3, [fp, #-8]
8002351c:	e3a02000 	mov	r2, #0
80023520:	e1c321b0 	strh	r2, [r3, #16]
80023524:	e51b0008 	ldr	r0, [fp, #-8]
80023528:	ebfffeb7 	bl	8002300c <iupdate>
8002352c:	e59f003c 	ldr	r0, [pc, #60]	@ 80023570 <iput+0xe4>
80023530:	eb000d37 	bl	80026a14 <acquire>
80023534:	e51b3008 	ldr	r3, [fp, #-8]
80023538:	e3a02000 	mov	r2, #0
8002353c:	e583200c 	str	r2, [r3, #12]
80023540:	e51b0008 	ldr	r0, [fp, #-8]
80023544:	eb000a93 	bl	80025f98 <wakeup>
80023548:	e51b3008 	ldr	r3, [fp, #-8]
8002354c:	e5933008 	ldr	r3, [r3, #8]
80023550:	e2432001 	sub	r2, r3, #1
80023554:	e51b3008 	ldr	r3, [fp, #-8]
80023558:	e5832008 	str	r2, [r3, #8]
8002355c:	e59f000c 	ldr	r0, [pc, #12]	@ 80023570 <iput+0xe4>
80023560:	eb000d36 	bl	80026a40 <release>
80023564:	e1a00000 	nop			@ (mov r0, r0)
80023568:	e24bd004 	sub	sp, fp, #4
8002356c:	e8bd8800 	pop	{fp, pc}
80023570:	800d5b3c 	.word	0x800d5b3c
80023574:	8002ad08 	.word	0x8002ad08

80023578 <iunlockput>:
80023578:	e92d4800 	push	{fp, lr}
8002357c:	e28db004 	add	fp, sp, #4
80023580:	e24dd008 	sub	sp, sp, #8
80023584:	e50b0008 	str	r0, [fp, #-8]
80023588:	e51b0008 	ldr	r0, [fp, #-8]
8002358c:	ebffff9c 	bl	80023404 <iunlock>
80023590:	e51b0008 	ldr	r0, [fp, #-8]
80023594:	ebffffbc 	bl	8002348c <iput>
80023598:	e1a00000 	nop			@ (mov r0, r0)
8002359c:	e24bd004 	sub	sp, fp, #4
800235a0:	e8bd8800 	pop	{fp, pc}

800235a4 <bmap>:
800235a4:	e92d4800 	push	{fp, lr}
800235a8:	e28db004 	add	fp, sp, #4
800235ac:	e24dd028 	sub	sp, sp, #40	@ 0x28
800235b0:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
800235b4:	e50b102c 	str	r1, [fp, #-44]	@ 0xffffffd4
800235b8:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
800235bc:	e353000a 	cmp	r3, #10
800235c0:	8a000017 	bhi	80023624 <bmap+0x80>
800235c4:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
800235c8:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
800235cc:	e2833006 	add	r3, r3, #6
800235d0:	e1a03103 	lsl	r3, r3, #2
800235d4:	e0823003 	add	r3, r2, r3
800235d8:	e5933004 	ldr	r3, [r3, #4]
800235dc:	e50b3008 	str	r3, [fp, #-8]
800235e0:	e51b3008 	ldr	r3, [fp, #-8]
800235e4:	e3530000 	cmp	r3, #0
800235e8:	1a00000b 	bne	8002361c <bmap+0x78>
800235ec:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
800235f0:	e5933000 	ldr	r3, [r3]
800235f4:	e1a00003 	mov	r0, r3
800235f8:	ebfffd7e 	bl	80022bf8 <balloc>
800235fc:	e50b0008 	str	r0, [fp, #-8]
80023600:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023604:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023608:	e2833006 	add	r3, r3, #6
8002360c:	e1a03103 	lsl	r3, r3, #2
80023610:	e0823003 	add	r3, r2, r3
80023614:	e51b2008 	ldr	r2, [fp, #-8]
80023618:	e5832004 	str	r2, [r3, #4]
8002361c:	e51b3008 	ldr	r3, [fp, #-8]
80023620:	ea000095 	b	8002387c <bmap+0x2d8>
80023624:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023628:	e243300b 	sub	r3, r3, #11
8002362c:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
80023630:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023634:	e353007f 	cmp	r3, #127	@ 0x7f
80023638:	8a000030 	bhi	80023700 <bmap+0x15c>
8002363c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023640:	e5933048 	ldr	r3, [r3, #72]	@ 0x48
80023644:	e50b3008 	str	r3, [fp, #-8]
80023648:	e51b3008 	ldr	r3, [fp, #-8]
8002364c:	e3530000 	cmp	r3, #0
80023650:	1a000007 	bne	80023674 <bmap+0xd0>
80023654:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023658:	e5933000 	ldr	r3, [r3]
8002365c:	e1a00003 	mov	r0, r3
80023660:	ebfffd64 	bl	80022bf8 <balloc>
80023664:	e50b0008 	str	r0, [fp, #-8]
80023668:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8002366c:	e51b2008 	ldr	r2, [fp, #-8]
80023670:	e5832048 	str	r2, [r3, #72]	@ 0x48
80023674:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023678:	e5933000 	ldr	r3, [r3]
8002367c:	e51b1008 	ldr	r1, [fp, #-8]
80023680:	e1a00003 	mov	r0, r3
80023684:	ebfff522 	bl	80020b14 <bread>
80023688:	e50b001c 	str	r0, [fp, #-28]	@ 0xffffffe4
8002368c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80023690:	e2833018 	add	r3, r3, #24
80023694:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80023698:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
8002369c:	e1a03103 	lsl	r3, r3, #2
800236a0:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
800236a4:	e0823003 	add	r3, r2, r3
800236a8:	e5933000 	ldr	r3, [r3]
800236ac:	e50b3008 	str	r3, [fp, #-8]
800236b0:	e51b3008 	ldr	r3, [fp, #-8]
800236b4:	e3530000 	cmp	r3, #0
800236b8:	1a00000c 	bne	800236f0 <bmap+0x14c>
800236bc:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
800236c0:	e5933000 	ldr	r3, [r3]
800236c4:	e1a00003 	mov	r0, r3
800236c8:	ebfffd4a 	bl	80022bf8 <balloc>
800236cc:	e50b0008 	str	r0, [fp, #-8]
800236d0:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
800236d4:	e1a03103 	lsl	r3, r3, #2
800236d8:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
800236dc:	e0823003 	add	r3, r2, r3
800236e0:	e51b2008 	ldr	r2, [fp, #-8]
800236e4:	e5832000 	str	r2, [r3]
800236e8:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
800236ec:	eb000436 	bl	800247cc <log_write>
800236f0:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
800236f4:	ebfff530 	bl	80020bbc <brelse>
800236f8:	e51b3008 	ldr	r3, [fp, #-8]
800236fc:	ea00005e 	b	8002387c <bmap+0x2d8>
80023700:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023704:	e2433080 	sub	r3, r3, #128	@ 0x80
80023708:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
8002370c:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023710:	e1a033a3 	lsr	r3, r3, #7
80023714:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80023718:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
8002371c:	e203307f 	and	r3, r3, #127	@ 0x7f
80023720:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80023724:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80023728:	e353007f 	cmp	r3, #127	@ 0x7f
8002372c:	9a000001 	bls	80023738 <bmap+0x194>
80023730:	e59f0150 	ldr	r0, [pc, #336]	@ 80023888 <bmap+0x2e4>
80023734:	ebfff8ee 	bl	80021af4 <panic>
80023738:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8002373c:	e593304c 	ldr	r3, [r3, #76]	@ 0x4c
80023740:	e50b300c 	str	r3, [fp, #-12]
80023744:	e51b300c 	ldr	r3, [fp, #-12]
80023748:	e3530000 	cmp	r3, #0
8002374c:	1a000007 	bne	80023770 <bmap+0x1cc>
80023750:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023754:	e5933000 	ldr	r3, [r3]
80023758:	e1a00003 	mov	r0, r3
8002375c:	ebfffd25 	bl	80022bf8 <balloc>
80023760:	e50b000c 	str	r0, [fp, #-12]
80023764:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023768:	e51b200c 	ldr	r2, [fp, #-12]
8002376c:	e583204c 	str	r2, [r3, #76]	@ 0x4c
80023770:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023774:	e5933000 	ldr	r3, [r3]
80023778:	e51b100c 	ldr	r1, [fp, #-12]
8002377c:	e1a00003 	mov	r0, r3
80023780:	ebfff4e3 	bl	80020b14 <bread>
80023784:	e50b001c 	str	r0, [fp, #-28]	@ 0xffffffe4
80023788:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8002378c:	e2833018 	add	r3, r3, #24
80023790:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80023794:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80023798:	e1a03103 	lsl	r3, r3, #2
8002379c:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
800237a0:	e0823003 	add	r3, r2, r3
800237a4:	e5933000 	ldr	r3, [r3]
800237a8:	e50b3010 	str	r3, [fp, #-16]
800237ac:	e51b3010 	ldr	r3, [fp, #-16]
800237b0:	e3530000 	cmp	r3, #0
800237b4:	1a00000c 	bne	800237ec <bmap+0x248>
800237b8:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
800237bc:	e5933000 	ldr	r3, [r3]
800237c0:	e1a00003 	mov	r0, r3
800237c4:	ebfffd0b 	bl	80022bf8 <balloc>
800237c8:	e50b0010 	str	r0, [fp, #-16]
800237cc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800237d0:	e1a03103 	lsl	r3, r3, #2
800237d4:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
800237d8:	e0823003 	add	r3, r2, r3
800237dc:	e51b2010 	ldr	r2, [fp, #-16]
800237e0:	e5832000 	str	r2, [r3]
800237e4:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
800237e8:	eb0003f7 	bl	800247cc <log_write>
800237ec:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
800237f0:	ebfff4f1 	bl	80020bbc <brelse>
800237f4:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
800237f8:	e5933000 	ldr	r3, [r3]
800237fc:	e51b1010 	ldr	r1, [fp, #-16]
80023800:	e1a00003 	mov	r0, r3
80023804:	ebfff4c2 	bl	80020b14 <bread>
80023808:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
8002380c:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80023810:	e2833018 	add	r3, r3, #24
80023814:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80023818:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002381c:	e1a03103 	lsl	r3, r3, #2
80023820:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
80023824:	e0823003 	add	r3, r2, r3
80023828:	e5933000 	ldr	r3, [r3]
8002382c:	e50b3008 	str	r3, [fp, #-8]
80023830:	e51b3008 	ldr	r3, [fp, #-8]
80023834:	e3530000 	cmp	r3, #0
80023838:	1a00000c 	bne	80023870 <bmap+0x2cc>
8002383c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023840:	e5933000 	ldr	r3, [r3]
80023844:	e1a00003 	mov	r0, r3
80023848:	ebfffcea 	bl	80022bf8 <balloc>
8002384c:	e50b0008 	str	r0, [fp, #-8]
80023850:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80023854:	e1a03103 	lsl	r3, r3, #2
80023858:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8002385c:	e0823003 	add	r3, r2, r3
80023860:	e51b2008 	ldr	r2, [fp, #-8]
80023864:	e5832000 	str	r2, [r3]
80023868:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
8002386c:	eb0003d6 	bl	800247cc <log_write>
80023870:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
80023874:	ebfff4d0 	bl	80020bbc <brelse>
80023878:	e51b3008 	ldr	r3, [fp, #-8]
8002387c:	e1a00003 	mov	r0, r3
80023880:	e24bd004 	sub	sp, fp, #4
80023884:	e8bd8800 	pop	{fp, pc}
80023888:	8002ad14 	.word	0x8002ad14

8002388c <itrunc>:
8002388c:	e92d4800 	push	{fp, lr}
80023890:	e28db004 	add	fp, sp, #4
80023894:	e24dd018 	sub	sp, sp, #24
80023898:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8002389c:	e3a03000 	mov	r3, #0
800238a0:	e50b3008 	str	r3, [fp, #-8]
800238a4:	ea00001c 	b	8002391c <itrunc+0x90>
800238a8:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
800238ac:	e51b3008 	ldr	r3, [fp, #-8]
800238b0:	e2833006 	add	r3, r3, #6
800238b4:	e1a03103 	lsl	r3, r3, #2
800238b8:	e0823003 	add	r3, r2, r3
800238bc:	e5933004 	ldr	r3, [r3, #4]
800238c0:	e3530000 	cmp	r3, #0
800238c4:	0a000011 	beq	80023910 <itrunc+0x84>
800238c8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800238cc:	e5933000 	ldr	r3, [r3]
800238d0:	e1a00003 	mov	r0, r3
800238d4:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
800238d8:	e51b3008 	ldr	r3, [fp, #-8]
800238dc:	e2833006 	add	r3, r3, #6
800238e0:	e1a03103 	lsl	r3, r3, #2
800238e4:	e0823003 	add	r3, r2, r3
800238e8:	e5933004 	ldr	r3, [r3, #4]
800238ec:	e1a01003 	mov	r1, r3
800238f0:	ebfffd32 	bl	80022dc0 <bfree>
800238f4:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
800238f8:	e51b3008 	ldr	r3, [fp, #-8]
800238fc:	e2833006 	add	r3, r3, #6
80023900:	e1a03103 	lsl	r3, r3, #2
80023904:	e0823003 	add	r3, r2, r3
80023908:	e3a02000 	mov	r2, #0
8002390c:	e5832004 	str	r2, [r3, #4]
80023910:	e51b3008 	ldr	r3, [fp, #-8]
80023914:	e2833001 	add	r3, r3, #1
80023918:	e50b3008 	str	r3, [fp, #-8]
8002391c:	e51b3008 	ldr	r3, [fp, #-8]
80023920:	e353000a 	cmp	r3, #10
80023924:	daffffdf 	ble	800238a8 <itrunc+0x1c>
80023928:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002392c:	e5933048 	ldr	r3, [r3, #72]	@ 0x48
80023930:	e3530000 	cmp	r3, #0
80023934:	0a000031 	beq	80023a00 <itrunc+0x174>
80023938:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002393c:	e5932000 	ldr	r2, [r3]
80023940:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80023944:	e5933048 	ldr	r3, [r3, #72]	@ 0x48
80023948:	e1a01003 	mov	r1, r3
8002394c:	e1a00002 	mov	r0, r2
80023950:	ebfff46f 	bl	80020b14 <bread>
80023954:	e50b0010 	str	r0, [fp, #-16]
80023958:	e51b3010 	ldr	r3, [fp, #-16]
8002395c:	e2833018 	add	r3, r3, #24
80023960:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80023964:	e3a03000 	mov	r3, #0
80023968:	e50b300c 	str	r3, [fp, #-12]
8002396c:	ea000013 	b	800239c0 <itrunc+0x134>
80023970:	e51b300c 	ldr	r3, [fp, #-12]
80023974:	e1a03103 	lsl	r3, r3, #2
80023978:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8002397c:	e0823003 	add	r3, r2, r3
80023980:	e5933000 	ldr	r3, [r3]
80023984:	e3530000 	cmp	r3, #0
80023988:	0a000009 	beq	800239b4 <itrunc+0x128>
8002398c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80023990:	e5933000 	ldr	r3, [r3]
80023994:	e1a00003 	mov	r0, r3
80023998:	e51b300c 	ldr	r3, [fp, #-12]
8002399c:	e1a03103 	lsl	r3, r3, #2
800239a0:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800239a4:	e0823003 	add	r3, r2, r3
800239a8:	e5933000 	ldr	r3, [r3]
800239ac:	e1a01003 	mov	r1, r3
800239b0:	ebfffd02 	bl	80022dc0 <bfree>
800239b4:	e51b300c 	ldr	r3, [fp, #-12]
800239b8:	e2833001 	add	r3, r3, #1
800239bc:	e50b300c 	str	r3, [fp, #-12]
800239c0:	e51b300c 	ldr	r3, [fp, #-12]
800239c4:	e353007f 	cmp	r3, #127	@ 0x7f
800239c8:	9affffe8 	bls	80023970 <itrunc+0xe4>
800239cc:	e51b0010 	ldr	r0, [fp, #-16]
800239d0:	ebfff479 	bl	80020bbc <brelse>
800239d4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800239d8:	e5933000 	ldr	r3, [r3]
800239dc:	e1a02003 	mov	r2, r3
800239e0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800239e4:	e5933048 	ldr	r3, [r3, #72]	@ 0x48
800239e8:	e1a01003 	mov	r1, r3
800239ec:	e1a00002 	mov	r0, r2
800239f0:	ebfffcf2 	bl	80022dc0 <bfree>
800239f4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800239f8:	e3a02000 	mov	r2, #0
800239fc:	e5832048 	str	r2, [r3, #72]	@ 0x48
80023a00:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80023a04:	e3a02000 	mov	r2, #0
80023a08:	e5832018 	str	r2, [r3, #24]
80023a0c:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80023a10:	ebfffd7d 	bl	8002300c <iupdate>
80023a14:	e1a00000 	nop			@ (mov r0, r0)
80023a18:	e24bd004 	sub	sp, fp, #4
80023a1c:	e8bd8800 	pop	{fp, pc}

80023a20 <stati>:
80023a20:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80023a24:	e28db000 	add	fp, sp, #0
80023a28:	e24dd00c 	sub	sp, sp, #12
80023a2c:	e50b0008 	str	r0, [fp, #-8]
80023a30:	e50b100c 	str	r1, [fp, #-12]
80023a34:	e51b3008 	ldr	r3, [fp, #-8]
80023a38:	e5933000 	ldr	r3, [r3]
80023a3c:	e1a02003 	mov	r2, r3
80023a40:	e51b300c 	ldr	r3, [fp, #-12]
80023a44:	e5832004 	str	r2, [r3, #4]
80023a48:	e51b3008 	ldr	r3, [fp, #-8]
80023a4c:	e5932004 	ldr	r2, [r3, #4]
80023a50:	e51b300c 	ldr	r3, [fp, #-12]
80023a54:	e5832008 	str	r2, [r3, #8]
80023a58:	e51b3008 	ldr	r3, [fp, #-8]
80023a5c:	e1d321f0 	ldrsh	r2, [r3, #16]
80023a60:	e51b300c 	ldr	r3, [fp, #-12]
80023a64:	e1c320b0 	strh	r2, [r3]
80023a68:	e51b3008 	ldr	r3, [fp, #-8]
80023a6c:	e1d321f6 	ldrsh	r2, [r3, #22]
80023a70:	e51b300c 	ldr	r3, [fp, #-12]
80023a74:	e1c320bc 	strh	r2, [r3, #12]
80023a78:	e51b3008 	ldr	r3, [fp, #-8]
80023a7c:	e5932018 	ldr	r2, [r3, #24]
80023a80:	e51b300c 	ldr	r3, [fp, #-12]
80023a84:	e5832010 	str	r2, [r3, #16]
80023a88:	e1a00000 	nop			@ (mov r0, r0)
80023a8c:	e28bd000 	add	sp, fp, #0
80023a90:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80023a94:	e12fff1e 	bx	lr

80023a98 <readi>:
80023a98:	e92d4810 	push	{r4, fp, lr}
80023a9c:	e28db008 	add	fp, sp, #8
80023aa0:	e24dd024 	sub	sp, sp, #36	@ 0x24
80023aa4:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80023aa8:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
80023aac:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
80023ab0:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
80023ab4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023ab8:	e1d331f0 	ldrsh	r3, [r3, #16]
80023abc:	e3530003 	cmp	r3, #3
80023ac0:	1a00001b 	bne	80023b34 <readi+0x9c>
80023ac4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023ac8:	e1d331f2 	ldrsh	r3, [r3, #18]
80023acc:	e3530000 	cmp	r3, #0
80023ad0:	ba00000a 	blt	80023b00 <readi+0x68>
80023ad4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023ad8:	e1d331f2 	ldrsh	r3, [r3, #18]
80023adc:	e3530009 	cmp	r3, #9
80023ae0:	ca000006 	bgt	80023b00 <readi+0x68>
80023ae4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023ae8:	e1d331f2 	ldrsh	r3, [r3, #18]
80023aec:	e1a02003 	mov	r2, r3
80023af0:	e59f3188 	ldr	r3, [pc, #392]	@ 80023c80 <readi+0x1e8>
80023af4:	e7933182 	ldr	r3, [r3, r2, lsl #3]
80023af8:	e3530000 	cmp	r3, #0
80023afc:	1a000001 	bne	80023b08 <readi+0x70>
80023b00:	e3e03000 	mvn	r3, #0
80023b04:	ea00005a 	b	80023c74 <readi+0x1dc>
80023b08:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023b0c:	e1d331f2 	ldrsh	r3, [r3, #18]
80023b10:	e1a02003 	mov	r2, r3
80023b14:	e59f3164 	ldr	r3, [pc, #356]	@ 80023c80 <readi+0x1e8>
80023b18:	e7933182 	ldr	r3, [r3, r2, lsl #3]
80023b1c:	e51b202c 	ldr	r2, [fp, #-44]	@ 0xffffffd4
80023b20:	e51b1024 	ldr	r1, [fp, #-36]	@ 0xffffffdc
80023b24:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80023b28:	e12fff33 	blx	r3
80023b2c:	e1a03000 	mov	r3, r0
80023b30:	ea00004f 	b	80023c74 <readi+0x1dc>
80023b34:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023b38:	e5933018 	ldr	r3, [r3, #24]
80023b3c:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023b40:	e1520003 	cmp	r2, r3
80023b44:	8a000005 	bhi	80023b60 <readi+0xc8>
80023b48:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023b4c:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023b50:	e0823003 	add	r3, r2, r3
80023b54:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023b58:	e1520003 	cmp	r2, r3
80023b5c:	9a000001 	bls	80023b68 <readi+0xd0>
80023b60:	e3e03000 	mvn	r3, #0
80023b64:	ea000042 	b	80023c74 <readi+0x1dc>
80023b68:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023b6c:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023b70:	e0822003 	add	r2, r2, r3
80023b74:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023b78:	e5933018 	ldr	r3, [r3, #24]
80023b7c:	e1520003 	cmp	r2, r3
80023b80:	9a000004 	bls	80023b98 <readi+0x100>
80023b84:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023b88:	e5932018 	ldr	r2, [r3, #24]
80023b8c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023b90:	e0423003 	sub	r3, r2, r3
80023b94:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
80023b98:	e3a03000 	mov	r3, #0
80023b9c:	e50b3010 	str	r3, [fp, #-16]
80023ba0:	ea00002e 	b	80023c60 <readi+0x1c8>
80023ba4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023ba8:	e5934000 	ldr	r4, [r3]
80023bac:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023bb0:	e1a034a3 	lsr	r3, r3, #9
80023bb4:	e1a01003 	mov	r1, r3
80023bb8:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80023bbc:	ebfffe78 	bl	800235a4 <bmap>
80023bc0:	e1a03000 	mov	r3, r0
80023bc4:	e1a01003 	mov	r1, r3
80023bc8:	e1a00004 	mov	r0, r4
80023bcc:	ebfff3d0 	bl	80020b14 <bread>
80023bd0:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80023bd4:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023bd8:	e1a03b83 	lsl	r3, r3, #23
80023bdc:	e1a03ba3 	lsr	r3, r3, #23
80023be0:	e2632c02 	rsb	r2, r3, #512	@ 0x200
80023be4:	e51b102c 	ldr	r1, [fp, #-44]	@ 0xffffffd4
80023be8:	e51b3010 	ldr	r3, [fp, #-16]
80023bec:	e0413003 	sub	r3, r1, r3
80023bf0:	e1520003 	cmp	r2, r3
80023bf4:	31a03002 	movcc	r3, r2
80023bf8:	21a03003 	movcs	r3, r3
80023bfc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80023c00:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80023c04:	e2832018 	add	r2, r3, #24
80023c08:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023c0c:	e1a03b83 	lsl	r3, r3, #23
80023c10:	e1a03ba3 	lsr	r3, r3, #23
80023c14:	e0823003 	add	r3, r2, r3
80023c18:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80023c1c:	e1a01003 	mov	r1, r3
80023c20:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
80023c24:	ebfff167 	bl	800201c8 <memmove>
80023c28:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80023c2c:	ebfff3e2 	bl	80020bbc <brelse>
80023c30:	e51b2010 	ldr	r2, [fp, #-16]
80023c34:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80023c38:	e0823003 	add	r3, r2, r3
80023c3c:	e50b3010 	str	r3, [fp, #-16]
80023c40:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023c44:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80023c48:	e0823003 	add	r3, r2, r3
80023c4c:	e50b3028 	str	r3, [fp, #-40]	@ 0xffffffd8
80023c50:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
80023c54:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80023c58:	e0823003 	add	r3, r2, r3
80023c5c:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80023c60:	e51b2010 	ldr	r2, [fp, #-16]
80023c64:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023c68:	e1520003 	cmp	r2, r3
80023c6c:	3affffcc 	bcc	80023ba4 <readi+0x10c>
80023c70:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023c74:	e1a00003 	mov	r0, r3
80023c78:	e24bd008 	sub	sp, fp, #8
80023c7c:	e8bd8810 	pop	{r4, fp, pc}
80023c80:	800d5158 	.word	0x800d5158

80023c84 <writei>:
80023c84:	e92d4810 	push	{r4, fp, lr}
80023c88:	e28db008 	add	fp, sp, #8
80023c8c:	e24dd024 	sub	sp, sp, #36	@ 0x24
80023c90:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80023c94:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
80023c98:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
80023c9c:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
80023ca0:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023ca4:	e1d331f0 	ldrsh	r3, [r3, #16]
80023ca8:	e3530003 	cmp	r3, #3
80023cac:	1a00001d 	bne	80023d28 <writei+0xa4>
80023cb0:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023cb4:	e1d331f2 	ldrsh	r3, [r3, #18]
80023cb8:	e3530000 	cmp	r3, #0
80023cbc:	ba00000b 	blt	80023cf0 <writei+0x6c>
80023cc0:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023cc4:	e1d331f2 	ldrsh	r3, [r3, #18]
80023cc8:	e3530009 	cmp	r3, #9
80023ccc:	ca000007 	bgt	80023cf0 <writei+0x6c>
80023cd0:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023cd4:	e1d331f2 	ldrsh	r3, [r3, #18]
80023cd8:	e59f21c0 	ldr	r2, [pc, #448]	@ 80023ea0 <writei+0x21c>
80023cdc:	e1a03183 	lsl	r3, r3, #3
80023ce0:	e0823003 	add	r3, r2, r3
80023ce4:	e5933004 	ldr	r3, [r3, #4]
80023ce8:	e3530000 	cmp	r3, #0
80023cec:	1a000001 	bne	80023cf8 <writei+0x74>
80023cf0:	e3e03000 	mvn	r3, #0
80023cf4:	ea000066 	b	80023e94 <writei+0x210>
80023cf8:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023cfc:	e1d331f2 	ldrsh	r3, [r3, #18]
80023d00:	e59f2198 	ldr	r2, [pc, #408]	@ 80023ea0 <writei+0x21c>
80023d04:	e1a03183 	lsl	r3, r3, #3
80023d08:	e0823003 	add	r3, r2, r3
80023d0c:	e5933004 	ldr	r3, [r3, #4]
80023d10:	e51b202c 	ldr	r2, [fp, #-44]	@ 0xffffffd4
80023d14:	e51b1024 	ldr	r1, [fp, #-36]	@ 0xffffffdc
80023d18:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80023d1c:	e12fff33 	blx	r3
80023d20:	e1a03000 	mov	r3, r0
80023d24:	ea00005a 	b	80023e94 <writei+0x210>
80023d28:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023d2c:	e5933018 	ldr	r3, [r3, #24]
80023d30:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023d34:	e1520003 	cmp	r2, r3
80023d38:	8a000005 	bhi	80023d54 <writei+0xd0>
80023d3c:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023d40:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023d44:	e0823003 	add	r3, r2, r3
80023d48:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023d4c:	e1520003 	cmp	r2, r3
80023d50:	9a000001 	bls	80023d5c <writei+0xd8>
80023d54:	e3e03000 	mvn	r3, #0
80023d58:	ea00004d 	b	80023e94 <writei+0x210>
80023d5c:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023d60:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023d64:	e0823003 	add	r3, r2, r3
80023d68:	e59f2134 	ldr	r2, [pc, #308]	@ 80023ea4 <writei+0x220>
80023d6c:	e1530002 	cmp	r3, r2
80023d70:	9a000001 	bls	80023d7c <writei+0xf8>
80023d74:	e3e03000 	mvn	r3, #0
80023d78:	ea000045 	b	80023e94 <writei+0x210>
80023d7c:	e3a03000 	mov	r3, #0
80023d80:	e50b3010 	str	r3, [fp, #-16]
80023d84:	ea000030 	b	80023e4c <writei+0x1c8>
80023d88:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023d8c:	e5934000 	ldr	r4, [r3]
80023d90:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023d94:	e1a034a3 	lsr	r3, r3, #9
80023d98:	e1a01003 	mov	r1, r3
80023d9c:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80023da0:	ebfffdff 	bl	800235a4 <bmap>
80023da4:	e1a03000 	mov	r3, r0
80023da8:	e1a01003 	mov	r1, r3
80023dac:	e1a00004 	mov	r0, r4
80023db0:	ebfff357 	bl	80020b14 <bread>
80023db4:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80023db8:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023dbc:	e1a03b83 	lsl	r3, r3, #23
80023dc0:	e1a03ba3 	lsr	r3, r3, #23
80023dc4:	e2632c02 	rsb	r2, r3, #512	@ 0x200
80023dc8:	e51b102c 	ldr	r1, [fp, #-44]	@ 0xffffffd4
80023dcc:	e51b3010 	ldr	r3, [fp, #-16]
80023dd0:	e0413003 	sub	r3, r1, r3
80023dd4:	e1520003 	cmp	r2, r3
80023dd8:	31a03002 	movcc	r3, r2
80023ddc:	21a03003 	movcs	r3, r3
80023de0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80023de4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80023de8:	e2832018 	add	r2, r3, #24
80023dec:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023df0:	e1a03b83 	lsl	r3, r3, #23
80023df4:	e1a03ba3 	lsr	r3, r3, #23
80023df8:	e0823003 	add	r3, r2, r3
80023dfc:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80023e00:	e51b1024 	ldr	r1, [fp, #-36]	@ 0xffffffdc
80023e04:	e1a00003 	mov	r0, r3
80023e08:	ebfff0ee 	bl	800201c8 <memmove>
80023e0c:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80023e10:	eb00026d 	bl	800247cc <log_write>
80023e14:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80023e18:	ebfff367 	bl	80020bbc <brelse>
80023e1c:	e51b2010 	ldr	r2, [fp, #-16]
80023e20:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80023e24:	e0823003 	add	r3, r2, r3
80023e28:	e50b3010 	str	r3, [fp, #-16]
80023e2c:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023e30:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80023e34:	e0823003 	add	r3, r2, r3
80023e38:	e50b3028 	str	r3, [fp, #-40]	@ 0xffffffd8
80023e3c:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
80023e40:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80023e44:	e0823003 	add	r3, r2, r3
80023e48:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80023e4c:	e51b2010 	ldr	r2, [fp, #-16]
80023e50:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023e54:	e1520003 	cmp	r2, r3
80023e58:	3affffca 	bcc	80023d88 <writei+0x104>
80023e5c:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023e60:	e3530000 	cmp	r3, #0
80023e64:	0a000009 	beq	80023e90 <writei+0x20c>
80023e68:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023e6c:	e5933018 	ldr	r3, [r3, #24]
80023e70:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023e74:	e1520003 	cmp	r2, r3
80023e78:	9a000004 	bls	80023e90 <writei+0x20c>
80023e7c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023e80:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80023e84:	e5832018 	str	r2, [r3, #24]
80023e88:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80023e8c:	ebfffc5e 	bl	8002300c <iupdate>
80023e90:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80023e94:	e1a00003 	mov	r0, r3
80023e98:	e24bd008 	sub	sp, fp, #8
80023e9c:	e8bd8810 	pop	{r4, fp, pc}
80023ea0:	800d5158 	.word	0x800d5158
80023ea4:	00811600 	.word	0x00811600

80023ea8 <namecmp>:
80023ea8:	e92d4800 	push	{fp, lr}
80023eac:	e28db004 	add	fp, sp, #4
80023eb0:	e24dd008 	sub	sp, sp, #8
80023eb4:	e50b0008 	str	r0, [fp, #-8]
80023eb8:	e50b100c 	str	r1, [fp, #-12]
80023ebc:	e3a0200e 	mov	r2, #14
80023ec0:	e51b100c 	ldr	r1, [fp, #-12]
80023ec4:	e51b0008 	ldr	r0, [fp, #-8]
80023ec8:	ebfff10b 	bl	800202fc <strncmp>
80023ecc:	e1a03000 	mov	r3, r0
80023ed0:	e1a00003 	mov	r0, r3
80023ed4:	e24bd004 	sub	sp, fp, #4
80023ed8:	e8bd8800 	pop	{fp, pc}

80023edc <dirlookup>:
80023edc:	e92d4800 	push	{fp, lr}
80023ee0:	e28db004 	add	fp, sp, #4
80023ee4:	e24dd028 	sub	sp, sp, #40	@ 0x28
80023ee8:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80023eec:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
80023ef0:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
80023ef4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023ef8:	e1d331f0 	ldrsh	r3, [r3, #16]
80023efc:	e3530001 	cmp	r3, #1
80023f00:	0a000001 	beq	80023f0c <dirlookup+0x30>
80023f04:	e59f00d0 	ldr	r0, [pc, #208]	@ 80023fdc <dirlookup+0x100>
80023f08:	ebfff6f9 	bl	80021af4 <panic>
80023f0c:	e3a03000 	mov	r3, #0
80023f10:	e50b3008 	str	r3, [fp, #-8]
80023f14:	ea000027 	b	80023fb8 <dirlookup+0xdc>
80023f18:	e24b101c 	sub	r1, fp, #28
80023f1c:	e3a03010 	mov	r3, #16
80023f20:	e51b2008 	ldr	r2, [fp, #-8]
80023f24:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80023f28:	ebfffeda 	bl	80023a98 <readi>
80023f2c:	e1a03000 	mov	r3, r0
80023f30:	e3530010 	cmp	r3, #16
80023f34:	0a000001 	beq	80023f40 <dirlookup+0x64>
80023f38:	e59f00a0 	ldr	r0, [pc, #160]	@ 80023fe0 <dirlookup+0x104>
80023f3c:	ebfff6ec 	bl	80021af4 <panic>
80023f40:	e15b31bc 	ldrh	r3, [fp, #-28]	@ 0xffffffe4
80023f44:	e3530000 	cmp	r3, #0
80023f48:	0a000016 	beq	80023fa8 <dirlookup+0xcc>
80023f4c:	e24b301c 	sub	r3, fp, #28
80023f50:	e2833002 	add	r3, r3, #2
80023f54:	e1a01003 	mov	r1, r3
80023f58:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
80023f5c:	ebffffd1 	bl	80023ea8 <namecmp>
80023f60:	e1a03000 	mov	r3, r0
80023f64:	e3530000 	cmp	r3, #0
80023f68:	1a00000f 	bne	80023fac <dirlookup+0xd0>
80023f6c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023f70:	e3530000 	cmp	r3, #0
80023f74:	0a000002 	beq	80023f84 <dirlookup+0xa8>
80023f78:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80023f7c:	e51b2008 	ldr	r2, [fp, #-8]
80023f80:	e5832000 	str	r2, [r3]
80023f84:	e15b31bc 	ldrh	r3, [fp, #-28]	@ 0xffffffe4
80023f88:	e50b300c 	str	r3, [fp, #-12]
80023f8c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023f90:	e5933000 	ldr	r3, [r3]
80023f94:	e51b100c 	ldr	r1, [fp, #-12]
80023f98:	e1a00003 	mov	r0, r3
80023f9c:	ebfffc52 	bl	800230ec <iget>
80023fa0:	e1a03000 	mov	r3, r0
80023fa4:	ea000009 	b	80023fd0 <dirlookup+0xf4>
80023fa8:	e1a00000 	nop			@ (mov r0, r0)
80023fac:	e51b3008 	ldr	r3, [fp, #-8]
80023fb0:	e2833010 	add	r3, r3, #16
80023fb4:	e50b3008 	str	r3, [fp, #-8]
80023fb8:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80023fbc:	e5933018 	ldr	r3, [r3, #24]
80023fc0:	e51b2008 	ldr	r2, [fp, #-8]
80023fc4:	e1520003 	cmp	r2, r3
80023fc8:	3affffd2 	bcc	80023f18 <dirlookup+0x3c>
80023fcc:	e3a03000 	mov	r3, #0
80023fd0:	e1a00003 	mov	r0, r3
80023fd4:	e24bd004 	sub	sp, fp, #4
80023fd8:	e8bd8800 	pop	{fp, pc}
80023fdc:	8002ad28 	.word	0x8002ad28
80023fe0:	8002ad3c 	.word	0x8002ad3c

80023fe4 <dirlink>:
80023fe4:	e92d4800 	push	{fp, lr}
80023fe8:	e28db004 	add	fp, sp, #4
80023fec:	e24dd028 	sub	sp, sp, #40	@ 0x28
80023ff0:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80023ff4:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
80023ff8:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
80023ffc:	e3a02000 	mov	r2, #0
80024000:	e51b1024 	ldr	r1, [fp, #-36]	@ 0xffffffdc
80024004:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80024008:	ebffffb3 	bl	80023edc <dirlookup>
8002400c:	e50b000c 	str	r0, [fp, #-12]
80024010:	e51b300c 	ldr	r3, [fp, #-12]
80024014:	e3530000 	cmp	r3, #0
80024018:	0a000003 	beq	8002402c <dirlink+0x48>
8002401c:	e51b000c 	ldr	r0, [fp, #-12]
80024020:	ebfffd19 	bl	8002348c <iput>
80024024:	e3e03000 	mvn	r3, #0
80024028:	ea00002d 	b	800240e4 <dirlink+0x100>
8002402c:	e3a03000 	mov	r3, #0
80024030:	e50b3008 	str	r3, [fp, #-8]
80024034:	ea00000f 	b	80024078 <dirlink+0x94>
80024038:	e51b2008 	ldr	r2, [fp, #-8]
8002403c:	e24b101c 	sub	r1, fp, #28
80024040:	e3a03010 	mov	r3, #16
80024044:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80024048:	ebfffe92 	bl	80023a98 <readi>
8002404c:	e1a03000 	mov	r3, r0
80024050:	e3530010 	cmp	r3, #16
80024054:	0a000001 	beq	80024060 <dirlink+0x7c>
80024058:	e59f0090 	ldr	r0, [pc, #144]	@ 800240f0 <dirlink+0x10c>
8002405c:	ebfff6a4 	bl	80021af4 <panic>
80024060:	e15b31bc 	ldrh	r3, [fp, #-28]	@ 0xffffffe4
80024064:	e3530000 	cmp	r3, #0
80024068:	0a000008 	beq	80024090 <dirlink+0xac>
8002406c:	e51b3008 	ldr	r3, [fp, #-8]
80024070:	e2833010 	add	r3, r3, #16
80024074:	e50b3008 	str	r3, [fp, #-8]
80024078:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8002407c:	e5932018 	ldr	r2, [r3, #24]
80024080:	e51b3008 	ldr	r3, [fp, #-8]
80024084:	e1520003 	cmp	r2, r3
80024088:	8affffea 	bhi	80024038 <dirlink+0x54>
8002408c:	ea000000 	b	80024094 <dirlink+0xb0>
80024090:	e1a00000 	nop			@ (mov r0, r0)
80024094:	e24b301c 	sub	r3, fp, #28
80024098:	e2833002 	add	r3, r3, #2
8002409c:	e3a0200e 	mov	r2, #14
800240a0:	e51b1024 	ldr	r1, [fp, #-36]	@ 0xffffffdc
800240a4:	e1a00003 	mov	r0, r3
800240a8:	ebfff0bf 	bl	800203ac <strncpy>
800240ac:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
800240b0:	e6ff3073 	uxth	r3, r3
800240b4:	e14b31bc 	strh	r3, [fp, #-28]	@ 0xffffffe4
800240b8:	e51b2008 	ldr	r2, [fp, #-8]
800240bc:	e24b101c 	sub	r1, fp, #28
800240c0:	e3a03010 	mov	r3, #16
800240c4:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
800240c8:	ebfffeed 	bl	80023c84 <writei>
800240cc:	e1a03000 	mov	r3, r0
800240d0:	e3530010 	cmp	r3, #16
800240d4:	0a000001 	beq	800240e0 <dirlink+0xfc>
800240d8:	e59f0014 	ldr	r0, [pc, #20]	@ 800240f4 <dirlink+0x110>
800240dc:	ebfff684 	bl	80021af4 <panic>
800240e0:	e3a03000 	mov	r3, #0
800240e4:	e1a00003 	mov	r0, r3
800240e8:	e24bd004 	sub	sp, fp, #4
800240ec:	e8bd8800 	pop	{fp, pc}
800240f0:	8002ad3c 	.word	0x8002ad3c
800240f4:	8002ad4c 	.word	0x8002ad4c

800240f8 <skipelem>:
800240f8:	e92d4800 	push	{fp, lr}
800240fc:	e28db004 	add	fp, sp, #4
80024100:	e24dd010 	sub	sp, sp, #16
80024104:	e50b0010 	str	r0, [fp, #-16]
80024108:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
8002410c:	ea000002 	b	8002411c <skipelem+0x24>
80024110:	e51b3010 	ldr	r3, [fp, #-16]
80024114:	e2833001 	add	r3, r3, #1
80024118:	e50b3010 	str	r3, [fp, #-16]
8002411c:	e51b3010 	ldr	r3, [fp, #-16]
80024120:	e5d33000 	ldrb	r3, [r3]
80024124:	e353002f 	cmp	r3, #47	@ 0x2f
80024128:	0afffff8 	beq	80024110 <skipelem+0x18>
8002412c:	e51b3010 	ldr	r3, [fp, #-16]
80024130:	e5d33000 	ldrb	r3, [r3]
80024134:	e3530000 	cmp	r3, #0
80024138:	1a000001 	bne	80024144 <skipelem+0x4c>
8002413c:	e3a03000 	mov	r3, #0
80024140:	ea00002c 	b	800241f8 <skipelem+0x100>
80024144:	e51b3010 	ldr	r3, [fp, #-16]
80024148:	e50b3008 	str	r3, [fp, #-8]
8002414c:	ea000002 	b	8002415c <skipelem+0x64>
80024150:	e51b3010 	ldr	r3, [fp, #-16]
80024154:	e2833001 	add	r3, r3, #1
80024158:	e50b3010 	str	r3, [fp, #-16]
8002415c:	e51b3010 	ldr	r3, [fp, #-16]
80024160:	e5d33000 	ldrb	r3, [r3]
80024164:	e353002f 	cmp	r3, #47	@ 0x2f
80024168:	0a000003 	beq	8002417c <skipelem+0x84>
8002416c:	e51b3010 	ldr	r3, [fp, #-16]
80024170:	e5d33000 	ldrb	r3, [r3]
80024174:	e3530000 	cmp	r3, #0
80024178:	1afffff4 	bne	80024150 <skipelem+0x58>
8002417c:	e51b2010 	ldr	r2, [fp, #-16]
80024180:	e51b3008 	ldr	r3, [fp, #-8]
80024184:	e0423003 	sub	r3, r2, r3
80024188:	e50b300c 	str	r3, [fp, #-12]
8002418c:	e51b300c 	ldr	r3, [fp, #-12]
80024190:	e353000d 	cmp	r3, #13
80024194:	da000004 	ble	800241ac <skipelem+0xb4>
80024198:	e3a0200e 	mov	r2, #14
8002419c:	e51b1008 	ldr	r1, [fp, #-8]
800241a0:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
800241a4:	ebfff007 	bl	800201c8 <memmove>
800241a8:	ea00000d 	b	800241e4 <skipelem+0xec>
800241ac:	e51b300c 	ldr	r3, [fp, #-12]
800241b0:	e1a02003 	mov	r2, r3
800241b4:	e51b1008 	ldr	r1, [fp, #-8]
800241b8:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
800241bc:	ebfff001 	bl	800201c8 <memmove>
800241c0:	e51b300c 	ldr	r3, [fp, #-12]
800241c4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800241c8:	e0823003 	add	r3, r2, r3
800241cc:	e3a02000 	mov	r2, #0
800241d0:	e5c32000 	strb	r2, [r3]
800241d4:	ea000002 	b	800241e4 <skipelem+0xec>
800241d8:	e51b3010 	ldr	r3, [fp, #-16]
800241dc:	e2833001 	add	r3, r3, #1
800241e0:	e50b3010 	str	r3, [fp, #-16]
800241e4:	e51b3010 	ldr	r3, [fp, #-16]
800241e8:	e5d33000 	ldrb	r3, [r3]
800241ec:	e353002f 	cmp	r3, #47	@ 0x2f
800241f0:	0afffff8 	beq	800241d8 <skipelem+0xe0>
800241f4:	e51b3010 	ldr	r3, [fp, #-16]
800241f8:	e1a00003 	mov	r0, r3
800241fc:	e24bd004 	sub	sp, fp, #4
80024200:	e8bd8800 	pop	{fp, pc}

80024204 <namex>:
80024204:	e92d4800 	push	{fp, lr}
80024208:	e28db004 	add	fp, sp, #4
8002420c:	e24dd018 	sub	sp, sp, #24
80024210:	e50b0010 	str	r0, [fp, #-16]
80024214:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80024218:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
8002421c:	e51b3010 	ldr	r3, [fp, #-16]
80024220:	e5d33000 	ldrb	r3, [r3]
80024224:	e353002f 	cmp	r3, #47	@ 0x2f
80024228:	1a000004 	bne	80024240 <namex+0x3c>
8002422c:	e3a01001 	mov	r1, #1
80024230:	e3a00001 	mov	r0, #1
80024234:	ebfffbac 	bl	800230ec <iget>
80024238:	e50b0008 	str	r0, [fp, #-8]
8002423c:	ea00002b 	b	800242f0 <namex+0xec>
80024240:	e59f30f0 	ldr	r3, [pc, #240]	@ 80024338 <namex+0x134>
80024244:	e5933000 	ldr	r3, [r3]
80024248:	e5933068 	ldr	r3, [r3, #104]	@ 0x68
8002424c:	e1a00003 	mov	r0, r3
80024250:	ebfffbf5 	bl	8002322c <idup>
80024254:	e50b0008 	str	r0, [fp, #-8]
80024258:	ea000024 	b	800242f0 <namex+0xec>
8002425c:	e51b0008 	ldr	r0, [fp, #-8]
80024260:	ebfffc03 	bl	80023274 <ilock>
80024264:	e51b3008 	ldr	r3, [fp, #-8]
80024268:	e1d331f0 	ldrsh	r3, [r3, #16]
8002426c:	e3530001 	cmp	r3, #1
80024270:	0a000003 	beq	80024284 <namex+0x80>
80024274:	e51b0008 	ldr	r0, [fp, #-8]
80024278:	ebfffcbe 	bl	80023578 <iunlockput>
8002427c:	e3a03000 	mov	r3, #0
80024280:	ea000029 	b	8002432c <namex+0x128>
80024284:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024288:	e3530000 	cmp	r3, #0
8002428c:	0a000007 	beq	800242b0 <namex+0xac>
80024290:	e51b3010 	ldr	r3, [fp, #-16]
80024294:	e5d33000 	ldrb	r3, [r3]
80024298:	e3530000 	cmp	r3, #0
8002429c:	1a000003 	bne	800242b0 <namex+0xac>
800242a0:	e51b0008 	ldr	r0, [fp, #-8]
800242a4:	ebfffc56 	bl	80023404 <iunlock>
800242a8:	e51b3008 	ldr	r3, [fp, #-8]
800242ac:	ea00001e 	b	8002432c <namex+0x128>
800242b0:	e3a02000 	mov	r2, #0
800242b4:	e51b1018 	ldr	r1, [fp, #-24]	@ 0xffffffe8
800242b8:	e51b0008 	ldr	r0, [fp, #-8]
800242bc:	ebffff06 	bl	80023edc <dirlookup>
800242c0:	e50b000c 	str	r0, [fp, #-12]
800242c4:	e51b300c 	ldr	r3, [fp, #-12]
800242c8:	e3530000 	cmp	r3, #0
800242cc:	1a000003 	bne	800242e0 <namex+0xdc>
800242d0:	e51b0008 	ldr	r0, [fp, #-8]
800242d4:	ebfffca7 	bl	80023578 <iunlockput>
800242d8:	e3a03000 	mov	r3, #0
800242dc:	ea000012 	b	8002432c <namex+0x128>
800242e0:	e51b0008 	ldr	r0, [fp, #-8]
800242e4:	ebfffca3 	bl	80023578 <iunlockput>
800242e8:	e51b300c 	ldr	r3, [fp, #-12]
800242ec:	e50b3008 	str	r3, [fp, #-8]
800242f0:	e51b1018 	ldr	r1, [fp, #-24]	@ 0xffffffe8
800242f4:	e51b0010 	ldr	r0, [fp, #-16]
800242f8:	ebffff7e 	bl	800240f8 <skipelem>
800242fc:	e50b0010 	str	r0, [fp, #-16]
80024300:	e51b3010 	ldr	r3, [fp, #-16]
80024304:	e3530000 	cmp	r3, #0
80024308:	1affffd3 	bne	8002425c <namex+0x58>
8002430c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024310:	e3530000 	cmp	r3, #0
80024314:	0a000003 	beq	80024328 <namex+0x124>
80024318:	e51b0008 	ldr	r0, [fp, #-8]
8002431c:	ebfffc5a 	bl	8002348c <iput>
80024320:	e3a03000 	mov	r3, #0
80024324:	ea000000 	b	8002432c <namex+0x128>
80024328:	e51b3008 	ldr	r3, [fp, #-8]
8002432c:	e1a00003 	mov	r0, r3
80024330:	e24bd004 	sub	sp, fp, #4
80024334:	e8bd8800 	pop	{fp, pc}
80024338:	800d97a8 	.word	0x800d97a8

8002433c <namei>:
8002433c:	e92d4800 	push	{fp, lr}
80024340:	e28db004 	add	fp, sp, #4
80024344:	e24dd018 	sub	sp, sp, #24
80024348:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8002434c:	e24b3014 	sub	r3, fp, #20
80024350:	e1a02003 	mov	r2, r3
80024354:	e3a01000 	mov	r1, #0
80024358:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
8002435c:	ebffffa8 	bl	80024204 <namex>
80024360:	e1a03000 	mov	r3, r0
80024364:	e1a00003 	mov	r0, r3
80024368:	e24bd004 	sub	sp, fp, #4
8002436c:	e8bd8800 	pop	{fp, pc}

80024370 <nameiparent>:
80024370:	e92d4800 	push	{fp, lr}
80024374:	e28db004 	add	fp, sp, #4
80024378:	e24dd008 	sub	sp, sp, #8
8002437c:	e50b0008 	str	r0, [fp, #-8]
80024380:	e50b100c 	str	r1, [fp, #-12]
80024384:	e51b200c 	ldr	r2, [fp, #-12]
80024388:	e3a01001 	mov	r1, #1
8002438c:	e51b0008 	ldr	r0, [fp, #-8]
80024390:	ebffff9b 	bl	80024204 <namex>
80024394:	e1a03000 	mov	r3, r0
80024398:	e1a00003 	mov	r0, r3
8002439c:	e24bd004 	sub	sp, fp, #4
800243a0:	e8bd8800 	pop	{fp, pc}

800243a4 <symlink_write>:
800243a4:	e92d4800 	push	{fp, lr}
800243a8:	e28db004 	add	fp, sp, #4
800243ac:	e24dd010 	sub	sp, sp, #16
800243b0:	e50b0010 	str	r0, [fp, #-16]
800243b4:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
800243b8:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
800243bc:	ebfff04a 	bl	800204ec <strlen>
800243c0:	e50b0008 	str	r0, [fp, #-8]
800243c4:	e51b3008 	ldr	r3, [fp, #-8]
800243c8:	e59f204c 	ldr	r2, [pc, #76]	@ 8002441c <symlink_write+0x78>
800243cc:	e1530002 	cmp	r3, r2
800243d0:	9a000001 	bls	800243dc <symlink_write+0x38>
800243d4:	e3e03000 	mvn	r3, #0
800243d8:	ea00000c 	b	80024410 <symlink_write+0x6c>
800243dc:	e51b3008 	ldr	r3, [fp, #-8]
800243e0:	e3a02000 	mov	r2, #0
800243e4:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
800243e8:	e51b0010 	ldr	r0, [fp, #-16]
800243ec:	ebfffe24 	bl	80023c84 <writei>
800243f0:	e50b000c 	str	r0, [fp, #-12]
800243f4:	e51b200c 	ldr	r2, [fp, #-12]
800243f8:	e51b3008 	ldr	r3, [fp, #-8]
800243fc:	e1520003 	cmp	r2, r3
80024400:	0a000001 	beq	8002440c <symlink_write+0x68>
80024404:	e3e03000 	mvn	r3, #0
80024408:	ea000000 	b	80024410 <symlink_write+0x6c>
8002440c:	e3a03000 	mov	r3, #0
80024410:	e1a00003 	mov	r0, r3
80024414:	e24bd004 	sub	sp, fp, #4
80024418:	e8bd8800 	pop	{fp, pc}
8002441c:	00811600 	.word	0x00811600

80024420 <initlog>:
80024420:	e92d4800 	push	{fp, lr}
80024424:	e28db004 	add	fp, sp, #4
80024428:	e24dd010 	sub	sp, sp, #16
8002442c:	e59f1058 	ldr	r1, [pc, #88]	@ 8002448c <initlog+0x6c>
80024430:	e59f0058 	ldr	r0, [pc, #88]	@ 80024490 <initlog+0x70>
80024434:	eb000964 	bl	800269cc <initlock>
80024438:	e24b3014 	sub	r3, fp, #20
8002443c:	e1a01003 	mov	r1, r3
80024440:	e3a00001 	mov	r0, #1
80024444:	ebfff9be 	bl	80022b44 <readsb>
80024448:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8002444c:	e51b3008 	ldr	r3, [fp, #-8]
80024450:	e0423003 	sub	r3, r2, r3
80024454:	e1a02003 	mov	r2, r3
80024458:	e59f3030 	ldr	r3, [pc, #48]	@ 80024490 <initlog+0x70>
8002445c:	e5832034 	str	r2, [r3, #52]	@ 0x34
80024460:	e51b3008 	ldr	r3, [fp, #-8]
80024464:	e1a02003 	mov	r2, r3
80024468:	e59f3020 	ldr	r3, [pc, #32]	@ 80024490 <initlog+0x70>
8002446c:	e5832038 	str	r2, [r3, #56]	@ 0x38
80024470:	e59f3018 	ldr	r3, [pc, #24]	@ 80024490 <initlog+0x70>
80024474:	e3a02001 	mov	r2, #1
80024478:	e5832040 	str	r2, [r3, #64]	@ 0x40
8002447c:	eb00009b 	bl	800246f0 <recover_from_log>
80024480:	e1a00000 	nop			@ (mov r0, r0)
80024484:	e24bd004 	sub	sp, fp, #4
80024488:	e8bd8800 	pop	{fp, pc}
8002448c:	8002ad54 	.word	0x8002ad54
80024490:	800d6b10 	.word	0x800d6b10

80024494 <install_trans>:
80024494:	e92d4800 	push	{fp, lr}
80024498:	e28db004 	add	fp, sp, #4
8002449c:	e24dd010 	sub	sp, sp, #16
800244a0:	e3a03000 	mov	r3, #0
800244a4:	e50b3008 	str	r3, [fp, #-8]
800244a8:	ea000026 	b	80024548 <install_trans+0xb4>
800244ac:	e59f30b8 	ldr	r3, [pc, #184]	@ 8002456c <install_trans+0xd8>
800244b0:	e5933040 	ldr	r3, [r3, #64]	@ 0x40
800244b4:	e1a00003 	mov	r0, r3
800244b8:	e59f30ac 	ldr	r3, [pc, #172]	@ 8002456c <install_trans+0xd8>
800244bc:	e5932034 	ldr	r2, [r3, #52]	@ 0x34
800244c0:	e51b3008 	ldr	r3, [fp, #-8]
800244c4:	e0823003 	add	r3, r2, r3
800244c8:	e2833001 	add	r3, r3, #1
800244cc:	e1a01003 	mov	r1, r3
800244d0:	ebfff18f 	bl	80020b14 <bread>
800244d4:	e50b000c 	str	r0, [fp, #-12]
800244d8:	e59f308c 	ldr	r3, [pc, #140]	@ 8002456c <install_trans+0xd8>
800244dc:	e5933040 	ldr	r3, [r3, #64]	@ 0x40
800244e0:	e1a00003 	mov	r0, r3
800244e4:	e59f2080 	ldr	r2, [pc, #128]	@ 8002456c <install_trans+0xd8>
800244e8:	e51b3008 	ldr	r3, [fp, #-8]
800244ec:	e2833010 	add	r3, r3, #16
800244f0:	e1a03103 	lsl	r3, r3, #2
800244f4:	e0823003 	add	r3, r2, r3
800244f8:	e5933008 	ldr	r3, [r3, #8]
800244fc:	e1a01003 	mov	r1, r3
80024500:	ebfff183 	bl	80020b14 <bread>
80024504:	e50b0010 	str	r0, [fp, #-16]
80024508:	e51b3010 	ldr	r3, [fp, #-16]
8002450c:	e2830018 	add	r0, r3, #24
80024510:	e51b300c 	ldr	r3, [fp, #-12]
80024514:	e2833018 	add	r3, r3, #24
80024518:	e3a02c02 	mov	r2, #512	@ 0x200
8002451c:	e1a01003 	mov	r1, r3
80024520:	ebffef28 	bl	800201c8 <memmove>
80024524:	e51b0010 	ldr	r0, [fp, #-16]
80024528:	ebfff18d 	bl	80020b64 <bwrite>
8002452c:	e51b000c 	ldr	r0, [fp, #-12]
80024530:	ebfff1a1 	bl	80020bbc <brelse>
80024534:	e51b0010 	ldr	r0, [fp, #-16]
80024538:	ebfff19f 	bl	80020bbc <brelse>
8002453c:	e51b3008 	ldr	r3, [fp, #-8]
80024540:	e2833001 	add	r3, r3, #1
80024544:	e50b3008 	str	r3, [fp, #-8]
80024548:	e59f301c 	ldr	r3, [pc, #28]	@ 8002456c <install_trans+0xd8>
8002454c:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
80024550:	e51b2008 	ldr	r2, [fp, #-8]
80024554:	e1520003 	cmp	r2, r3
80024558:	baffffd3 	blt	800244ac <install_trans+0x18>
8002455c:	e1a00000 	nop			@ (mov r0, r0)
80024560:	e1a00000 	nop			@ (mov r0, r0)
80024564:	e24bd004 	sub	sp, fp, #4
80024568:	e8bd8800 	pop	{fp, pc}
8002456c:	800d6b10 	.word	0x800d6b10

80024570 <read_head>:
80024570:	e92d4800 	push	{fp, lr}
80024574:	e28db004 	add	fp, sp, #4
80024578:	e24dd010 	sub	sp, sp, #16
8002457c:	e59f30a4 	ldr	r3, [pc, #164]	@ 80024628 <read_head+0xb8>
80024580:	e5933040 	ldr	r3, [r3, #64]	@ 0x40
80024584:	e1a02003 	mov	r2, r3
80024588:	e59f3098 	ldr	r3, [pc, #152]	@ 80024628 <read_head+0xb8>
8002458c:	e5933034 	ldr	r3, [r3, #52]	@ 0x34
80024590:	e1a01003 	mov	r1, r3
80024594:	e1a00002 	mov	r0, r2
80024598:	ebfff15d 	bl	80020b14 <bread>
8002459c:	e50b000c 	str	r0, [fp, #-12]
800245a0:	e51b300c 	ldr	r3, [fp, #-12]
800245a4:	e2833018 	add	r3, r3, #24
800245a8:	e50b3010 	str	r3, [fp, #-16]
800245ac:	e51b3010 	ldr	r3, [fp, #-16]
800245b0:	e5933000 	ldr	r3, [r3]
800245b4:	e59f206c 	ldr	r2, [pc, #108]	@ 80024628 <read_head+0xb8>
800245b8:	e5823044 	str	r3, [r2, #68]	@ 0x44
800245bc:	e3a03000 	mov	r3, #0
800245c0:	e50b3008 	str	r3, [fp, #-8]
800245c4:	ea00000d 	b	80024600 <read_head+0x90>
800245c8:	e51b2010 	ldr	r2, [fp, #-16]
800245cc:	e51b3008 	ldr	r3, [fp, #-8]
800245d0:	e1a03103 	lsl	r3, r3, #2
800245d4:	e0823003 	add	r3, r2, r3
800245d8:	e5932004 	ldr	r2, [r3, #4]
800245dc:	e59f1044 	ldr	r1, [pc, #68]	@ 80024628 <read_head+0xb8>
800245e0:	e51b3008 	ldr	r3, [fp, #-8]
800245e4:	e2833010 	add	r3, r3, #16
800245e8:	e1a03103 	lsl	r3, r3, #2
800245ec:	e0813003 	add	r3, r1, r3
800245f0:	e5832008 	str	r2, [r3, #8]
800245f4:	e51b3008 	ldr	r3, [fp, #-8]
800245f8:	e2833001 	add	r3, r3, #1
800245fc:	e50b3008 	str	r3, [fp, #-8]
80024600:	e59f3020 	ldr	r3, [pc, #32]	@ 80024628 <read_head+0xb8>
80024604:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
80024608:	e51b2008 	ldr	r2, [fp, #-8]
8002460c:	e1520003 	cmp	r2, r3
80024610:	baffffec 	blt	800245c8 <read_head+0x58>
80024614:	e51b000c 	ldr	r0, [fp, #-12]
80024618:	ebfff167 	bl	80020bbc <brelse>
8002461c:	e1a00000 	nop			@ (mov r0, r0)
80024620:	e24bd004 	sub	sp, fp, #4
80024624:	e8bd8800 	pop	{fp, pc}
80024628:	800d6b10 	.word	0x800d6b10

8002462c <write_head>:
8002462c:	e92d4800 	push	{fp, lr}
80024630:	e28db004 	add	fp, sp, #4
80024634:	e24dd010 	sub	sp, sp, #16
80024638:	e59f30ac 	ldr	r3, [pc, #172]	@ 800246ec <write_head+0xc0>
8002463c:	e5933040 	ldr	r3, [r3, #64]	@ 0x40
80024640:	e1a02003 	mov	r2, r3
80024644:	e59f30a0 	ldr	r3, [pc, #160]	@ 800246ec <write_head+0xc0>
80024648:	e5933034 	ldr	r3, [r3, #52]	@ 0x34
8002464c:	e1a01003 	mov	r1, r3
80024650:	e1a00002 	mov	r0, r2
80024654:	ebfff12e 	bl	80020b14 <bread>
80024658:	e50b000c 	str	r0, [fp, #-12]
8002465c:	e51b300c 	ldr	r3, [fp, #-12]
80024660:	e2833018 	add	r3, r3, #24
80024664:	e50b3010 	str	r3, [fp, #-16]
80024668:	e59f307c 	ldr	r3, [pc, #124]	@ 800246ec <write_head+0xc0>
8002466c:	e5932044 	ldr	r2, [r3, #68]	@ 0x44
80024670:	e51b3010 	ldr	r3, [fp, #-16]
80024674:	e5832000 	str	r2, [r3]
80024678:	e3a03000 	mov	r3, #0
8002467c:	e50b3008 	str	r3, [fp, #-8]
80024680:	ea00000d 	b	800246bc <write_head+0x90>
80024684:	e59f2060 	ldr	r2, [pc, #96]	@ 800246ec <write_head+0xc0>
80024688:	e51b3008 	ldr	r3, [fp, #-8]
8002468c:	e2833010 	add	r3, r3, #16
80024690:	e1a03103 	lsl	r3, r3, #2
80024694:	e0823003 	add	r3, r2, r3
80024698:	e5932008 	ldr	r2, [r3, #8]
8002469c:	e51b1010 	ldr	r1, [fp, #-16]
800246a0:	e51b3008 	ldr	r3, [fp, #-8]
800246a4:	e1a03103 	lsl	r3, r3, #2
800246a8:	e0813003 	add	r3, r1, r3
800246ac:	e5832004 	str	r2, [r3, #4]
800246b0:	e51b3008 	ldr	r3, [fp, #-8]
800246b4:	e2833001 	add	r3, r3, #1
800246b8:	e50b3008 	str	r3, [fp, #-8]
800246bc:	e59f3028 	ldr	r3, [pc, #40]	@ 800246ec <write_head+0xc0>
800246c0:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
800246c4:	e51b2008 	ldr	r2, [fp, #-8]
800246c8:	e1520003 	cmp	r2, r3
800246cc:	baffffec 	blt	80024684 <write_head+0x58>
800246d0:	e51b000c 	ldr	r0, [fp, #-12]
800246d4:	ebfff122 	bl	80020b64 <bwrite>
800246d8:	e51b000c 	ldr	r0, [fp, #-12]
800246dc:	ebfff136 	bl	80020bbc <brelse>
800246e0:	e1a00000 	nop			@ (mov r0, r0)
800246e4:	e24bd004 	sub	sp, fp, #4
800246e8:	e8bd8800 	pop	{fp, pc}
800246ec:	800d6b10 	.word	0x800d6b10

800246f0 <recover_from_log>:
800246f0:	e92d4800 	push	{fp, lr}
800246f4:	e28db004 	add	fp, sp, #4
800246f8:	ebffff9c 	bl	80024570 <read_head>
800246fc:	ebffff64 	bl	80024494 <install_trans>
80024700:	e59f3010 	ldr	r3, [pc, #16]	@ 80024718 <recover_from_log+0x28>
80024704:	e3a02000 	mov	r2, #0
80024708:	e5832044 	str	r2, [r3, #68]	@ 0x44
8002470c:	ebffffc6 	bl	8002462c <write_head>
80024710:	e1a00000 	nop			@ (mov r0, r0)
80024714:	e8bd8800 	pop	{fp, pc}
80024718:	800d6b10 	.word	0x800d6b10

8002471c <begin_trans>:
8002471c:	e92d4800 	push	{fp, lr}
80024720:	e28db004 	add	fp, sp, #4
80024724:	e59f003c 	ldr	r0, [pc, #60]	@ 80024768 <begin_trans+0x4c>
80024728:	eb0008b9 	bl	80026a14 <acquire>
8002472c:	ea000002 	b	8002473c <begin_trans+0x20>
80024730:	e59f1030 	ldr	r1, [pc, #48]	@ 80024768 <begin_trans+0x4c>
80024734:	e59f002c 	ldr	r0, [pc, #44]	@ 80024768 <begin_trans+0x4c>
80024738:	eb0005a2 	bl	80025dc8 <sleep>
8002473c:	e59f3024 	ldr	r3, [pc, #36]	@ 80024768 <begin_trans+0x4c>
80024740:	e593303c 	ldr	r3, [r3, #60]	@ 0x3c
80024744:	e3530000 	cmp	r3, #0
80024748:	1afffff8 	bne	80024730 <begin_trans+0x14>
8002474c:	e59f3014 	ldr	r3, [pc, #20]	@ 80024768 <begin_trans+0x4c>
80024750:	e3a02001 	mov	r2, #1
80024754:	e583203c 	str	r2, [r3, #60]	@ 0x3c
80024758:	e59f0008 	ldr	r0, [pc, #8]	@ 80024768 <begin_trans+0x4c>
8002475c:	eb0008b7 	bl	80026a40 <release>
80024760:	e1a00000 	nop			@ (mov r0, r0)
80024764:	e8bd8800 	pop	{fp, pc}
80024768:	800d6b10 	.word	0x800d6b10

8002476c <commit_trans>:
8002476c:	e92d4800 	push	{fp, lr}
80024770:	e28db004 	add	fp, sp, #4
80024774:	e59f304c 	ldr	r3, [pc, #76]	@ 800247c8 <commit_trans+0x5c>
80024778:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
8002477c:	e3530000 	cmp	r3, #0
80024780:	da000005 	ble	8002479c <commit_trans+0x30>
80024784:	ebffffa8 	bl	8002462c <write_head>
80024788:	ebffff41 	bl	80024494 <install_trans>
8002478c:	e59f3034 	ldr	r3, [pc, #52]	@ 800247c8 <commit_trans+0x5c>
80024790:	e3a02000 	mov	r2, #0
80024794:	e5832044 	str	r2, [r3, #68]	@ 0x44
80024798:	ebffffa3 	bl	8002462c <write_head>
8002479c:	e59f0024 	ldr	r0, [pc, #36]	@ 800247c8 <commit_trans+0x5c>
800247a0:	eb00089b 	bl	80026a14 <acquire>
800247a4:	e59f301c 	ldr	r3, [pc, #28]	@ 800247c8 <commit_trans+0x5c>
800247a8:	e3a02000 	mov	r2, #0
800247ac:	e583203c 	str	r2, [r3, #60]	@ 0x3c
800247b0:	e59f0010 	ldr	r0, [pc, #16]	@ 800247c8 <commit_trans+0x5c>
800247b4:	eb0005f7 	bl	80025f98 <wakeup>
800247b8:	e59f0008 	ldr	r0, [pc, #8]	@ 800247c8 <commit_trans+0x5c>
800247bc:	eb00089f 	bl	80026a40 <release>
800247c0:	e1a00000 	nop			@ (mov r0, r0)
800247c4:	e8bd8800 	pop	{fp, pc}
800247c8:	800d6b10 	.word	0x800d6b10

800247cc <log_write>:
800247cc:	e92d4800 	push	{fp, lr}
800247d0:	e28db004 	add	fp, sp, #4
800247d4:	e24dd010 	sub	sp, sp, #16
800247d8:	e50b0010 	str	r0, [fp, #-16]
800247dc:	e59f3164 	ldr	r3, [pc, #356]	@ 80024948 <log_write+0x17c>
800247e0:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
800247e4:	e3530009 	cmp	r3, #9
800247e8:	ca000006 	bgt	80024808 <log_write+0x3c>
800247ec:	e59f3154 	ldr	r3, [pc, #340]	@ 80024948 <log_write+0x17c>
800247f0:	e5932044 	ldr	r2, [r3, #68]	@ 0x44
800247f4:	e59f314c 	ldr	r3, [pc, #332]	@ 80024948 <log_write+0x17c>
800247f8:	e5933038 	ldr	r3, [r3, #56]	@ 0x38
800247fc:	e2433001 	sub	r3, r3, #1
80024800:	e1520003 	cmp	r2, r3
80024804:	ba000001 	blt	80024810 <log_write+0x44>
80024808:	e59f013c 	ldr	r0, [pc, #316]	@ 8002494c <log_write+0x180>
8002480c:	ebfff4b8 	bl	80021af4 <panic>
80024810:	e59f3130 	ldr	r3, [pc, #304]	@ 80024948 <log_write+0x17c>
80024814:	e593303c 	ldr	r3, [r3, #60]	@ 0x3c
80024818:	e3530000 	cmp	r3, #0
8002481c:	1a000001 	bne	80024828 <log_write+0x5c>
80024820:	e59f0128 	ldr	r0, [pc, #296]	@ 80024950 <log_write+0x184>
80024824:	ebfff4b2 	bl	80021af4 <panic>
80024828:	e3a03000 	mov	r3, #0
8002482c:	e50b3008 	str	r3, [fp, #-8]
80024830:	ea00000d 	b	8002486c <log_write+0xa0>
80024834:	e59f210c 	ldr	r2, [pc, #268]	@ 80024948 <log_write+0x17c>
80024838:	e51b3008 	ldr	r3, [fp, #-8]
8002483c:	e2833010 	add	r3, r3, #16
80024840:	e1a03103 	lsl	r3, r3, #2
80024844:	e0823003 	add	r3, r2, r3
80024848:	e5933008 	ldr	r3, [r3, #8]
8002484c:	e1a02003 	mov	r2, r3
80024850:	e51b3010 	ldr	r3, [fp, #-16]
80024854:	e5933008 	ldr	r3, [r3, #8]
80024858:	e1520003 	cmp	r2, r3
8002485c:	0a000008 	beq	80024884 <log_write+0xb8>
80024860:	e51b3008 	ldr	r3, [fp, #-8]
80024864:	e2833001 	add	r3, r3, #1
80024868:	e50b3008 	str	r3, [fp, #-8]
8002486c:	e59f30d4 	ldr	r3, [pc, #212]	@ 80024948 <log_write+0x17c>
80024870:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
80024874:	e51b2008 	ldr	r2, [fp, #-8]
80024878:	e1520003 	cmp	r2, r3
8002487c:	baffffec 	blt	80024834 <log_write+0x68>
80024880:	ea000000 	b	80024888 <log_write+0xbc>
80024884:	e1a00000 	nop			@ (mov r0, r0)
80024888:	e51b3010 	ldr	r3, [fp, #-16]
8002488c:	e5933008 	ldr	r3, [r3, #8]
80024890:	e1a01003 	mov	r1, r3
80024894:	e59f20ac 	ldr	r2, [pc, #172]	@ 80024948 <log_write+0x17c>
80024898:	e51b3008 	ldr	r3, [fp, #-8]
8002489c:	e2833010 	add	r3, r3, #16
800248a0:	e1a03103 	lsl	r3, r3, #2
800248a4:	e0823003 	add	r3, r2, r3
800248a8:	e5831008 	str	r1, [r3, #8]
800248ac:	e51b3010 	ldr	r3, [fp, #-16]
800248b0:	e5930004 	ldr	r0, [r3, #4]
800248b4:	e59f308c 	ldr	r3, [pc, #140]	@ 80024948 <log_write+0x17c>
800248b8:	e5932034 	ldr	r2, [r3, #52]	@ 0x34
800248bc:	e51b3008 	ldr	r3, [fp, #-8]
800248c0:	e0823003 	add	r3, r2, r3
800248c4:	e2833001 	add	r3, r3, #1
800248c8:	e1a01003 	mov	r1, r3
800248cc:	ebfff090 	bl	80020b14 <bread>
800248d0:	e50b000c 	str	r0, [fp, #-12]
800248d4:	e51b300c 	ldr	r3, [fp, #-12]
800248d8:	e2830018 	add	r0, r3, #24
800248dc:	e51b3010 	ldr	r3, [fp, #-16]
800248e0:	e2833018 	add	r3, r3, #24
800248e4:	e3a02c02 	mov	r2, #512	@ 0x200
800248e8:	e1a01003 	mov	r1, r3
800248ec:	ebffee35 	bl	800201c8 <memmove>
800248f0:	e51b000c 	ldr	r0, [fp, #-12]
800248f4:	ebfff09a 	bl	80020b64 <bwrite>
800248f8:	e51b000c 	ldr	r0, [fp, #-12]
800248fc:	ebfff0ae 	bl	80020bbc <brelse>
80024900:	e59f3040 	ldr	r3, [pc, #64]	@ 80024948 <log_write+0x17c>
80024904:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
80024908:	e51b2008 	ldr	r2, [fp, #-8]
8002490c:	e1520003 	cmp	r2, r3
80024910:	1a000004 	bne	80024928 <log_write+0x15c>
80024914:	e59f302c 	ldr	r3, [pc, #44]	@ 80024948 <log_write+0x17c>
80024918:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
8002491c:	e2833001 	add	r3, r3, #1
80024920:	e59f2020 	ldr	r2, [pc, #32]	@ 80024948 <log_write+0x17c>
80024924:	e5823044 	str	r3, [r2, #68]	@ 0x44
80024928:	e51b3010 	ldr	r3, [fp, #-16]
8002492c:	e5933000 	ldr	r3, [r3]
80024930:	e3832004 	orr	r2, r3, #4
80024934:	e51b3010 	ldr	r3, [fp, #-16]
80024938:	e5832000 	str	r2, [r3]
8002493c:	e1a00000 	nop			@ (mov r0, r0)
80024940:	e24bd004 	sub	sp, fp, #4
80024944:	e8bd8800 	pop	{fp, pc}
80024948:	800d6b10 	.word	0x800d6b10
8002494c:	8002ad58 	.word	0x8002ad58
80024950:	8002ad70 	.word	0x8002ad70

80024954 <kmain>:
80024954:	e92d4800 	push	{fp, lr}
80024958:	e28db004 	add	fp, sp, #4
8002495c:	e24dd008 	sub	sp, sp, #8
80024960:	e59f30a4 	ldr	r3, [pc, #164]	@ 80024a0c <kmain+0xb8>
80024964:	e59f20a4 	ldr	r2, [pc, #164]	@ 80024a10 <kmain+0xbc>
80024968:	e5832000 	str	r2, [r3]
8002496c:	e59f00a0 	ldr	r0, [pc, #160]	@ 80024a14 <kmain+0xc0>
80024970:	eb001744 	bl	8002a688 <uart_init>
80024974:	e59f309c 	ldr	r3, [pc, #156]	@ 80024a18 <kmain+0xc4>
80024978:	e50b3008 	str	r3, [fp, #-8]
8002497c:	eb001238 	bl	80029264 <init_vmm>
80024980:	e59f3094 	ldr	r3, [pc, #148]	@ 80024a1c <kmain+0xc8>
80024984:	e2833fff 	add	r3, r3, #1020	@ 0x3fc
80024988:	e2833003 	add	r3, r3, #3
8002498c:	e3c33fff 	bic	r3, r3, #1020	@ 0x3fc
80024990:	e3c33003 	bic	r3, r3, #3
80024994:	e51b1008 	ldr	r1, [fp, #-8]
80024998:	e1a00003 	mov	r0, r3
8002499c:	eb001264 	bl	80029334 <kpt_freerange>
800249a0:	e51b3008 	ldr	r3, [fp, #-8]
800249a4:	e2833b01 	add	r3, r3, #1024	@ 0x400
800249a8:	e59f1070 	ldr	r1, [pc, #112]	@ 80024a20 <kmain+0xcc>
800249ac:	e1a00003 	mov	r0, r3
800249b0:	eb00125f 	bl	80029334 <kpt_freerange>
800249b4:	e3a01302 	mov	r1, #134217728	@ 0x8000000
800249b8:	e3a00601 	mov	r0, #1048576	@ 0x100000
800249bc:	eb001524 	bl	80029e54 <paging_init>
800249c0:	ebfff0fc 	bl	80020db8 <kmem_init>
800249c4:	e3a01322 	mov	r1, #-2013265920	@ 0x88000000
800249c8:	e59f0050 	ldr	r0, [pc, #80]	@ 80024a20 <kmain+0xcc>
800249cc:	ebfff102 	bl	80020ddc <kmem_init2>
800249d0:	eb0010c4 	bl	80028ce8 <trap_init>
800249d4:	e59f0048 	ldr	r0, [pc, #72]	@ 80024a24 <kmain+0xd0>
800249d8:	eb001646 	bl	8002a2f8 <pic_init>
800249dc:	eb00175a 	bl	8002a74c <uart_enable_rx>
800249e0:	ebfff5c6 	bl	80022100 <consoleinit>
800249e4:	eb0001ca 	bl	80025114 <pinit>
800249e8:	ebffefb8 	bl	800208d0 <binit>
800249ec:	ebfff710 	bl	80022634 <fileinit>
800249f0:	ebfff93c 	bl	80022ee8 <iinit>
800249f4:	eb00000b 	bl	80024a28 <ideinit>
800249f8:	e3a0000a 	mov	r0, #10
800249fc:	eb0016d0 	bl	8002a544 <timer_init>
80024a00:	ebffeedc 	bl	80020578 <sti>
80024a04:	eb000247 	bl	80025328 <userinit>
80024a08:	eb00043d 	bl	80025b04 <scheduler>
80024a0c:	800d6c60 	.word	0x800d6c60
80024a10:	800d6b80 	.word	0x800d6b80
80024a14:	901f1000 	.word	0x901f1000
80024a18:	800f0000 	.word	0x800f0000
80024a1c:	800da000 	.word	0x800da000
80024a20:	80100000 	.word	0x80100000
80024a24:	90140000 	.word	0x90140000

80024a28 <ideinit>:
80024a28:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80024a2c:	e28db000 	add	fp, sp, #0
80024a30:	e59f3028 	ldr	r3, [pc, #40]	@ 80024a60 <ideinit+0x38>
80024a34:	e59f2028 	ldr	r2, [pc, #40]	@ 80024a64 <ideinit+0x3c>
80024a38:	e5832000 	str	r2, [r3]
80024a3c:	e59f3024 	ldr	r3, [pc, #36]	@ 80024a68 <ideinit+0x40>
80024a40:	e1a034a3 	lsr	r3, r3, #9
80024a44:	e1a02003 	mov	r2, r3
80024a48:	e59f301c 	ldr	r3, [pc, #28]	@ 80024a6c <ideinit+0x44>
80024a4c:	e5832000 	str	r2, [r3]
80024a50:	e1a00000 	nop			@ (mov r0, r0)
80024a54:	e28bd000 	add	sp, fp, #0
80024a58:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80024a5c:	e12fff1e 	bx	lr
80024a60:	800d6c68 	.word	0x800d6c68
80024a64:	8002c124 	.word	0x8002c124
80024a68:	000a7600 	.word	0x000a7600
80024a6c:	800d6c64 	.word	0x800d6c64

80024a70 <ideintr>:
80024a70:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80024a74:	e28db000 	add	fp, sp, #0
80024a78:	e1a00000 	nop			@ (mov r0, r0)
80024a7c:	e28bd000 	add	sp, fp, #0
80024a80:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80024a84:	e12fff1e 	bx	lr

80024a88 <iderw>:
80024a88:	e92d4800 	push	{fp, lr}
80024a8c:	e28db004 	add	fp, sp, #4
80024a90:	e24dd010 	sub	sp, sp, #16
80024a94:	e50b0010 	str	r0, [fp, #-16]
80024a98:	e51b3010 	ldr	r3, [fp, #-16]
80024a9c:	e5933000 	ldr	r3, [r3]
80024aa0:	e2033001 	and	r3, r3, #1
80024aa4:	e3530000 	cmp	r3, #0
80024aa8:	1a000001 	bne	80024ab4 <iderw+0x2c>
80024aac:	e59f00ec 	ldr	r0, [pc, #236]	@ 80024ba0 <iderw+0x118>
80024ab0:	ebfff40f 	bl	80021af4 <panic>
80024ab4:	e51b3010 	ldr	r3, [fp, #-16]
80024ab8:	e5933000 	ldr	r3, [r3]
80024abc:	e2033006 	and	r3, r3, #6
80024ac0:	e3530002 	cmp	r3, #2
80024ac4:	1a000001 	bne	80024ad0 <iderw+0x48>
80024ac8:	e59f00d4 	ldr	r0, [pc, #212]	@ 80024ba4 <iderw+0x11c>
80024acc:	ebfff408 	bl	80021af4 <panic>
80024ad0:	e51b3010 	ldr	r3, [fp, #-16]
80024ad4:	e5933004 	ldr	r3, [r3, #4]
80024ad8:	e3530001 	cmp	r3, #1
80024adc:	0a000001 	beq	80024ae8 <iderw+0x60>
80024ae0:	e59f00c0 	ldr	r0, [pc, #192]	@ 80024ba8 <iderw+0x120>
80024ae4:	ebfff402 	bl	80021af4 <panic>
80024ae8:	e51b3010 	ldr	r3, [fp, #-16]
80024aec:	e5933008 	ldr	r3, [r3, #8]
80024af0:	e59f20b4 	ldr	r2, [pc, #180]	@ 80024bac <iderw+0x124>
80024af4:	e5922000 	ldr	r2, [r2]
80024af8:	e1530002 	cmp	r3, r2
80024afc:	3a000001 	bcc	80024b08 <iderw+0x80>
80024b00:	e59f00a8 	ldr	r0, [pc, #168]	@ 80024bb0 <iderw+0x128>
80024b04:	ebfff3fa 	bl	80021af4 <panic>
80024b08:	e59f30a4 	ldr	r3, [pc, #164]	@ 80024bb4 <iderw+0x12c>
80024b0c:	e5932000 	ldr	r2, [r3]
80024b10:	e51b3010 	ldr	r3, [fp, #-16]
80024b14:	e5933008 	ldr	r3, [r3, #8]
80024b18:	e1a03483 	lsl	r3, r3, #9
80024b1c:	e0823003 	add	r3, r2, r3
80024b20:	e50b3008 	str	r3, [fp, #-8]
80024b24:	e51b3010 	ldr	r3, [fp, #-16]
80024b28:	e5933000 	ldr	r3, [r3]
80024b2c:	e2033004 	and	r3, r3, #4
80024b30:	e3530000 	cmp	r3, #0
80024b34:	0a00000b 	beq	80024b68 <iderw+0xe0>
80024b38:	e51b3010 	ldr	r3, [fp, #-16]
80024b3c:	e5933000 	ldr	r3, [r3]
80024b40:	e3c32004 	bic	r2, r3, #4
80024b44:	e51b3010 	ldr	r3, [fp, #-16]
80024b48:	e5832000 	str	r2, [r3]
80024b4c:	e51b3010 	ldr	r3, [fp, #-16]
80024b50:	e2833018 	add	r3, r3, #24
80024b54:	e3a02c02 	mov	r2, #512	@ 0x200
80024b58:	e1a01003 	mov	r1, r3
80024b5c:	e51b0008 	ldr	r0, [fp, #-8]
80024b60:	ebffed98 	bl	800201c8 <memmove>
80024b64:	ea000005 	b	80024b80 <iderw+0xf8>
80024b68:	e51b3010 	ldr	r3, [fp, #-16]
80024b6c:	e2833018 	add	r3, r3, #24
80024b70:	e3a02c02 	mov	r2, #512	@ 0x200
80024b74:	e51b1008 	ldr	r1, [fp, #-8]
80024b78:	e1a00003 	mov	r0, r3
80024b7c:	ebffed91 	bl	800201c8 <memmove>
80024b80:	e51b3010 	ldr	r3, [fp, #-16]
80024b84:	e5933000 	ldr	r3, [r3]
80024b88:	e3832002 	orr	r2, r3, #2
80024b8c:	e51b3010 	ldr	r3, [fp, #-16]
80024b90:	e5832000 	str	r2, [r3]
80024b94:	e1a00000 	nop			@ (mov r0, r0)
80024b98:	e24bd004 	sub	sp, fp, #4
80024b9c:	e8bd8800 	pop	{fp, pc}
80024ba0:	8002ad88 	.word	0x8002ad88
80024ba4:	8002ad9c 	.word	0x8002ad9c
80024ba8:	8002adb4 	.word	0x8002adb4
80024bac:	800d6c64 	.word	0x800d6c64
80024bb0:	8002add4 	.word	0x8002add4
80024bb4:	800d6c68 	.word	0x800d6c68

80024bb8 <pipealloc>:
80024bb8:	e92d4800 	push	{fp, lr}
80024bbc:	e28db004 	add	fp, sp, #4
80024bc0:	e24dd010 	sub	sp, sp, #16
80024bc4:	e50b0010 	str	r0, [fp, #-16]
80024bc8:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80024bcc:	e3a03000 	mov	r3, #0
80024bd0:	e50b3008 	str	r3, [fp, #-8]
80024bd4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024bd8:	e3a02000 	mov	r2, #0
80024bdc:	e5832000 	str	r2, [r3]
80024be0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024be4:	e5932000 	ldr	r2, [r3]
80024be8:	e51b3010 	ldr	r3, [fp, #-16]
80024bec:	e5832000 	str	r2, [r3]
80024bf0:	ebfff698 	bl	80022658 <filealloc>
80024bf4:	e1a02000 	mov	r2, r0
80024bf8:	e51b3010 	ldr	r3, [fp, #-16]
80024bfc:	e5832000 	str	r2, [r3]
80024c00:	e51b3010 	ldr	r3, [fp, #-16]
80024c04:	e5933000 	ldr	r3, [r3]
80024c08:	e3530000 	cmp	r3, #0
80024c0c:	0a000042 	beq	80024d1c <pipealloc+0x164>
80024c10:	ebfff690 	bl	80022658 <filealloc>
80024c14:	e1a02000 	mov	r2, r0
80024c18:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024c1c:	e5832000 	str	r2, [r3]
80024c20:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024c24:	e5933000 	ldr	r3, [r3]
80024c28:	e3530000 	cmp	r3, #0
80024c2c:	0a00003a 	beq	80024d1c <pipealloc+0x164>
80024c30:	e3a00f91 	mov	r0, #580	@ 0x244
80024c34:	ebfff284 	bl	8002164c <get_order>
80024c38:	e1a03000 	mov	r3, r0
80024c3c:	e1a00003 	mov	r0, r3
80024c40:	ebfff1f7 	bl	80021424 <kmalloc>
80024c44:	e50b0008 	str	r0, [fp, #-8]
80024c48:	e51b3008 	ldr	r3, [fp, #-8]
80024c4c:	e3530000 	cmp	r3, #0
80024c50:	0a000033 	beq	80024d24 <pipealloc+0x16c>
80024c54:	e51b3008 	ldr	r3, [fp, #-8]
80024c58:	e3a02001 	mov	r2, #1
80024c5c:	e583223c 	str	r2, [r3, #572]	@ 0x23c
80024c60:	e51b3008 	ldr	r3, [fp, #-8]
80024c64:	e3a02001 	mov	r2, #1
80024c68:	e5832240 	str	r2, [r3, #576]	@ 0x240
80024c6c:	e51b3008 	ldr	r3, [fp, #-8]
80024c70:	e3a02000 	mov	r2, #0
80024c74:	e5832238 	str	r2, [r3, #568]	@ 0x238
80024c78:	e51b3008 	ldr	r3, [fp, #-8]
80024c7c:	e3a02000 	mov	r2, #0
80024c80:	e5832234 	str	r2, [r3, #564]	@ 0x234
80024c84:	e51b3008 	ldr	r3, [fp, #-8]
80024c88:	e59f110c 	ldr	r1, [pc, #268]	@ 80024d9c <pipealloc+0x1e4>
80024c8c:	e1a00003 	mov	r0, r3
80024c90:	eb00074d 	bl	800269cc <initlock>
80024c94:	e51b3010 	ldr	r3, [fp, #-16]
80024c98:	e5933000 	ldr	r3, [r3]
80024c9c:	e3a02001 	mov	r2, #1
80024ca0:	e5c32000 	strb	r2, [r3]
80024ca4:	e51b3010 	ldr	r3, [fp, #-16]
80024ca8:	e5933000 	ldr	r3, [r3]
80024cac:	e3a02001 	mov	r2, #1
80024cb0:	e5c32008 	strb	r2, [r3, #8]
80024cb4:	e51b3010 	ldr	r3, [fp, #-16]
80024cb8:	e5933000 	ldr	r3, [r3]
80024cbc:	e3a02000 	mov	r2, #0
80024cc0:	e5c32009 	strb	r2, [r3, #9]
80024cc4:	e51b3010 	ldr	r3, [fp, #-16]
80024cc8:	e5933000 	ldr	r3, [r3]
80024ccc:	e51b2008 	ldr	r2, [fp, #-8]
80024cd0:	e583200c 	str	r2, [r3, #12]
80024cd4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024cd8:	e5933000 	ldr	r3, [r3]
80024cdc:	e3a02001 	mov	r2, #1
80024ce0:	e5c32000 	strb	r2, [r3]
80024ce4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024ce8:	e5933000 	ldr	r3, [r3]
80024cec:	e3a02000 	mov	r2, #0
80024cf0:	e5c32008 	strb	r2, [r3, #8]
80024cf4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024cf8:	e5933000 	ldr	r3, [r3]
80024cfc:	e3a02001 	mov	r2, #1
80024d00:	e5c32009 	strb	r2, [r3, #9]
80024d04:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024d08:	e5933000 	ldr	r3, [r3]
80024d0c:	e51b2008 	ldr	r2, [fp, #-8]
80024d10:	e583200c 	str	r2, [r3, #12]
80024d14:	e3a03000 	mov	r3, #0
80024d18:	ea00001c 	b	80024d90 <pipealloc+0x1d8>
80024d1c:	e1a00000 	nop			@ (mov r0, r0)
80024d20:	ea000000 	b	80024d28 <pipealloc+0x170>
80024d24:	e1a00000 	nop			@ (mov r0, r0)
80024d28:	e51b3008 	ldr	r3, [fp, #-8]
80024d2c:	e3530000 	cmp	r3, #0
80024d30:	0a000005 	beq	80024d4c <pipealloc+0x194>
80024d34:	e3a00f91 	mov	r0, #580	@ 0x244
80024d38:	ebfff243 	bl	8002164c <get_order>
80024d3c:	e1a03000 	mov	r3, r0
80024d40:	e1a01003 	mov	r1, r3
80024d44:	e51b0008 	ldr	r0, [fp, #-8]
80024d48:	ebfff20c 	bl	80021580 <kfree>
80024d4c:	e51b3010 	ldr	r3, [fp, #-16]
80024d50:	e5933000 	ldr	r3, [r3]
80024d54:	e3530000 	cmp	r3, #0
80024d58:	0a000003 	beq	80024d6c <pipealloc+0x1b4>
80024d5c:	e51b3010 	ldr	r3, [fp, #-16]
80024d60:	e5933000 	ldr	r3, [r3]
80024d64:	e1a00003 	mov	r0, r3
80024d68:	ebfff676 	bl	80022748 <fileclose>
80024d6c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024d70:	e5933000 	ldr	r3, [r3]
80024d74:	e3530000 	cmp	r3, #0
80024d78:	0a000003 	beq	80024d8c <pipealloc+0x1d4>
80024d7c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80024d80:	e5933000 	ldr	r3, [r3]
80024d84:	e1a00003 	mov	r0, r3
80024d88:	ebfff66e 	bl	80022748 <fileclose>
80024d8c:	e3e03000 	mvn	r3, #0
80024d90:	e1a00003 	mov	r0, r3
80024d94:	e24bd004 	sub	sp, fp, #4
80024d98:	e8bd8800 	pop	{fp, pc}
80024d9c:	8002adf0 	.word	0x8002adf0

80024da0 <pipeclose>:
80024da0:	e92d4800 	push	{fp, lr}
80024da4:	e28db004 	add	fp, sp, #4
80024da8:	e24dd008 	sub	sp, sp, #8
80024dac:	e50b0008 	str	r0, [fp, #-8]
80024db0:	e50b100c 	str	r1, [fp, #-12]
80024db4:	e51b3008 	ldr	r3, [fp, #-8]
80024db8:	e1a00003 	mov	r0, r3
80024dbc:	eb000714 	bl	80026a14 <acquire>
80024dc0:	e51b300c 	ldr	r3, [fp, #-12]
80024dc4:	e3530000 	cmp	r3, #0
80024dc8:	0a000007 	beq	80024dec <pipeclose+0x4c>
80024dcc:	e51b3008 	ldr	r3, [fp, #-8]
80024dd0:	e3a02000 	mov	r2, #0
80024dd4:	e5832240 	str	r2, [r3, #576]	@ 0x240
80024dd8:	e51b3008 	ldr	r3, [fp, #-8]
80024ddc:	e2833f8d 	add	r3, r3, #564	@ 0x234
80024de0:	e1a00003 	mov	r0, r3
80024de4:	eb00046b 	bl	80025f98 <wakeup>
80024de8:	ea000006 	b	80024e08 <pipeclose+0x68>
80024dec:	e51b3008 	ldr	r3, [fp, #-8]
80024df0:	e3a02000 	mov	r2, #0
80024df4:	e583223c 	str	r2, [r3, #572]	@ 0x23c
80024df8:	e51b3008 	ldr	r3, [fp, #-8]
80024dfc:	e2833f8e 	add	r3, r3, #568	@ 0x238
80024e00:	e1a00003 	mov	r0, r3
80024e04:	eb000463 	bl	80025f98 <wakeup>
80024e08:	e51b3008 	ldr	r3, [fp, #-8]
80024e0c:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80024e10:	e3530000 	cmp	r3, #0
80024e14:	1a00000d 	bne	80024e50 <pipeclose+0xb0>
80024e18:	e51b3008 	ldr	r3, [fp, #-8]
80024e1c:	e5933240 	ldr	r3, [r3, #576]	@ 0x240
80024e20:	e3530000 	cmp	r3, #0
80024e24:	1a000009 	bne	80024e50 <pipeclose+0xb0>
80024e28:	e51b3008 	ldr	r3, [fp, #-8]
80024e2c:	e1a00003 	mov	r0, r3
80024e30:	eb000702 	bl	80026a40 <release>
80024e34:	e3a00f91 	mov	r0, #580	@ 0x244
80024e38:	ebfff203 	bl	8002164c <get_order>
80024e3c:	e1a03000 	mov	r3, r0
80024e40:	e1a01003 	mov	r1, r3
80024e44:	e51b0008 	ldr	r0, [fp, #-8]
80024e48:	ebfff1cc 	bl	80021580 <kfree>
80024e4c:	ea000003 	b	80024e60 <pipeclose+0xc0>
80024e50:	e51b3008 	ldr	r3, [fp, #-8]
80024e54:	e1a00003 	mov	r0, r3
80024e58:	eb0006f8 	bl	80026a40 <release>
80024e5c:	e1a00000 	nop			@ (mov r0, r0)
80024e60:	e1a00000 	nop			@ (mov r0, r0)
80024e64:	e24bd004 	sub	sp, fp, #4
80024e68:	e8bd8800 	pop	{fp, pc}

80024e6c <pipewrite>:
80024e6c:	e92d4800 	push	{fp, lr}
80024e70:	e28db004 	add	fp, sp, #4
80024e74:	e24dd018 	sub	sp, sp, #24
80024e78:	e50b0010 	str	r0, [fp, #-16]
80024e7c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80024e80:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80024e84:	e51b3010 	ldr	r3, [fp, #-16]
80024e88:	e1a00003 	mov	r0, r3
80024e8c:	eb0006e0 	bl	80026a14 <acquire>
80024e90:	e3a03000 	mov	r3, #0
80024e94:	e50b3008 	str	r3, [fp, #-8]
80024e98:	ea00002b 	b	80024f4c <pipewrite+0xe0>
80024e9c:	e51b3010 	ldr	r3, [fp, #-16]
80024ea0:	e593323c 	ldr	r3, [r3, #572]	@ 0x23c
80024ea4:	e3530000 	cmp	r3, #0
80024ea8:	1a000004 	bne	80024ec0 <pipewrite+0x54>
80024eac:	e51b3010 	ldr	r3, [fp, #-16]
80024eb0:	e1a00003 	mov	r0, r3
80024eb4:	eb0006e1 	bl	80026a40 <release>
80024eb8:	e3e03000 	mvn	r3, #0
80024ebc:	ea00002e 	b	80024f7c <pipewrite+0x110>
80024ec0:	e51b3010 	ldr	r3, [fp, #-16]
80024ec4:	e2833f8d 	add	r3, r3, #564	@ 0x234
80024ec8:	e1a00003 	mov	r0, r3
80024ecc:	eb000431 	bl	80025f98 <wakeup>
80024ed0:	e51b3010 	ldr	r3, [fp, #-16]
80024ed4:	e2833f8e 	add	r3, r3, #568	@ 0x238
80024ed8:	e51b2010 	ldr	r2, [fp, #-16]
80024edc:	e1a01002 	mov	r1, r2
80024ee0:	e1a00003 	mov	r0, r3
80024ee4:	eb0003b7 	bl	80025dc8 <sleep>
80024ee8:	e51b3010 	ldr	r3, [fp, #-16]
80024eec:	e5932238 	ldr	r2, [r3, #568]	@ 0x238
80024ef0:	e51b3010 	ldr	r3, [fp, #-16]
80024ef4:	e5933234 	ldr	r3, [r3, #564]	@ 0x234
80024ef8:	e2833c02 	add	r3, r3, #512	@ 0x200
80024efc:	e1520003 	cmp	r2, r3
80024f00:	0affffe5 	beq	80024e9c <pipewrite+0x30>
80024f04:	e51b3008 	ldr	r3, [fp, #-8]
80024f08:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
80024f0c:	e0822003 	add	r2, r2, r3
80024f10:	e51b3010 	ldr	r3, [fp, #-16]
80024f14:	e5933238 	ldr	r3, [r3, #568]	@ 0x238
80024f18:	e2830001 	add	r0, r3, #1
80024f1c:	e51b1010 	ldr	r1, [fp, #-16]
80024f20:	e5810238 	str	r0, [r1, #568]	@ 0x238
80024f24:	e1a03b83 	lsl	r3, r3, #23
80024f28:	e1a03ba3 	lsr	r3, r3, #23
80024f2c:	e5d21000 	ldrb	r1, [r2]
80024f30:	e51b2010 	ldr	r2, [fp, #-16]
80024f34:	e0823003 	add	r3, r2, r3
80024f38:	e1a02001 	mov	r2, r1
80024f3c:	e5c32034 	strb	r2, [r3, #52]	@ 0x34
80024f40:	e51b3008 	ldr	r3, [fp, #-8]
80024f44:	e2833001 	add	r3, r3, #1
80024f48:	e50b3008 	str	r3, [fp, #-8]
80024f4c:	e51b2008 	ldr	r2, [fp, #-8]
80024f50:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80024f54:	e1520003 	cmp	r2, r3
80024f58:	baffffe2 	blt	80024ee8 <pipewrite+0x7c>
80024f5c:	e51b3010 	ldr	r3, [fp, #-16]
80024f60:	e2833f8d 	add	r3, r3, #564	@ 0x234
80024f64:	e1a00003 	mov	r0, r3
80024f68:	eb00040a 	bl	80025f98 <wakeup>
80024f6c:	e51b3010 	ldr	r3, [fp, #-16]
80024f70:	e1a00003 	mov	r0, r3
80024f74:	eb0006b1 	bl	80026a40 <release>
80024f78:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80024f7c:	e1a00003 	mov	r0, r3
80024f80:	e24bd004 	sub	sp, fp, #4
80024f84:	e8bd8800 	pop	{fp, pc}

80024f88 <piperead>:
80024f88:	e92d4800 	push	{fp, lr}
80024f8c:	e28db004 	add	fp, sp, #4
80024f90:	e24dd018 	sub	sp, sp, #24
80024f94:	e50b0010 	str	r0, [fp, #-16]
80024f98:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80024f9c:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80024fa0:	e51b3010 	ldr	r3, [fp, #-16]
80024fa4:	e1a00003 	mov	r0, r3
80024fa8:	eb000699 	bl	80026a14 <acquire>
80024fac:	ea00000f 	b	80024ff0 <piperead+0x68>
80024fb0:	e59f310c 	ldr	r3, [pc, #268]	@ 800250c4 <piperead+0x13c>
80024fb4:	e5933000 	ldr	r3, [r3]
80024fb8:	e5933024 	ldr	r3, [r3, #36]	@ 0x24
80024fbc:	e3530000 	cmp	r3, #0
80024fc0:	0a000004 	beq	80024fd8 <piperead+0x50>
80024fc4:	e51b3010 	ldr	r3, [fp, #-16]
80024fc8:	e1a00003 	mov	r0, r3
80024fcc:	eb00069b 	bl	80026a40 <release>
80024fd0:	e3e03000 	mvn	r3, #0
80024fd4:	ea000037 	b	800250b8 <piperead+0x130>
80024fd8:	e51b3010 	ldr	r3, [fp, #-16]
80024fdc:	e2833f8d 	add	r3, r3, #564	@ 0x234
80024fe0:	e51b2010 	ldr	r2, [fp, #-16]
80024fe4:	e1a01002 	mov	r1, r2
80024fe8:	e1a00003 	mov	r0, r3
80024fec:	eb000375 	bl	80025dc8 <sleep>
80024ff0:	e51b3010 	ldr	r3, [fp, #-16]
80024ff4:	e5932234 	ldr	r2, [r3, #564]	@ 0x234
80024ff8:	e51b3010 	ldr	r3, [fp, #-16]
80024ffc:	e5933238 	ldr	r3, [r3, #568]	@ 0x238
80025000:	e1520003 	cmp	r2, r3
80025004:	1a000003 	bne	80025018 <piperead+0x90>
80025008:	e51b3010 	ldr	r3, [fp, #-16]
8002500c:	e5933240 	ldr	r3, [r3, #576]	@ 0x240
80025010:	e3530000 	cmp	r3, #0
80025014:	1affffe5 	bne	80024fb0 <piperead+0x28>
80025018:	e3a03000 	mov	r3, #0
8002501c:	e50b3008 	str	r3, [fp, #-8]
80025020:	ea000016 	b	80025080 <piperead+0xf8>
80025024:	e51b3010 	ldr	r3, [fp, #-16]
80025028:	e5932234 	ldr	r2, [r3, #564]	@ 0x234
8002502c:	e51b3010 	ldr	r3, [fp, #-16]
80025030:	e5933238 	ldr	r3, [r3, #568]	@ 0x238
80025034:	e1520003 	cmp	r2, r3
80025038:	0a000015 	beq	80025094 <piperead+0x10c>
8002503c:	e51b3010 	ldr	r3, [fp, #-16]
80025040:	e5933234 	ldr	r3, [r3, #564]	@ 0x234
80025044:	e2831001 	add	r1, r3, #1
80025048:	e51b2010 	ldr	r2, [fp, #-16]
8002504c:	e5821234 	str	r1, [r2, #564]	@ 0x234
80025050:	e1a03b83 	lsl	r3, r3, #23
80025054:	e1a03ba3 	lsr	r3, r3, #23
80025058:	e51b2008 	ldr	r2, [fp, #-8]
8002505c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
80025060:	e0812002 	add	r2, r1, r2
80025064:	e51b1010 	ldr	r1, [fp, #-16]
80025068:	e0813003 	add	r3, r1, r3
8002506c:	e5d33034 	ldrb	r3, [r3, #52]	@ 0x34
80025070:	e5c23000 	strb	r3, [r2]
80025074:	e51b3008 	ldr	r3, [fp, #-8]
80025078:	e2833001 	add	r3, r3, #1
8002507c:	e50b3008 	str	r3, [fp, #-8]
80025080:	e51b2008 	ldr	r2, [fp, #-8]
80025084:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80025088:	e1520003 	cmp	r2, r3
8002508c:	baffffe4 	blt	80025024 <piperead+0x9c>
80025090:	ea000000 	b	80025098 <piperead+0x110>
80025094:	e1a00000 	nop			@ (mov r0, r0)
80025098:	e51b3010 	ldr	r3, [fp, #-16]
8002509c:	e2833f8e 	add	r3, r3, #568	@ 0x238
800250a0:	e1a00003 	mov	r0, r3
800250a4:	eb0003bb 	bl	80025f98 <wakeup>
800250a8:	e51b3010 	ldr	r3, [fp, #-16]
800250ac:	e1a00003 	mov	r0, r3
800250b0:	eb000662 	bl	80026a40 <release>
800250b4:	e51b3008 	ldr	r3, [fp, #-8]
800250b8:	e1a00003 	mov	r0, r3
800250bc:	e24bd004 	sub	sp, fp, #4
800250c0:	e8bd8800 	pop	{fp, pc}
800250c4:	800d97a8 	.word	0x800d97a8

800250c8 <rand>:
800250c8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
800250cc:	e28db000 	add	fp, sp, #0
800250d0:	e59f3034 	ldr	r3, [pc, #52]	@ 8002510c <rand+0x44>
800250d4:	e5933000 	ldr	r3, [r3]
800250d8:	e59f2030 	ldr	r2, [pc, #48]	@ 80025110 <rand+0x48>
800250dc:	e0030392 	mul	r3, r2, r3
800250e0:	e2833a03 	add	r3, r3, #12288	@ 0x3000
800250e4:	e2833039 	add	r3, r3, #57	@ 0x39
800250e8:	e3c33102 	bic	r3, r3, #-2147483648	@ 0x80000000
800250ec:	e59f2018 	ldr	r2, [pc, #24]	@ 8002510c <rand+0x44>
800250f0:	e5823000 	str	r3, [r2]
800250f4:	e59f3010 	ldr	r3, [pc, #16]	@ 8002510c <rand+0x44>
800250f8:	e5933000 	ldr	r3, [r3]
800250fc:	e1a00003 	mov	r0, r3
80025100:	e28bd000 	add	sp, fp, #0
80025104:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80025108:	e12fff1e 	bx	lr
8002510c:	800d6c6c 	.word	0x800d6c6c
80025110:	41c64e6d 	.word	0x41c64e6d

80025114 <pinit>:
80025114:	e92d4800 	push	{fp, lr}
80025118:	e28db004 	add	fp, sp, #4
8002511c:	e59f100c 	ldr	r1, [pc, #12]	@ 80025130 <pinit+0x1c>
80025120:	e59f000c 	ldr	r0, [pc, #12]	@ 80025134 <pinit+0x20>
80025124:	eb000628 	bl	800269cc <initlock>
80025128:	e1a00000 	nop			@ (mov r0, r0)
8002512c:	e8bd8800 	pop	{fp, pc}
80025130:	8002adf8 	.word	0x8002adf8
80025134:	800d6c70 	.word	0x800d6c70

80025138 <allocproc>:
80025138:	e92d4800 	push	{fp, lr}
8002513c:	e28db004 	add	fp, sp, #4
80025140:	e24dd008 	sub	sp, sp, #8
80025144:	e59f01ac 	ldr	r0, [pc, #428]	@ 800252f8 <allocproc+0x1c0>
80025148:	eb000631 	bl	80026a14 <acquire>
8002514c:	e59f31a8 	ldr	r3, [pc, #424]	@ 800252fc <allocproc+0x1c4>
80025150:	e50b3008 	str	r3, [fp, #-8]
80025154:	ea000006 	b	80025174 <allocproc+0x3c>
80025158:	e51b3008 	ldr	r3, [fp, #-8]
8002515c:	e5d3300c 	ldrb	r3, [r3, #12]
80025160:	e3530000 	cmp	r3, #0
80025164:	0a00000a 	beq	80025194 <allocproc+0x5c>
80025168:	e51b3008 	ldr	r3, [fp, #-8]
8002516c:	e28330ac 	add	r3, r3, #172	@ 0xac
80025170:	e50b3008 	str	r3, [fp, #-8]
80025174:	e51b3008 	ldr	r3, [fp, #-8]
80025178:	e59f2180 	ldr	r2, [pc, #384]	@ 80025300 <allocproc+0x1c8>
8002517c:	e1530002 	cmp	r3, r2
80025180:	3afffff4 	bcc	80025158 <allocproc+0x20>
80025184:	e59f016c 	ldr	r0, [pc, #364]	@ 800252f8 <allocproc+0x1c0>
80025188:	eb00062c 	bl	80026a40 <release>
8002518c:	e3a03000 	mov	r3, #0
80025190:	ea000055 	b	800252ec <allocproc+0x1b4>
80025194:	e1a00000 	nop			@ (mov r0, r0)
80025198:	e51b3008 	ldr	r3, [fp, #-8]
8002519c:	e3a02001 	mov	r2, #1
800251a0:	e5c3200c 	strb	r2, [r3, #12]
800251a4:	e59f3158 	ldr	r3, [pc, #344]	@ 80025304 <allocproc+0x1cc>
800251a8:	e5933000 	ldr	r3, [r3]
800251ac:	e2832001 	add	r2, r3, #1
800251b0:	e59f114c 	ldr	r1, [pc, #332]	@ 80025304 <allocproc+0x1cc>
800251b4:	e5812000 	str	r2, [r1]
800251b8:	e51b2008 	ldr	r2, [fp, #-8]
800251bc:	e5823010 	str	r3, [r2, #16]
800251c0:	e59f0130 	ldr	r0, [pc, #304]	@ 800252f8 <allocproc+0x1c0>
800251c4:	eb00061d 	bl	80026a40 <release>
800251c8:	ebfff118 	bl	80021630 <alloc_page>
800251cc:	e1a02000 	mov	r2, r0
800251d0:	e51b3008 	ldr	r3, [fp, #-8]
800251d4:	e5832008 	str	r2, [r3, #8]
800251d8:	e51b3008 	ldr	r3, [fp, #-8]
800251dc:	e5933008 	ldr	r3, [r3, #8]
800251e0:	e3530000 	cmp	r3, #0
800251e4:	1a000004 	bne	800251fc <allocproc+0xc4>
800251e8:	e51b3008 	ldr	r3, [fp, #-8]
800251ec:	e3a02000 	mov	r2, #0
800251f0:	e5c3200c 	strb	r2, [r3, #12]
800251f4:	e3a03000 	mov	r3, #0
800251f8:	ea00003b 	b	800252ec <allocproc+0x1b4>
800251fc:	e51b3008 	ldr	r3, [fp, #-8]
80025200:	e5933008 	ldr	r3, [r3, #8]
80025204:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80025208:	e50b300c 	str	r3, [fp, #-12]
8002520c:	e51b300c 	ldr	r3, [fp, #-12]
80025210:	e2433048 	sub	r3, r3, #72	@ 0x48
80025214:	e50b300c 	str	r3, [fp, #-12]
80025218:	e51b3008 	ldr	r3, [fp, #-8]
8002521c:	e51b200c 	ldr	r2, [fp, #-12]
80025220:	e5832018 	str	r2, [r3, #24]
80025224:	e51b300c 	ldr	r3, [fp, #-12]
80025228:	e2433004 	sub	r3, r3, #4
8002522c:	e50b300c 	str	r3, [fp, #-12]
80025230:	e59f20d0 	ldr	r2, [pc, #208]	@ 80025308 <allocproc+0x1d0>
80025234:	e51b300c 	ldr	r3, [fp, #-12]
80025238:	e5832000 	str	r2, [r3]
8002523c:	e51b300c 	ldr	r3, [fp, #-12]
80025240:	e2433004 	sub	r3, r3, #4
80025244:	e50b300c 	str	r3, [fp, #-12]
80025248:	e51b3008 	ldr	r3, [fp, #-8]
8002524c:	e5933008 	ldr	r3, [r3, #8]
80025250:	e2832a01 	add	r2, r3, #4096	@ 0x1000
80025254:	e51b300c 	ldr	r3, [fp, #-12]
80025258:	e5832000 	str	r2, [r3]
8002525c:	e51b300c 	ldr	r3, [fp, #-12]
80025260:	e2433028 	sub	r3, r3, #40	@ 0x28
80025264:	e50b300c 	str	r3, [fp, #-12]
80025268:	e51b3008 	ldr	r3, [fp, #-8]
8002526c:	e51b200c 	ldr	r2, [fp, #-12]
80025270:	e583201c 	str	r2, [r3, #28]
80025274:	e51b3008 	ldr	r3, [fp, #-8]
80025278:	e593301c 	ldr	r3, [r3, #28]
8002527c:	e3a02028 	mov	r2, #40	@ 0x28
80025280:	e3a01000 	mov	r1, #0
80025284:	e1a00003 	mov	r0, r3
80025288:	ebffeb5c 	bl	80020000 <memset>
8002528c:	e59f2078 	ldr	r2, [pc, #120]	@ 8002530c <allocproc+0x1d4>
80025290:	e51b3008 	ldr	r3, [fp, #-8]
80025294:	e593301c 	ldr	r3, [r3, #28]
80025298:	e2822004 	add	r2, r2, #4
8002529c:	e5832024 	str	r2, [r3, #36]	@ 0x24
800252a0:	e59f3068 	ldr	r3, [pc, #104]	@ 80025310 <allocproc+0x1d8>
800252a4:	e5933000 	ldr	r3, [r3]
800252a8:	e5933014 	ldr	r3, [r3, #20]
800252ac:	e3530000 	cmp	r3, #0
800252b0:	0a000006 	beq	800252d0 <allocproc+0x198>
800252b4:	e59f3054 	ldr	r3, [pc, #84]	@ 80025310 <allocproc+0x1d8>
800252b8:	e5933000 	ldr	r3, [r3]
800252bc:	e5933014 	ldr	r3, [r3, #20]
800252c0:	e5932080 	ldr	r2, [r3, #128]	@ 0x80
800252c4:	e51b3008 	ldr	r3, [fp, #-8]
800252c8:	e5832080 	str	r2, [r3, #128]	@ 0x80
800252cc:	ea000002 	b	800252dc <allocproc+0x1a4>
800252d0:	e51b3008 	ldr	r3, [fp, #-8]
800252d4:	e3a02001 	mov	r2, #1
800252d8:	e5832080 	str	r2, [r3, #128]	@ 0x80
800252dc:	e51b3008 	ldr	r3, [fp, #-8]
800252e0:	e3a02000 	mov	r2, #0
800252e4:	e5832088 	str	r2, [r3, #136]	@ 0x88
800252e8:	e51b3008 	ldr	r3, [fp, #-8]
800252ec:	e1a00003 	mov	r0, r3
800252f0:	e24bd004 	sub	sp, fp, #4
800252f4:	e8bd8800 	pop	{fp, pc}
800252f8:	800d6c70 	.word	0x800d6c70
800252fc:	800d6ca4 	.word	0x800d6ca4
80025300:	800d97a4 	.word	0x800d97a4
80025304:	8002c014 	.word	0x8002c014
80025308:	800288e0 	.word	0x800288e0
8002530c:	80025d88 	.word	0x80025d88
80025310:	800d97a8 	.word	0x800d97a8

80025314 <error_init>:
80025314:	e92d4800 	push	{fp, lr}
80025318:	e28db004 	add	fp, sp, #4
8002531c:	e59f0000 	ldr	r0, [pc]	@ 80025324 <error_init+0x10>
80025320:	ebfff1f3 	bl	80021af4 <panic>
80025324:	8002ae00 	.word	0x8002ae00

80025328 <userinit>:
80025328:	e92d4810 	push	{r4, fp, lr}
8002532c:	e28db008 	add	fp, sp, #8
80025330:	e24dd00c 	sub	sp, sp, #12
80025334:	ebffff7f 	bl	80025138 <allocproc>
80025338:	e50b0010 	str	r0, [fp, #-16]
8002533c:	e59f2100 	ldr	r2, [pc, #256]	@ 80025444 <userinit+0x11c>
80025340:	e51b3010 	ldr	r3, [fp, #-16]
80025344:	e5823000 	str	r3, [r2]
80025348:	eb00100d 	bl	80029384 <kpt_alloc>
8002534c:	e1a02000 	mov	r2, r0
80025350:	e51b3010 	ldr	r3, [fp, #-16]
80025354:	e5832004 	str	r2, [r3, #4]
80025358:	e51b3010 	ldr	r3, [fp, #-16]
8002535c:	e5933004 	ldr	r3, [r3, #4]
80025360:	e3530000 	cmp	r3, #0
80025364:	1a000001 	bne	80025370 <userinit+0x48>
80025368:	e59f00d8 	ldr	r0, [pc, #216]	@ 80025448 <userinit+0x120>
8002536c:	ebfff1e0 	bl	80021af4 <panic>
80025370:	e51b3010 	ldr	r3, [fp, #-16]
80025374:	e5933004 	ldr	r3, [r3, #4]
80025378:	e59f20cc 	ldr	r2, [pc, #204]	@ 8002544c <userinit+0x124>
8002537c:	e59f10cc 	ldr	r1, [pc, #204]	@ 80025450 <userinit+0x128>
80025380:	e1a00003 	mov	r0, r3
80025384:	eb0010bc 	bl	8002967c <inituvm>
80025388:	e51b3010 	ldr	r3, [fp, #-16]
8002538c:	e3a02a01 	mov	r2, #4096	@ 0x1000
80025390:	e5832000 	str	r2, [r3]
80025394:	e51b3010 	ldr	r3, [fp, #-16]
80025398:	e5933018 	ldr	r3, [r3, #24]
8002539c:	e3a02048 	mov	r2, #72	@ 0x48
800253a0:	e3a01000 	mov	r1, #0
800253a4:	e1a00003 	mov	r0, r3
800253a8:	ebffeb14 	bl	80020000 <memset>
800253ac:	e51b3010 	ldr	r3, [fp, #-16]
800253b0:	e5933018 	ldr	r3, [r3, #24]
800253b4:	e59f2098 	ldr	r2, [pc, #152]	@ 80025454 <userinit+0x12c>
800253b8:	e5832008 	str	r2, [r3, #8]
800253bc:	e51b3010 	ldr	r3, [fp, #-16]
800253c0:	e5934018 	ldr	r4, [r3, #24]
800253c4:	ebffec79 	bl	800205b0 <spsr_usr>
800253c8:	e1a03000 	mov	r3, r0
800253cc:	e584300c 	str	r3, [r4, #12]
800253d0:	e51b3010 	ldr	r3, [fp, #-16]
800253d4:	e5933018 	ldr	r3, [r3, #24]
800253d8:	e3a02a01 	mov	r2, #4096	@ 0x1000
800253dc:	e5832000 	str	r2, [r3]
800253e0:	e51b3010 	ldr	r3, [fp, #-16]
800253e4:	e5933018 	ldr	r3, [r3, #24]
800253e8:	e3a02000 	mov	r2, #0
800253ec:	e5832004 	str	r2, [r3, #4]
800253f0:	e51b3010 	ldr	r3, [fp, #-16]
800253f4:	e5933018 	ldr	r3, [r3, #24]
800253f8:	e3a02000 	mov	r2, #0
800253fc:	e5832044 	str	r2, [r3, #68]	@ 0x44
80025400:	e51b3010 	ldr	r3, [fp, #-16]
80025404:	e283306c 	add	r3, r3, #108	@ 0x6c
80025408:	e3a02010 	mov	r2, #16
8002540c:	e59f1044 	ldr	r1, [pc, #68]	@ 80025458 <userinit+0x130>
80025410:	e1a00003 	mov	r0, r3
80025414:	ebffec0d 	bl	80020450 <safestrcpy>
80025418:	e59f003c 	ldr	r0, [pc, #60]	@ 8002545c <userinit+0x134>
8002541c:	ebfffbc6 	bl	8002433c <namei>
80025420:	e1a02000 	mov	r2, r0
80025424:	e51b3010 	ldr	r3, [fp, #-16]
80025428:	e5832068 	str	r2, [r3, #104]	@ 0x68
8002542c:	e51b3010 	ldr	r3, [fp, #-16]
80025430:	e3a02003 	mov	r2, #3
80025434:	e5c3200c 	strb	r2, [r3, #12]
80025438:	e1a00000 	nop			@ (mov r0, r0)
8002543c:	e24bd008 	sub	sp, fp, #8
80025440:	e8bd8810 	pop	{r4, fp, pc}
80025444:	800d97a4 	.word	0x800d97a4
80025448:	8002ae20 	.word	0x8002ae20
8002544c:	00000034 	.word	0x00000034
80025450:	8002c0f0 	.word	0x8002c0f0
80025454:	80025314 	.word	0x80025314
80025458:	8002ae3c 	.word	0x8002ae3c
8002545c:	8002ae48 	.word	0x8002ae48

80025460 <growproc>:
80025460:	e92d4800 	push	{fp, lr}
80025464:	e28db004 	add	fp, sp, #4
80025468:	e24dd010 	sub	sp, sp, #16
8002546c:	e50b0010 	str	r0, [fp, #-16]
80025470:	e59f30d0 	ldr	r3, [pc, #208]	@ 80025548 <growproc+0xe8>
80025474:	e5933000 	ldr	r3, [r3]
80025478:	e5933000 	ldr	r3, [r3]
8002547c:	e50b3008 	str	r3, [fp, #-8]
80025480:	e51b3010 	ldr	r3, [fp, #-16]
80025484:	e3530000 	cmp	r3, #0
80025488:	da00000f 	ble	800254cc <growproc+0x6c>
8002548c:	e59f30b4 	ldr	r3, [pc, #180]	@ 80025548 <growproc+0xe8>
80025490:	e5933000 	ldr	r3, [r3]
80025494:	e5930004 	ldr	r0, [r3, #4]
80025498:	e51b2010 	ldr	r2, [fp, #-16]
8002549c:	e51b3008 	ldr	r3, [fp, #-8]
800254a0:	e0823003 	add	r3, r2, r3
800254a4:	e1a02003 	mov	r2, r3
800254a8:	e51b1008 	ldr	r1, [fp, #-8]
800254ac:	eb0010e0 	bl	80029834 <allocuvm>
800254b0:	e1a03000 	mov	r3, r0
800254b4:	e50b3008 	str	r3, [fp, #-8]
800254b8:	e51b3008 	ldr	r3, [fp, #-8]
800254bc:	e3530000 	cmp	r3, #0
800254c0:	1a000014 	bne	80025518 <growproc+0xb8>
800254c4:	e3e03000 	mvn	r3, #0
800254c8:	ea00001b 	b	8002553c <growproc+0xdc>
800254cc:	e51b3010 	ldr	r3, [fp, #-16]
800254d0:	e3530000 	cmp	r3, #0
800254d4:	aa00000f 	bge	80025518 <growproc+0xb8>
800254d8:	e59f3068 	ldr	r3, [pc, #104]	@ 80025548 <growproc+0xe8>
800254dc:	e5933000 	ldr	r3, [r3]
800254e0:	e5930004 	ldr	r0, [r3, #4]
800254e4:	e51b2010 	ldr	r2, [fp, #-16]
800254e8:	e51b3008 	ldr	r3, [fp, #-8]
800254ec:	e0823003 	add	r3, r2, r3
800254f0:	e1a02003 	mov	r2, r3
800254f4:	e51b1008 	ldr	r1, [fp, #-8]
800254f8:	eb00110c 	bl	80029930 <deallocuvm>
800254fc:	e1a03000 	mov	r3, r0
80025500:	e50b3008 	str	r3, [fp, #-8]
80025504:	e51b3008 	ldr	r3, [fp, #-8]
80025508:	e3530000 	cmp	r3, #0
8002550c:	1a000001 	bne	80025518 <growproc+0xb8>
80025510:	e3e03000 	mvn	r3, #0
80025514:	ea000008 	b	8002553c <growproc+0xdc>
80025518:	e59f3028 	ldr	r3, [pc, #40]	@ 80025548 <growproc+0xe8>
8002551c:	e5933000 	ldr	r3, [r3]
80025520:	e51b2008 	ldr	r2, [fp, #-8]
80025524:	e5832000 	str	r2, [r3]
80025528:	e59f3018 	ldr	r3, [pc, #24]	@ 80025548 <growproc+0xe8>
8002552c:	e5933000 	ldr	r3, [r3]
80025530:	e1a00003 	mov	r0, r3
80025534:	eb001039 	bl	80029620 <switchuvm>
80025538:	e3a03000 	mov	r3, #0
8002553c:	e1a00003 	mov	r0, r3
80025540:	e24bd004 	sub	sp, fp, #4
80025544:	e8bd8800 	pop	{fp, pc}
80025548:	800d97a8 	.word	0x800d97a8

8002554c <fork>:
8002554c:	e92d4800 	push	{fp, lr}
80025550:	e28db004 	add	fp, sp, #4
80025554:	e24dd010 	sub	sp, sp, #16
80025558:	ebfffef6 	bl	80025138 <allocproc>
8002555c:	e50b000c 	str	r0, [fp, #-12]
80025560:	e51b300c 	ldr	r3, [fp, #-12]
80025564:	e3530000 	cmp	r3, #0
80025568:	1a000001 	bne	80025574 <fork+0x28>
8002556c:	e3e03000 	mvn	r3, #0
80025570:	ea000065 	b	8002570c <fork+0x1c0>
80025574:	e59f319c 	ldr	r3, [pc, #412]	@ 80025718 <fork+0x1cc>
80025578:	e5933000 	ldr	r3, [r3]
8002557c:	e5932004 	ldr	r2, [r3, #4]
80025580:	e59f3190 	ldr	r3, [pc, #400]	@ 80025718 <fork+0x1cc>
80025584:	e5933000 	ldr	r3, [r3]
80025588:	e5933000 	ldr	r3, [r3]
8002558c:	e1a01003 	mov	r1, r3
80025590:	e1a00002 	mov	r0, r2
80025594:	eb001174 	bl	80029b6c <copyuvm>
80025598:	e1a02000 	mov	r2, r0
8002559c:	e51b300c 	ldr	r3, [fp, #-12]
800255a0:	e5832004 	str	r2, [r3, #4]
800255a4:	e51b300c 	ldr	r3, [fp, #-12]
800255a8:	e5933004 	ldr	r3, [r3, #4]
800255ac:	e3530000 	cmp	r3, #0
800255b0:	1a00000b 	bne	800255e4 <fork+0x98>
800255b4:	e51b300c 	ldr	r3, [fp, #-12]
800255b8:	e5933008 	ldr	r3, [r3, #8]
800255bc:	e1a00003 	mov	r0, r3
800255c0:	ebfff010 	bl	80021608 <free_page>
800255c4:	e51b300c 	ldr	r3, [fp, #-12]
800255c8:	e3a02000 	mov	r2, #0
800255cc:	e5832008 	str	r2, [r3, #8]
800255d0:	e51b300c 	ldr	r3, [fp, #-12]
800255d4:	e3a02000 	mov	r2, #0
800255d8:	e5c3200c 	strb	r2, [r3, #12]
800255dc:	e3e03000 	mvn	r3, #0
800255e0:	ea000049 	b	8002570c <fork+0x1c0>
800255e4:	e59f312c 	ldr	r3, [pc, #300]	@ 80025718 <fork+0x1cc>
800255e8:	e5933000 	ldr	r3, [r3]
800255ec:	e5932000 	ldr	r2, [r3]
800255f0:	e51b300c 	ldr	r3, [fp, #-12]
800255f4:	e5832000 	str	r2, [r3]
800255f8:	e59f3118 	ldr	r3, [pc, #280]	@ 80025718 <fork+0x1cc>
800255fc:	e5932000 	ldr	r2, [r3]
80025600:	e51b300c 	ldr	r3, [fp, #-12]
80025604:	e5832014 	str	r2, [r3, #20]
80025608:	e59f3108 	ldr	r3, [pc, #264]	@ 80025718 <fork+0x1cc>
8002560c:	e5933000 	ldr	r3, [r3]
80025610:	e5932018 	ldr	r2, [r3, #24]
80025614:	e51b300c 	ldr	r3, [fp, #-12]
80025618:	e5933018 	ldr	r3, [r3, #24]
8002561c:	e1a00003 	mov	r0, r3
80025620:	e1a01002 	mov	r1, r2
80025624:	e3a03048 	mov	r3, #72	@ 0x48
80025628:	e1a02003 	mov	r2, r3
8002562c:	ebffeb24 	bl	800202c4 <memcpy>
80025630:	e51b300c 	ldr	r3, [fp, #-12]
80025634:	e5933018 	ldr	r3, [r3, #24]
80025638:	e3a02000 	mov	r2, #0
8002563c:	e5832010 	str	r2, [r3, #16]
80025640:	e3a03000 	mov	r3, #0
80025644:	e50b3008 	str	r3, [fp, #-8]
80025648:	ea000015 	b	800256a4 <fork+0x158>
8002564c:	e59f30c4 	ldr	r3, [pc, #196]	@ 80025718 <fork+0x1cc>
80025650:	e5933000 	ldr	r3, [r3]
80025654:	e51b2008 	ldr	r2, [fp, #-8]
80025658:	e282200a 	add	r2, r2, #10
8002565c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80025660:	e3530000 	cmp	r3, #0
80025664:	0a00000b 	beq	80025698 <fork+0x14c>
80025668:	e59f30a8 	ldr	r3, [pc, #168]	@ 80025718 <fork+0x1cc>
8002566c:	e5933000 	ldr	r3, [r3]
80025670:	e51b2008 	ldr	r2, [fp, #-8]
80025674:	e282200a 	add	r2, r2, #10
80025678:	e7933102 	ldr	r3, [r3, r2, lsl #2]
8002567c:	e1a00003 	mov	r0, r3
80025680:	ebfff417 	bl	800226e4 <filedup>
80025684:	e1a01000 	mov	r1, r0
80025688:	e51b300c 	ldr	r3, [fp, #-12]
8002568c:	e51b2008 	ldr	r2, [fp, #-8]
80025690:	e282200a 	add	r2, r2, #10
80025694:	e7831102 	str	r1, [r3, r2, lsl #2]
80025698:	e51b3008 	ldr	r3, [fp, #-8]
8002569c:	e2833001 	add	r3, r3, #1
800256a0:	e50b3008 	str	r3, [fp, #-8]
800256a4:	e51b3008 	ldr	r3, [fp, #-8]
800256a8:	e353000f 	cmp	r3, #15
800256ac:	daffffe6 	ble	8002564c <fork+0x100>
800256b0:	e59f3060 	ldr	r3, [pc, #96]	@ 80025718 <fork+0x1cc>
800256b4:	e5933000 	ldr	r3, [r3]
800256b8:	e5933068 	ldr	r3, [r3, #104]	@ 0x68
800256bc:	e1a00003 	mov	r0, r3
800256c0:	ebfff6d9 	bl	8002322c <idup>
800256c4:	e1a02000 	mov	r2, r0
800256c8:	e51b300c 	ldr	r3, [fp, #-12]
800256cc:	e5832068 	str	r2, [r3, #104]	@ 0x68
800256d0:	e51b300c 	ldr	r3, [fp, #-12]
800256d4:	e5933010 	ldr	r3, [r3, #16]
800256d8:	e50b3010 	str	r3, [fp, #-16]
800256dc:	e51b300c 	ldr	r3, [fp, #-12]
800256e0:	e3a02003 	mov	r2, #3
800256e4:	e5c3200c 	strb	r2, [r3, #12]
800256e8:	e51b300c 	ldr	r3, [fp, #-12]
800256ec:	e283006c 	add	r0, r3, #108	@ 0x6c
800256f0:	e59f3020 	ldr	r3, [pc, #32]	@ 80025718 <fork+0x1cc>
800256f4:	e5933000 	ldr	r3, [r3]
800256f8:	e283306c 	add	r3, r3, #108	@ 0x6c
800256fc:	e3a02010 	mov	r2, #16
80025700:	e1a01003 	mov	r1, r3
80025704:	ebffeb51 	bl	80020450 <safestrcpy>
80025708:	e51b3010 	ldr	r3, [fp, #-16]
8002570c:	e1a00003 	mov	r0, r3
80025710:	e24bd004 	sub	sp, fp, #4
80025714:	e8bd8800 	pop	{fp, pc}
80025718:	800d97a8 	.word	0x800d97a8

8002571c <exit>:
8002571c:	e92d4800 	push	{fp, lr}
80025720:	e28db004 	add	fp, sp, #4
80025724:	e24dd008 	sub	sp, sp, #8
80025728:	e59f3158 	ldr	r3, [pc, #344]	@ 80025888 <exit+0x16c>
8002572c:	e5932000 	ldr	r2, [r3]
80025730:	e59f3154 	ldr	r3, [pc, #340]	@ 8002588c <exit+0x170>
80025734:	e5933000 	ldr	r3, [r3]
80025738:	e1520003 	cmp	r2, r3
8002573c:	1a000001 	bne	80025748 <exit+0x2c>
80025740:	e59f0148 	ldr	r0, [pc, #328]	@ 80025890 <exit+0x174>
80025744:	ebfff0ea 	bl	80021af4 <panic>
80025748:	e3a03000 	mov	r3, #0
8002574c:	e50b300c 	str	r3, [fp, #-12]
80025750:	ea000016 	b	800257b0 <exit+0x94>
80025754:	e59f312c 	ldr	r3, [pc, #300]	@ 80025888 <exit+0x16c>
80025758:	e5933000 	ldr	r3, [r3]
8002575c:	e51b200c 	ldr	r2, [fp, #-12]
80025760:	e282200a 	add	r2, r2, #10
80025764:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80025768:	e3530000 	cmp	r3, #0
8002576c:	0a00000c 	beq	800257a4 <exit+0x88>
80025770:	e59f3110 	ldr	r3, [pc, #272]	@ 80025888 <exit+0x16c>
80025774:	e5933000 	ldr	r3, [r3]
80025778:	e51b200c 	ldr	r2, [fp, #-12]
8002577c:	e282200a 	add	r2, r2, #10
80025780:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80025784:	e1a00003 	mov	r0, r3
80025788:	ebfff3ee 	bl	80022748 <fileclose>
8002578c:	e59f30f4 	ldr	r3, [pc, #244]	@ 80025888 <exit+0x16c>
80025790:	e5933000 	ldr	r3, [r3]
80025794:	e51b200c 	ldr	r2, [fp, #-12]
80025798:	e282200a 	add	r2, r2, #10
8002579c:	e3a01000 	mov	r1, #0
800257a0:	e7831102 	str	r1, [r3, r2, lsl #2]
800257a4:	e51b300c 	ldr	r3, [fp, #-12]
800257a8:	e2833001 	add	r3, r3, #1
800257ac:	e50b300c 	str	r3, [fp, #-12]
800257b0:	e51b300c 	ldr	r3, [fp, #-12]
800257b4:	e353000f 	cmp	r3, #15
800257b8:	daffffe5 	ble	80025754 <exit+0x38>
800257bc:	e59f30c4 	ldr	r3, [pc, #196]	@ 80025888 <exit+0x16c>
800257c0:	e5933000 	ldr	r3, [r3]
800257c4:	e5933068 	ldr	r3, [r3, #104]	@ 0x68
800257c8:	e1a00003 	mov	r0, r3
800257cc:	ebfff72e 	bl	8002348c <iput>
800257d0:	e59f30b0 	ldr	r3, [pc, #176]	@ 80025888 <exit+0x16c>
800257d4:	e5933000 	ldr	r3, [r3]
800257d8:	e3a02000 	mov	r2, #0
800257dc:	e5832068 	str	r2, [r3, #104]	@ 0x68
800257e0:	e59f00ac 	ldr	r0, [pc, #172]	@ 80025894 <exit+0x178>
800257e4:	eb00048a 	bl	80026a14 <acquire>
800257e8:	e59f3098 	ldr	r3, [pc, #152]	@ 80025888 <exit+0x16c>
800257ec:	e5933000 	ldr	r3, [r3]
800257f0:	e5933014 	ldr	r3, [r3, #20]
800257f4:	e1a00003 	mov	r0, r3
800257f8:	eb0001a6 	bl	80025e98 <wakeup1>
800257fc:	e59f3094 	ldr	r3, [pc, #148]	@ 80025898 <exit+0x17c>
80025800:	e50b3008 	str	r3, [fp, #-8]
80025804:	ea000014 	b	8002585c <exit+0x140>
80025808:	e51b3008 	ldr	r3, [fp, #-8]
8002580c:	e5932014 	ldr	r2, [r3, #20]
80025810:	e59f3070 	ldr	r3, [pc, #112]	@ 80025888 <exit+0x16c>
80025814:	e5933000 	ldr	r3, [r3]
80025818:	e1520003 	cmp	r2, r3
8002581c:	1a00000b 	bne	80025850 <exit+0x134>
80025820:	e59f3064 	ldr	r3, [pc, #100]	@ 8002588c <exit+0x170>
80025824:	e5932000 	ldr	r2, [r3]
80025828:	e51b3008 	ldr	r3, [fp, #-8]
8002582c:	e5832014 	str	r2, [r3, #20]
80025830:	e51b3008 	ldr	r3, [fp, #-8]
80025834:	e5d3300c 	ldrb	r3, [r3, #12]
80025838:	e3530005 	cmp	r3, #5
8002583c:	1a000003 	bne	80025850 <exit+0x134>
80025840:	e59f3044 	ldr	r3, [pc, #68]	@ 8002588c <exit+0x170>
80025844:	e5933000 	ldr	r3, [r3]
80025848:	e1a00003 	mov	r0, r3
8002584c:	eb000191 	bl	80025e98 <wakeup1>
80025850:	e51b3008 	ldr	r3, [fp, #-8]
80025854:	e28330ac 	add	r3, r3, #172	@ 0xac
80025858:	e50b3008 	str	r3, [fp, #-8]
8002585c:	e51b3008 	ldr	r3, [fp, #-8]
80025860:	e59f2034 	ldr	r2, [pc, #52]	@ 8002589c <exit+0x180>
80025864:	e1530002 	cmp	r3, r2
80025868:	3affffe6 	bcc	80025808 <exit+0xec>
8002586c:	e59f3014 	ldr	r3, [pc, #20]	@ 80025888 <exit+0x16c>
80025870:	e5933000 	ldr	r3, [r3]
80025874:	e3a02005 	mov	r2, #5
80025878:	e5c3200c 	strb	r2, [r3, #12]
8002587c:	eb0000f9 	bl	80025c68 <sched>
80025880:	e59f0018 	ldr	r0, [pc, #24]	@ 800258a0 <exit+0x184>
80025884:	ebfff09a 	bl	80021af4 <panic>
80025888:	800d97a8 	.word	0x800d97a8
8002588c:	800d97a4 	.word	0x800d97a4
80025890:	8002ae4c 	.word	0x8002ae4c
80025894:	800d6c70 	.word	0x800d6c70
80025898:	800d6ca4 	.word	0x800d6ca4
8002589c:	800d97a4 	.word	0x800d97a4
800258a0:	8002ae5c 	.word	0x8002ae5c

800258a4 <wait>:
800258a4:	e92d4800 	push	{fp, lr}
800258a8:	e28db004 	add	fp, sp, #4
800258ac:	e24dd010 	sub	sp, sp, #16
800258b0:	e59f014c 	ldr	r0, [pc, #332]	@ 80025a04 <wait+0x160>
800258b4:	eb000456 	bl	80026a14 <acquire>
800258b8:	e3a03000 	mov	r3, #0
800258bc:	e50b300c 	str	r3, [fp, #-12]
800258c0:	e59f3140 	ldr	r3, [pc, #320]	@ 80025a08 <wait+0x164>
800258c4:	e50b3008 	str	r3, [fp, #-8]
800258c8:	ea000034 	b	800259a0 <wait+0xfc>
800258cc:	e51b3008 	ldr	r3, [fp, #-8]
800258d0:	e5932014 	ldr	r2, [r3, #20]
800258d4:	e59f3130 	ldr	r3, [pc, #304]	@ 80025a0c <wait+0x168>
800258d8:	e5933000 	ldr	r3, [r3]
800258dc:	e1520003 	cmp	r2, r3
800258e0:	1a00002a 	bne	80025990 <wait+0xec>
800258e4:	e51b3008 	ldr	r3, [fp, #-8]
800258e8:	e593309c 	ldr	r3, [r3, #156]	@ 0x9c
800258ec:	e3530000 	cmp	r3, #0
800258f0:	1a000026 	bne	80025990 <wait+0xec>
800258f4:	e3a03001 	mov	r3, #1
800258f8:	e50b300c 	str	r3, [fp, #-12]
800258fc:	e51b3008 	ldr	r3, [fp, #-8]
80025900:	e5d3300c 	ldrb	r3, [r3, #12]
80025904:	e3530005 	cmp	r3, #5
80025908:	1a000021 	bne	80025994 <wait+0xf0>
8002590c:	e51b3008 	ldr	r3, [fp, #-8]
80025910:	e5933010 	ldr	r3, [r3, #16]
80025914:	e50b3010 	str	r3, [fp, #-16]
80025918:	e51b3008 	ldr	r3, [fp, #-8]
8002591c:	e5933008 	ldr	r3, [r3, #8]
80025920:	e1a00003 	mov	r0, r3
80025924:	ebffef37 	bl	80021608 <free_page>
80025928:	e51b3008 	ldr	r3, [fp, #-8]
8002592c:	e3a02000 	mov	r2, #0
80025930:	e5832008 	str	r2, [r3, #8]
80025934:	e51b3008 	ldr	r3, [fp, #-8]
80025938:	e5933004 	ldr	r3, [r3, #4]
8002593c:	e1a00003 	mov	r0, r3
80025940:	eb001040 	bl	80029a48 <freevm>
80025944:	e51b3008 	ldr	r3, [fp, #-8]
80025948:	e3a02000 	mov	r2, #0
8002594c:	e5c3200c 	strb	r2, [r3, #12]
80025950:	e51b3008 	ldr	r3, [fp, #-8]
80025954:	e3a02000 	mov	r2, #0
80025958:	e5832010 	str	r2, [r3, #16]
8002595c:	e51b3008 	ldr	r3, [fp, #-8]
80025960:	e3a02000 	mov	r2, #0
80025964:	e5832014 	str	r2, [r3, #20]
80025968:	e51b3008 	ldr	r3, [fp, #-8]
8002596c:	e3a02000 	mov	r2, #0
80025970:	e5c3206c 	strb	r2, [r3, #108]	@ 0x6c
80025974:	e51b3008 	ldr	r3, [fp, #-8]
80025978:	e3a02000 	mov	r2, #0
8002597c:	e5832024 	str	r2, [r3, #36]	@ 0x24
80025980:	e59f007c 	ldr	r0, [pc, #124]	@ 80025a04 <wait+0x160>
80025984:	eb00042d 	bl	80026a40 <release>
80025988:	e51b3010 	ldr	r3, [fp, #-16]
8002598c:	ea000019 	b	800259f8 <wait+0x154>
80025990:	e1a00000 	nop			@ (mov r0, r0)
80025994:	e51b3008 	ldr	r3, [fp, #-8]
80025998:	e28330ac 	add	r3, r3, #172	@ 0xac
8002599c:	e50b3008 	str	r3, [fp, #-8]
800259a0:	e51b3008 	ldr	r3, [fp, #-8]
800259a4:	e59f2064 	ldr	r2, [pc, #100]	@ 80025a10 <wait+0x16c>
800259a8:	e1530002 	cmp	r3, r2
800259ac:	3affffc6 	bcc	800258cc <wait+0x28>
800259b0:	e51b300c 	ldr	r3, [fp, #-12]
800259b4:	e3530000 	cmp	r3, #0
800259b8:	0a000004 	beq	800259d0 <wait+0x12c>
800259bc:	e59f3048 	ldr	r3, [pc, #72]	@ 80025a0c <wait+0x168>
800259c0:	e5933000 	ldr	r3, [r3]
800259c4:	e5933024 	ldr	r3, [r3, #36]	@ 0x24
800259c8:	e3530000 	cmp	r3, #0
800259cc:	0a000003 	beq	800259e0 <wait+0x13c>
800259d0:	e59f002c 	ldr	r0, [pc, #44]	@ 80025a04 <wait+0x160>
800259d4:	eb000419 	bl	80026a40 <release>
800259d8:	e3e03000 	mvn	r3, #0
800259dc:	ea000005 	b	800259f8 <wait+0x154>
800259e0:	e59f3024 	ldr	r3, [pc, #36]	@ 80025a0c <wait+0x168>
800259e4:	e5933000 	ldr	r3, [r3]
800259e8:	e59f1014 	ldr	r1, [pc, #20]	@ 80025a04 <wait+0x160>
800259ec:	e1a00003 	mov	r0, r3
800259f0:	eb0000f4 	bl	80025dc8 <sleep>
800259f4:	eaffffaf 	b	800258b8 <wait+0x14>
800259f8:	e1a00003 	mov	r0, r3
800259fc:	e24bd004 	sub	sp, fp, #4
80025a00:	e8bd8800 	pop	{fp, pc}
80025a04:	800d6c70 	.word	0x800d6c70
80025a08:	800d6ca4 	.word	0x800d6ca4
80025a0c:	800d97a8 	.word	0x800d97a8
80025a10:	800d97a4 	.word	0x800d97a4

80025a14 <hold_lottery>:
80025a14:	e92d4800 	push	{fp, lr}
80025a18:	e28db004 	add	fp, sp, #4
80025a1c:	e24dd018 	sub	sp, sp, #24
80025a20:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80025a24:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80025a28:	e3530000 	cmp	r3, #0
80025a2c:	ca000001 	bgt	80025a38 <hold_lottery+0x24>
80025a30:	e3a03000 	mov	r3, #0
80025a34:	ea00002d 	b	80025af0 <hold_lottery+0xdc>
80025a38:	ebfffda2 	bl	800250c8 <rand>
80025a3c:	e1a02000 	mov	r2, r0
80025a40:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80025a44:	e1a01003 	mov	r1, r3
80025a48:	e1a00002 	mov	r0, r2
80025a4c:	eb0013ca 	bl	8002a97c <__aeabi_uidivmod>
80025a50:	e1a03001 	mov	r3, r1
80025a54:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80025a58:	e3a03000 	mov	r3, #0
80025a5c:	e50b3008 	str	r3, [fp, #-8]
80025a60:	e59f3094 	ldr	r3, [pc, #148]	@ 80025afc <hold_lottery+0xe8>
80025a64:	e50b300c 	str	r3, [fp, #-12]
80025a68:	ea00001b 	b	80025adc <hold_lottery+0xc8>
80025a6c:	e51b300c 	ldr	r3, [fp, #-12]
80025a70:	e5d3300c 	ldrb	r3, [r3, #12]
80025a74:	e3530003 	cmp	r3, #3
80025a78:	1a000013 	bne	80025acc <hold_lottery+0xb8>
80025a7c:	e51b300c 	ldr	r3, [fp, #-12]
80025a80:	e5933080 	ldr	r3, [r3, #128]	@ 0x80
80025a84:	e50b3010 	str	r3, [fp, #-16]
80025a88:	e51b300c 	ldr	r3, [fp, #-12]
80025a8c:	e5933088 	ldr	r3, [r3, #136]	@ 0x88
80025a90:	e3530000 	cmp	r3, #0
80025a94:	da000002 	ble	80025aa4 <hold_lottery+0x90>
80025a98:	e51b3010 	ldr	r3, [fp, #-16]
80025a9c:	e1a03083 	lsl	r3, r3, #1
80025aa0:	e50b3010 	str	r3, [fp, #-16]
80025aa4:	e51b2008 	ldr	r2, [fp, #-8]
80025aa8:	e51b3010 	ldr	r3, [fp, #-16]
80025aac:	e0823003 	add	r3, r2, r3
80025ab0:	e50b3008 	str	r3, [fp, #-8]
80025ab4:	e51b2008 	ldr	r2, [fp, #-8]
80025ab8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80025abc:	e1520003 	cmp	r2, r3
80025ac0:	da000002 	ble	80025ad0 <hold_lottery+0xbc>
80025ac4:	e51b300c 	ldr	r3, [fp, #-12]
80025ac8:	ea000008 	b	80025af0 <hold_lottery+0xdc>
80025acc:	e1a00000 	nop			@ (mov r0, r0)
80025ad0:	e51b300c 	ldr	r3, [fp, #-12]
80025ad4:	e28330ac 	add	r3, r3, #172	@ 0xac
80025ad8:	e50b300c 	str	r3, [fp, #-12]
80025adc:	e51b300c 	ldr	r3, [fp, #-12]
80025ae0:	e59f2018 	ldr	r2, [pc, #24]	@ 80025b00 <hold_lottery+0xec>
80025ae4:	e1530002 	cmp	r3, r2
80025ae8:	3affffdf 	bcc	80025a6c <hold_lottery+0x58>
80025aec:	e3a03000 	mov	r3, #0
80025af0:	e1a00003 	mov	r0, r3
80025af4:	e24bd004 	sub	sp, fp, #4
80025af8:	e8bd8800 	pop	{fp, pc}
80025afc:	800d6ca4 	.word	0x800d6ca4
80025b00:	800d97a4 	.word	0x800d97a4

80025b04 <scheduler>:
80025b04:	e92d4800 	push	{fp, lr}
80025b08:	e28db004 	add	fp, sp, #4
80025b0c:	e24dd010 	sub	sp, sp, #16
80025b10:	ebffea98 	bl	80020578 <sti>
80025b14:	e59f0138 	ldr	r0, [pc, #312]	@ 80025c54 <scheduler+0x150>
80025b18:	eb0003bd 	bl	80026a14 <acquire>
80025b1c:	e3a03000 	mov	r3, #0
80025b20:	e50b300c 	str	r3, [fp, #-12]
80025b24:	e59f312c 	ldr	r3, [pc, #300]	@ 80025c58 <scheduler+0x154>
80025b28:	e50b3008 	str	r3, [fp, #-8]
80025b2c:	ea000016 	b	80025b8c <scheduler+0x88>
80025b30:	e51b3008 	ldr	r3, [fp, #-8]
80025b34:	e5d3300c 	ldrb	r3, [r3, #12]
80025b38:	e3530003 	cmp	r3, #3
80025b3c:	1a00000e 	bne	80025b7c <scheduler+0x78>
80025b40:	e51b3008 	ldr	r3, [fp, #-8]
80025b44:	e5933080 	ldr	r3, [r3, #128]	@ 0x80
80025b48:	e50b3010 	str	r3, [fp, #-16]
80025b4c:	e51b3008 	ldr	r3, [fp, #-8]
80025b50:	e5933088 	ldr	r3, [r3, #136]	@ 0x88
80025b54:	e3530000 	cmp	r3, #0
80025b58:	da000002 	ble	80025b68 <scheduler+0x64>
80025b5c:	e51b3010 	ldr	r3, [fp, #-16]
80025b60:	e1a03083 	lsl	r3, r3, #1
80025b64:	e50b3010 	str	r3, [fp, #-16]
80025b68:	e51b200c 	ldr	r2, [fp, #-12]
80025b6c:	e51b3010 	ldr	r3, [fp, #-16]
80025b70:	e0823003 	add	r3, r2, r3
80025b74:	e50b300c 	str	r3, [fp, #-12]
80025b78:	ea000000 	b	80025b80 <scheduler+0x7c>
80025b7c:	e1a00000 	nop			@ (mov r0, r0)
80025b80:	e51b3008 	ldr	r3, [fp, #-8]
80025b84:	e28330ac 	add	r3, r3, #172	@ 0xac
80025b88:	e50b3008 	str	r3, [fp, #-8]
80025b8c:	e51b3008 	ldr	r3, [fp, #-8]
80025b90:	e59f20c4 	ldr	r2, [pc, #196]	@ 80025c5c <scheduler+0x158>
80025b94:	e1530002 	cmp	r3, r2
80025b98:	3affffe4 	bcc	80025b30 <scheduler+0x2c>
80025b9c:	e51b300c 	ldr	r3, [fp, #-12]
80025ba0:	e3530000 	cmp	r3, #0
80025ba4:	da000027 	ble	80025c48 <scheduler+0x144>
80025ba8:	e51b000c 	ldr	r0, [fp, #-12]
80025bac:	ebffff98 	bl	80025a14 <hold_lottery>
80025bb0:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80025bb4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80025bb8:	e3530000 	cmp	r3, #0
80025bbc:	0a000021 	beq	80025c48 <scheduler+0x144>
80025bc0:	e59f2098 	ldr	r2, [pc, #152]	@ 80025c60 <scheduler+0x15c>
80025bc4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80025bc8:	e5823000 	str	r3, [r2]
80025bcc:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80025bd0:	eb000e92 	bl	80029620 <switchuvm>
80025bd4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80025bd8:	e3a02004 	mov	r2, #4
80025bdc:	e5c3200c 	strb	r2, [r3, #12]
80025be0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80025be4:	e5933084 	ldr	r3, [r3, #132]	@ 0x84
80025be8:	e2832001 	add	r2, r3, #1
80025bec:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80025bf0:	e5832084 	str	r2, [r3, #132]	@ 0x84
80025bf4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80025bf8:	e5933088 	ldr	r3, [r3, #136]	@ 0x88
80025bfc:	e3530000 	cmp	r3, #0
80025c00:	da000004 	ble	80025c18 <scheduler+0x114>
80025c04:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80025c08:	e5933088 	ldr	r3, [r3, #136]	@ 0x88
80025c0c:	e2432001 	sub	r2, r3, #1
80025c10:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80025c14:	e5832088 	str	r2, [r3, #136]	@ 0x88
80025c18:	e59f3044 	ldr	r3, [pc, #68]	@ 80025c64 <scheduler+0x160>
80025c1c:	e5933000 	ldr	r3, [r3]
80025c20:	e2832004 	add	r2, r3, #4
80025c24:	e59f3034 	ldr	r3, [pc, #52]	@ 80025c60 <scheduler+0x15c>
80025c28:	e5933000 	ldr	r3, [r3]
80025c2c:	e593301c 	ldr	r3, [r3, #28]
80025c30:	e1a01003 	mov	r1, r3
80025c34:	e1a00002 	mov	r0, r2
80025c38:	eb000395 	bl	80026a94 <swtch>
80025c3c:	e59f301c 	ldr	r3, [pc, #28]	@ 80025c60 <scheduler+0x15c>
80025c40:	e3a02000 	mov	r2, #0
80025c44:	e5832000 	str	r2, [r3]
80025c48:	e59f0004 	ldr	r0, [pc, #4]	@ 80025c54 <scheduler+0x150>
80025c4c:	eb00037b 	bl	80026a40 <release>
80025c50:	eaffffae 	b	80025b10 <scheduler+0xc>
80025c54:	800d6c70 	.word	0x800d6c70
80025c58:	800d6ca4 	.word	0x800d6ca4
80025c5c:	800d97a4 	.word	0x800d97a4
80025c60:	800d97a8 	.word	0x800d97a8
80025c64:	800d6c60 	.word	0x800d6c60

80025c68 <sched>:
80025c68:	e92d4800 	push	{fp, lr}
80025c6c:	e28db004 	add	fp, sp, #4
80025c70:	e24dd008 	sub	sp, sp, #8
80025c74:	e59f00b4 	ldr	r0, [pc, #180]	@ 80025d30 <sched+0xc8>
80025c78:	eb00037b 	bl	80026a6c <holding>
80025c7c:	e1a03000 	mov	r3, r0
80025c80:	e3530000 	cmp	r3, #0
80025c84:	1a000001 	bne	80025c90 <sched+0x28>
80025c88:	e59f00a4 	ldr	r0, [pc, #164]	@ 80025d34 <sched+0xcc>
80025c8c:	ebffef98 	bl	80021af4 <panic>
80025c90:	e59f30a0 	ldr	r3, [pc, #160]	@ 80025d38 <sched+0xd0>
80025c94:	e5933000 	ldr	r3, [r3]
80025c98:	e593300c 	ldr	r3, [r3, #12]
80025c9c:	e3530001 	cmp	r3, #1
80025ca0:	0a000001 	beq	80025cac <sched+0x44>
80025ca4:	e59f0090 	ldr	r0, [pc, #144]	@ 80025d3c <sched+0xd4>
80025ca8:	ebffef91 	bl	80021af4 <panic>
80025cac:	e59f308c 	ldr	r3, [pc, #140]	@ 80025d40 <sched+0xd8>
80025cb0:	e5933000 	ldr	r3, [r3]
80025cb4:	e5d3300c 	ldrb	r3, [r3, #12]
80025cb8:	e3530004 	cmp	r3, #4
80025cbc:	1a000001 	bne	80025cc8 <sched+0x60>
80025cc0:	e59f007c 	ldr	r0, [pc, #124]	@ 80025d44 <sched+0xdc>
80025cc4:	ebffef8a 	bl	80021af4 <panic>
80025cc8:	ebffea48 	bl	800205f0 <int_enabled>
80025ccc:	e1a03000 	mov	r3, r0
80025cd0:	e3530000 	cmp	r3, #0
80025cd4:	0a000001 	beq	80025ce0 <sched+0x78>
80025cd8:	e59f0068 	ldr	r0, [pc, #104]	@ 80025d48 <sched+0xe0>
80025cdc:	ebffef84 	bl	80021af4 <panic>
80025ce0:	e59f3050 	ldr	r3, [pc, #80]	@ 80025d38 <sched+0xd0>
80025ce4:	e5933000 	ldr	r3, [r3]
80025ce8:	e5933010 	ldr	r3, [r3, #16]
80025cec:	e50b3008 	str	r3, [fp, #-8]
80025cf0:	e59f3048 	ldr	r3, [pc, #72]	@ 80025d40 <sched+0xd8>
80025cf4:	e5933000 	ldr	r3, [r3]
80025cf8:	e283201c 	add	r2, r3, #28
80025cfc:	e59f3034 	ldr	r3, [pc, #52]	@ 80025d38 <sched+0xd0>
80025d00:	e5933000 	ldr	r3, [r3]
80025d04:	e5933004 	ldr	r3, [r3, #4]
80025d08:	e1a01003 	mov	r1, r3
80025d0c:	e1a00002 	mov	r0, r2
80025d10:	eb00035f 	bl	80026a94 <swtch>
80025d14:	e59f301c 	ldr	r3, [pc, #28]	@ 80025d38 <sched+0xd0>
80025d18:	e5933000 	ldr	r3, [r3]
80025d1c:	e51b2008 	ldr	r2, [fp, #-8]
80025d20:	e5832010 	str	r2, [r3, #16]
80025d24:	e1a00000 	nop			@ (mov r0, r0)
80025d28:	e24bd004 	sub	sp, fp, #4
80025d2c:	e8bd8800 	pop	{fp, pc}
80025d30:	800d6c70 	.word	0x800d6c70
80025d34:	8002ae68 	.word	0x8002ae68
80025d38:	800d6c60 	.word	0x800d6c60
80025d3c:	8002ae7c 	.word	0x8002ae7c
80025d40:	800d97a8 	.word	0x800d97a8
80025d44:	8002ae88 	.word	0x8002ae88
80025d48:	8002ae98 	.word	0x8002ae98

80025d4c <yield>:
80025d4c:	e92d4800 	push	{fp, lr}
80025d50:	e28db004 	add	fp, sp, #4
80025d54:	e59f0024 	ldr	r0, [pc, #36]	@ 80025d80 <yield+0x34>
80025d58:	eb00032d 	bl	80026a14 <acquire>
80025d5c:	e59f3020 	ldr	r3, [pc, #32]	@ 80025d84 <yield+0x38>
80025d60:	e5933000 	ldr	r3, [r3]
80025d64:	e3a02003 	mov	r2, #3
80025d68:	e5c3200c 	strb	r2, [r3, #12]
80025d6c:	ebffffbd 	bl	80025c68 <sched>
80025d70:	e59f0008 	ldr	r0, [pc, #8]	@ 80025d80 <yield+0x34>
80025d74:	eb000331 	bl	80026a40 <release>
80025d78:	e1a00000 	nop			@ (mov r0, r0)
80025d7c:	e8bd8800 	pop	{fp, pc}
80025d80:	800d6c70 	.word	0x800d6c70
80025d84:	800d97a8 	.word	0x800d97a8

80025d88 <forkret>:
80025d88:	e92d4800 	push	{fp, lr}
80025d8c:	e28db004 	add	fp, sp, #4
80025d90:	e59f0028 	ldr	r0, [pc, #40]	@ 80025dc0 <forkret+0x38>
80025d94:	eb000329 	bl	80026a40 <release>
80025d98:	e59f3024 	ldr	r3, [pc, #36]	@ 80025dc4 <forkret+0x3c>
80025d9c:	e5933000 	ldr	r3, [r3]
80025da0:	e3530000 	cmp	r3, #0
80025da4:	0a000003 	beq	80025db8 <forkret+0x30>
80025da8:	e59f3014 	ldr	r3, [pc, #20]	@ 80025dc4 <forkret+0x3c>
80025dac:	e3a02000 	mov	r2, #0
80025db0:	e5832000 	str	r2, [r3]
80025db4:	ebfff999 	bl	80024420 <initlog>
80025db8:	e1a00000 	nop			@ (mov r0, r0)
80025dbc:	e8bd8800 	pop	{fp, pc}
80025dc0:	800d6c70 	.word	0x800d6c70
80025dc4:	8002c018 	.word	0x8002c018

80025dc8 <sleep>:
80025dc8:	e92d4800 	push	{fp, lr}
80025dcc:	e28db004 	add	fp, sp, #4
80025dd0:	e24dd008 	sub	sp, sp, #8
80025dd4:	e50b0008 	str	r0, [fp, #-8]
80025dd8:	e50b100c 	str	r1, [fp, #-12]
80025ddc:	e59f30a4 	ldr	r3, [pc, #164]	@ 80025e88 <sleep+0xc0>
80025de0:	e5933000 	ldr	r3, [r3]
80025de4:	e3530000 	cmp	r3, #0
80025de8:	1a000001 	bne	80025df4 <sleep+0x2c>
80025dec:	e59f0098 	ldr	r0, [pc, #152]	@ 80025e8c <sleep+0xc4>
80025df0:	ebffef3f 	bl	80021af4 <panic>
80025df4:	e51b300c 	ldr	r3, [fp, #-12]
80025df8:	e3530000 	cmp	r3, #0
80025dfc:	1a000001 	bne	80025e08 <sleep+0x40>
80025e00:	e59f0088 	ldr	r0, [pc, #136]	@ 80025e90 <sleep+0xc8>
80025e04:	ebffef3a 	bl	80021af4 <panic>
80025e08:	e51b300c 	ldr	r3, [fp, #-12]
80025e0c:	e59f2080 	ldr	r2, [pc, #128]	@ 80025e94 <sleep+0xcc>
80025e10:	e1530002 	cmp	r3, r2
80025e14:	0a000003 	beq	80025e28 <sleep+0x60>
80025e18:	e59f0074 	ldr	r0, [pc, #116]	@ 80025e94 <sleep+0xcc>
80025e1c:	eb0002fc 	bl	80026a14 <acquire>
80025e20:	e51b000c 	ldr	r0, [fp, #-12]
80025e24:	eb000305 	bl	80026a40 <release>
80025e28:	e59f3058 	ldr	r3, [pc, #88]	@ 80025e88 <sleep+0xc0>
80025e2c:	e5933000 	ldr	r3, [r3]
80025e30:	e51b2008 	ldr	r2, [fp, #-8]
80025e34:	e5832020 	str	r2, [r3, #32]
80025e38:	e59f3048 	ldr	r3, [pc, #72]	@ 80025e88 <sleep+0xc0>
80025e3c:	e5933000 	ldr	r3, [r3]
80025e40:	e3a02002 	mov	r2, #2
80025e44:	e5c3200c 	strb	r2, [r3, #12]
80025e48:	ebffff86 	bl	80025c68 <sched>
80025e4c:	e59f3034 	ldr	r3, [pc, #52]	@ 80025e88 <sleep+0xc0>
80025e50:	e5933000 	ldr	r3, [r3]
80025e54:	e3a02000 	mov	r2, #0
80025e58:	e5832020 	str	r2, [r3, #32]
80025e5c:	e51b300c 	ldr	r3, [fp, #-12]
80025e60:	e59f202c 	ldr	r2, [pc, #44]	@ 80025e94 <sleep+0xcc>
80025e64:	e1530002 	cmp	r3, r2
80025e68:	0a000003 	beq	80025e7c <sleep+0xb4>
80025e6c:	e59f0020 	ldr	r0, [pc, #32]	@ 80025e94 <sleep+0xcc>
80025e70:	eb0002f2 	bl	80026a40 <release>
80025e74:	e51b000c 	ldr	r0, [fp, #-12]
80025e78:	eb0002e5 	bl	80026a14 <acquire>
80025e7c:	e1a00000 	nop			@ (mov r0, r0)
80025e80:	e24bd004 	sub	sp, fp, #4
80025e84:	e8bd8800 	pop	{fp, pc}
80025e88:	800d97a8 	.word	0x800d97a8
80025e8c:	8002aeac 	.word	0x8002aeac
80025e90:	8002aeb4 	.word	0x8002aeb4
80025e94:	800d6c70 	.word	0x800d6c70

80025e98 <wakeup1>:
80025e98:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80025e9c:	e28db000 	add	fp, sp, #0
80025ea0:	e24dd014 	sub	sp, sp, #20
80025ea4:	e50b0010 	str	r0, [fp, #-16]
80025ea8:	e59f30dc 	ldr	r3, [pc, #220]	@ 80025f8c <wakeup1+0xf4>
80025eac:	e50b3008 	str	r3, [fp, #-8]
80025eb0:	ea00002c 	b	80025f68 <wakeup1+0xd0>
80025eb4:	e51b3008 	ldr	r3, [fp, #-8]
80025eb8:	e5d3300c 	ldrb	r3, [r3, #12]
80025ebc:	e3530002 	cmp	r3, #2
80025ec0:	1a000024 	bne	80025f58 <wakeup1+0xc0>
80025ec4:	e51b3008 	ldr	r3, [fp, #-8]
80025ec8:	e5933020 	ldr	r3, [r3, #32]
80025ecc:	e51b2010 	ldr	r2, [fp, #-16]
80025ed0:	e1520003 	cmp	r2, r3
80025ed4:	1a00001f 	bne	80025f58 <wakeup1+0xc0>
80025ed8:	e51b3010 	ldr	r3, [fp, #-16]
80025edc:	e59f20ac 	ldr	r2, [pc, #172]	@ 80025f90 <wakeup1+0xf8>
80025ee0:	e1530002 	cmp	r3, r2
80025ee4:	1a000017 	bne	80025f48 <wakeup1+0xb0>
80025ee8:	e51b3008 	ldr	r3, [fp, #-8]
80025eec:	e5933094 	ldr	r3, [r3, #148]	@ 0x94
80025ef0:	e1a02003 	mov	r2, r3
80025ef4:	e59f3094 	ldr	r3, [pc, #148]	@ 80025f90 <wakeup1+0xf8>
80025ef8:	e5933000 	ldr	r3, [r3]
80025efc:	e1520003 	cmp	r2, r3
80025f00:	8a000015 	bhi	80025f5c <wakeup1+0xc4>
80025f04:	e51b3008 	ldr	r3, [fp, #-8]
80025f08:	e5932088 	ldr	r2, [r3, #136]	@ 0x88
80025f0c:	e51b3008 	ldr	r3, [fp, #-8]
80025f10:	e593308c 	ldr	r3, [r3, #140]	@ 0x8c
80025f14:	e0822003 	add	r2, r2, r3
80025f18:	e51b3008 	ldr	r3, [fp, #-8]
80025f1c:	e5832088 	str	r2, [r3, #136]	@ 0x88
80025f20:	e51b3008 	ldr	r3, [fp, #-8]
80025f24:	e3a02003 	mov	r2, #3
80025f28:	e5c3200c 	strb	r2, [r3, #12]
80025f2c:	e51b3008 	ldr	r3, [fp, #-8]
80025f30:	e3a02000 	mov	r2, #0
80025f34:	e583208c 	str	r2, [r3, #140]	@ 0x8c
80025f38:	e51b3008 	ldr	r3, [fp, #-8]
80025f3c:	e3a02000 	mov	r2, #0
80025f40:	e5832094 	str	r2, [r3, #148]	@ 0x94
80025f44:	ea000004 	b	80025f5c <wakeup1+0xc4>
80025f48:	e51b3008 	ldr	r3, [fp, #-8]
80025f4c:	e3a02003 	mov	r2, #3
80025f50:	e5c3200c 	strb	r2, [r3, #12]
80025f54:	ea000000 	b	80025f5c <wakeup1+0xc4>
80025f58:	e1a00000 	nop			@ (mov r0, r0)
80025f5c:	e51b3008 	ldr	r3, [fp, #-8]
80025f60:	e28330ac 	add	r3, r3, #172	@ 0xac
80025f64:	e50b3008 	str	r3, [fp, #-8]
80025f68:	e51b3008 	ldr	r3, [fp, #-8]
80025f6c:	e59f2020 	ldr	r2, [pc, #32]	@ 80025f94 <wakeup1+0xfc>
80025f70:	e1530002 	cmp	r3, r2
80025f74:	3affffce 	bcc	80025eb4 <wakeup1+0x1c>
80025f78:	e1a00000 	nop			@ (mov r0, r0)
80025f7c:	e1a00000 	nop			@ (mov r0, r0)
80025f80:	e28bd000 	add	sp, fp, #0
80025f84:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80025f88:	e12fff1e 	bx	lr
80025f8c:	800d6ca4 	.word	0x800d6ca4
80025f90:	800d98dc 	.word	0x800d98dc
80025f94:	800d97a4 	.word	0x800d97a4

80025f98 <wakeup>:
80025f98:	e92d4800 	push	{fp, lr}
80025f9c:	e28db004 	add	fp, sp, #4
80025fa0:	e24dd008 	sub	sp, sp, #8
80025fa4:	e50b0008 	str	r0, [fp, #-8]
80025fa8:	e59f001c 	ldr	r0, [pc, #28]	@ 80025fcc <wakeup+0x34>
80025fac:	eb000298 	bl	80026a14 <acquire>
80025fb0:	e51b0008 	ldr	r0, [fp, #-8]
80025fb4:	ebffffb7 	bl	80025e98 <wakeup1>
80025fb8:	e59f000c 	ldr	r0, [pc, #12]	@ 80025fcc <wakeup+0x34>
80025fbc:	eb00029f 	bl	80026a40 <release>
80025fc0:	e1a00000 	nop			@ (mov r0, r0)
80025fc4:	e24bd004 	sub	sp, fp, #4
80025fc8:	e8bd8800 	pop	{fp, pc}
80025fcc:	800d6c70 	.word	0x800d6c70

80025fd0 <kill>:
80025fd0:	e92d4800 	push	{fp, lr}
80025fd4:	e28db004 	add	fp, sp, #4
80025fd8:	e24dd010 	sub	sp, sp, #16
80025fdc:	e50b0010 	str	r0, [fp, #-16]
80025fe0:	e59f008c 	ldr	r0, [pc, #140]	@ 80026074 <kill+0xa4>
80025fe4:	eb00028a 	bl	80026a14 <acquire>
80025fe8:	e59f3088 	ldr	r3, [pc, #136]	@ 80026078 <kill+0xa8>
80025fec:	e50b3008 	str	r3, [fp, #-8]
80025ff0:	ea000015 	b	8002604c <kill+0x7c>
80025ff4:	e51b3008 	ldr	r3, [fp, #-8]
80025ff8:	e5933010 	ldr	r3, [r3, #16]
80025ffc:	e51b2010 	ldr	r2, [fp, #-16]
80026000:	e1520003 	cmp	r2, r3
80026004:	1a00000d 	bne	80026040 <kill+0x70>
80026008:	e51b3008 	ldr	r3, [fp, #-8]
8002600c:	e3a02001 	mov	r2, #1
80026010:	e5832024 	str	r2, [r3, #36]	@ 0x24
80026014:	e51b3008 	ldr	r3, [fp, #-8]
80026018:	e5d3300c 	ldrb	r3, [r3, #12]
8002601c:	e3530002 	cmp	r3, #2
80026020:	1a000002 	bne	80026030 <kill+0x60>
80026024:	e51b3008 	ldr	r3, [fp, #-8]
80026028:	e3a02003 	mov	r2, #3
8002602c:	e5c3200c 	strb	r2, [r3, #12]
80026030:	e59f003c 	ldr	r0, [pc, #60]	@ 80026074 <kill+0xa4>
80026034:	eb000281 	bl	80026a40 <release>
80026038:	e3a03000 	mov	r3, #0
8002603c:	ea000009 	b	80026068 <kill+0x98>
80026040:	e51b3008 	ldr	r3, [fp, #-8]
80026044:	e28330ac 	add	r3, r3, #172	@ 0xac
80026048:	e50b3008 	str	r3, [fp, #-8]
8002604c:	e51b3008 	ldr	r3, [fp, #-8]
80026050:	e59f2024 	ldr	r2, [pc, #36]	@ 8002607c <kill+0xac>
80026054:	e1530002 	cmp	r3, r2
80026058:	3affffe5 	bcc	80025ff4 <kill+0x24>
8002605c:	e59f0010 	ldr	r0, [pc, #16]	@ 80026074 <kill+0xa4>
80026060:	eb000276 	bl	80026a40 <release>
80026064:	e3e03000 	mvn	r3, #0
80026068:	e1a00003 	mov	r0, r3
8002606c:	e24bd004 	sub	sp, fp, #4
80026070:	e8bd8800 	pop	{fp, pc}
80026074:	800d6c70 	.word	0x800d6c70
80026078:	800d6ca4 	.word	0x800d6ca4
8002607c:	800d97a4 	.word	0x800d97a4

80026080 <procdump>:
80026080:	e92d4800 	push	{fp, lr}
80026084:	e28db004 	add	fp, sp, #4
80026088:	e24dd008 	sub	sp, sp, #8
8002608c:	e59f30b8 	ldr	r3, [pc, #184]	@ 8002614c <procdump+0xcc>
80026090:	e50b3008 	str	r3, [fp, #-8]
80026094:	ea000023 	b	80026128 <procdump+0xa8>
80026098:	e51b3008 	ldr	r3, [fp, #-8]
8002609c:	e5d3300c 	ldrb	r3, [r3, #12]
800260a0:	e3530000 	cmp	r3, #0
800260a4:	0a00001b 	beq	80026118 <procdump+0x98>
800260a8:	e51b3008 	ldr	r3, [fp, #-8]
800260ac:	e5d3300c 	ldrb	r3, [r3, #12]
800260b0:	e3530005 	cmp	r3, #5
800260b4:	8a00000d 	bhi	800260f0 <procdump+0x70>
800260b8:	e51b3008 	ldr	r3, [fp, #-8]
800260bc:	e5d3300c 	ldrb	r3, [r3, #12]
800260c0:	e1a02003 	mov	r2, r3
800260c4:	e59f3084 	ldr	r3, [pc, #132]	@ 80026150 <procdump+0xd0>
800260c8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
800260cc:	e3530000 	cmp	r3, #0
800260d0:	0a000006 	beq	800260f0 <procdump+0x70>
800260d4:	e51b3008 	ldr	r3, [fp, #-8]
800260d8:	e5d3300c 	ldrb	r3, [r3, #12]
800260dc:	e1a02003 	mov	r2, r3
800260e0:	e59f3068 	ldr	r3, [pc, #104]	@ 80026150 <procdump+0xd0>
800260e4:	e7933102 	ldr	r3, [r3, r2, lsl #2]
800260e8:	e50b300c 	str	r3, [fp, #-12]
800260ec:	ea000001 	b	800260f8 <procdump+0x78>
800260f0:	e59f305c 	ldr	r3, [pc, #92]	@ 80026154 <procdump+0xd4>
800260f4:	e50b300c 	str	r3, [fp, #-12]
800260f8:	e51b3008 	ldr	r3, [fp, #-8]
800260fc:	e5931010 	ldr	r1, [r3, #16]
80026100:	e51b3008 	ldr	r3, [fp, #-8]
80026104:	e283306c 	add	r3, r3, #108	@ 0x6c
80026108:	e51b200c 	ldr	r2, [fp, #-12]
8002610c:	e59f0044 	ldr	r0, [pc, #68]	@ 80026158 <procdump+0xd8>
80026110:	ebffeddf 	bl	80021894 <cprintf>
80026114:	ea000000 	b	8002611c <procdump+0x9c>
80026118:	e1a00000 	nop			@ (mov r0, r0)
8002611c:	e51b3008 	ldr	r3, [fp, #-8]
80026120:	e28330ac 	add	r3, r3, #172	@ 0xac
80026124:	e50b3008 	str	r3, [fp, #-8]
80026128:	e51b3008 	ldr	r3, [fp, #-8]
8002612c:	e59f2028 	ldr	r2, [pc, #40]	@ 8002615c <procdump+0xdc>
80026130:	e1530002 	cmp	r3, r2
80026134:	3affffd7 	bcc	80026098 <procdump+0x18>
80026138:	e59f0020 	ldr	r0, [pc, #32]	@ 80026160 <procdump+0xe0>
8002613c:	ebffe9b2 	bl	8002080c <show_callstk>
80026140:	e1a00000 	nop			@ (mov r0, r0)
80026144:	e24bd004 	sub	sp, fp, #4
80026148:	e8bd8800 	pop	{fp, pc}
8002614c:	800d6ca4 	.word	0x800d6ca4
80026150:	8002c01c 	.word	0x8002c01c
80026154:	8002aec8 	.word	0x8002aec8
80026158:	8002aecc 	.word	0x8002aecc
8002615c:	800d97a4 	.word	0x800d97a4
80026160:	8002aed8 	.word	0x8002aed8

80026164 <ps>:
80026164:	e92d4800 	push	{fp, lr}
80026168:	e28db004 	add	fp, sp, #4
8002616c:	e24dd010 	sub	sp, sp, #16
80026170:	e59f00c8 	ldr	r0, [pc, #200]	@ 80026240 <ps+0xdc>
80026174:	eb000226 	bl	80026a14 <acquire>
80026178:	e59f00c4 	ldr	r0, [pc, #196]	@ 80026244 <ps+0xe0>
8002617c:	ebffedc4 	bl	80021894 <cprintf>
80026180:	e59f30c0 	ldr	r3, [pc, #192]	@ 80026248 <ps+0xe4>
80026184:	e50b3008 	str	r3, [fp, #-8]
80026188:	ea000022 	b	80026218 <ps+0xb4>
8002618c:	e51b3008 	ldr	r3, [fp, #-8]
80026190:	e5d3300c 	ldrb	r3, [r3, #12]
80026194:	e3530000 	cmp	r3, #0
80026198:	0a00001a 	beq	80026208 <ps+0xa4>
8002619c:	e51b3008 	ldr	r3, [fp, #-8]
800261a0:	e5930010 	ldr	r0, [r3, #16]
800261a4:	e51b3008 	ldr	r3, [fp, #-8]
800261a8:	e5933014 	ldr	r3, [r3, #20]
800261ac:	e3530000 	cmp	r3, #0
800261b0:	0a000003 	beq	800261c4 <ps+0x60>
800261b4:	e51b3008 	ldr	r3, [fp, #-8]
800261b8:	e5933014 	ldr	r3, [r3, #20]
800261bc:	e5932010 	ldr	r2, [r3, #16]
800261c0:	ea000000 	b	800261c8 <ps+0x64>
800261c4:	e3a02000 	mov	r2, #0
800261c8:	e51b3008 	ldr	r3, [fp, #-8]
800261cc:	e283c06c 	add	ip, r3, #108	@ 0x6c
800261d0:	e51b3008 	ldr	r3, [fp, #-8]
800261d4:	e5d3300c 	ldrb	r3, [r3, #12]
800261d8:	e1a01003 	mov	r1, r3
800261dc:	e59f3068 	ldr	r3, [pc, #104]	@ 8002624c <ps+0xe8>
800261e0:	e7933101 	ldr	r3, [r3, r1, lsl #2]
800261e4:	e51b1008 	ldr	r1, [fp, #-8]
800261e8:	e591107c 	ldr	r1, [r1, #124]	@ 0x7c
800261ec:	e58d1004 	str	r1, [sp, #4]
800261f0:	e58d3000 	str	r3, [sp]
800261f4:	e1a0300c 	mov	r3, ip
800261f8:	e1a01000 	mov	r1, r0
800261fc:	e59f004c 	ldr	r0, [pc, #76]	@ 80026250 <ps+0xec>
80026200:	ebffeda3 	bl	80021894 <cprintf>
80026204:	ea000000 	b	8002620c <ps+0xa8>
80026208:	e1a00000 	nop			@ (mov r0, r0)
8002620c:	e51b3008 	ldr	r3, [fp, #-8]
80026210:	e28330ac 	add	r3, r3, #172	@ 0xac
80026214:	e50b3008 	str	r3, [fp, #-8]
80026218:	e51b3008 	ldr	r3, [fp, #-8]
8002621c:	e59f2030 	ldr	r2, [pc, #48]	@ 80026254 <ps+0xf0>
80026220:	e1530002 	cmp	r3, r2
80026224:	3affffd8 	bcc	8002618c <ps+0x28>
80026228:	e59f0010 	ldr	r0, [pc, #16]	@ 80026240 <ps+0xdc>
8002622c:	eb000203 	bl	80026a40 <release>
80026230:	e3a03000 	mov	r3, #0
80026234:	e1a00003 	mov	r0, r3
80026238:	e24bd004 	sub	sp, fp, #4
8002623c:	e8bd8800 	pop	{fp, pc}
80026240:	800d6c70 	.word	0x800d6c70
80026244:	8002aee4 	.word	0x8002aee4
80026248:	800d6ca4 	.word	0x800d6ca4
8002624c:	8002c034 	.word	0x8002c034
80026250:	8002af08 	.word	0x8002af08
80026254:	800d97a4 	.word	0x800d97a4

80026258 <settickets>:
80026258:	e92d4800 	push	{fp, lr}
8002625c:	e28db004 	add	fp, sp, #4
80026260:	e24dd010 	sub	sp, sp, #16
80026264:	e50b0010 	str	r0, [fp, #-16]
80026268:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
8002626c:	e3a03000 	mov	r3, #0
80026270:	e50b300c 	str	r3, [fp, #-12]
80026274:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026278:	e3530000 	cmp	r3, #0
8002627c:	ca000001 	bgt	80026288 <settickets+0x30>
80026280:	e3e03000 	mvn	r3, #0
80026284:	ea00001e 	b	80026304 <settickets+0xac>
80026288:	e59f0080 	ldr	r0, [pc, #128]	@ 80026310 <settickets+0xb8>
8002628c:	eb0001e0 	bl	80026a14 <acquire>
80026290:	e59f307c 	ldr	r3, [pc, #124]	@ 80026314 <settickets+0xbc>
80026294:	e50b3008 	str	r3, [fp, #-8]
80026298:	ea00000d 	b	800262d4 <settickets+0x7c>
8002629c:	e51b3008 	ldr	r3, [fp, #-8]
800262a0:	e5933010 	ldr	r3, [r3, #16]
800262a4:	e51b2010 	ldr	r2, [fp, #-16]
800262a8:	e1520003 	cmp	r2, r3
800262ac:	1a000005 	bne	800262c8 <settickets+0x70>
800262b0:	e51b3008 	ldr	r3, [fp, #-8]
800262b4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800262b8:	e5832080 	str	r2, [r3, #128]	@ 0x80
800262bc:	e3a03001 	mov	r3, #1
800262c0:	e50b300c 	str	r3, [fp, #-12]
800262c4:	ea000006 	b	800262e4 <settickets+0x8c>
800262c8:	e51b3008 	ldr	r3, [fp, #-8]
800262cc:	e28330ac 	add	r3, r3, #172	@ 0xac
800262d0:	e50b3008 	str	r3, [fp, #-8]
800262d4:	e51b3008 	ldr	r3, [fp, #-8]
800262d8:	e59f2038 	ldr	r2, [pc, #56]	@ 80026318 <settickets+0xc0>
800262dc:	e1530002 	cmp	r3, r2
800262e0:	3affffed 	bcc	8002629c <settickets+0x44>
800262e4:	e59f0024 	ldr	r0, [pc, #36]	@ 80026310 <settickets+0xb8>
800262e8:	eb0001d4 	bl	80026a40 <release>
800262ec:	e51b300c 	ldr	r3, [fp, #-12]
800262f0:	e3530000 	cmp	r3, #0
800262f4:	0a000001 	beq	80026300 <settickets+0xa8>
800262f8:	e3a03000 	mov	r3, #0
800262fc:	ea000000 	b	80026304 <settickets+0xac>
80026300:	e3e03000 	mvn	r3, #0
80026304:	e1a00003 	mov	r0, r3
80026308:	e24bd004 	sub	sp, fp, #4
8002630c:	e8bd8800 	pop	{fp, pc}
80026310:	800d6c70 	.word	0x800d6c70
80026314:	800d6ca4 	.word	0x800d6ca4
80026318:	800d97a4 	.word	0x800d97a4

8002631c <getpinfo>:
8002631c:	e92d4800 	push	{fp, lr}
80026320:	e28db004 	add	fp, sp, #4
80026324:	e24dd010 	sub	sp, sp, #16
80026328:	e50b0010 	str	r0, [fp, #-16]
8002632c:	e3a03000 	mov	r3, #0
80026330:	e50b300c 	str	r3, [fp, #-12]
80026334:	e51b3010 	ldr	r3, [fp, #-16]
80026338:	e3530000 	cmp	r3, #0
8002633c:	1a000001 	bne	80026348 <getpinfo+0x2c>
80026340:	e3e03000 	mvn	r3, #0
80026344:	ea000033 	b	80026418 <getpinfo+0xfc>
80026348:	e59f00d4 	ldr	r0, [pc, #212]	@ 80026424 <getpinfo+0x108>
8002634c:	eb0001b0 	bl	80026a14 <acquire>
80026350:	e59f30d0 	ldr	r3, [pc, #208]	@ 80026428 <getpinfo+0x10c>
80026354:	e50b3008 	str	r3, [fp, #-8]
80026358:	ea000027 	b	800263fc <getpinfo+0xe0>
8002635c:	e51b3008 	ldr	r3, [fp, #-8]
80026360:	e5d3300c 	ldrb	r3, [r3, #12]
80026364:	e3530000 	cmp	r3, #0
80026368:	13a03001 	movne	r3, #1
8002636c:	03a03000 	moveq	r3, #0
80026370:	e6ef3073 	uxtb	r3, r3
80026374:	e1a01003 	mov	r1, r3
80026378:	e51b3010 	ldr	r3, [fp, #-16]
8002637c:	e51b200c 	ldr	r2, [fp, #-12]
80026380:	e7831102 	str	r1, [r3, r2, lsl #2]
80026384:	e51b3008 	ldr	r3, [fp, #-8]
80026388:	e5931010 	ldr	r1, [r3, #16]
8002638c:	e51b3010 	ldr	r3, [fp, #-16]
80026390:	e51b200c 	ldr	r2, [fp, #-12]
80026394:	e2822040 	add	r2, r2, #64	@ 0x40
80026398:	e7831102 	str	r1, [r3, r2, lsl #2]
8002639c:	e51b3008 	ldr	r3, [fp, #-8]
800263a0:	e5931080 	ldr	r1, [r3, #128]	@ 0x80
800263a4:	e51b3010 	ldr	r3, [fp, #-16]
800263a8:	e51b200c 	ldr	r2, [fp, #-12]
800263ac:	e2822080 	add	r2, r2, #128	@ 0x80
800263b0:	e7831102 	str	r1, [r3, r2, lsl #2]
800263b4:	e51b3008 	ldr	r3, [fp, #-8]
800263b8:	e5931084 	ldr	r1, [r3, #132]	@ 0x84
800263bc:	e51b3010 	ldr	r3, [fp, #-16]
800263c0:	e51b200c 	ldr	r2, [fp, #-12]
800263c4:	e28220c0 	add	r2, r2, #192	@ 0xc0
800263c8:	e7831102 	str	r1, [r3, r2, lsl #2]
800263cc:	e51b3008 	ldr	r3, [fp, #-8]
800263d0:	e5931088 	ldr	r1, [r3, #136]	@ 0x88
800263d4:	e51b3010 	ldr	r3, [fp, #-16]
800263d8:	e51b200c 	ldr	r2, [fp, #-12]
800263dc:	e2822c01 	add	r2, r2, #256	@ 0x100
800263e0:	e7831102 	str	r1, [r3, r2, lsl #2]
800263e4:	e51b3008 	ldr	r3, [fp, #-8]
800263e8:	e28330ac 	add	r3, r3, #172	@ 0xac
800263ec:	e50b3008 	str	r3, [fp, #-8]
800263f0:	e51b300c 	ldr	r3, [fp, #-12]
800263f4:	e2833001 	add	r3, r3, #1
800263f8:	e50b300c 	str	r3, [fp, #-12]
800263fc:	e51b3008 	ldr	r3, [fp, #-8]
80026400:	e59f2024 	ldr	r2, [pc, #36]	@ 8002642c <getpinfo+0x110>
80026404:	e1530002 	cmp	r3, r2
80026408:	3affffd3 	bcc	8002635c <getpinfo+0x40>
8002640c:	e59f0010 	ldr	r0, [pc, #16]	@ 80026424 <getpinfo+0x108>
80026410:	eb00018a 	bl	80026a40 <release>
80026414:	e3a03000 	mov	r3, #0
80026418:	e1a00003 	mov	r0, r3
8002641c:	e24bd004 	sub	sp, fp, #4
80026420:	e8bd8800 	pop	{fp, pc}
80026424:	800d6c70 	.word	0x800d6c70
80026428:	800d6ca4 	.word	0x800d6ca4
8002642c:	800d97a4 	.word	0x800d97a4

80026430 <thread_create>:
80026430:	e92d4810 	push	{r4, fp, lr}
80026434:	e28db008 	add	fp, sp, #8
80026438:	e24dd024 	sub	sp, sp, #36	@ 0x24
8002643c:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80026440:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
80026444:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
80026448:	ebfffb3a 	bl	80025138 <allocproc>
8002644c:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80026450:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026454:	e3530000 	cmp	r3, #0
80026458:	1a000001 	bne	80026464 <thread_create+0x34>
8002645c:	e3e03000 	mvn	r3, #0
80026460:	ea0000a8 	b	80026708 <thread_create+0x2d8>
80026464:	e59f32a8 	ldr	r3, [pc, #680]	@ 80026714 <thread_create+0x2e4>
80026468:	e5933000 	ldr	r3, [r3]
8002646c:	e5932004 	ldr	r2, [r3, #4]
80026470:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026474:	e5832004 	str	r2, [r3, #4]
80026478:	e59f3294 	ldr	r3, [pc, #660]	@ 80026714 <thread_create+0x2e4>
8002647c:	e5933000 	ldr	r3, [r3]
80026480:	e5932000 	ldr	r2, [r3]
80026484:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026488:	e5832000 	str	r2, [r3]
8002648c:	e59f3280 	ldr	r3, [pc, #640]	@ 80026714 <thread_create+0x2e4>
80026490:	e5933000 	ldr	r3, [r3]
80026494:	e593309c 	ldr	r3, [r3, #156]	@ 0x9c
80026498:	e3530000 	cmp	r3, #0
8002649c:	0a000003 	beq	800264b0 <thread_create+0x80>
800264a0:	e59f326c 	ldr	r3, [pc, #620]	@ 80026714 <thread_create+0x2e4>
800264a4:	e5933000 	ldr	r3, [r3]
800264a8:	e59330a0 	ldr	r3, [r3, #160]	@ 0xa0
800264ac:	ea000001 	b	800264b8 <thread_create+0x88>
800264b0:	e59f325c 	ldr	r3, [pc, #604]	@ 80026714 <thread_create+0x2e4>
800264b4:	e5933000 	ldr	r3, [r3]
800264b8:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800264bc:	e58230a0 	str	r3, [r2, #160]	@ 0xa0
800264c0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800264c4:	e3a02001 	mov	r2, #1
800264c8:	e583209c 	str	r2, [r3, #156]	@ 0x9c
800264cc:	e59f3240 	ldr	r3, [pc, #576]	@ 80026714 <thread_create+0x2e4>
800264d0:	e5933000 	ldr	r3, [r3]
800264d4:	e5932018 	ldr	r2, [r3, #24]
800264d8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800264dc:	e5933018 	ldr	r3, [r3, #24]
800264e0:	e1a00003 	mov	r0, r3
800264e4:	e1a01002 	mov	r1, r2
800264e8:	e3a03048 	mov	r3, #72	@ 0x48
800264ec:	e1a02003 	mov	r2, r3
800264f0:	ebffe773 	bl	800202c4 <memcpy>
800264f4:	e59f3218 	ldr	r3, [pc, #536]	@ 80026714 <thread_create+0x2e4>
800264f8:	e5933000 	ldr	r3, [r3]
800264fc:	e5933000 	ldr	r3, [r3]
80026500:	e2833eff 	add	r3, r3, #4080	@ 0xff0
80026504:	e283300f 	add	r3, r3, #15
80026508:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
8002650c:	e3c3300f 	bic	r3, r3, #15
80026510:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80026514:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026518:	e5930004 	ldr	r0, [r3, #4]
8002651c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80026520:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80026524:	e1a02003 	mov	r2, r3
80026528:	e51b1018 	ldr	r1, [fp, #-24]	@ 0xffffffe8
8002652c:	eb000cc0 	bl	80029834 <allocuvm>
80026530:	e1a03000 	mov	r3, r0
80026534:	e3530000 	cmp	r3, #0
80026538:	1a000004 	bne	80026550 <thread_create+0x120>
8002653c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026540:	e3a02000 	mov	r2, #0
80026544:	e5c3200c 	strb	r2, [r3, #12]
80026548:	e3e03000 	mvn	r3, #0
8002654c:	ea00006d 	b	80026708 <thread_create+0x2d8>
80026550:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80026554:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026558:	e58320a4 	str	r2, [r3, #164]	@ 0xa4
8002655c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80026560:	e2832a01 	add	r2, r3, #4096	@ 0x1000
80026564:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026568:	e5832000 	str	r2, [r3]
8002656c:	e59f31a0 	ldr	r3, [pc, #416]	@ 80026714 <thread_create+0x2e4>
80026570:	e5933000 	ldr	r3, [r3]
80026574:	e5932000 	ldr	r2, [r3]
80026578:	e59f3194 	ldr	r3, [pc, #404]	@ 80026714 <thread_create+0x2e4>
8002657c:	e5933000 	ldr	r3, [r3]
80026580:	e2822a01 	add	r2, r2, #4096	@ 0x1000
80026584:	e5832000 	str	r2, [r3]
80026588:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002658c:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80026590:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80026594:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80026598:	e2433004 	sub	r3, r3, #4
8002659c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
800265a0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
800265a4:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
800265a8:	e5832000 	str	r2, [r3]
800265ac:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800265b0:	e5933018 	ldr	r3, [r3, #24]
800265b4:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
800265b8:	e5832000 	str	r2, [r3]
800265bc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800265c0:	e5933018 	ldr	r3, [r3, #24]
800265c4:	e3a02000 	mov	r2, #0
800265c8:	e5832004 	str	r2, [r3, #4]
800265cc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800265d0:	e5933018 	ldr	r3, [r3, #24]
800265d4:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
800265d8:	e5832044 	str	r2, [r3, #68]	@ 0x44
800265dc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800265e0:	e5934018 	ldr	r4, [r3, #24]
800265e4:	ebffe7f1 	bl	800205b0 <spsr_usr>
800265e8:	e1a03000 	mov	r3, r0
800265ec:	e584300c 	str	r3, [r4, #12]
800265f0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800265f4:	e5933018 	ldr	r3, [r3, #24]
800265f8:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
800265fc:	e5832010 	str	r2, [r3, #16]
80026600:	e3a03000 	mov	r3, #0
80026604:	e50b3010 	str	r3, [fp, #-16]
80026608:	ea000015 	b	80026664 <thread_create+0x234>
8002660c:	e59f3100 	ldr	r3, [pc, #256]	@ 80026714 <thread_create+0x2e4>
80026610:	e5933000 	ldr	r3, [r3]
80026614:	e51b2010 	ldr	r2, [fp, #-16]
80026618:	e282200a 	add	r2, r2, #10
8002661c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80026620:	e3530000 	cmp	r3, #0
80026624:	0a00000b 	beq	80026658 <thread_create+0x228>
80026628:	e59f30e4 	ldr	r3, [pc, #228]	@ 80026714 <thread_create+0x2e4>
8002662c:	e5933000 	ldr	r3, [r3]
80026630:	e51b2010 	ldr	r2, [fp, #-16]
80026634:	e282200a 	add	r2, r2, #10
80026638:	e7933102 	ldr	r3, [r3, r2, lsl #2]
8002663c:	e1a00003 	mov	r0, r3
80026640:	ebfff027 	bl	800226e4 <filedup>
80026644:	e1a01000 	mov	r1, r0
80026648:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8002664c:	e51b2010 	ldr	r2, [fp, #-16]
80026650:	e282200a 	add	r2, r2, #10
80026654:	e7831102 	str	r1, [r3, r2, lsl #2]
80026658:	e51b3010 	ldr	r3, [fp, #-16]
8002665c:	e2833001 	add	r3, r3, #1
80026660:	e50b3010 	str	r3, [fp, #-16]
80026664:	e51b3010 	ldr	r3, [fp, #-16]
80026668:	e353000f 	cmp	r3, #15
8002666c:	daffffe6 	ble	8002660c <thread_create+0x1dc>
80026670:	e59f309c 	ldr	r3, [pc, #156]	@ 80026714 <thread_create+0x2e4>
80026674:	e5933000 	ldr	r3, [r3]
80026678:	e5933068 	ldr	r3, [r3, #104]	@ 0x68
8002667c:	e1a00003 	mov	r0, r3
80026680:	ebfff2e9 	bl	8002322c <idup>
80026684:	e1a02000 	mov	r2, r0
80026688:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8002668c:	e5832068 	str	r2, [r3, #104]	@ 0x68
80026690:	e59f307c 	ldr	r3, [pc, #124]	@ 80026714 <thread_create+0x2e4>
80026694:	e5932000 	ldr	r2, [r3]
80026698:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8002669c:	e5832014 	str	r2, [r3, #20]
800266a0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800266a4:	e3a02003 	mov	r2, #3
800266a8:	e5c3200c 	strb	r2, [r3, #12]
800266ac:	e59f3060 	ldr	r3, [pc, #96]	@ 80026714 <thread_create+0x2e4>
800266b0:	e5933000 	ldr	r3, [r3]
800266b4:	e5930004 	ldr	r0, [r3, #4]
800266b8:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
800266bc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800266c0:	e2832010 	add	r2, r3, #16
800266c4:	e3a03004 	mov	r3, #4
800266c8:	eb000da3 	bl	80029d5c <copyout>
800266cc:	e1a03000 	mov	r3, r0
800266d0:	e3530000 	cmp	r3, #0
800266d4:	aa000001 	bge	800266e0 <thread_create+0x2b0>
800266d8:	e3e03000 	mvn	r3, #0
800266dc:	ea000009 	b	80026708 <thread_create+0x2d8>
800266e0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800266e4:	e283006c 	add	r0, r3, #108	@ 0x6c
800266e8:	e59f3024 	ldr	r3, [pc, #36]	@ 80026714 <thread_create+0x2e4>
800266ec:	e5933000 	ldr	r3, [r3]
800266f0:	e283306c 	add	r3, r3, #108	@ 0x6c
800266f4:	e3a02010 	mov	r2, #16
800266f8:	e1a01003 	mov	r1, r3
800266fc:	ebffe753 	bl	80020450 <safestrcpy>
80026700:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026704:	e5933010 	ldr	r3, [r3, #16]
80026708:	e1a00003 	mov	r0, r3
8002670c:	e24bd008 	sub	sp, fp, #8
80026710:	e8bd8810 	pop	{r4, fp, pc}
80026714:	800d97a8 	.word	0x800d97a8

80026718 <thread_exit>:
80026718:	e92d4800 	push	{fp, lr}
8002671c:	e28db004 	add	fp, sp, #4
80026720:	e24dd008 	sub	sp, sp, #8
80026724:	e59f30e8 	ldr	r3, [pc, #232]	@ 80026814 <thread_exit+0xfc>
80026728:	e5933000 	ldr	r3, [r3]
8002672c:	e593309c 	ldr	r3, [r3, #156]	@ 0x9c
80026730:	e3530000 	cmp	r3, #0
80026734:	0a000033 	beq	80026808 <thread_exit+0xf0>
80026738:	e3a03000 	mov	r3, #0
8002673c:	e50b3008 	str	r3, [fp, #-8]
80026740:	ea000016 	b	800267a0 <thread_exit+0x88>
80026744:	e59f30c8 	ldr	r3, [pc, #200]	@ 80026814 <thread_exit+0xfc>
80026748:	e5933000 	ldr	r3, [r3]
8002674c:	e51b2008 	ldr	r2, [fp, #-8]
80026750:	e282200a 	add	r2, r2, #10
80026754:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80026758:	e3530000 	cmp	r3, #0
8002675c:	0a00000c 	beq	80026794 <thread_exit+0x7c>
80026760:	e59f30ac 	ldr	r3, [pc, #172]	@ 80026814 <thread_exit+0xfc>
80026764:	e5933000 	ldr	r3, [r3]
80026768:	e51b2008 	ldr	r2, [fp, #-8]
8002676c:	e282200a 	add	r2, r2, #10
80026770:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80026774:	e1a00003 	mov	r0, r3
80026778:	ebffeff2 	bl	80022748 <fileclose>
8002677c:	e59f3090 	ldr	r3, [pc, #144]	@ 80026814 <thread_exit+0xfc>
80026780:	e5933000 	ldr	r3, [r3]
80026784:	e51b2008 	ldr	r2, [fp, #-8]
80026788:	e282200a 	add	r2, r2, #10
8002678c:	e3a01000 	mov	r1, #0
80026790:	e7831102 	str	r1, [r3, r2, lsl #2]
80026794:	e51b3008 	ldr	r3, [fp, #-8]
80026798:	e2833001 	add	r3, r3, #1
8002679c:	e50b3008 	str	r3, [fp, #-8]
800267a0:	e51b3008 	ldr	r3, [fp, #-8]
800267a4:	e353000f 	cmp	r3, #15
800267a8:	daffffe5 	ble	80026744 <thread_exit+0x2c>
800267ac:	e59f3060 	ldr	r3, [pc, #96]	@ 80026814 <thread_exit+0xfc>
800267b0:	e5933000 	ldr	r3, [r3]
800267b4:	e5933068 	ldr	r3, [r3, #104]	@ 0x68
800267b8:	e1a00003 	mov	r0, r3
800267bc:	ebfff332 	bl	8002348c <iput>
800267c0:	e59f304c 	ldr	r3, [pc, #76]	@ 80026814 <thread_exit+0xfc>
800267c4:	e5933000 	ldr	r3, [r3]
800267c8:	e3a02000 	mov	r2, #0
800267cc:	e5832068 	str	r2, [r3, #104]	@ 0x68
800267d0:	e59f0040 	ldr	r0, [pc, #64]	@ 80026818 <thread_exit+0x100>
800267d4:	eb00008e 	bl	80026a14 <acquire>
800267d8:	e59f3034 	ldr	r3, [pc, #52]	@ 80026814 <thread_exit+0xfc>
800267dc:	e5933000 	ldr	r3, [r3]
800267e0:	e59330a0 	ldr	r3, [r3, #160]	@ 0xa0
800267e4:	e1a00003 	mov	r0, r3
800267e8:	ebfffdaa 	bl	80025e98 <wakeup1>
800267ec:	e59f3020 	ldr	r3, [pc, #32]	@ 80026814 <thread_exit+0xfc>
800267f0:	e5933000 	ldr	r3, [r3]
800267f4:	e3a02005 	mov	r2, #5
800267f8:	e5c3200c 	strb	r2, [r3, #12]
800267fc:	ebfffd19 	bl	80025c68 <sched>
80026800:	e59f0014 	ldr	r0, [pc, #20]	@ 8002681c <thread_exit+0x104>
80026804:	ebffecba 	bl	80021af4 <panic>
80026808:	e1a00000 	nop			@ (mov r0, r0)
8002680c:	e24bd004 	sub	sp, fp, #4
80026810:	e8bd8800 	pop	{fp, pc}
80026814:	800d97a8 	.word	0x800d97a8
80026818:	800d6c70 	.word	0x800d6c70
8002681c:	8002ae5c 	.word	0x8002ae5c

80026820 <thread_join>:
80026820:	e92d4800 	push	{fp, lr}
80026824:	e28db004 	add	fp, sp, #4
80026828:	e24dd010 	sub	sp, sp, #16
8002682c:	e50b0010 	str	r0, [fp, #-16]
80026830:	e3a03000 	mov	r3, #0
80026834:	e50b300c 	str	r3, [fp, #-12]
80026838:	e59f017c 	ldr	r0, [pc, #380]	@ 800269bc <thread_join+0x19c>
8002683c:	eb000074 	bl	80026a14 <acquire>
80026840:	e3a03000 	mov	r3, #0
80026844:	e50b300c 	str	r3, [fp, #-12]
80026848:	e59f3170 	ldr	r3, [pc, #368]	@ 800269c0 <thread_join+0x1a0>
8002684c:	e50b3008 	str	r3, [fp, #-8]
80026850:	ea000040 	b	80026958 <thread_join+0x138>
80026854:	e51b3008 	ldr	r3, [fp, #-8]
80026858:	e5933010 	ldr	r3, [r3, #16]
8002685c:	e1a02003 	mov	r2, r3
80026860:	e51b3010 	ldr	r3, [fp, #-16]
80026864:	e1530002 	cmp	r3, r2
80026868:	1a000037 	bne	8002694c <thread_join+0x12c>
8002686c:	e51b3008 	ldr	r3, [fp, #-8]
80026870:	e59320a0 	ldr	r2, [r3, #160]	@ 0xa0
80026874:	e59f3148 	ldr	r3, [pc, #328]	@ 800269c4 <thread_join+0x1a4>
80026878:	e5933000 	ldr	r3, [r3]
8002687c:	e1520003 	cmp	r2, r3
80026880:	1a000031 	bne	8002694c <thread_join+0x12c>
80026884:	e51b3008 	ldr	r3, [fp, #-8]
80026888:	e593309c 	ldr	r3, [r3, #156]	@ 0x9c
8002688c:	e3530000 	cmp	r3, #0
80026890:	0a00002d 	beq	8002694c <thread_join+0x12c>
80026894:	e3a03001 	mov	r3, #1
80026898:	e50b300c 	str	r3, [fp, #-12]
8002689c:	e51b3008 	ldr	r3, [fp, #-8]
800268a0:	e5d3300c 	ldrb	r3, [r3, #12]
800268a4:	e3530005 	cmp	r3, #5
800268a8:	1a000027 	bne	8002694c <thread_join+0x12c>
800268ac:	e51b3008 	ldr	r3, [fp, #-8]
800268b0:	e59330a4 	ldr	r3, [r3, #164]	@ 0xa4
800268b4:	e3530000 	cmp	r3, #0
800268b8:	0a000009 	beq	800268e4 <thread_join+0xc4>
800268bc:	e59f3100 	ldr	r3, [pc, #256]	@ 800269c4 <thread_join+0x1a4>
800268c0:	e5933000 	ldr	r3, [r3]
800268c4:	e5930004 	ldr	r0, [r3, #4]
800268c8:	e51b3008 	ldr	r3, [fp, #-8]
800268cc:	e59330a4 	ldr	r3, [r3, #164]	@ 0xa4
800268d0:	e2831a01 	add	r1, r3, #4096	@ 0x1000
800268d4:	e51b3008 	ldr	r3, [fp, #-8]
800268d8:	e59330a4 	ldr	r3, [r3, #164]	@ 0xa4
800268dc:	e1a02003 	mov	r2, r3
800268e0:	eb000c12 	bl	80029930 <deallocuvm>
800268e4:	e51b3008 	ldr	r3, [fp, #-8]
800268e8:	e5933008 	ldr	r3, [r3, #8]
800268ec:	e1a00003 	mov	r0, r3
800268f0:	ebffeb44 	bl	80021608 <free_page>
800268f4:	e51b3008 	ldr	r3, [fp, #-8]
800268f8:	e3a02000 	mov	r2, #0
800268fc:	e5c3200c 	strb	r2, [r3, #12]
80026900:	e51b3008 	ldr	r3, [fp, #-8]
80026904:	e3a02000 	mov	r2, #0
80026908:	e5832010 	str	r2, [r3, #16]
8002690c:	e51b3008 	ldr	r3, [fp, #-8]
80026910:	e3a02000 	mov	r2, #0
80026914:	e5832014 	str	r2, [r3, #20]
80026918:	e51b3008 	ldr	r3, [fp, #-8]
8002691c:	e3a02000 	mov	r2, #0
80026920:	e58320a0 	str	r2, [r3, #160]	@ 0xa0
80026924:	e51b3008 	ldr	r3, [fp, #-8]
80026928:	e3a02000 	mov	r2, #0
8002692c:	e5c3206c 	strb	r2, [r3, #108]	@ 0x6c
80026930:	e51b3008 	ldr	r3, [fp, #-8]
80026934:	e3a02000 	mov	r2, #0
80026938:	e5832024 	str	r2, [r3, #36]	@ 0x24
8002693c:	e59f0078 	ldr	r0, [pc, #120]	@ 800269bc <thread_join+0x19c>
80026940:	eb00003e 	bl	80026a40 <release>
80026944:	e51b3010 	ldr	r3, [fp, #-16]
80026948:	ea000018 	b	800269b0 <thread_join+0x190>
8002694c:	e51b3008 	ldr	r3, [fp, #-8]
80026950:	e28330ac 	add	r3, r3, #172	@ 0xac
80026954:	e50b3008 	str	r3, [fp, #-8]
80026958:	e51b3008 	ldr	r3, [fp, #-8]
8002695c:	e59f2064 	ldr	r2, [pc, #100]	@ 800269c8 <thread_join+0x1a8>
80026960:	e1530002 	cmp	r3, r2
80026964:	3affffba 	bcc	80026854 <thread_join+0x34>
80026968:	e51b300c 	ldr	r3, [fp, #-12]
8002696c:	e3530000 	cmp	r3, #0
80026970:	0a000004 	beq	80026988 <thread_join+0x168>
80026974:	e59f3048 	ldr	r3, [pc, #72]	@ 800269c4 <thread_join+0x1a4>
80026978:	e5933000 	ldr	r3, [r3]
8002697c:	e5933024 	ldr	r3, [r3, #36]	@ 0x24
80026980:	e3530000 	cmp	r3, #0
80026984:	0a000003 	beq	80026998 <thread_join+0x178>
80026988:	e59f002c 	ldr	r0, [pc, #44]	@ 800269bc <thread_join+0x19c>
8002698c:	eb00002b 	bl	80026a40 <release>
80026990:	e3e03000 	mvn	r3, #0
80026994:	ea000005 	b	800269b0 <thread_join+0x190>
80026998:	e59f3024 	ldr	r3, [pc, #36]	@ 800269c4 <thread_join+0x1a4>
8002699c:	e5933000 	ldr	r3, [r3]
800269a0:	e59f1014 	ldr	r1, [pc, #20]	@ 800269bc <thread_join+0x19c>
800269a4:	e1a00003 	mov	r0, r3
800269a8:	ebfffd06 	bl	80025dc8 <sleep>
800269ac:	eaffffa3 	b	80026840 <thread_join+0x20>
800269b0:	e1a00003 	mov	r0, r3
800269b4:	e24bd004 	sub	sp, fp, #4
800269b8:	e8bd8800 	pop	{fp, pc}
800269bc:	800d6c70 	.word	0x800d6c70
800269c0:	800d6ca4 	.word	0x800d6ca4
800269c4:	800d97a8 	.word	0x800d97a8
800269c8:	800d97a4 	.word	0x800d97a4

800269cc <initlock>:
800269cc:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
800269d0:	e28db000 	add	fp, sp, #0
800269d4:	e24dd00c 	sub	sp, sp, #12
800269d8:	e50b0008 	str	r0, [fp, #-8]
800269dc:	e50b100c 	str	r1, [fp, #-12]
800269e0:	e51b3008 	ldr	r3, [fp, #-8]
800269e4:	e51b200c 	ldr	r2, [fp, #-12]
800269e8:	e5832004 	str	r2, [r3, #4]
800269ec:	e51b3008 	ldr	r3, [fp, #-8]
800269f0:	e3a02000 	mov	r2, #0
800269f4:	e5832000 	str	r2, [r3]
800269f8:	e51b3008 	ldr	r3, [fp, #-8]
800269fc:	e3a02000 	mov	r2, #0
80026a00:	e5832008 	str	r2, [r3, #8]
80026a04:	e1a00000 	nop			@ (mov r0, r0)
80026a08:	e28bd000 	add	sp, fp, #0
80026a0c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80026a10:	e12fff1e 	bx	lr

80026a14 <acquire>:
80026a14:	e92d4800 	push	{fp, lr}
80026a18:	e28db004 	add	fp, sp, #4
80026a1c:	e24dd008 	sub	sp, sp, #8
80026a20:	e50b0008 	str	r0, [fp, #-8]
80026a24:	ebffe700 	bl	8002062c <pushcli>
80026a28:	e51b3008 	ldr	r3, [fp, #-8]
80026a2c:	e3a02001 	mov	r2, #1
80026a30:	e5832000 	str	r2, [r3]
80026a34:	e1a00000 	nop			@ (mov r0, r0)
80026a38:	e24bd004 	sub	sp, fp, #4
80026a3c:	e8bd8800 	pop	{fp, pc}

80026a40 <release>:
80026a40:	e92d4800 	push	{fp, lr}
80026a44:	e28db004 	add	fp, sp, #4
80026a48:	e24dd008 	sub	sp, sp, #8
80026a4c:	e50b0008 	str	r0, [fp, #-8]
80026a50:	e51b3008 	ldr	r3, [fp, #-8]
80026a54:	e3a02000 	mov	r2, #0
80026a58:	e5832000 	str	r2, [r3]
80026a5c:	ebffe707 	bl	80020680 <popcli>
80026a60:	e1a00000 	nop			@ (mov r0, r0)
80026a64:	e24bd004 	sub	sp, fp, #4
80026a68:	e8bd8800 	pop	{fp, pc}

80026a6c <holding>:
80026a6c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80026a70:	e28db000 	add	fp, sp, #0
80026a74:	e24dd00c 	sub	sp, sp, #12
80026a78:	e50b0008 	str	r0, [fp, #-8]
80026a7c:	e51b3008 	ldr	r3, [fp, #-8]
80026a80:	e5933000 	ldr	r3, [r3]
80026a84:	e1a00003 	mov	r0, r3
80026a88:	e28bd000 	add	sp, fp, #0
80026a8c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80026a90:	e12fff1e 	bx	lr

80026a94 <swtch>:
80026a94:	e92d5ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
80026a98:	e580d000 	str	sp, [r0]
80026a9c:	e1a0d001 	mov	sp, r1
80026aa0:	e8bd5ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
80026aa4:	e12fff1e 	bx	lr

80026aa8 <fetchint>:
80026aa8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80026aac:	e28db000 	add	fp, sp, #0
80026ab0:	e24dd00c 	sub	sp, sp, #12
80026ab4:	e50b0008 	str	r0, [fp, #-8]
80026ab8:	e50b100c 	str	r1, [fp, #-12]
80026abc:	e59f3058 	ldr	r3, [pc, #88]	@ 80026b1c <fetchint+0x74>
80026ac0:	e5933000 	ldr	r3, [r3]
80026ac4:	e5933000 	ldr	r3, [r3]
80026ac8:	e51b2008 	ldr	r2, [fp, #-8]
80026acc:	e1520003 	cmp	r2, r3
80026ad0:	2a000006 	bcs	80026af0 <fetchint+0x48>
80026ad4:	e51b3008 	ldr	r3, [fp, #-8]
80026ad8:	e2832004 	add	r2, r3, #4
80026adc:	e59f3038 	ldr	r3, [pc, #56]	@ 80026b1c <fetchint+0x74>
80026ae0:	e5933000 	ldr	r3, [r3]
80026ae4:	e5933000 	ldr	r3, [r3]
80026ae8:	e1520003 	cmp	r2, r3
80026aec:	9a000001 	bls	80026af8 <fetchint+0x50>
80026af0:	e3e03000 	mvn	r3, #0
80026af4:	ea000004 	b	80026b0c <fetchint+0x64>
80026af8:	e51b3008 	ldr	r3, [fp, #-8]
80026afc:	e5932000 	ldr	r2, [r3]
80026b00:	e51b300c 	ldr	r3, [fp, #-12]
80026b04:	e5832000 	str	r2, [r3]
80026b08:	e3a03000 	mov	r3, #0
80026b0c:	e1a00003 	mov	r0, r3
80026b10:	e28bd000 	add	sp, fp, #0
80026b14:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80026b18:	e12fff1e 	bx	lr
80026b1c:	800d97a8 	.word	0x800d97a8

80026b20 <fetchstr>:
80026b20:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80026b24:	e28db000 	add	fp, sp, #0
80026b28:	e24dd014 	sub	sp, sp, #20
80026b2c:	e50b0010 	str	r0, [fp, #-16]
80026b30:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80026b34:	e59f3098 	ldr	r3, [pc, #152]	@ 80026bd4 <fetchstr+0xb4>
80026b38:	e5933000 	ldr	r3, [r3]
80026b3c:	e5933000 	ldr	r3, [r3]
80026b40:	e51b2010 	ldr	r2, [fp, #-16]
80026b44:	e1520003 	cmp	r2, r3
80026b48:	3a000001 	bcc	80026b54 <fetchstr+0x34>
80026b4c:	e3e03000 	mvn	r3, #0
80026b50:	ea00001b 	b	80026bc4 <fetchstr+0xa4>
80026b54:	e51b2010 	ldr	r2, [fp, #-16]
80026b58:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026b5c:	e5832000 	str	r2, [r3]
80026b60:	e59f306c 	ldr	r3, [pc, #108]	@ 80026bd4 <fetchstr+0xb4>
80026b64:	e5933000 	ldr	r3, [r3]
80026b68:	e5933000 	ldr	r3, [r3]
80026b6c:	e50b300c 	str	r3, [fp, #-12]
80026b70:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026b74:	e5933000 	ldr	r3, [r3]
80026b78:	e50b3008 	str	r3, [fp, #-8]
80026b7c:	ea00000b 	b	80026bb0 <fetchstr+0x90>
80026b80:	e51b3008 	ldr	r3, [fp, #-8]
80026b84:	e5d33000 	ldrb	r3, [r3]
80026b88:	e3530000 	cmp	r3, #0
80026b8c:	1a000004 	bne	80026ba4 <fetchstr+0x84>
80026b90:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026b94:	e5933000 	ldr	r3, [r3]
80026b98:	e51b2008 	ldr	r2, [fp, #-8]
80026b9c:	e0423003 	sub	r3, r2, r3
80026ba0:	ea000007 	b	80026bc4 <fetchstr+0xa4>
80026ba4:	e51b3008 	ldr	r3, [fp, #-8]
80026ba8:	e2833001 	add	r3, r3, #1
80026bac:	e50b3008 	str	r3, [fp, #-8]
80026bb0:	e51b2008 	ldr	r2, [fp, #-8]
80026bb4:	e51b300c 	ldr	r3, [fp, #-12]
80026bb8:	e1520003 	cmp	r2, r3
80026bbc:	3affffef 	bcc	80026b80 <fetchstr+0x60>
80026bc0:	e3e03000 	mvn	r3, #0
80026bc4:	e1a00003 	mov	r0, r3
80026bc8:	e28bd000 	add	sp, fp, #0
80026bcc:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80026bd0:	e12fff1e 	bx	lr
80026bd4:	800d97a8 	.word	0x800d97a8

80026bd8 <argint>:
80026bd8:	e92d4800 	push	{fp, lr}
80026bdc:	e28db004 	add	fp, sp, #4
80026be0:	e24dd008 	sub	sp, sp, #8
80026be4:	e50b0008 	str	r0, [fp, #-8]
80026be8:	e50b100c 	str	r1, [fp, #-12]
80026bec:	e51b3008 	ldr	r3, [fp, #-8]
80026bf0:	e3530003 	cmp	r3, #3
80026bf4:	da000001 	ble	80026c00 <argint+0x28>
80026bf8:	e59f003c 	ldr	r0, [pc, #60]	@ 80026c3c <argint+0x64>
80026bfc:	ebffebbc 	bl	80021af4 <panic>
80026c00:	e59f3038 	ldr	r3, [pc, #56]	@ 80026c40 <argint+0x68>
80026c04:	e5933000 	ldr	r3, [r3]
80026c08:	e5933018 	ldr	r3, [r3, #24]
80026c0c:	e2832014 	add	r2, r3, #20
80026c10:	e51b3008 	ldr	r3, [fp, #-8]
80026c14:	e1a03103 	lsl	r3, r3, #2
80026c18:	e0823003 	add	r3, r2, r3
80026c1c:	e5933000 	ldr	r3, [r3]
80026c20:	e1a02003 	mov	r2, r3
80026c24:	e51b300c 	ldr	r3, [fp, #-12]
80026c28:	e5832000 	str	r2, [r3]
80026c2c:	e3a03000 	mov	r3, #0
80026c30:	e1a00003 	mov	r0, r3
80026c34:	e24bd004 	sub	sp, fp, #4
80026c38:	e8bd8800 	pop	{fp, pc}
80026c3c:	8002af84 	.word	0x8002af84
80026c40:	800d97a8 	.word	0x800d97a8

80026c44 <argptr>:
80026c44:	e92d4800 	push	{fp, lr}
80026c48:	e28db004 	add	fp, sp, #4
80026c4c:	e24dd018 	sub	sp, sp, #24
80026c50:	e50b0010 	str	r0, [fp, #-16]
80026c54:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80026c58:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80026c5c:	e24b3008 	sub	r3, fp, #8
80026c60:	e1a01003 	mov	r1, r3
80026c64:	e51b0010 	ldr	r0, [fp, #-16]
80026c68:	ebffffda 	bl	80026bd8 <argint>
80026c6c:	e1a03000 	mov	r3, r0
80026c70:	e3530000 	cmp	r3, #0
80026c74:	aa000001 	bge	80026c80 <argptr+0x3c>
80026c78:	e3e03000 	mvn	r3, #0
80026c7c:	ea000015 	b	80026cd8 <argptr+0x94>
80026c80:	e59f305c 	ldr	r3, [pc, #92]	@ 80026ce4 <argptr+0xa0>
80026c84:	e5933000 	ldr	r3, [r3]
80026c88:	e5933000 	ldr	r3, [r3]
80026c8c:	e51b2008 	ldr	r2, [fp, #-8]
80026c90:	e1530002 	cmp	r3, r2
80026c94:	9a000008 	bls	80026cbc <argptr+0x78>
80026c98:	e51b3008 	ldr	r3, [fp, #-8]
80026c9c:	e1a02003 	mov	r2, r3
80026ca0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80026ca4:	e0822003 	add	r2, r2, r3
80026ca8:	e59f3034 	ldr	r3, [pc, #52]	@ 80026ce4 <argptr+0xa0>
80026cac:	e5933000 	ldr	r3, [r3]
80026cb0:	e5933000 	ldr	r3, [r3]
80026cb4:	e1520003 	cmp	r2, r3
80026cb8:	9a000001 	bls	80026cc4 <argptr+0x80>
80026cbc:	e3e03000 	mvn	r3, #0
80026cc0:	ea000004 	b	80026cd8 <argptr+0x94>
80026cc4:	e51b3008 	ldr	r3, [fp, #-8]
80026cc8:	e1a02003 	mov	r2, r3
80026ccc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026cd0:	e5832000 	str	r2, [r3]
80026cd4:	e3a03000 	mov	r3, #0
80026cd8:	e1a00003 	mov	r0, r3
80026cdc:	e24bd004 	sub	sp, fp, #4
80026ce0:	e8bd8800 	pop	{fp, pc}
80026ce4:	800d97a8 	.word	0x800d97a8

80026ce8 <argstr>:
80026ce8:	e92d4800 	push	{fp, lr}
80026cec:	e28db004 	add	fp, sp, #4
80026cf0:	e24dd010 	sub	sp, sp, #16
80026cf4:	e50b0010 	str	r0, [fp, #-16]
80026cf8:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80026cfc:	e24b3008 	sub	r3, fp, #8
80026d00:	e1a01003 	mov	r1, r3
80026d04:	e51b0010 	ldr	r0, [fp, #-16]
80026d08:	ebffffb2 	bl	80026bd8 <argint>
80026d0c:	e1a03000 	mov	r3, r0
80026d10:	e3530000 	cmp	r3, #0
80026d14:	aa000001 	bge	80026d20 <argstr+0x38>
80026d18:	e3e03000 	mvn	r3, #0
80026d1c:	ea000004 	b	80026d34 <argstr+0x4c>
80026d20:	e51b3008 	ldr	r3, [fp, #-8]
80026d24:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
80026d28:	e1a00003 	mov	r0, r3
80026d2c:	ebffff7b 	bl	80026b20 <fetchstr>
80026d30:	e1a03000 	mov	r3, r0
80026d34:	e1a00003 	mov	r0, r3
80026d38:	e24bd004 	sub	sp, fp, #4
80026d3c:	e8bd8800 	pop	{fp, pc}

80026d40 <syscall>:
80026d40:	e92d4800 	push	{fp, lr}
80026d44:	e28db004 	add	fp, sp, #4
80026d48:	e24dd008 	sub	sp, sp, #8
80026d4c:	e59f30cc 	ldr	r3, [pc, #204]	@ 80026e20 <syscall+0xe0>
80026d50:	e5933000 	ldr	r3, [r3]
80026d54:	e5933018 	ldr	r3, [r3, #24]
80026d58:	e5933010 	ldr	r3, [r3, #16]
80026d5c:	e50b3008 	str	r3, [fp, #-8]
80026d60:	e51b3008 	ldr	r3, [fp, #-8]
80026d64:	e3530000 	cmp	r3, #0
80026d68:	da00001a 	ble	80026dd8 <syscall+0x98>
80026d6c:	e51b3008 	ldr	r3, [fp, #-8]
80026d70:	e3530028 	cmp	r3, #40	@ 0x28
80026d74:	8a000017 	bhi	80026dd8 <syscall+0x98>
80026d78:	e59f20a4 	ldr	r2, [pc, #164]	@ 80026e24 <syscall+0xe4>
80026d7c:	e51b3008 	ldr	r3, [fp, #-8]
80026d80:	e7923103 	ldr	r3, [r2, r3, lsl #2]
80026d84:	e3530000 	cmp	r3, #0
80026d88:	0a000012 	beq	80026dd8 <syscall+0x98>
80026d8c:	e59f308c 	ldr	r3, [pc, #140]	@ 80026e20 <syscall+0xe0>
80026d90:	e5933000 	ldr	r3, [r3]
80026d94:	e593207c 	ldr	r2, [r3, #124]	@ 0x7c
80026d98:	e2822001 	add	r2, r2, #1
80026d9c:	e583207c 	str	r2, [r3, #124]	@ 0x7c
80026da0:	e59f207c 	ldr	r2, [pc, #124]	@ 80026e24 <syscall+0xe4>
80026da4:	e51b3008 	ldr	r3, [fp, #-8]
80026da8:	e7923103 	ldr	r3, [r2, r3, lsl #2]
80026dac:	e12fff33 	blx	r3
80026db0:	e50b000c 	str	r0, [fp, #-12]
80026db4:	e51b3008 	ldr	r3, [fp, #-8]
80026db8:	e3530007 	cmp	r3, #7
80026dbc:	0a000014 	beq	80026e14 <syscall+0xd4>
80026dc0:	e59f3058 	ldr	r3, [pc, #88]	@ 80026e20 <syscall+0xe0>
80026dc4:	e5933000 	ldr	r3, [r3]
80026dc8:	e5933018 	ldr	r3, [r3, #24]
80026dcc:	e51b200c 	ldr	r2, [fp, #-12]
80026dd0:	e5832010 	str	r2, [r3, #16]
80026dd4:	ea00000e 	b	80026e14 <syscall+0xd4>
80026dd8:	e59f3040 	ldr	r3, [pc, #64]	@ 80026e20 <syscall+0xe0>
80026ddc:	e5933000 	ldr	r3, [r3]
80026de0:	e5931010 	ldr	r1, [r3, #16]
80026de4:	e59f3034 	ldr	r3, [pc, #52]	@ 80026e20 <syscall+0xe0>
80026de8:	e5933000 	ldr	r3, [r3]
80026dec:	e283206c 	add	r2, r3, #108	@ 0x6c
80026df0:	e51b3008 	ldr	r3, [fp, #-8]
80026df4:	e59f002c 	ldr	r0, [pc, #44]	@ 80026e28 <syscall+0xe8>
80026df8:	ebffeaa5 	bl	80021894 <cprintf>
80026dfc:	e59f301c 	ldr	r3, [pc, #28]	@ 80026e20 <syscall+0xe0>
80026e00:	e5933000 	ldr	r3, [r3]
80026e04:	e5933018 	ldr	r3, [r3, #24]
80026e08:	e3e02000 	mvn	r2, #0
80026e0c:	e5832010 	str	r2, [r3, #16]
80026e10:	e1a00000 	nop			@ (mov r0, r0)
80026e14:	e1a00000 	nop			@ (mov r0, r0)
80026e18:	e24bd004 	sub	sp, fp, #4
80026e1c:	e8bd8800 	pop	{fp, pc}
80026e20:	800d97a8 	.word	0x800d97a8
80026e24:	8002c04c 	.word	0x8002c04c
80026e28:	8002afa8 	.word	0x8002afa8

80026e2c <argfd>:
80026e2c:	e92d4800 	push	{fp, lr}
80026e30:	e28db004 	add	fp, sp, #4
80026e34:	e24dd018 	sub	sp, sp, #24
80026e38:	e50b0010 	str	r0, [fp, #-16]
80026e3c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80026e40:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80026e44:	e24b300c 	sub	r3, fp, #12
80026e48:	e1a01003 	mov	r1, r3
80026e4c:	e51b0010 	ldr	r0, [fp, #-16]
80026e50:	ebffff60 	bl	80026bd8 <argint>
80026e54:	e1a03000 	mov	r3, r0
80026e58:	e3530000 	cmp	r3, #0
80026e5c:	aa000001 	bge	80026e68 <argfd+0x3c>
80026e60:	e3e03000 	mvn	r3, #0
80026e64:	ea00001d 	b	80026ee0 <argfd+0xb4>
80026e68:	e51b300c 	ldr	r3, [fp, #-12]
80026e6c:	e3530000 	cmp	r3, #0
80026e70:	ba00000b 	blt	80026ea4 <argfd+0x78>
80026e74:	e51b300c 	ldr	r3, [fp, #-12]
80026e78:	e353000f 	cmp	r3, #15
80026e7c:	ca000008 	bgt	80026ea4 <argfd+0x78>
80026e80:	e59f3064 	ldr	r3, [pc, #100]	@ 80026eec <argfd+0xc0>
80026e84:	e5933000 	ldr	r3, [r3]
80026e88:	e51b200c 	ldr	r2, [fp, #-12]
80026e8c:	e282200a 	add	r2, r2, #10
80026e90:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80026e94:	e50b3008 	str	r3, [fp, #-8]
80026e98:	e51b3008 	ldr	r3, [fp, #-8]
80026e9c:	e3530000 	cmp	r3, #0
80026ea0:	1a000001 	bne	80026eac <argfd+0x80>
80026ea4:	e3e03000 	mvn	r3, #0
80026ea8:	ea00000c 	b	80026ee0 <argfd+0xb4>
80026eac:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026eb0:	e3530000 	cmp	r3, #0
80026eb4:	0a000002 	beq	80026ec4 <argfd+0x98>
80026eb8:	e51b200c 	ldr	r2, [fp, #-12]
80026ebc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80026ec0:	e5832000 	str	r2, [r3]
80026ec4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80026ec8:	e3530000 	cmp	r3, #0
80026ecc:	0a000002 	beq	80026edc <argfd+0xb0>
80026ed0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80026ed4:	e51b2008 	ldr	r2, [fp, #-8]
80026ed8:	e5832000 	str	r2, [r3]
80026edc:	e3a03000 	mov	r3, #0
80026ee0:	e1a00003 	mov	r0, r3
80026ee4:	e24bd004 	sub	sp, fp, #4
80026ee8:	e8bd8800 	pop	{fp, pc}
80026eec:	800d97a8 	.word	0x800d97a8

80026ef0 <fdalloc>:
80026ef0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80026ef4:	e28db000 	add	fp, sp, #0
80026ef8:	e24dd014 	sub	sp, sp, #20
80026efc:	e50b0010 	str	r0, [fp, #-16]
80026f00:	e3a03000 	mov	r3, #0
80026f04:	e50b3008 	str	r3, [fp, #-8]
80026f08:	ea000011 	b	80026f54 <fdalloc+0x64>
80026f0c:	e59f3060 	ldr	r3, [pc, #96]	@ 80026f74 <fdalloc+0x84>
80026f10:	e5933000 	ldr	r3, [r3]
80026f14:	e51b2008 	ldr	r2, [fp, #-8]
80026f18:	e282200a 	add	r2, r2, #10
80026f1c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80026f20:	e3530000 	cmp	r3, #0
80026f24:	1a000007 	bne	80026f48 <fdalloc+0x58>
80026f28:	e59f3044 	ldr	r3, [pc, #68]	@ 80026f74 <fdalloc+0x84>
80026f2c:	e5933000 	ldr	r3, [r3]
80026f30:	e51b2008 	ldr	r2, [fp, #-8]
80026f34:	e282200a 	add	r2, r2, #10
80026f38:	e51b1010 	ldr	r1, [fp, #-16]
80026f3c:	e7831102 	str	r1, [r3, r2, lsl #2]
80026f40:	e51b3008 	ldr	r3, [fp, #-8]
80026f44:	ea000006 	b	80026f64 <fdalloc+0x74>
80026f48:	e51b3008 	ldr	r3, [fp, #-8]
80026f4c:	e2833001 	add	r3, r3, #1
80026f50:	e50b3008 	str	r3, [fp, #-8]
80026f54:	e51b3008 	ldr	r3, [fp, #-8]
80026f58:	e353000f 	cmp	r3, #15
80026f5c:	daffffea 	ble	80026f0c <fdalloc+0x1c>
80026f60:	e3e03000 	mvn	r3, #0
80026f64:	e1a00003 	mov	r0, r3
80026f68:	e28bd000 	add	sp, fp, #0
80026f6c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80026f70:	e12fff1e 	bx	lr
80026f74:	800d97a8 	.word	0x800d97a8

80026f78 <sys_dup>:
80026f78:	e92d4800 	push	{fp, lr}
80026f7c:	e28db004 	add	fp, sp, #4
80026f80:	e24dd008 	sub	sp, sp, #8
80026f84:	e24b300c 	sub	r3, fp, #12
80026f88:	e1a02003 	mov	r2, r3
80026f8c:	e3a01000 	mov	r1, #0
80026f90:	e3a00000 	mov	r0, #0
80026f94:	ebffffa4 	bl	80026e2c <argfd>
80026f98:	e1a03000 	mov	r3, r0
80026f9c:	e3530000 	cmp	r3, #0
80026fa0:	aa000001 	bge	80026fac <sys_dup+0x34>
80026fa4:	e3e03000 	mvn	r3, #0
80026fa8:	ea00000c 	b	80026fe0 <sys_dup+0x68>
80026fac:	e51b300c 	ldr	r3, [fp, #-12]
80026fb0:	e1a00003 	mov	r0, r3
80026fb4:	ebffffcd 	bl	80026ef0 <fdalloc>
80026fb8:	e50b0008 	str	r0, [fp, #-8]
80026fbc:	e51b3008 	ldr	r3, [fp, #-8]
80026fc0:	e3530000 	cmp	r3, #0
80026fc4:	aa000001 	bge	80026fd0 <sys_dup+0x58>
80026fc8:	e3e03000 	mvn	r3, #0
80026fcc:	ea000003 	b	80026fe0 <sys_dup+0x68>
80026fd0:	e51b300c 	ldr	r3, [fp, #-12]
80026fd4:	e1a00003 	mov	r0, r3
80026fd8:	ebffedc1 	bl	800226e4 <filedup>
80026fdc:	e51b3008 	ldr	r3, [fp, #-8]
80026fe0:	e1a00003 	mov	r0, r3
80026fe4:	e24bd004 	sub	sp, fp, #4
80026fe8:	e8bd8800 	pop	{fp, pc}

80026fec <sys_read>:
80026fec:	e92d4800 	push	{fp, lr}
80026ff0:	e28db004 	add	fp, sp, #4
80026ff4:	e24dd010 	sub	sp, sp, #16
80026ff8:	e24b3008 	sub	r3, fp, #8
80026ffc:	e1a02003 	mov	r2, r3
80027000:	e3a01000 	mov	r1, #0
80027004:	e3a00000 	mov	r0, #0
80027008:	ebffff87 	bl	80026e2c <argfd>
8002700c:	e1a03000 	mov	r3, r0
80027010:	e3530000 	cmp	r3, #0
80027014:	ba00000e 	blt	80027054 <sys_read+0x68>
80027018:	e24b300c 	sub	r3, fp, #12
8002701c:	e1a01003 	mov	r1, r3
80027020:	e3a00002 	mov	r0, #2
80027024:	ebfffeeb 	bl	80026bd8 <argint>
80027028:	e1a03000 	mov	r3, r0
8002702c:	e3530000 	cmp	r3, #0
80027030:	ba000007 	blt	80027054 <sys_read+0x68>
80027034:	e51b200c 	ldr	r2, [fp, #-12]
80027038:	e24b3010 	sub	r3, fp, #16
8002703c:	e1a01003 	mov	r1, r3
80027040:	e3a00001 	mov	r0, #1
80027044:	ebfffefe 	bl	80026c44 <argptr>
80027048:	e1a03000 	mov	r3, r0
8002704c:	e3530000 	cmp	r3, #0
80027050:	aa000001 	bge	8002705c <sys_read+0x70>
80027054:	e3e03000 	mvn	r3, #0
80027058:	ea000005 	b	80027074 <sys_read+0x88>
8002705c:	e51b3008 	ldr	r3, [fp, #-8]
80027060:	e51b1010 	ldr	r1, [fp, #-16]
80027064:	e51b200c 	ldr	r2, [fp, #-12]
80027068:	e1a00003 	mov	r0, r3
8002706c:	ebffee0d 	bl	800228a8 <fileread>
80027070:	e1a03000 	mov	r3, r0
80027074:	e1a00003 	mov	r0, r3
80027078:	e24bd004 	sub	sp, fp, #4
8002707c:	e8bd8800 	pop	{fp, pc}

80027080 <sys_write>:
80027080:	e92d4800 	push	{fp, lr}
80027084:	e28db004 	add	fp, sp, #4
80027088:	e24dd010 	sub	sp, sp, #16
8002708c:	e24b3008 	sub	r3, fp, #8
80027090:	e1a02003 	mov	r2, r3
80027094:	e3a01000 	mov	r1, #0
80027098:	e3a00000 	mov	r0, #0
8002709c:	ebffff62 	bl	80026e2c <argfd>
800270a0:	e1a03000 	mov	r3, r0
800270a4:	e3530000 	cmp	r3, #0
800270a8:	ba00000e 	blt	800270e8 <sys_write+0x68>
800270ac:	e24b300c 	sub	r3, fp, #12
800270b0:	e1a01003 	mov	r1, r3
800270b4:	e3a00002 	mov	r0, #2
800270b8:	ebfffec6 	bl	80026bd8 <argint>
800270bc:	e1a03000 	mov	r3, r0
800270c0:	e3530000 	cmp	r3, #0
800270c4:	ba000007 	blt	800270e8 <sys_write+0x68>
800270c8:	e51b200c 	ldr	r2, [fp, #-12]
800270cc:	e24b3010 	sub	r3, fp, #16
800270d0:	e1a01003 	mov	r1, r3
800270d4:	e3a00001 	mov	r0, #1
800270d8:	ebfffed9 	bl	80026c44 <argptr>
800270dc:	e1a03000 	mov	r3, r0
800270e0:	e3530000 	cmp	r3, #0
800270e4:	aa000001 	bge	800270f0 <sys_write+0x70>
800270e8:	e3e03000 	mvn	r3, #0
800270ec:	ea000005 	b	80027108 <sys_write+0x88>
800270f0:	e51b3008 	ldr	r3, [fp, #-8]
800270f4:	e51b1010 	ldr	r1, [fp, #-16]
800270f8:	e51b200c 	ldr	r2, [fp, #-12]
800270fc:	e1a00003 	mov	r0, r3
80027100:	ebffee25 	bl	8002299c <filewrite>
80027104:	e1a03000 	mov	r3, r0
80027108:	e1a00003 	mov	r0, r3
8002710c:	e24bd004 	sub	sp, fp, #4
80027110:	e8bd8800 	pop	{fp, pc}

80027114 <sys_close>:
80027114:	e92d4800 	push	{fp, lr}
80027118:	e28db004 	add	fp, sp, #4
8002711c:	e24dd008 	sub	sp, sp, #8
80027120:	e24b200c 	sub	r2, fp, #12
80027124:	e24b3008 	sub	r3, fp, #8
80027128:	e1a01003 	mov	r1, r3
8002712c:	e3a00000 	mov	r0, #0
80027130:	ebffff3d 	bl	80026e2c <argfd>
80027134:	e1a03000 	mov	r3, r0
80027138:	e3530000 	cmp	r3, #0
8002713c:	aa000001 	bge	80027148 <sys_close+0x34>
80027140:	e3e03000 	mvn	r3, #0
80027144:	ea000009 	b	80027170 <sys_close+0x5c>
80027148:	e59f302c 	ldr	r3, [pc, #44]	@ 8002717c <sys_close+0x68>
8002714c:	e5933000 	ldr	r3, [r3]
80027150:	e51b2008 	ldr	r2, [fp, #-8]
80027154:	e282200a 	add	r2, r2, #10
80027158:	e3a01000 	mov	r1, #0
8002715c:	e7831102 	str	r1, [r3, r2, lsl #2]
80027160:	e51b300c 	ldr	r3, [fp, #-12]
80027164:	e1a00003 	mov	r0, r3
80027168:	ebffed76 	bl	80022748 <fileclose>
8002716c:	e3a03000 	mov	r3, #0
80027170:	e1a00003 	mov	r0, r3
80027174:	e24bd004 	sub	sp, fp, #4
80027178:	e8bd8800 	pop	{fp, pc}
8002717c:	800d97a8 	.word	0x800d97a8

80027180 <sys_fstat>:
80027180:	e92d4800 	push	{fp, lr}
80027184:	e28db004 	add	fp, sp, #4
80027188:	e24dd008 	sub	sp, sp, #8
8002718c:	e24b3008 	sub	r3, fp, #8
80027190:	e1a02003 	mov	r2, r3
80027194:	e3a01000 	mov	r1, #0
80027198:	e3a00000 	mov	r0, #0
8002719c:	ebffff22 	bl	80026e2c <argfd>
800271a0:	e1a03000 	mov	r3, r0
800271a4:	e3530000 	cmp	r3, #0
800271a8:	ba000007 	blt	800271cc <sys_fstat+0x4c>
800271ac:	e24b300c 	sub	r3, fp, #12
800271b0:	e3a02014 	mov	r2, #20
800271b4:	e1a01003 	mov	r1, r3
800271b8:	e3a00001 	mov	r0, #1
800271bc:	ebfffea0 	bl	80026c44 <argptr>
800271c0:	e1a03000 	mov	r3, r0
800271c4:	e3530000 	cmp	r3, #0
800271c8:	aa000001 	bge	800271d4 <sys_fstat+0x54>
800271cc:	e3e03000 	mvn	r3, #0
800271d0:	ea000005 	b	800271ec <sys_fstat+0x6c>
800271d4:	e51b3008 	ldr	r3, [fp, #-8]
800271d8:	e51b200c 	ldr	r2, [fp, #-12]
800271dc:	e1a01002 	mov	r1, r2
800271e0:	e1a00003 	mov	r0, r3
800271e4:	ebffed93 	bl	80022838 <filestat>
800271e8:	e1a03000 	mov	r3, r0
800271ec:	e1a00003 	mov	r0, r3
800271f0:	e24bd004 	sub	sp, fp, #4
800271f4:	e8bd8800 	pop	{fp, pc}

800271f8 <sys_link>:
800271f8:	e92d4800 	push	{fp, lr}
800271fc:	e28db004 	add	fp, sp, #4
80027200:	e24dd020 	sub	sp, sp, #32
80027204:	e24b3024 	sub	r3, fp, #36	@ 0x24
80027208:	e1a01003 	mov	r1, r3
8002720c:	e3a00000 	mov	r0, #0
80027210:	ebfffeb4 	bl	80026ce8 <argstr>
80027214:	e1a03000 	mov	r3, r0
80027218:	e3530000 	cmp	r3, #0
8002721c:	ba000006 	blt	8002723c <sys_link+0x44>
80027220:	e24b3020 	sub	r3, fp, #32
80027224:	e1a01003 	mov	r1, r3
80027228:	e3a00001 	mov	r0, #1
8002722c:	ebfffead 	bl	80026ce8 <argstr>
80027230:	e1a03000 	mov	r3, r0
80027234:	e3530000 	cmp	r3, #0
80027238:	aa000001 	bge	80027244 <sys_link+0x4c>
8002723c:	e3e03000 	mvn	r3, #0
80027240:	ea000055 	b	8002739c <sys_link+0x1a4>
80027244:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80027248:	e1a00003 	mov	r0, r3
8002724c:	ebfff43a 	bl	8002433c <namei>
80027250:	e50b0008 	str	r0, [fp, #-8]
80027254:	e51b3008 	ldr	r3, [fp, #-8]
80027258:	e3530000 	cmp	r3, #0
8002725c:	1a000001 	bne	80027268 <sys_link+0x70>
80027260:	e3e03000 	mvn	r3, #0
80027264:	ea00004c 	b	8002739c <sys_link+0x1a4>
80027268:	ebfff52b 	bl	8002471c <begin_trans>
8002726c:	e51b0008 	ldr	r0, [fp, #-8]
80027270:	ebffefff 	bl	80023274 <ilock>
80027274:	e51b3008 	ldr	r3, [fp, #-8]
80027278:	e1d331f0 	ldrsh	r3, [r3, #16]
8002727c:	e3530001 	cmp	r3, #1
80027280:	1a000004 	bne	80027298 <sys_link+0xa0>
80027284:	e51b0008 	ldr	r0, [fp, #-8]
80027288:	ebfff0ba 	bl	80023578 <iunlockput>
8002728c:	ebfff536 	bl	8002476c <commit_trans>
80027290:	e3e03000 	mvn	r3, #0
80027294:	ea000040 	b	8002739c <sys_link+0x1a4>
80027298:	e51b3008 	ldr	r3, [fp, #-8]
8002729c:	e1d331f6 	ldrsh	r3, [r3, #22]
800272a0:	e6ff3073 	uxth	r3, r3
800272a4:	e2833001 	add	r3, r3, #1
800272a8:	e6ff3073 	uxth	r3, r3
800272ac:	e6bf2073 	sxth	r2, r3
800272b0:	e51b3008 	ldr	r3, [fp, #-8]
800272b4:	e1c321b6 	strh	r2, [r3, #22]
800272b8:	e51b0008 	ldr	r0, [fp, #-8]
800272bc:	ebffef52 	bl	8002300c <iupdate>
800272c0:	e51b0008 	ldr	r0, [fp, #-8]
800272c4:	ebfff04e 	bl	80023404 <iunlock>
800272c8:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800272cc:	e24b201c 	sub	r2, fp, #28
800272d0:	e1a01002 	mov	r1, r2
800272d4:	e1a00003 	mov	r0, r3
800272d8:	ebfff424 	bl	80024370 <nameiparent>
800272dc:	e50b000c 	str	r0, [fp, #-12]
800272e0:	e51b300c 	ldr	r3, [fp, #-12]
800272e4:	e3530000 	cmp	r3, #0
800272e8:	0a00001a 	beq	80027358 <sys_link+0x160>
800272ec:	e51b000c 	ldr	r0, [fp, #-12]
800272f0:	ebffefdf 	bl	80023274 <ilock>
800272f4:	e51b300c 	ldr	r3, [fp, #-12]
800272f8:	e5932000 	ldr	r2, [r3]
800272fc:	e51b3008 	ldr	r3, [fp, #-8]
80027300:	e5933000 	ldr	r3, [r3]
80027304:	e1520003 	cmp	r2, r3
80027308:	1a000008 	bne	80027330 <sys_link+0x138>
8002730c:	e51b3008 	ldr	r3, [fp, #-8]
80027310:	e5932004 	ldr	r2, [r3, #4]
80027314:	e24b301c 	sub	r3, fp, #28
80027318:	e1a01003 	mov	r1, r3
8002731c:	e51b000c 	ldr	r0, [fp, #-12]
80027320:	ebfff32f 	bl	80023fe4 <dirlink>
80027324:	e1a03000 	mov	r3, r0
80027328:	e3530000 	cmp	r3, #0
8002732c:	aa000002 	bge	8002733c <sys_link+0x144>
80027330:	e51b000c 	ldr	r0, [fp, #-12]
80027334:	ebfff08f 	bl	80023578 <iunlockput>
80027338:	ea000007 	b	8002735c <sys_link+0x164>
8002733c:	e51b000c 	ldr	r0, [fp, #-12]
80027340:	ebfff08c 	bl	80023578 <iunlockput>
80027344:	e51b0008 	ldr	r0, [fp, #-8]
80027348:	ebfff04f 	bl	8002348c <iput>
8002734c:	ebfff506 	bl	8002476c <commit_trans>
80027350:	e3a03000 	mov	r3, #0
80027354:	ea000010 	b	8002739c <sys_link+0x1a4>
80027358:	e1a00000 	nop			@ (mov r0, r0)
8002735c:	e51b0008 	ldr	r0, [fp, #-8]
80027360:	ebffefc3 	bl	80023274 <ilock>
80027364:	e51b3008 	ldr	r3, [fp, #-8]
80027368:	e1d331f6 	ldrsh	r3, [r3, #22]
8002736c:	e6ff3073 	uxth	r3, r3
80027370:	e2433001 	sub	r3, r3, #1
80027374:	e6ff3073 	uxth	r3, r3
80027378:	e6bf2073 	sxth	r2, r3
8002737c:	e51b3008 	ldr	r3, [fp, #-8]
80027380:	e1c321b6 	strh	r2, [r3, #22]
80027384:	e51b0008 	ldr	r0, [fp, #-8]
80027388:	ebffef1f 	bl	8002300c <iupdate>
8002738c:	e51b0008 	ldr	r0, [fp, #-8]
80027390:	ebfff078 	bl	80023578 <iunlockput>
80027394:	ebfff4f4 	bl	8002476c <commit_trans>
80027398:	e3e03000 	mvn	r3, #0
8002739c:	e1a00003 	mov	r0, r3
800273a0:	e24bd004 	sub	sp, fp, #4
800273a4:	e8bd8800 	pop	{fp, pc}

800273a8 <isdirempty>:
800273a8:	e92d4800 	push	{fp, lr}
800273ac:	e28db004 	add	fp, sp, #4
800273b0:	e24dd020 	sub	sp, sp, #32
800273b4:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
800273b8:	e3a03020 	mov	r3, #32
800273bc:	e50b3008 	str	r3, [fp, #-8]
800273c0:	ea000011 	b	8002740c <isdirempty+0x64>
800273c4:	e51b2008 	ldr	r2, [fp, #-8]
800273c8:	e24b1018 	sub	r1, fp, #24
800273cc:	e3a03010 	mov	r3, #16
800273d0:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
800273d4:	ebfff1af 	bl	80023a98 <readi>
800273d8:	e1a03000 	mov	r3, r0
800273dc:	e3530010 	cmp	r3, #16
800273e0:	0a000001 	beq	800273ec <isdirempty+0x44>
800273e4:	e59f0044 	ldr	r0, [pc, #68]	@ 80027430 <isdirempty+0x88>
800273e8:	ebffe9c1 	bl	80021af4 <panic>
800273ec:	e15b31b8 	ldrh	r3, [fp, #-24]	@ 0xffffffe8
800273f0:	e3530000 	cmp	r3, #0
800273f4:	0a000001 	beq	80027400 <isdirempty+0x58>
800273f8:	e3a03000 	mov	r3, #0
800273fc:	ea000008 	b	80027424 <isdirempty+0x7c>
80027400:	e51b3008 	ldr	r3, [fp, #-8]
80027404:	e2833010 	add	r3, r3, #16
80027408:	e50b3008 	str	r3, [fp, #-8]
8002740c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80027410:	e5932018 	ldr	r2, [r3, #24]
80027414:	e51b3008 	ldr	r3, [fp, #-8]
80027418:	e1520003 	cmp	r2, r3
8002741c:	8affffe8 	bhi	800273c4 <isdirempty+0x1c>
80027420:	e3a03001 	mov	r3, #1
80027424:	e1a00003 	mov	r0, r3
80027428:	e24bd004 	sub	sp, fp, #4
8002742c:	e8bd8800 	pop	{fp, pc}
80027430:	8002afc4 	.word	0x8002afc4

80027434 <sys_unlink>:
80027434:	e92d4800 	push	{fp, lr}
80027438:	e28db004 	add	fp, sp, #4
8002743c:	e24dd030 	sub	sp, sp, #48	@ 0x30
80027440:	e24b3030 	sub	r3, fp, #48	@ 0x30
80027444:	e1a01003 	mov	r1, r3
80027448:	e3a00000 	mov	r0, #0
8002744c:	ebfffe25 	bl	80026ce8 <argstr>
80027450:	e1a03000 	mov	r3, r0
80027454:	e3530000 	cmp	r3, #0
80027458:	aa000001 	bge	80027464 <sys_unlink+0x30>
8002745c:	e3e03000 	mvn	r3, #0
80027460:	ea00006d 	b	8002761c <sys_unlink+0x1e8>
80027464:	e51b3030 	ldr	r3, [fp, #-48]	@ 0xffffffd0
80027468:	e24b202c 	sub	r2, fp, #44	@ 0x2c
8002746c:	e1a01002 	mov	r1, r2
80027470:	e1a00003 	mov	r0, r3
80027474:	ebfff3bd 	bl	80024370 <nameiparent>
80027478:	e50b0008 	str	r0, [fp, #-8]
8002747c:	e51b3008 	ldr	r3, [fp, #-8]
80027480:	e3530000 	cmp	r3, #0
80027484:	1a000001 	bne	80027490 <sys_unlink+0x5c>
80027488:	e3e03000 	mvn	r3, #0
8002748c:	ea000062 	b	8002761c <sys_unlink+0x1e8>
80027490:	ebfff4a1 	bl	8002471c <begin_trans>
80027494:	e51b0008 	ldr	r0, [fp, #-8]
80027498:	ebffef75 	bl	80023274 <ilock>
8002749c:	e24b302c 	sub	r3, fp, #44	@ 0x2c
800274a0:	e59f1180 	ldr	r1, [pc, #384]	@ 80027628 <sys_unlink+0x1f4>
800274a4:	e1a00003 	mov	r0, r3
800274a8:	ebfff27e 	bl	80023ea8 <namecmp>
800274ac:	e1a03000 	mov	r3, r0
800274b0:	e3530000 	cmp	r3, #0
800274b4:	0a000051 	beq	80027600 <sys_unlink+0x1cc>
800274b8:	e24b302c 	sub	r3, fp, #44	@ 0x2c
800274bc:	e59f1168 	ldr	r1, [pc, #360]	@ 8002762c <sys_unlink+0x1f8>
800274c0:	e1a00003 	mov	r0, r3
800274c4:	ebfff277 	bl	80023ea8 <namecmp>
800274c8:	e1a03000 	mov	r3, r0
800274cc:	e3530000 	cmp	r3, #0
800274d0:	0a00004a 	beq	80027600 <sys_unlink+0x1cc>
800274d4:	e24b2034 	sub	r2, fp, #52	@ 0x34
800274d8:	e24b302c 	sub	r3, fp, #44	@ 0x2c
800274dc:	e1a01003 	mov	r1, r3
800274e0:	e51b0008 	ldr	r0, [fp, #-8]
800274e4:	ebfff27c 	bl	80023edc <dirlookup>
800274e8:	e50b000c 	str	r0, [fp, #-12]
800274ec:	e51b300c 	ldr	r3, [fp, #-12]
800274f0:	e3530000 	cmp	r3, #0
800274f4:	0a000043 	beq	80027608 <sys_unlink+0x1d4>
800274f8:	e51b000c 	ldr	r0, [fp, #-12]
800274fc:	ebffef5c 	bl	80023274 <ilock>
80027500:	e51b300c 	ldr	r3, [fp, #-12]
80027504:	e1d331f6 	ldrsh	r3, [r3, #22]
80027508:	e3530000 	cmp	r3, #0
8002750c:	ca000001 	bgt	80027518 <sys_unlink+0xe4>
80027510:	e59f0118 	ldr	r0, [pc, #280]	@ 80027630 <sys_unlink+0x1fc>
80027514:	ebffe976 	bl	80021af4 <panic>
80027518:	e51b300c 	ldr	r3, [fp, #-12]
8002751c:	e1d331f0 	ldrsh	r3, [r3, #16]
80027520:	e3530001 	cmp	r3, #1
80027524:	1a000007 	bne	80027548 <sys_unlink+0x114>
80027528:	e51b000c 	ldr	r0, [fp, #-12]
8002752c:	ebffff9d 	bl	800273a8 <isdirempty>
80027530:	e1a03000 	mov	r3, r0
80027534:	e3530000 	cmp	r3, #0
80027538:	1a000002 	bne	80027548 <sys_unlink+0x114>
8002753c:	e51b000c 	ldr	r0, [fp, #-12]
80027540:	ebfff00c 	bl	80023578 <iunlockput>
80027544:	ea000030 	b	8002760c <sys_unlink+0x1d8>
80027548:	e24b301c 	sub	r3, fp, #28
8002754c:	e3a02010 	mov	r2, #16
80027550:	e3a01000 	mov	r1, #0
80027554:	e1a00003 	mov	r0, r3
80027558:	ebffe2a8 	bl	80020000 <memset>
8002755c:	e51b2034 	ldr	r2, [fp, #-52]	@ 0xffffffcc
80027560:	e24b101c 	sub	r1, fp, #28
80027564:	e3a03010 	mov	r3, #16
80027568:	e51b0008 	ldr	r0, [fp, #-8]
8002756c:	ebfff1c4 	bl	80023c84 <writei>
80027570:	e1a03000 	mov	r3, r0
80027574:	e3530010 	cmp	r3, #16
80027578:	0a000001 	beq	80027584 <sys_unlink+0x150>
8002757c:	e59f00b0 	ldr	r0, [pc, #176]	@ 80027634 <sys_unlink+0x200>
80027580:	ebffe95b 	bl	80021af4 <panic>
80027584:	e51b300c 	ldr	r3, [fp, #-12]
80027588:	e1d331f0 	ldrsh	r3, [r3, #16]
8002758c:	e3530001 	cmp	r3, #1
80027590:	1a000009 	bne	800275bc <sys_unlink+0x188>
80027594:	e51b3008 	ldr	r3, [fp, #-8]
80027598:	e1d331f6 	ldrsh	r3, [r3, #22]
8002759c:	e6ff3073 	uxth	r3, r3
800275a0:	e2433001 	sub	r3, r3, #1
800275a4:	e6ff3073 	uxth	r3, r3
800275a8:	e6bf2073 	sxth	r2, r3
800275ac:	e51b3008 	ldr	r3, [fp, #-8]
800275b0:	e1c321b6 	strh	r2, [r3, #22]
800275b4:	e51b0008 	ldr	r0, [fp, #-8]
800275b8:	ebffee93 	bl	8002300c <iupdate>
800275bc:	e51b0008 	ldr	r0, [fp, #-8]
800275c0:	ebffefec 	bl	80023578 <iunlockput>
800275c4:	e51b300c 	ldr	r3, [fp, #-12]
800275c8:	e1d331f6 	ldrsh	r3, [r3, #22]
800275cc:	e6ff3073 	uxth	r3, r3
800275d0:	e2433001 	sub	r3, r3, #1
800275d4:	e6ff3073 	uxth	r3, r3
800275d8:	e6bf2073 	sxth	r2, r3
800275dc:	e51b300c 	ldr	r3, [fp, #-12]
800275e0:	e1c321b6 	strh	r2, [r3, #22]
800275e4:	e51b000c 	ldr	r0, [fp, #-12]
800275e8:	ebffee87 	bl	8002300c <iupdate>
800275ec:	e51b000c 	ldr	r0, [fp, #-12]
800275f0:	ebffefe0 	bl	80023578 <iunlockput>
800275f4:	ebfff45c 	bl	8002476c <commit_trans>
800275f8:	e3a03000 	mov	r3, #0
800275fc:	ea000006 	b	8002761c <sys_unlink+0x1e8>
80027600:	e1a00000 	nop			@ (mov r0, r0)
80027604:	ea000000 	b	8002760c <sys_unlink+0x1d8>
80027608:	e1a00000 	nop			@ (mov r0, r0)
8002760c:	e51b0008 	ldr	r0, [fp, #-8]
80027610:	ebffefd8 	bl	80023578 <iunlockput>
80027614:	ebfff454 	bl	8002476c <commit_trans>
80027618:	e3e03000 	mvn	r3, #0
8002761c:	e1a00003 	mov	r0, r3
80027620:	e24bd004 	sub	sp, fp, #4
80027624:	e8bd8800 	pop	{fp, pc}
80027628:	8002afd8 	.word	0x8002afd8
8002762c:	8002afdc 	.word	0x8002afdc
80027630:	8002afe0 	.word	0x8002afe0
80027634:	8002aff4 	.word	0x8002aff4

80027638 <create>:
80027638:	e92d4800 	push	{fp, lr}
8002763c:	e28db004 	add	fp, sp, #4
80027640:	e24dd030 	sub	sp, sp, #48	@ 0x30
80027644:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
80027648:	e1a00001 	mov	r0, r1
8002764c:	e1a01002 	mov	r1, r2
80027650:	e1a02003 	mov	r2, r3
80027654:	e1a03000 	mov	r3, r0
80027658:	e14b32ba 	strh	r3, [fp, #-42]	@ 0xffffffd6
8002765c:	e1a03001 	mov	r3, r1
80027660:	e14b32bc 	strh	r3, [fp, #-44]	@ 0xffffffd4
80027664:	e1a03002 	mov	r3, r2
80027668:	e14b32be 	strh	r3, [fp, #-46]	@ 0xffffffd2
8002766c:	e24b3020 	sub	r3, fp, #32
80027670:	e1a01003 	mov	r1, r3
80027674:	e51b0028 	ldr	r0, [fp, #-40]	@ 0xffffffd8
80027678:	ebfff33c 	bl	80024370 <nameiparent>
8002767c:	e50b0008 	str	r0, [fp, #-8]
80027680:	e51b3008 	ldr	r3, [fp, #-8]
80027684:	e3530000 	cmp	r3, #0
80027688:	1a000001 	bne	80027694 <create+0x5c>
8002768c:	e3a03000 	mov	r3, #0
80027690:	ea000063 	b	80027824 <create+0x1ec>
80027694:	e51b0008 	ldr	r0, [fp, #-8]
80027698:	ebffeef5 	bl	80023274 <ilock>
8002769c:	e24b2010 	sub	r2, fp, #16
800276a0:	e24b3020 	sub	r3, fp, #32
800276a4:	e1a01003 	mov	r1, r3
800276a8:	e51b0008 	ldr	r0, [fp, #-8]
800276ac:	ebfff20a 	bl	80023edc <dirlookup>
800276b0:	e50b000c 	str	r0, [fp, #-12]
800276b4:	e51b300c 	ldr	r3, [fp, #-12]
800276b8:	e3530000 	cmp	r3, #0
800276bc:	0a000010 	beq	80027704 <create+0xcc>
800276c0:	e51b0008 	ldr	r0, [fp, #-8]
800276c4:	ebffefab 	bl	80023578 <iunlockput>
800276c8:	e51b000c 	ldr	r0, [fp, #-12]
800276cc:	ebffeee8 	bl	80023274 <ilock>
800276d0:	e15b32fa 	ldrsh	r3, [fp, #-42]	@ 0xffffffd6
800276d4:	e3530002 	cmp	r3, #2
800276d8:	1a000005 	bne	800276f4 <create+0xbc>
800276dc:	e51b300c 	ldr	r3, [fp, #-12]
800276e0:	e1d331f0 	ldrsh	r3, [r3, #16]
800276e4:	e3530002 	cmp	r3, #2
800276e8:	1a000001 	bne	800276f4 <create+0xbc>
800276ec:	e51b300c 	ldr	r3, [fp, #-12]
800276f0:	ea00004b 	b	80027824 <create+0x1ec>
800276f4:	e51b000c 	ldr	r0, [fp, #-12]
800276f8:	ebffef9e 	bl	80023578 <iunlockput>
800276fc:	e3a03000 	mov	r3, #0
80027700:	ea000047 	b	80027824 <create+0x1ec>
80027704:	e51b3008 	ldr	r3, [fp, #-8]
80027708:	e5933000 	ldr	r3, [r3]
8002770c:	e15b22fa 	ldrsh	r2, [fp, #-42]	@ 0xffffffd6
80027710:	e1a01002 	mov	r1, r2
80027714:	e1a00003 	mov	r0, r3
80027718:	ebffedfb 	bl	80022f0c <ialloc>
8002771c:	e50b000c 	str	r0, [fp, #-12]
80027720:	e51b300c 	ldr	r3, [fp, #-12]
80027724:	e3530000 	cmp	r3, #0
80027728:	1a000001 	bne	80027734 <create+0xfc>
8002772c:	e59f00fc 	ldr	r0, [pc, #252]	@ 80027830 <create+0x1f8>
80027730:	ebffe8ef 	bl	80021af4 <panic>
80027734:	e51b000c 	ldr	r0, [fp, #-12]
80027738:	ebffeecd 	bl	80023274 <ilock>
8002773c:	e51b300c 	ldr	r3, [fp, #-12]
80027740:	e15b22bc 	ldrh	r2, [fp, #-44]	@ 0xffffffd4
80027744:	e1c321b2 	strh	r2, [r3, #18]
80027748:	e51b300c 	ldr	r3, [fp, #-12]
8002774c:	e15b22be 	ldrh	r2, [fp, #-46]	@ 0xffffffd2
80027750:	e1c321b4 	strh	r2, [r3, #20]
80027754:	e51b300c 	ldr	r3, [fp, #-12]
80027758:	e3a02001 	mov	r2, #1
8002775c:	e1c321b6 	strh	r2, [r3, #22]
80027760:	e51b000c 	ldr	r0, [fp, #-12]
80027764:	ebffee28 	bl	8002300c <iupdate>
80027768:	e15b32fa 	ldrsh	r3, [fp, #-42]	@ 0xffffffd6
8002776c:	e3530001 	cmp	r3, #1
80027770:	1a00001d 	bne	800277ec <create+0x1b4>
80027774:	e51b3008 	ldr	r3, [fp, #-8]
80027778:	e1d331f6 	ldrsh	r3, [r3, #22]
8002777c:	e6ff3073 	uxth	r3, r3
80027780:	e2833001 	add	r3, r3, #1
80027784:	e6ff3073 	uxth	r3, r3
80027788:	e6bf2073 	sxth	r2, r3
8002778c:	e51b3008 	ldr	r3, [fp, #-8]
80027790:	e1c321b6 	strh	r2, [r3, #22]
80027794:	e51b0008 	ldr	r0, [fp, #-8]
80027798:	ebffee1b 	bl	8002300c <iupdate>
8002779c:	e51b300c 	ldr	r3, [fp, #-12]
800277a0:	e5933004 	ldr	r3, [r3, #4]
800277a4:	e1a02003 	mov	r2, r3
800277a8:	e59f1084 	ldr	r1, [pc, #132]	@ 80027834 <create+0x1fc>
800277ac:	e51b000c 	ldr	r0, [fp, #-12]
800277b0:	ebfff20b 	bl	80023fe4 <dirlink>
800277b4:	e1a03000 	mov	r3, r0
800277b8:	e3530000 	cmp	r3, #0
800277bc:	ba000008 	blt	800277e4 <create+0x1ac>
800277c0:	e51b3008 	ldr	r3, [fp, #-8]
800277c4:	e5933004 	ldr	r3, [r3, #4]
800277c8:	e1a02003 	mov	r2, r3
800277cc:	e59f1064 	ldr	r1, [pc, #100]	@ 80027838 <create+0x200>
800277d0:	e51b000c 	ldr	r0, [fp, #-12]
800277d4:	ebfff202 	bl	80023fe4 <dirlink>
800277d8:	e1a03000 	mov	r3, r0
800277dc:	e3530000 	cmp	r3, #0
800277e0:	aa000001 	bge	800277ec <create+0x1b4>
800277e4:	e59f0050 	ldr	r0, [pc, #80]	@ 8002783c <create+0x204>
800277e8:	ebffe8c1 	bl	80021af4 <panic>
800277ec:	e51b300c 	ldr	r3, [fp, #-12]
800277f0:	e5932004 	ldr	r2, [r3, #4]
800277f4:	e24b3020 	sub	r3, fp, #32
800277f8:	e1a01003 	mov	r1, r3
800277fc:	e51b0008 	ldr	r0, [fp, #-8]
80027800:	ebfff1f7 	bl	80023fe4 <dirlink>
80027804:	e1a03000 	mov	r3, r0
80027808:	e3530000 	cmp	r3, #0
8002780c:	aa000001 	bge	80027818 <create+0x1e0>
80027810:	e59f0028 	ldr	r0, [pc, #40]	@ 80027840 <create+0x208>
80027814:	ebffe8b6 	bl	80021af4 <panic>
80027818:	e51b0008 	ldr	r0, [fp, #-8]
8002781c:	ebffef55 	bl	80023578 <iunlockput>
80027820:	e51b300c 	ldr	r3, [fp, #-12]
80027824:	e1a00003 	mov	r0, r3
80027828:	e24bd004 	sub	sp, fp, #4
8002782c:	e8bd8800 	pop	{fp, pc}
80027830:	8002b004 	.word	0x8002b004
80027834:	8002afd8 	.word	0x8002afd8
80027838:	8002afdc 	.word	0x8002afdc
8002783c:	8002b014 	.word	0x8002b014
80027840:	8002b020 	.word	0x8002b020

80027844 <sys_open>:
80027844:	e92d4800 	push	{fp, lr}
80027848:	e28db004 	add	fp, sp, #4
8002784c:	e24dd098 	sub	sp, sp, #152	@ 0x98
80027850:	e24b3018 	sub	r3, fp, #24
80027854:	e1a01003 	mov	r1, r3
80027858:	e3a00000 	mov	r0, #0
8002785c:	ebfffd21 	bl	80026ce8 <argstr>
80027860:	e1a03000 	mov	r3, r0
80027864:	e3530000 	cmp	r3, #0
80027868:	ba000006 	blt	80027888 <sys_open+0x44>
8002786c:	e24b301c 	sub	r3, fp, #28
80027870:	e1a01003 	mov	r1, r3
80027874:	e3a00001 	mov	r0, #1
80027878:	ebfffcd6 	bl	80026bd8 <argint>
8002787c:	e1a03000 	mov	r3, r0
80027880:	e3530000 	cmp	r3, #0
80027884:	aa000001 	bge	80027890 <sys_open+0x4c>
80027888:	e3e03000 	mvn	r3, #0
8002788c:	ea000081 	b	80027a98 <sys_open+0x254>
80027890:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80027894:	e2033c02 	and	r3, r3, #512	@ 0x200
80027898:	e3530000 	cmp	r3, #0
8002789c:	0a00000c 	beq	800278d4 <sys_open+0x90>
800278a0:	ebfff39d 	bl	8002471c <begin_trans>
800278a4:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
800278a8:	e3a03000 	mov	r3, #0
800278ac:	e3a02000 	mov	r2, #0
800278b0:	e3a01002 	mov	r1, #2
800278b4:	ebffff5f 	bl	80027638 <create>
800278b8:	e50b0008 	str	r0, [fp, #-8]
800278bc:	ebfff3aa 	bl	8002476c <commit_trans>
800278c0:	e51b3008 	ldr	r3, [fp, #-8]
800278c4:	e3530000 	cmp	r3, #0
800278c8:	1a00003b 	bne	800279bc <sys_open+0x178>
800278cc:	e3e03000 	mvn	r3, #0
800278d0:	ea000070 	b	80027a98 <sys_open+0x254>
800278d4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800278d8:	e1a00003 	mov	r0, r3
800278dc:	ebfff296 	bl	8002433c <namei>
800278e0:	e50b0008 	str	r0, [fp, #-8]
800278e4:	e51b3008 	ldr	r3, [fp, #-8]
800278e8:	e3530000 	cmp	r3, #0
800278ec:	1a000001 	bne	800278f8 <sys_open+0xb4>
800278f0:	e3e03000 	mvn	r3, #0
800278f4:	ea000067 	b	80027a98 <sys_open+0x254>
800278f8:	e51b0008 	ldr	r0, [fp, #-8]
800278fc:	ebffee5c 	bl	80023274 <ilock>
80027900:	ea00001e 	b	80027980 <sys_open+0x13c>
80027904:	e24b109c 	sub	r1, fp, #156	@ 0x9c
80027908:	e3a0307f 	mov	r3, #127	@ 0x7f
8002790c:	e3a02000 	mov	r2, #0
80027910:	e51b0008 	ldr	r0, [fp, #-8]
80027914:	ebfff05f 	bl	80023a98 <readi>
80027918:	e50b000c 	str	r0, [fp, #-12]
8002791c:	e51b300c 	ldr	r3, [fp, #-12]
80027920:	e3530000 	cmp	r3, #0
80027924:	ca000003 	bgt	80027938 <sys_open+0xf4>
80027928:	e51b0008 	ldr	r0, [fp, #-8]
8002792c:	ebffef11 	bl	80023578 <iunlockput>
80027930:	e3e03000 	mvn	r3, #0
80027934:	ea000057 	b	80027a98 <sys_open+0x254>
80027938:	e24b209c 	sub	r2, fp, #156	@ 0x9c
8002793c:	e51b300c 	ldr	r3, [fp, #-12]
80027940:	e0823003 	add	r3, r2, r3
80027944:	e3a02000 	mov	r2, #0
80027948:	e5c32000 	strb	r2, [r3]
8002794c:	e51b0008 	ldr	r0, [fp, #-8]
80027950:	ebffef08 	bl	80023578 <iunlockput>
80027954:	e24b309c 	sub	r3, fp, #156	@ 0x9c
80027958:	e1a00003 	mov	r0, r3
8002795c:	ebfff276 	bl	8002433c <namei>
80027960:	e50b0008 	str	r0, [fp, #-8]
80027964:	e51b3008 	ldr	r3, [fp, #-8]
80027968:	e3530000 	cmp	r3, #0
8002796c:	1a000001 	bne	80027978 <sys_open+0x134>
80027970:	e3e03000 	mvn	r3, #0
80027974:	ea000047 	b	80027a98 <sys_open+0x254>
80027978:	e51b0008 	ldr	r0, [fp, #-8]
8002797c:	ebffee3c 	bl	80023274 <ilock>
80027980:	e51b3008 	ldr	r3, [fp, #-8]
80027984:	e1d331f0 	ldrsh	r3, [r3, #16]
80027988:	e3530004 	cmp	r3, #4
8002798c:	0affffdc 	beq	80027904 <sys_open+0xc0>
80027990:	e51b3008 	ldr	r3, [fp, #-8]
80027994:	e1d331f0 	ldrsh	r3, [r3, #16]
80027998:	e3530001 	cmp	r3, #1
8002799c:	1a000006 	bne	800279bc <sys_open+0x178>
800279a0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
800279a4:	e3530000 	cmp	r3, #0
800279a8:	0a000003 	beq	800279bc <sys_open+0x178>
800279ac:	e51b0008 	ldr	r0, [fp, #-8]
800279b0:	ebffeef0 	bl	80023578 <iunlockput>
800279b4:	e3e03000 	mvn	r3, #0
800279b8:	ea000036 	b	80027a98 <sys_open+0x254>
800279bc:	ebffeb25 	bl	80022658 <filealloc>
800279c0:	e50b0010 	str	r0, [fp, #-16]
800279c4:	e51b3010 	ldr	r3, [fp, #-16]
800279c8:	e3530000 	cmp	r3, #0
800279cc:	0a000005 	beq	800279e8 <sys_open+0x1a4>
800279d0:	e51b0010 	ldr	r0, [fp, #-16]
800279d4:	ebfffd45 	bl	80026ef0 <fdalloc>
800279d8:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
800279dc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800279e0:	e3530000 	cmp	r3, #0
800279e4:	aa000008 	bge	80027a0c <sys_open+0x1c8>
800279e8:	e51b3010 	ldr	r3, [fp, #-16]
800279ec:	e3530000 	cmp	r3, #0
800279f0:	0a000001 	beq	800279fc <sys_open+0x1b8>
800279f4:	e51b0010 	ldr	r0, [fp, #-16]
800279f8:	ebffeb52 	bl	80022748 <fileclose>
800279fc:	e51b0008 	ldr	r0, [fp, #-8]
80027a00:	ebffeedc 	bl	80023578 <iunlockput>
80027a04:	e3e03000 	mvn	r3, #0
80027a08:	ea000022 	b	80027a98 <sys_open+0x254>
80027a0c:	e51b0008 	ldr	r0, [fp, #-8]
80027a10:	ebffee7b 	bl	80023404 <iunlock>
80027a14:	e51b3010 	ldr	r3, [fp, #-16]
80027a18:	e3a02002 	mov	r2, #2
80027a1c:	e5c32000 	strb	r2, [r3]
80027a20:	e51b3010 	ldr	r3, [fp, #-16]
80027a24:	e51b2008 	ldr	r2, [fp, #-8]
80027a28:	e5832010 	str	r2, [r3, #16]
80027a2c:	e51b3010 	ldr	r3, [fp, #-16]
80027a30:	e3a02000 	mov	r2, #0
80027a34:	e5832014 	str	r2, [r3, #20]
80027a38:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80027a3c:	e2033001 	and	r3, r3, #1
80027a40:	e3530000 	cmp	r3, #0
80027a44:	03a03001 	moveq	r3, #1
80027a48:	13a03000 	movne	r3, #0
80027a4c:	e6ef3073 	uxtb	r3, r3
80027a50:	e1a02003 	mov	r2, r3
80027a54:	e51b3010 	ldr	r3, [fp, #-16]
80027a58:	e5c32008 	strb	r2, [r3, #8]
80027a5c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80027a60:	e2033001 	and	r3, r3, #1
80027a64:	e3530000 	cmp	r3, #0
80027a68:	1a000003 	bne	80027a7c <sys_open+0x238>
80027a6c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80027a70:	e2033002 	and	r3, r3, #2
80027a74:	e3530000 	cmp	r3, #0
80027a78:	0a000001 	beq	80027a84 <sys_open+0x240>
80027a7c:	e3a03001 	mov	r3, #1
80027a80:	ea000000 	b	80027a88 <sys_open+0x244>
80027a84:	e3a03000 	mov	r3, #0
80027a88:	e6ef2073 	uxtb	r2, r3
80027a8c:	e51b3010 	ldr	r3, [fp, #-16]
80027a90:	e5c32009 	strb	r2, [r3, #9]
80027a94:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80027a98:	e1a00003 	mov	r0, r3
80027a9c:	e24bd004 	sub	sp, fp, #4
80027aa0:	e8bd8800 	pop	{fp, pc}

80027aa4 <sys_mkdir>:
80027aa4:	e92d4800 	push	{fp, lr}
80027aa8:	e28db004 	add	fp, sp, #4
80027aac:	e24dd008 	sub	sp, sp, #8
80027ab0:	ebfff319 	bl	8002471c <begin_trans>
80027ab4:	e24b300c 	sub	r3, fp, #12
80027ab8:	e1a01003 	mov	r1, r3
80027abc:	e3a00000 	mov	r0, #0
80027ac0:	ebfffc88 	bl	80026ce8 <argstr>
80027ac4:	e1a03000 	mov	r3, r0
80027ac8:	e3530000 	cmp	r3, #0
80027acc:	ba000008 	blt	80027af4 <sys_mkdir+0x50>
80027ad0:	e51b000c 	ldr	r0, [fp, #-12]
80027ad4:	e3a03000 	mov	r3, #0
80027ad8:	e3a02000 	mov	r2, #0
80027adc:	e3a01001 	mov	r1, #1
80027ae0:	ebfffed4 	bl	80027638 <create>
80027ae4:	e50b0008 	str	r0, [fp, #-8]
80027ae8:	e51b3008 	ldr	r3, [fp, #-8]
80027aec:	e3530000 	cmp	r3, #0
80027af0:	1a000002 	bne	80027b00 <sys_mkdir+0x5c>
80027af4:	ebfff31c 	bl	8002476c <commit_trans>
80027af8:	e3e03000 	mvn	r3, #0
80027afc:	ea000003 	b	80027b10 <sys_mkdir+0x6c>
80027b00:	e51b0008 	ldr	r0, [fp, #-8]
80027b04:	ebffee9b 	bl	80023578 <iunlockput>
80027b08:	ebfff317 	bl	8002476c <commit_trans>
80027b0c:	e3a03000 	mov	r3, #0
80027b10:	e1a00003 	mov	r0, r3
80027b14:	e24bd004 	sub	sp, fp, #4
80027b18:	e8bd8800 	pop	{fp, pc}

80027b1c <sys_mknod>:
80027b1c:	e92d4800 	push	{fp, lr}
80027b20:	e28db004 	add	fp, sp, #4
80027b24:	e24dd018 	sub	sp, sp, #24
80027b28:	ebfff2fb 	bl	8002471c <begin_trans>
80027b2c:	e24b3010 	sub	r3, fp, #16
80027b30:	e1a01003 	mov	r1, r3
80027b34:	e3a00000 	mov	r0, #0
80027b38:	ebfffc6a 	bl	80026ce8 <argstr>
80027b3c:	e50b0008 	str	r0, [fp, #-8]
80027b40:	e51b3008 	ldr	r3, [fp, #-8]
80027b44:	e3530000 	cmp	r3, #0
80027b48:	ba000018 	blt	80027bb0 <sys_mknod+0x94>
80027b4c:	e24b3014 	sub	r3, fp, #20
80027b50:	e1a01003 	mov	r1, r3
80027b54:	e3a00001 	mov	r0, #1
80027b58:	ebfffc1e 	bl	80026bd8 <argint>
80027b5c:	e1a03000 	mov	r3, r0
80027b60:	e3530000 	cmp	r3, #0
80027b64:	ba000011 	blt	80027bb0 <sys_mknod+0x94>
80027b68:	e24b3018 	sub	r3, fp, #24
80027b6c:	e1a01003 	mov	r1, r3
80027b70:	e3a00002 	mov	r0, #2
80027b74:	ebfffc17 	bl	80026bd8 <argint>
80027b78:	e1a03000 	mov	r3, r0
80027b7c:	e3530000 	cmp	r3, #0
80027b80:	ba00000a 	blt	80027bb0 <sys_mknod+0x94>
80027b84:	e51b0010 	ldr	r0, [fp, #-16]
80027b88:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80027b8c:	e6bf2073 	sxth	r2, r3
80027b90:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80027b94:	e6bf3073 	sxth	r3, r3
80027b98:	e3a01003 	mov	r1, #3
80027b9c:	ebfffea5 	bl	80027638 <create>
80027ba0:	e50b000c 	str	r0, [fp, #-12]
80027ba4:	e51b300c 	ldr	r3, [fp, #-12]
80027ba8:	e3530000 	cmp	r3, #0
80027bac:	1a000002 	bne	80027bbc <sys_mknod+0xa0>
80027bb0:	ebfff2ed 	bl	8002476c <commit_trans>
80027bb4:	e3e03000 	mvn	r3, #0
80027bb8:	ea000003 	b	80027bcc <sys_mknod+0xb0>
80027bbc:	e51b000c 	ldr	r0, [fp, #-12]
80027bc0:	ebffee6c 	bl	80023578 <iunlockput>
80027bc4:	ebfff2e8 	bl	8002476c <commit_trans>
80027bc8:	e3a03000 	mov	r3, #0
80027bcc:	e1a00003 	mov	r0, r3
80027bd0:	e24bd004 	sub	sp, fp, #4
80027bd4:	e8bd8800 	pop	{fp, pc}

80027bd8 <sys_chdir>:
80027bd8:	e92d4800 	push	{fp, lr}
80027bdc:	e28db004 	add	fp, sp, #4
80027be0:	e24dd008 	sub	sp, sp, #8
80027be4:	e24b300c 	sub	r3, fp, #12
80027be8:	e1a01003 	mov	r1, r3
80027bec:	e3a00000 	mov	r0, #0
80027bf0:	ebfffc3c 	bl	80026ce8 <argstr>
80027bf4:	e1a03000 	mov	r3, r0
80027bf8:	e3530000 	cmp	r3, #0
80027bfc:	ba000006 	blt	80027c1c <sys_chdir+0x44>
80027c00:	e51b300c 	ldr	r3, [fp, #-12]
80027c04:	e1a00003 	mov	r0, r3
80027c08:	ebfff1cb 	bl	8002433c <namei>
80027c0c:	e50b0008 	str	r0, [fp, #-8]
80027c10:	e51b3008 	ldr	r3, [fp, #-8]
80027c14:	e3530000 	cmp	r3, #0
80027c18:	1a000001 	bne	80027c24 <sys_chdir+0x4c>
80027c1c:	e3e03000 	mvn	r3, #0
80027c20:	ea000015 	b	80027c7c <sys_chdir+0xa4>
80027c24:	e51b0008 	ldr	r0, [fp, #-8]
80027c28:	ebffed91 	bl	80023274 <ilock>
80027c2c:	e51b3008 	ldr	r3, [fp, #-8]
80027c30:	e1d331f0 	ldrsh	r3, [r3, #16]
80027c34:	e3530001 	cmp	r3, #1
80027c38:	0a000003 	beq	80027c4c <sys_chdir+0x74>
80027c3c:	e51b0008 	ldr	r0, [fp, #-8]
80027c40:	ebffee4c 	bl	80023578 <iunlockput>
80027c44:	e3e03000 	mvn	r3, #0
80027c48:	ea00000b 	b	80027c7c <sys_chdir+0xa4>
80027c4c:	e51b0008 	ldr	r0, [fp, #-8]
80027c50:	ebffedeb 	bl	80023404 <iunlock>
80027c54:	e59f302c 	ldr	r3, [pc, #44]	@ 80027c88 <sys_chdir+0xb0>
80027c58:	e5933000 	ldr	r3, [r3]
80027c5c:	e5933068 	ldr	r3, [r3, #104]	@ 0x68
80027c60:	e1a00003 	mov	r0, r3
80027c64:	ebffee08 	bl	8002348c <iput>
80027c68:	e59f3018 	ldr	r3, [pc, #24]	@ 80027c88 <sys_chdir+0xb0>
80027c6c:	e5933000 	ldr	r3, [r3]
80027c70:	e51b2008 	ldr	r2, [fp, #-8]
80027c74:	e5832068 	str	r2, [r3, #104]	@ 0x68
80027c78:	e3a03000 	mov	r3, #0
80027c7c:	e1a00003 	mov	r0, r3
80027c80:	e24bd004 	sub	sp, fp, #4
80027c84:	e8bd8800 	pop	{fp, pc}
80027c88:	800d97a8 	.word	0x800d97a8

80027c8c <sys_exec>:
80027c8c:	e92d4800 	push	{fp, lr}
80027c90:	e28db004 	add	fp, sp, #4
80027c94:	e24dd090 	sub	sp, sp, #144	@ 0x90
80027c98:	e24b300c 	sub	r3, fp, #12
80027c9c:	e1a01003 	mov	r1, r3
80027ca0:	e3a00000 	mov	r0, #0
80027ca4:	ebfffc0f 	bl	80026ce8 <argstr>
80027ca8:	e1a03000 	mov	r3, r0
80027cac:	e3530000 	cmp	r3, #0
80027cb0:	ba000006 	blt	80027cd0 <sys_exec+0x44>
80027cb4:	e24b3090 	sub	r3, fp, #144	@ 0x90
80027cb8:	e1a01003 	mov	r1, r3
80027cbc:	e3a00001 	mov	r0, #1
80027cc0:	ebfffbc4 	bl	80026bd8 <argint>
80027cc4:	e1a03000 	mov	r3, r0
80027cc8:	e3530000 	cmp	r3, #0
80027ccc:	aa000001 	bge	80027cd8 <sys_exec+0x4c>
80027cd0:	e3e03000 	mvn	r3, #0
80027cd4:	ea00003a 	b	80027dc4 <sys_exec+0x138>
80027cd8:	e24b308c 	sub	r3, fp, #140	@ 0x8c
80027cdc:	e3a02080 	mov	r2, #128	@ 0x80
80027ce0:	e3a01000 	mov	r1, #0
80027ce4:	e1a00003 	mov	r0, r3
80027ce8:	ebffe0c4 	bl	80020000 <memset>
80027cec:	e3a03000 	mov	r3, #0
80027cf0:	e50b3008 	str	r3, [fp, #-8]
80027cf4:	e51b3008 	ldr	r3, [fp, #-8]
80027cf8:	e353001f 	cmp	r3, #31
80027cfc:	9a000001 	bls	80027d08 <sys_exec+0x7c>
80027d00:	e3e03000 	mvn	r3, #0
80027d04:	ea00002e 	b	80027dc4 <sys_exec+0x138>
80027d08:	e51b3008 	ldr	r3, [fp, #-8]
80027d0c:	e1a03103 	lsl	r3, r3, #2
80027d10:	e1a02003 	mov	r2, r3
80027d14:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
80027d18:	e0823003 	add	r3, r2, r3
80027d1c:	e24b2094 	sub	r2, fp, #148	@ 0x94
80027d20:	e1a01002 	mov	r1, r2
80027d24:	e1a00003 	mov	r0, r3
80027d28:	ebfffb5e 	bl	80026aa8 <fetchint>
80027d2c:	e1a03000 	mov	r3, r0
80027d30:	e3530000 	cmp	r3, #0
80027d34:	aa000001 	bge	80027d40 <sys_exec+0xb4>
80027d38:	e3e03000 	mvn	r3, #0
80027d3c:	ea000020 	b	80027dc4 <sys_exec+0x138>
80027d40:	e51b3094 	ldr	r3, [fp, #-148]	@ 0xffffff6c
80027d44:	e3530000 	cmp	r3, #0
80027d48:	1a00000d 	bne	80027d84 <sys_exec+0xf8>
80027d4c:	e51b3008 	ldr	r3, [fp, #-8]
80027d50:	e1a03103 	lsl	r3, r3, #2
80027d54:	e2433004 	sub	r3, r3, #4
80027d58:	e083300b 	add	r3, r3, fp
80027d5c:	e3a02000 	mov	r2, #0
80027d60:	e5032088 	str	r2, [r3, #-136]	@ 0xffffff78
80027d64:	e1a00000 	nop			@ (mov r0, r0)
80027d68:	e51b300c 	ldr	r3, [fp, #-12]
80027d6c:	e24b208c 	sub	r2, fp, #140	@ 0x8c
80027d70:	e1a01002 	mov	r1, r2
80027d74:	e1a00003 	mov	r0, r3
80027d78:	ebffe8fa 	bl	80022168 <exec>
80027d7c:	e1a03000 	mov	r3, r0
80027d80:	ea00000f 	b	80027dc4 <sys_exec+0x138>
80027d84:	e51b0094 	ldr	r0, [fp, #-148]	@ 0xffffff6c
80027d88:	e24b208c 	sub	r2, fp, #140	@ 0x8c
80027d8c:	e51b3008 	ldr	r3, [fp, #-8]
80027d90:	e1a03103 	lsl	r3, r3, #2
80027d94:	e0823003 	add	r3, r2, r3
80027d98:	e1a01003 	mov	r1, r3
80027d9c:	ebfffb5f 	bl	80026b20 <fetchstr>
80027da0:	e1a03000 	mov	r3, r0
80027da4:	e3530000 	cmp	r3, #0
80027da8:	aa000001 	bge	80027db4 <sys_exec+0x128>
80027dac:	e3e03000 	mvn	r3, #0
80027db0:	ea000003 	b	80027dc4 <sys_exec+0x138>
80027db4:	e51b3008 	ldr	r3, [fp, #-8]
80027db8:	e2833001 	add	r3, r3, #1
80027dbc:	e50b3008 	str	r3, [fp, #-8]
80027dc0:	eaffffcb 	b	80027cf4 <sys_exec+0x68>
80027dc4:	e1a00003 	mov	r0, r3
80027dc8:	e24bd004 	sub	sp, fp, #4
80027dcc:	e8bd8800 	pop	{fp, pc}

80027dd0 <sys_pipe>:
80027dd0:	e92d4800 	push	{fp, lr}
80027dd4:	e28db004 	add	fp, sp, #4
80027dd8:	e24dd018 	sub	sp, sp, #24
80027ddc:	e24b3010 	sub	r3, fp, #16
80027de0:	e3a02008 	mov	r2, #8
80027de4:	e1a01003 	mov	r1, r3
80027de8:	e3a00000 	mov	r0, #0
80027dec:	ebfffb94 	bl	80026c44 <argptr>
80027df0:	e1a03000 	mov	r3, r0
80027df4:	e3530000 	cmp	r3, #0
80027df8:	aa000001 	bge	80027e04 <sys_pipe+0x34>
80027dfc:	e3e03000 	mvn	r3, #0
80027e00:	ea000032 	b	80027ed0 <sys_pipe+0x100>
80027e04:	e24b2018 	sub	r2, fp, #24
80027e08:	e24b3014 	sub	r3, fp, #20
80027e0c:	e1a01002 	mov	r1, r2
80027e10:	e1a00003 	mov	r0, r3
80027e14:	ebfff367 	bl	80024bb8 <pipealloc>
80027e18:	e1a03000 	mov	r3, r0
80027e1c:	e3530000 	cmp	r3, #0
80027e20:	aa000001 	bge	80027e2c <sys_pipe+0x5c>
80027e24:	e3e03000 	mvn	r3, #0
80027e28:	ea000028 	b	80027ed0 <sys_pipe+0x100>
80027e2c:	e3e03000 	mvn	r3, #0
80027e30:	e50b3008 	str	r3, [fp, #-8]
80027e34:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80027e38:	e1a00003 	mov	r0, r3
80027e3c:	ebfffc2b 	bl	80026ef0 <fdalloc>
80027e40:	e50b0008 	str	r0, [fp, #-8]
80027e44:	e51b3008 	ldr	r3, [fp, #-8]
80027e48:	e3530000 	cmp	r3, #0
80027e4c:	ba000006 	blt	80027e6c <sys_pipe+0x9c>
80027e50:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80027e54:	e1a00003 	mov	r0, r3
80027e58:	ebfffc24 	bl	80026ef0 <fdalloc>
80027e5c:	e50b000c 	str	r0, [fp, #-12]
80027e60:	e51b300c 	ldr	r3, [fp, #-12]
80027e64:	e3530000 	cmp	r3, #0
80027e68:	aa000010 	bge	80027eb0 <sys_pipe+0xe0>
80027e6c:	e51b3008 	ldr	r3, [fp, #-8]
80027e70:	e3530000 	cmp	r3, #0
80027e74:	ba000005 	blt	80027e90 <sys_pipe+0xc0>
80027e78:	e59f305c 	ldr	r3, [pc, #92]	@ 80027edc <sys_pipe+0x10c>
80027e7c:	e5933000 	ldr	r3, [r3]
80027e80:	e51b2008 	ldr	r2, [fp, #-8]
80027e84:	e282200a 	add	r2, r2, #10
80027e88:	e3a01000 	mov	r1, #0
80027e8c:	e7831102 	str	r1, [r3, r2, lsl #2]
80027e90:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80027e94:	e1a00003 	mov	r0, r3
80027e98:	ebffea2a 	bl	80022748 <fileclose>
80027e9c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80027ea0:	e1a00003 	mov	r0, r3
80027ea4:	ebffea27 	bl	80022748 <fileclose>
80027ea8:	e3e03000 	mvn	r3, #0
80027eac:	ea000007 	b	80027ed0 <sys_pipe+0x100>
80027eb0:	e51b3010 	ldr	r3, [fp, #-16]
80027eb4:	e51b2008 	ldr	r2, [fp, #-8]
80027eb8:	e5832000 	str	r2, [r3]
80027ebc:	e51b3010 	ldr	r3, [fp, #-16]
80027ec0:	e2833004 	add	r3, r3, #4
80027ec4:	e51b200c 	ldr	r2, [fp, #-12]
80027ec8:	e5832000 	str	r2, [r3]
80027ecc:	e3a03000 	mov	r3, #0
80027ed0:	e1a00003 	mov	r0, r3
80027ed4:	e24bd004 	sub	sp, fp, #4
80027ed8:	e8bd8800 	pop	{fp, pc}
80027edc:	800d97a8 	.word	0x800d97a8

80027ee0 <sys_symlink>:
80027ee0:	e92d4800 	push	{fp, lr}
80027ee4:	e28db004 	add	fp, sp, #4
80027ee8:	e24dd020 	sub	sp, sp, #32
80027eec:	e24b3010 	sub	r3, fp, #16
80027ef0:	e1a01003 	mov	r1, r3
80027ef4:	e3a00000 	mov	r0, #0
80027ef8:	ebfffb7a 	bl	80026ce8 <argstr>
80027efc:	e1a03000 	mov	r3, r0
80027f00:	e3530000 	cmp	r3, #0
80027f04:	ba000006 	blt	80027f24 <sys_symlink+0x44>
80027f08:	e24b3014 	sub	r3, fp, #20
80027f0c:	e1a01003 	mov	r1, r3
80027f10:	e3a00001 	mov	r0, #1
80027f14:	ebfffb73 	bl	80026ce8 <argstr>
80027f18:	e1a03000 	mov	r3, r0
80027f1c:	e3530000 	cmp	r3, #0
80027f20:	aa000001 	bge	80027f2c <sys_symlink+0x4c>
80027f24:	e3e03000 	mvn	r3, #0
80027f28:	ea000069 	b	800280d4 <sys_symlink+0x1f4>
80027f2c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80027f30:	e24b2024 	sub	r2, fp, #36	@ 0x24
80027f34:	e1a01002 	mov	r1, r2
80027f38:	e1a00003 	mov	r0, r3
80027f3c:	ebfff10b 	bl	80024370 <nameiparent>
80027f40:	e50b0008 	str	r0, [fp, #-8]
80027f44:	e51b3008 	ldr	r3, [fp, #-8]
80027f48:	e3530000 	cmp	r3, #0
80027f4c:	1a000001 	bne	80027f58 <sys_symlink+0x78>
80027f50:	e3e03000 	mvn	r3, #0
80027f54:	ea00005e 	b	800280d4 <sys_symlink+0x1f4>
80027f58:	ebfff1ef 	bl	8002471c <begin_trans>
80027f5c:	e51b0008 	ldr	r0, [fp, #-8]
80027f60:	ebffecc3 	bl	80023274 <ilock>
80027f64:	e24b3024 	sub	r3, fp, #36	@ 0x24
80027f68:	e3a02000 	mov	r2, #0
80027f6c:	e1a01003 	mov	r1, r3
80027f70:	e51b0008 	ldr	r0, [fp, #-8]
80027f74:	ebffefd8 	bl	80023edc <dirlookup>
80027f78:	e1a03000 	mov	r3, r0
80027f7c:	e3530000 	cmp	r3, #0
80027f80:	0a000004 	beq	80027f98 <sys_symlink+0xb8>
80027f84:	e51b0008 	ldr	r0, [fp, #-8]
80027f88:	ebffed7a 	bl	80023578 <iunlockput>
80027f8c:	ebfff1f6 	bl	8002476c <commit_trans>
80027f90:	e3e03000 	mvn	r3, #0
80027f94:	ea00004e 	b	800280d4 <sys_symlink+0x1f4>
80027f98:	e51b3008 	ldr	r3, [fp, #-8]
80027f9c:	e5933000 	ldr	r3, [r3]
80027fa0:	e3a01004 	mov	r1, #4
80027fa4:	e1a00003 	mov	r0, r3
80027fa8:	ebffebd7 	bl	80022f0c <ialloc>
80027fac:	e50b000c 	str	r0, [fp, #-12]
80027fb0:	e51b300c 	ldr	r3, [fp, #-12]
80027fb4:	e3530000 	cmp	r3, #0
80027fb8:	1a000004 	bne	80027fd0 <sys_symlink+0xf0>
80027fbc:	e51b0008 	ldr	r0, [fp, #-8]
80027fc0:	ebffed0f 	bl	80023404 <iunlock>
80027fc4:	ebfff1e8 	bl	8002476c <commit_trans>
80027fc8:	e3e03000 	mvn	r3, #0
80027fcc:	ea000040 	b	800280d4 <sys_symlink+0x1f4>
80027fd0:	e51b000c 	ldr	r0, [fp, #-12]
80027fd4:	ebffeca6 	bl	80023274 <ilock>
80027fd8:	e51b300c 	ldr	r3, [fp, #-12]
80027fdc:	e3a02001 	mov	r2, #1
80027fe0:	e1c321b6 	strh	r2, [r3, #22]
80027fe4:	e51b3010 	ldr	r3, [fp, #-16]
80027fe8:	e1a00003 	mov	r0, r3
80027fec:	ebffe13e 	bl	800204ec <strlen>
80027ff0:	e1a03000 	mov	r3, r0
80027ff4:	e1a02003 	mov	r2, r3
80027ff8:	e51b300c 	ldr	r3, [fp, #-12]
80027ffc:	e5832018 	str	r2, [r3, #24]
80028000:	e51b000c 	ldr	r0, [fp, #-12]
80028004:	ebffec00 	bl	8002300c <iupdate>
80028008:	e51b1010 	ldr	r1, [fp, #-16]
8002800c:	e51b300c 	ldr	r3, [fp, #-12]
80028010:	e5933018 	ldr	r3, [r3, #24]
80028014:	e3a02000 	mov	r2, #0
80028018:	e51b000c 	ldr	r0, [fp, #-12]
8002801c:	ebffef18 	bl	80023c84 <writei>
80028020:	e1a03000 	mov	r3, r0
80028024:	e1a02003 	mov	r2, r3
80028028:	e51b300c 	ldr	r3, [fp, #-12]
8002802c:	e5933018 	ldr	r3, [r3, #24]
80028030:	e1520003 	cmp	r2, r3
80028034:	0a00000b 	beq	80028068 <sys_symlink+0x188>
80028038:	e51b300c 	ldr	r3, [fp, #-12]
8002803c:	e3a02000 	mov	r2, #0
80028040:	e1c321b6 	strh	r2, [r3, #22]
80028044:	e51b000c 	ldr	r0, [fp, #-12]
80028048:	ebffebef 	bl	8002300c <iupdate>
8002804c:	e51b000c 	ldr	r0, [fp, #-12]
80028050:	ebffed48 	bl	80023578 <iunlockput>
80028054:	e51b0008 	ldr	r0, [fp, #-8]
80028058:	ebffed46 	bl	80023578 <iunlockput>
8002805c:	ebfff1c2 	bl	8002476c <commit_trans>
80028060:	e3e03000 	mvn	r3, #0
80028064:	ea00001a 	b	800280d4 <sys_symlink+0x1f4>
80028068:	e51b000c 	ldr	r0, [fp, #-12]
8002806c:	ebffece4 	bl	80023404 <iunlock>
80028070:	e51b300c 	ldr	r3, [fp, #-12]
80028074:	e5932004 	ldr	r2, [r3, #4]
80028078:	e24b3024 	sub	r3, fp, #36	@ 0x24
8002807c:	e1a01003 	mov	r1, r3
80028080:	e51b0008 	ldr	r0, [fp, #-8]
80028084:	ebffefd6 	bl	80023fe4 <dirlink>
80028088:	e1a03000 	mov	r3, r0
8002808c:	e3530000 	cmp	r3, #0
80028090:	aa00000b 	bge	800280c4 <sys_symlink+0x1e4>
80028094:	e51b300c 	ldr	r3, [fp, #-12]
80028098:	e3a02000 	mov	r2, #0
8002809c:	e1c321b6 	strh	r2, [r3, #22]
800280a0:	e51b000c 	ldr	r0, [fp, #-12]
800280a4:	ebffebd8 	bl	8002300c <iupdate>
800280a8:	e51b000c 	ldr	r0, [fp, #-12]
800280ac:	ebffecf6 	bl	8002348c <iput>
800280b0:	e51b0008 	ldr	r0, [fp, #-8]
800280b4:	ebffed2f 	bl	80023578 <iunlockput>
800280b8:	ebfff1ab 	bl	8002476c <commit_trans>
800280bc:	e3e03000 	mvn	r3, #0
800280c0:	ea000003 	b	800280d4 <sys_symlink+0x1f4>
800280c4:	e51b0008 	ldr	r0, [fp, #-8]
800280c8:	ebffed2a 	bl	80023578 <iunlockput>
800280cc:	ebfff1a6 	bl	8002476c <commit_trans>
800280d0:	e3a03000 	mov	r3, #0
800280d4:	e1a00003 	mov	r0, r3
800280d8:	e24bd004 	sub	sp, fp, #4
800280dc:	e8bd8800 	pop	{fp, pc}

800280e0 <sys_fork>:
800280e0:	e92d4800 	push	{fp, lr}
800280e4:	e28db004 	add	fp, sp, #4
800280e8:	ebfff517 	bl	8002554c <fork>
800280ec:	e1a03000 	mov	r3, r0
800280f0:	e1a00003 	mov	r0, r3
800280f4:	e8bd8800 	pop	{fp, pc}

800280f8 <sys_exit>:
800280f8:	e92d4800 	push	{fp, lr}
800280fc:	e28db004 	add	fp, sp, #4
80028100:	ebfff585 	bl	8002571c <exit>
80028104:	e3a03000 	mov	r3, #0
80028108:	e1a00003 	mov	r0, r3
8002810c:	e8bd8800 	pop	{fp, pc}

80028110 <sys_wait>:
80028110:	e92d4800 	push	{fp, lr}
80028114:	e28db004 	add	fp, sp, #4
80028118:	ebfff5e1 	bl	800258a4 <wait>
8002811c:	e1a03000 	mov	r3, r0
80028120:	e1a00003 	mov	r0, r3
80028124:	e8bd8800 	pop	{fp, pc}

80028128 <sys_kill>:
80028128:	e92d4800 	push	{fp, lr}
8002812c:	e28db004 	add	fp, sp, #4
80028130:	e24dd008 	sub	sp, sp, #8
80028134:	e24b3008 	sub	r3, fp, #8
80028138:	e1a01003 	mov	r1, r3
8002813c:	e3a00000 	mov	r0, #0
80028140:	ebfffaa4 	bl	80026bd8 <argint>
80028144:	e1a03000 	mov	r3, r0
80028148:	e3530000 	cmp	r3, #0
8002814c:	aa000001 	bge	80028158 <sys_kill+0x30>
80028150:	e3e03000 	mvn	r3, #0
80028154:	ea000003 	b	80028168 <sys_kill+0x40>
80028158:	e51b3008 	ldr	r3, [fp, #-8]
8002815c:	e1a00003 	mov	r0, r3
80028160:	ebfff79a 	bl	80025fd0 <kill>
80028164:	e1a03000 	mov	r3, r0
80028168:	e1a00003 	mov	r0, r3
8002816c:	e24bd004 	sub	sp, fp, #4
80028170:	e8bd8800 	pop	{fp, pc}

80028174 <sys_getpid>:
80028174:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80028178:	e28db000 	add	fp, sp, #0
8002817c:	e59f3014 	ldr	r3, [pc, #20]	@ 80028198 <sys_getpid+0x24>
80028180:	e5933000 	ldr	r3, [r3]
80028184:	e5933010 	ldr	r3, [r3, #16]
80028188:	e1a00003 	mov	r0, r3
8002818c:	e28bd000 	add	sp, fp, #0
80028190:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80028194:	e12fff1e 	bx	lr
80028198:	800d97a8 	.word	0x800d97a8

8002819c <sys_sbrk>:
8002819c:	e92d4800 	push	{fp, lr}
800281a0:	e28db004 	add	fp, sp, #4
800281a4:	e24dd008 	sub	sp, sp, #8
800281a8:	e24b300c 	sub	r3, fp, #12
800281ac:	e1a01003 	mov	r1, r3
800281b0:	e3a00000 	mov	r0, #0
800281b4:	ebfffa87 	bl	80026bd8 <argint>
800281b8:	e1a03000 	mov	r3, r0
800281bc:	e3530000 	cmp	r3, #0
800281c0:	aa000001 	bge	800281cc <sys_sbrk+0x30>
800281c4:	e3e03000 	mvn	r3, #0
800281c8:	ea00000c 	b	80028200 <sys_sbrk+0x64>
800281cc:	e59f3038 	ldr	r3, [pc, #56]	@ 8002820c <sys_sbrk+0x70>
800281d0:	e5933000 	ldr	r3, [r3]
800281d4:	e5933000 	ldr	r3, [r3]
800281d8:	e50b3008 	str	r3, [fp, #-8]
800281dc:	e51b300c 	ldr	r3, [fp, #-12]
800281e0:	e1a00003 	mov	r0, r3
800281e4:	ebfff49d 	bl	80025460 <growproc>
800281e8:	e1a03000 	mov	r3, r0
800281ec:	e3530000 	cmp	r3, #0
800281f0:	aa000001 	bge	800281fc <sys_sbrk+0x60>
800281f4:	e3e03000 	mvn	r3, #0
800281f8:	ea000000 	b	80028200 <sys_sbrk+0x64>
800281fc:	e51b3008 	ldr	r3, [fp, #-8]
80028200:	e1a00003 	mov	r0, r3
80028204:	e24bd004 	sub	sp, fp, #4
80028208:	e8bd8800 	pop	{fp, pc}
8002820c:	800d97a8 	.word	0x800d97a8

80028210 <sys_sleep>:
80028210:	e92d4800 	push	{fp, lr}
80028214:	e28db004 	add	fp, sp, #4
80028218:	e24dd008 	sub	sp, sp, #8
8002821c:	e24b300c 	sub	r3, fp, #12
80028220:	e1a01003 	mov	r1, r3
80028224:	e3a00000 	mov	r0, #0
80028228:	ebfffa6a 	bl	80026bd8 <argint>
8002822c:	e1a03000 	mov	r3, r0
80028230:	e3530000 	cmp	r3, #0
80028234:	aa000001 	bge	80028240 <sys_sleep+0x30>
80028238:	e3e03000 	mvn	r3, #0
8002823c:	ea00002a 	b	800282ec <sys_sleep+0xdc>
80028240:	e59f00b0 	ldr	r0, [pc, #176]	@ 800282f8 <sys_sleep+0xe8>
80028244:	ebfff9f2 	bl	80026a14 <acquire>
80028248:	e59f30ac 	ldr	r3, [pc, #172]	@ 800282fc <sys_sleep+0xec>
8002824c:	e5933000 	ldr	r3, [r3]
80028250:	e50b3008 	str	r3, [fp, #-8]
80028254:	e59f00a4 	ldr	r0, [pc, #164]	@ 80028300 <sys_sleep+0xf0>
80028258:	ebfff9ed 	bl	80026a14 <acquire>
8002825c:	e59f30a0 	ldr	r3, [pc, #160]	@ 80028304 <sys_sleep+0xf4>
80028260:	e5933000 	ldr	r3, [r3]
80028264:	e51b200c 	ldr	r2, [fp, #-12]
80028268:	e583208c 	str	r2, [r3, #140]	@ 0x8c
8002826c:	e51b300c 	ldr	r3, [fp, #-12]
80028270:	e1a02003 	mov	r2, r3
80028274:	e51b3008 	ldr	r3, [fp, #-8]
80028278:	e0822003 	add	r2, r2, r3
8002827c:	e59f3080 	ldr	r3, [pc, #128]	@ 80028304 <sys_sleep+0xf4>
80028280:	e5933000 	ldr	r3, [r3]
80028284:	e5832094 	str	r2, [r3, #148]	@ 0x94
80028288:	e59f0070 	ldr	r0, [pc, #112]	@ 80028300 <sys_sleep+0xf0>
8002828c:	ebfff9eb 	bl	80026a40 <release>
80028290:	ea00000b 	b	800282c4 <sys_sleep+0xb4>
80028294:	e59f3068 	ldr	r3, [pc, #104]	@ 80028304 <sys_sleep+0xf4>
80028298:	e5933000 	ldr	r3, [r3]
8002829c:	e5933024 	ldr	r3, [r3, #36]	@ 0x24
800282a0:	e3530000 	cmp	r3, #0
800282a4:	0a000003 	beq	800282b8 <sys_sleep+0xa8>
800282a8:	e59f0048 	ldr	r0, [pc, #72]	@ 800282f8 <sys_sleep+0xe8>
800282ac:	ebfff9e3 	bl	80026a40 <release>
800282b0:	e3e03000 	mvn	r3, #0
800282b4:	ea00000c 	b	800282ec <sys_sleep+0xdc>
800282b8:	e59f1038 	ldr	r1, [pc, #56]	@ 800282f8 <sys_sleep+0xe8>
800282bc:	e59f0038 	ldr	r0, [pc, #56]	@ 800282fc <sys_sleep+0xec>
800282c0:	ebfff6c0 	bl	80025dc8 <sleep>
800282c4:	e59f3030 	ldr	r3, [pc, #48]	@ 800282fc <sys_sleep+0xec>
800282c8:	e5932000 	ldr	r2, [r3]
800282cc:	e51b3008 	ldr	r3, [fp, #-8]
800282d0:	e0423003 	sub	r3, r2, r3
800282d4:	e51b200c 	ldr	r2, [fp, #-12]
800282d8:	e1530002 	cmp	r3, r2
800282dc:	3affffec 	bcc	80028294 <sys_sleep+0x84>
800282e0:	e59f0010 	ldr	r0, [pc, #16]	@ 800282f8 <sys_sleep+0xe8>
800282e4:	ebfff9d5 	bl	80026a40 <release>
800282e8:	e3a03000 	mov	r3, #0
800282ec:	e1a00003 	mov	r0, r3
800282f0:	e24bd004 	sub	sp, fp, #4
800282f4:	e8bd8800 	pop	{fp, pc}
800282f8:	800d98a8 	.word	0x800d98a8
800282fc:	800d98dc 	.word	0x800d98dc
80028300:	800d6c70 	.word	0x800d6c70
80028304:	800d97a8 	.word	0x800d97a8

80028308 <sys_uptime>:
80028308:	e92d4800 	push	{fp, lr}
8002830c:	e28db004 	add	fp, sp, #4
80028310:	e24dd008 	sub	sp, sp, #8
80028314:	e59f0024 	ldr	r0, [pc, #36]	@ 80028340 <sys_uptime+0x38>
80028318:	ebfff9bd 	bl	80026a14 <acquire>
8002831c:	e59f3020 	ldr	r3, [pc, #32]	@ 80028344 <sys_uptime+0x3c>
80028320:	e5933000 	ldr	r3, [r3]
80028324:	e50b3008 	str	r3, [fp, #-8]
80028328:	e59f0010 	ldr	r0, [pc, #16]	@ 80028340 <sys_uptime+0x38>
8002832c:	ebfff9c3 	bl	80026a40 <release>
80028330:	e51b3008 	ldr	r3, [fp, #-8]
80028334:	e1a00003 	mov	r0, r3
80028338:	e24bd004 	sub	sp, fp, #4
8002833c:	e8bd8800 	pop	{fp, pc}
80028340:	800d98a8 	.word	0x800d98a8
80028344:	800d98dc 	.word	0x800d98dc

80028348 <sys_ps>:
80028348:	e92d4800 	push	{fp, lr}
8002834c:	e28db004 	add	fp, sp, #4
80028350:	ebfff783 	bl	80026164 <ps>
80028354:	e1a03000 	mov	r3, r0
80028358:	e1a00003 	mov	r0, r3
8002835c:	e8bd8800 	pop	{fp, pc}

80028360 <sys_settickets>:
80028360:	e92d4800 	push	{fp, lr}
80028364:	e28db004 	add	fp, sp, #4
80028368:	e24dd008 	sub	sp, sp, #8
8002836c:	e24b3008 	sub	r3, fp, #8
80028370:	e1a01003 	mov	r1, r3
80028374:	e3a00000 	mov	r0, #0
80028378:	ebfffa16 	bl	80026bd8 <argint>
8002837c:	e1a03000 	mov	r3, r0
80028380:	e3530000 	cmp	r3, #0
80028384:	ba000006 	blt	800283a4 <sys_settickets+0x44>
80028388:	e24b300c 	sub	r3, fp, #12
8002838c:	e1a01003 	mov	r1, r3
80028390:	e3a00001 	mov	r0, #1
80028394:	ebfffa0f 	bl	80026bd8 <argint>
80028398:	e1a03000 	mov	r3, r0
8002839c:	e3530000 	cmp	r3, #0
800283a0:	aa000001 	bge	800283ac <sys_settickets+0x4c>
800283a4:	e3e03000 	mvn	r3, #0
800283a8:	ea000005 	b	800283c4 <sys_settickets+0x64>
800283ac:	e51b3008 	ldr	r3, [fp, #-8]
800283b0:	e51b200c 	ldr	r2, [fp, #-12]
800283b4:	e1a01002 	mov	r1, r2
800283b8:	e1a00003 	mov	r0, r3
800283bc:	ebfff7a5 	bl	80026258 <settickets>
800283c0:	e1a03000 	mov	r3, r0
800283c4:	e1a00003 	mov	r0, r3
800283c8:	e24bd004 	sub	sp, fp, #4
800283cc:	e8bd8800 	pop	{fp, pc}

800283d0 <sys_srand>:
800283d0:	e92d4800 	push	{fp, lr}
800283d4:	e28db004 	add	fp, sp, #4
800283d8:	e24dd008 	sub	sp, sp, #8
800283dc:	e24b3008 	sub	r3, fp, #8
800283e0:	e1a01003 	mov	r1, r3
800283e4:	e3a00000 	mov	r0, #0
800283e8:	ebfff9fa 	bl	80026bd8 <argint>
800283ec:	e1a03000 	mov	r3, r0
800283f0:	e3530000 	cmp	r3, #0
800283f4:	aa000001 	bge	80028400 <sys_srand+0x30>
800283f8:	e3e03000 	mvn	r3, #0
800283fc:	ea000003 	b	80028410 <sys_srand+0x40>
80028400:	e51b3008 	ldr	r3, [fp, #-8]
80028404:	e59f2010 	ldr	r2, [pc, #16]	@ 8002841c <sys_srand+0x4c>
80028408:	e5823000 	str	r3, [r2]
8002840c:	e3a03000 	mov	r3, #0
80028410:	e1a00003 	mov	r0, r3
80028414:	e24bd004 	sub	sp, fp, #4
80028418:	e8bd8800 	pop	{fp, pc}
8002841c:	800d6c6c 	.word	0x800d6c6c

80028420 <sys_getpinfo>:
80028420:	e92d4800 	push	{fp, lr}
80028424:	e28db004 	add	fp, sp, #4
80028428:	e24ddc05 	sub	sp, sp, #1280	@ 0x500
8002842c:	e24dd008 	sub	sp, sp, #8
80028430:	e24b3c05 	sub	r3, fp, #1280	@ 0x500
80028434:	e2433004 	sub	r3, r3, #4
80028438:	e2433004 	sub	r3, r3, #4
8002843c:	e1a01003 	mov	r1, r3
80028440:	e3a00000 	mov	r0, #0
80028444:	ebfff9e3 	bl	80026bd8 <argint>
80028448:	e1a03000 	mov	r3, r0
8002844c:	e3530000 	cmp	r3, #0
80028450:	aa000001 	bge	8002845c <sys_getpinfo+0x3c>
80028454:	e3e03000 	mvn	r3, #0
80028458:	ea000016 	b	800284b8 <sys_getpinfo+0x98>
8002845c:	e24b3c05 	sub	r3, fp, #1280	@ 0x500
80028460:	e2433004 	sub	r3, r3, #4
80028464:	e1a00003 	mov	r0, r3
80028468:	ebfff7ab 	bl	8002631c <getpinfo>
8002846c:	e1a03000 	mov	r3, r0
80028470:	e3530000 	cmp	r3, #0
80028474:	aa000001 	bge	80028480 <sys_getpinfo+0x60>
80028478:	e3e03000 	mvn	r3, #0
8002847c:	ea00000d 	b	800284b8 <sys_getpinfo+0x98>
80028480:	e59f303c 	ldr	r3, [pc, #60]	@ 800284c4 <sys_getpinfo+0xa4>
80028484:	e5933000 	ldr	r3, [r3]
80028488:	e5930004 	ldr	r0, [r3, #4]
8002848c:	e51b1508 	ldr	r1, [fp, #-1288]	@ 0xfffffaf8
80028490:	e24b2c05 	sub	r2, fp, #1280	@ 0x500
80028494:	e2422004 	sub	r2, r2, #4
80028498:	e3a03c05 	mov	r3, #1280	@ 0x500
8002849c:	eb00062e 	bl	80029d5c <copyout>
800284a0:	e1a03000 	mov	r3, r0
800284a4:	e3530000 	cmp	r3, #0
800284a8:	aa000001 	bge	800284b4 <sys_getpinfo+0x94>
800284ac:	e3e03000 	mvn	r3, #0
800284b0:	ea000000 	b	800284b8 <sys_getpinfo+0x98>
800284b4:	e3a03000 	mov	r3, #0
800284b8:	e1a00003 	mov	r0, r3
800284bc:	e24bd004 	sub	sp, fp, #4
800284c0:	e8bd8800 	pop	{fp, pc}
800284c4:	800d97a8 	.word	0x800d97a8

800284c8 <sys_pgpte>:
800284c8:	e92d4800 	push	{fp, lr}
800284cc:	e28db004 	add	fp, sp, #4
800284d0:	e24dd008 	sub	sp, sp, #8
800284d4:	e24b3008 	sub	r3, fp, #8
800284d8:	e1a01003 	mov	r1, r3
800284dc:	e3a00000 	mov	r0, #0
800284e0:	ebfff9bc 	bl	80026bd8 <argint>
800284e4:	e1a03000 	mov	r3, r0
800284e8:	e3530000 	cmp	r3, #0
800284ec:	aa000001 	bge	800284f8 <sys_pgpte+0x30>
800284f0:	e3e03000 	mvn	r3, #0
800284f4:	ea000006 	b	80028514 <sys_pgpte+0x4c>
800284f8:	e59f3020 	ldr	r3, [pc, #32]	@ 80028520 <sys_pgpte+0x58>
800284fc:	e5933000 	ldr	r3, [r3]
80028500:	e51b2008 	ldr	r2, [fp, #-8]
80028504:	e1a01002 	mov	r1, r2
80028508:	e1a00003 	mov	r0, r3
8002850c:	eb00066b 	bl	80029ec0 <pgpte_kernel>
80028510:	e1a03000 	mov	r3, r0
80028514:	e1a00003 	mov	r0, r3
80028518:	e24bd004 	sub	sp, fp, #4
8002851c:	e8bd8800 	pop	{fp, pc}
80028520:	800d97a8 	.word	0x800d97a8

80028524 <sys_ugetpid>:
80028524:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80028528:	e28db000 	add	fp, sp, #0
8002852c:	e59f3014 	ldr	r3, [pc, #20]	@ 80028548 <sys_ugetpid+0x24>
80028530:	e5933000 	ldr	r3, [r3]
80028534:	e5933010 	ldr	r3, [r3, #16]
80028538:	e1a00003 	mov	r0, r3
8002853c:	e28bd000 	add	sp, fp, #0
80028540:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80028544:	e12fff1e 	bx	lr
80028548:	800d97a8 	.word	0x800d97a8

8002854c <sys_kpt>:
8002854c:	e92d4800 	push	{fp, lr}
80028550:	e28db004 	add	fp, sp, #4
80028554:	eb0006c8 	bl	8002a07c <kpt>
80028558:	e3a03000 	mov	r3, #0
8002855c:	e1a00003 	mov	r0, r3
80028560:	e8bd8800 	pop	{fp, pc}

80028564 <sys_thread_create>:
80028564:	e92d4800 	push	{fp, lr}
80028568:	e28db004 	add	fp, sp, #4
8002856c:	e24dd010 	sub	sp, sp, #16
80028570:	e24b3008 	sub	r3, fp, #8
80028574:	e1a01003 	mov	r1, r3
80028578:	e3a00000 	mov	r0, #0
8002857c:	ebfff995 	bl	80026bd8 <argint>
80028580:	e1a03000 	mov	r3, r0
80028584:	e3530000 	cmp	r3, #0
80028588:	aa000001 	bge	80028594 <sys_thread_create+0x30>
8002858c:	e3e03000 	mvn	r3, #0
80028590:	ea000019 	b	800285fc <sys_thread_create+0x98>
80028594:	e24b300c 	sub	r3, fp, #12
80028598:	e1a01003 	mov	r1, r3
8002859c:	e3a00001 	mov	r0, #1
800285a0:	ebfff98c 	bl	80026bd8 <argint>
800285a4:	e1a03000 	mov	r3, r0
800285a8:	e3530000 	cmp	r3, #0
800285ac:	aa000001 	bge	800285b8 <sys_thread_create+0x54>
800285b0:	e3e03000 	mvn	r3, #0
800285b4:	ea000010 	b	800285fc <sys_thread_create+0x98>
800285b8:	e24b3010 	sub	r3, fp, #16
800285bc:	e1a01003 	mov	r1, r3
800285c0:	e3a00002 	mov	r0, #2
800285c4:	ebfff983 	bl	80026bd8 <argint>
800285c8:	e1a03000 	mov	r3, r0
800285cc:	e3530000 	cmp	r3, #0
800285d0:	aa000001 	bge	800285dc <sys_thread_create+0x78>
800285d4:	e3e03000 	mvn	r3, #0
800285d8:	ea000007 	b	800285fc <sys_thread_create+0x98>
800285dc:	e51b3008 	ldr	r3, [fp, #-8]
800285e0:	e1a00003 	mov	r0, r3
800285e4:	e51b300c 	ldr	r3, [fp, #-12]
800285e8:	e1a01003 	mov	r1, r3
800285ec:	e51b3010 	ldr	r3, [fp, #-16]
800285f0:	e1a02003 	mov	r2, r3
800285f4:	ebfff78d 	bl	80026430 <thread_create>
800285f8:	e1a03000 	mov	r3, r0
800285fc:	e1a00003 	mov	r0, r3
80028600:	e24bd004 	sub	sp, fp, #4
80028604:	e8bd8800 	pop	{fp, pc}

80028608 <sys_thread_exit>:
80028608:	e92d4800 	push	{fp, lr}
8002860c:	e28db004 	add	fp, sp, #4
80028610:	ebfff840 	bl	80026718 <thread_exit>
80028614:	e3a03000 	mov	r3, #0
80028618:	e1a00003 	mov	r0, r3
8002861c:	e8bd8800 	pop	{fp, pc}

80028620 <sys_thread_join>:
80028620:	e92d4800 	push	{fp, lr}
80028624:	e28db004 	add	fp, sp, #4
80028628:	e24dd008 	sub	sp, sp, #8
8002862c:	e24b3008 	sub	r3, fp, #8
80028630:	e1a01003 	mov	r1, r3
80028634:	e3a00000 	mov	r0, #0
80028638:	ebfff966 	bl	80026bd8 <argint>
8002863c:	e1a03000 	mov	r3, r0
80028640:	e3530000 	cmp	r3, #0
80028644:	aa000001 	bge	80028650 <sys_thread_join+0x30>
80028648:	e3e03000 	mvn	r3, #0
8002864c:	ea000003 	b	80028660 <sys_thread_join+0x40>
80028650:	e51b3008 	ldr	r3, [fp, #-8]
80028654:	e1a00003 	mov	r0, r3
80028658:	ebfff870 	bl	80026820 <thread_join>
8002865c:	e1a03000 	mov	r3, r0
80028660:	e1a00003 	mov	r0, r3
80028664:	e24bd004 	sub	sp, fp, #4
80028668:	e8bd8800 	pop	{fp, pc}

8002866c <sys_barrier_init>:
8002866c:	e92d4800 	push	{fp, lr}
80028670:	e28db004 	add	fp, sp, #4
80028674:	e24dd008 	sub	sp, sp, #8
80028678:	e24b3008 	sub	r3, fp, #8
8002867c:	e1a01003 	mov	r1, r3
80028680:	e3a00000 	mov	r0, #0
80028684:	ebfff953 	bl	80026bd8 <argint>
80028688:	e1a03000 	mov	r3, r0
8002868c:	e3530000 	cmp	r3, #0
80028690:	aa000001 	bge	8002869c <sys_barrier_init+0x30>
80028694:	e3e03000 	mvn	r3, #0
80028698:	ea000003 	b	800286ac <sys_barrier_init+0x40>
8002869c:	e51b3008 	ldr	r3, [fp, #-8]
800286a0:	e1a00003 	mov	r0, r3
800286a4:	eb0006d3 	bl	8002a1f8 <barrier_init>
800286a8:	e1a03000 	mov	r3, r0
800286ac:	e1a00003 	mov	r0, r3
800286b0:	e24bd004 	sub	sp, fp, #4
800286b4:	e8bd8800 	pop	{fp, pc}

800286b8 <sys_barrier_check>:
800286b8:	e92d4800 	push	{fp, lr}
800286bc:	e28db004 	add	fp, sp, #4
800286c0:	eb0006e4 	bl	8002a258 <barrier_check>
800286c4:	e1a03000 	mov	r3, r0
800286c8:	e1a00003 	mov	r0, r3
800286cc:	e8bd8800 	pop	{fp, pc}

800286d0 <sys_waitpid>:
800286d0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
800286d4:	e28db000 	add	fp, sp, #0
800286d8:	e3e03000 	mvn	r3, #0
800286dc:	e1a00003 	mov	r0, r3
800286e0:	e28bd000 	add	sp, fp, #0
800286e4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
800286e8:	e12fff1e 	bx	lr

800286ec <sys_sleepChan>:
800286ec:	e92d4800 	push	{fp, lr}
800286f0:	e28db004 	add	fp, sp, #4
800286f4:	e24dd008 	sub	sp, sp, #8
800286f8:	e24b3008 	sub	r3, fp, #8
800286fc:	e1a01003 	mov	r1, r3
80028700:	e3a00000 	mov	r0, #0
80028704:	ebfff933 	bl	80026bd8 <argint>
80028708:	e1a03000 	mov	r3, r0
8002870c:	e3530000 	cmp	r3, #0
80028710:	aa000001 	bge	8002871c <sys_sleepChan+0x30>
80028714:	e3e03000 	mvn	r3, #0
80028718:	ea000008 	b	80028740 <sys_sleepChan+0x54>
8002871c:	e59f0028 	ldr	r0, [pc, #40]	@ 8002874c <sys_sleepChan+0x60>
80028720:	ebfff8bb 	bl	80026a14 <acquire>
80028724:	e51b3008 	ldr	r3, [fp, #-8]
80028728:	e59f101c 	ldr	r1, [pc, #28]	@ 8002874c <sys_sleepChan+0x60>
8002872c:	e1a00003 	mov	r0, r3
80028730:	ebfff5a4 	bl	80025dc8 <sleep>
80028734:	e59f0010 	ldr	r0, [pc, #16]	@ 8002874c <sys_sleepChan+0x60>
80028738:	ebfff8c0 	bl	80026a40 <release>
8002873c:	e3a03000 	mov	r3, #0
80028740:	e1a00003 	mov	r0, r3
80028744:	e24bd004 	sub	sp, fp, #4
80028748:	e8bd8800 	pop	{fp, pc}
8002874c:	800d6c70 	.word	0x800d6c70

80028750 <sys_getChannel>:
80028750:	e92d4800 	push	{fp, lr}
80028754:	e28db004 	add	fp, sp, #4
80028758:	e24dd008 	sub	sp, sp, #8
8002875c:	e59f0030 	ldr	r0, [pc, #48]	@ 80028794 <sys_getChannel+0x44>
80028760:	ebfff8ab 	bl	80026a14 <acquire>
80028764:	e59f302c 	ldr	r3, [pc, #44]	@ 80028798 <sys_getChannel+0x48>
80028768:	e5933000 	ldr	r3, [r3]
8002876c:	e2832001 	add	r2, r3, #1
80028770:	e59f1020 	ldr	r1, [pc, #32]	@ 80028798 <sys_getChannel+0x48>
80028774:	e5812000 	str	r2, [r1]
80028778:	e50b3008 	str	r3, [fp, #-8]
8002877c:	e59f0010 	ldr	r0, [pc, #16]	@ 80028794 <sys_getChannel+0x44>
80028780:	ebfff8ae 	bl	80026a40 <release>
80028784:	e51b3008 	ldr	r3, [fp, #-8]
80028788:	e1a00003 	mov	r0, r3
8002878c:	e24bd004 	sub	sp, fp, #4
80028790:	e8bd8800 	pop	{fp, pc}
80028794:	800d6c70 	.word	0x800d6c70
80028798:	8002c0ec 	.word	0x8002c0ec

8002879c <sys_sigChan>:
8002879c:	e92d4800 	push	{fp, lr}
800287a0:	e28db004 	add	fp, sp, #4
800287a4:	e24dd008 	sub	sp, sp, #8
800287a8:	e24b3008 	sub	r3, fp, #8
800287ac:	e1a01003 	mov	r1, r3
800287b0:	e3a00000 	mov	r0, #0
800287b4:	ebfff907 	bl	80026bd8 <argint>
800287b8:	e1a03000 	mov	r3, r0
800287bc:	e3530000 	cmp	r3, #0
800287c0:	aa000001 	bge	800287cc <sys_sigChan+0x30>
800287c4:	e3e03000 	mvn	r3, #0
800287c8:	ea000007 	b	800287ec <sys_sigChan+0x50>
800287cc:	e59f0024 	ldr	r0, [pc, #36]	@ 800287f8 <sys_sigChan+0x5c>
800287d0:	ebfff88f 	bl	80026a14 <acquire>
800287d4:	e51b3008 	ldr	r3, [fp, #-8]
800287d8:	e1a00003 	mov	r0, r3
800287dc:	ebfff5ed 	bl	80025f98 <wakeup>
800287e0:	e59f0010 	ldr	r0, [pc, #16]	@ 800287f8 <sys_sigChan+0x5c>
800287e4:	ebfff895 	bl	80026a40 <release>
800287e8:	e3a03000 	mov	r3, #0
800287ec:	e1a00003 	mov	r0, r3
800287f0:	e24bd004 	sub	sp, fp, #4
800287f4:	e8bd8800 	pop	{fp, pc}
800287f8:	800d6c70 	.word	0x800d6c70

800287fc <sys_sigOneChan>:
800287fc:	e92d4800 	push	{fp, lr}
80028800:	e28db004 	add	fp, sp, #4
80028804:	e24dd008 	sub	sp, sp, #8
80028808:	e24b300c 	sub	r3, fp, #12
8002880c:	e1a01003 	mov	r1, r3
80028810:	e3a00000 	mov	r0, #0
80028814:	ebfff8ef 	bl	80026bd8 <argint>
80028818:	e1a03000 	mov	r3, r0
8002881c:	e3530000 	cmp	r3, #0
80028820:	aa000001 	bge	8002882c <sys_sigOneChan+0x30>
80028824:	e3e03000 	mvn	r3, #0
80028828:	ea00001e 	b	800288a8 <sys_sigOneChan+0xac>
8002882c:	e59f0080 	ldr	r0, [pc, #128]	@ 800288b4 <sys_sigOneChan+0xb8>
80028830:	ebfff877 	bl	80026a14 <acquire>
80028834:	e59f307c 	ldr	r3, [pc, #124]	@ 800288b8 <sys_sigOneChan+0xbc>
80028838:	e50b3008 	str	r3, [fp, #-8]
8002883c:	ea000012 	b	8002888c <sys_sigOneChan+0x90>
80028840:	e51b3008 	ldr	r3, [fp, #-8]
80028844:	e5d3300c 	ldrb	r3, [r3, #12]
80028848:	e3530002 	cmp	r3, #2
8002884c:	1a00000b 	bne	80028880 <sys_sigOneChan+0x84>
80028850:	e51b3008 	ldr	r3, [fp, #-8]
80028854:	e5933020 	ldr	r3, [r3, #32]
80028858:	e51b200c 	ldr	r2, [fp, #-12]
8002885c:	e1530002 	cmp	r3, r2
80028860:	1a000006 	bne	80028880 <sys_sigOneChan+0x84>
80028864:	e51b3008 	ldr	r3, [fp, #-8]
80028868:	e3a02003 	mov	r2, #3
8002886c:	e5c3200c 	strb	r2, [r3, #12]
80028870:	e51b3008 	ldr	r3, [fp, #-8]
80028874:	e3a02000 	mov	r2, #0
80028878:	e5832020 	str	r2, [r3, #32]
8002887c:	ea000006 	b	8002889c <sys_sigOneChan+0xa0>
80028880:	e51b3008 	ldr	r3, [fp, #-8]
80028884:	e28330ac 	add	r3, r3, #172	@ 0xac
80028888:	e50b3008 	str	r3, [fp, #-8]
8002888c:	e51b3008 	ldr	r3, [fp, #-8]
80028890:	e59f2024 	ldr	r2, [pc, #36]	@ 800288bc <sys_sigOneChan+0xc0>
80028894:	e1530002 	cmp	r3, r2
80028898:	3affffe8 	bcc	80028840 <sys_sigOneChan+0x44>
8002889c:	e59f0010 	ldr	r0, [pc, #16]	@ 800288b4 <sys_sigOneChan+0xb8>
800288a0:	ebfff866 	bl	80026a40 <release>
800288a4:	e3a03000 	mov	r3, #0
800288a8:	e1a00003 	mov	r0, r3
800288ac:	e24bd004 	sub	sp, fp, #4
800288b0:	e8bd8800 	pop	{fp, pc}
800288b4:	800d6c70 	.word	0x800d6c70
800288b8:	800d6ca4 	.word	0x800d6ca4
800288bc:	800d97a4 	.word	0x800d97a4

800288c0 <trap_swi>:
800288c0:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
800288c4:	e14f2000 	mrs	r2, SPSR
800288c8:	e92d0004 	stmfd	sp!, {r2}
800288cc:	e92d4000 	stmfd	sp!, {lr}
800288d0:	e94d6000 	stmdb	sp, {sp, lr}^
800288d4:	e24dd008 	sub	sp, sp, #8
800288d8:	e1a0000d 	mov	r0, sp
800288dc:	eb000054 	bl	80028a34 <swi_handler>

800288e0 <trapret>:
800288e0:	e8dd6000 	ldm	sp, {sp, lr}^
800288e4:	e28dd008 	add	sp, sp, #8
800288e8:	e8bd4000 	ldmfd	sp!, {lr}
800288ec:	e8bd0004 	ldmfd	sp!, {r2}
800288f0:	e16ff002 	msr	SPSR_fsxc, r2
800288f4:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

800288f8 <trap_irq>:
800288f8:	e24ee004 	sub	lr, lr, #4
800288fc:	e92d4007 	push	{r0, r1, r2, lr}
80028900:	e14f1000 	mrs	r1, SPSR
80028904:	e1a0000d 	mov	r0, sp
80028908:	e28dd010 	add	sp, sp, #16
8002890c:	e10f2000 	mrs	r2, CPSR
80028910:	e3c2201f 	bic	r2, r2, #31
80028914:	e3822013 	orr	r2, r2, #19
80028918:	e12ff002 	msr	CPSR_fsxc, r2
8002891c:	e590200c 	ldr	r2, [r0, #12]
80028920:	e92d0004 	stmfd	sp!, {r2}
80028924:	e92d1ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
80028928:	e8900038 	ldm	r0, {r3, r4, r5}
8002892c:	e92d0038 	push	{r3, r4, r5}
80028930:	e92d0002 	stmfd	sp!, {r1}
80028934:	e92d4000 	stmfd	sp!, {lr}
80028938:	e94d6000 	stmdb	sp, {sp, lr}^
8002893c:	e24dd008 	sub	sp, sp, #8
80028940:	e1a0000d 	mov	r0, sp
80028944:	eb000047 	bl	80028a68 <irq_handler>
80028948:	eaffffe4 	b	800288e0 <trapret>

8002894c <trap_reset>:
8002894c:	e3a0e000 	mov	lr, #0
80028950:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
80028954:	e14f2000 	mrs	r2, SPSR
80028958:	e92d0004 	stmfd	sp!, {r2}
8002895c:	e92d4000 	stmfd	sp!, {lr}
80028960:	e94d6000 	stmdb	sp, {sp, lr}^
80028964:	e24dd008 	sub	sp, sp, #8
80028968:	e1a0000d 	mov	r0, sp
8002896c:	eb00004f 	bl	80028ab0 <reset_handler>
80028970:	eafffffe 	b	80028970 <trap_reset+0x24>

80028974 <trap_und>:
80028974:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
80028978:	e14f2000 	mrs	r2, SPSR
8002897c:	e92d0004 	stmfd	sp!, {r2}
80028980:	e92d4000 	stmfd	sp!, {lr}
80028984:	e94d6000 	stmdb	sp, {sp, lr}^
80028988:	e24dd008 	sub	sp, sp, #8
8002898c:	e1a0000d 	mov	r0, sp
80028990:	eb000054 	bl	80028ae8 <und_handler>
80028994:	eafffffe 	b	80028994 <trap_und+0x20>

80028998 <trap_iabort>:
80028998:	e24ee004 	sub	lr, lr, #4
8002899c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
800289a0:	e14f2000 	mrs	r2, SPSR
800289a4:	e92d0004 	stmfd	sp!, {r2}
800289a8:	e92d4000 	stmfd	sp!, {lr}
800289ac:	e94d6000 	stmdb	sp, {sp, lr}^
800289b0:	e24dd008 	sub	sp, sp, #8
800289b4:	e1a0000d 	mov	r0, sp
800289b8:	eb00009b 	bl	80028c2c <iabort_handler>
800289bc:	eafffffe 	b	800289bc <trap_iabort+0x24>

800289c0 <trap_dabort>:
800289c0:	e24ee008 	sub	lr, lr, #8
800289c4:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
800289c8:	e14f2000 	mrs	r2, SPSR
800289cc:	e92d0004 	stmfd	sp!, {r2}
800289d0:	e92d4000 	stmfd	sp!, {lr}
800289d4:	e94d6000 	stmdb	sp, {sp, lr}^
800289d8:	e24dd008 	sub	sp, sp, #8
800289dc:	e1a0000d 	mov	r0, sp
800289e0:	eb00004e 	bl	80028b20 <dabort_handler>
800289e4:	eafffffe 	b	800289e4 <trap_dabort+0x24>

800289e8 <trap_na>:
800289e8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
800289ec:	e14f2000 	mrs	r2, SPSR
800289f0:	e92d0004 	stmfd	sp!, {r2}
800289f4:	e92d4000 	stmfd	sp!, {lr}
800289f8:	e94d6000 	stmdb	sp, {sp, lr}^
800289fc:	e24dd008 	sub	sp, sp, #8
80028a00:	e1a0000d 	mov	r0, sp
80028a04:	eb00009b 	bl	80028c78 <na_handler>
80028a08:	eafffffe 	b	80028a08 <trap_na+0x20>

80028a0c <trap_fiq>:
80028a0c:	e24ee004 	sub	lr, lr, #4
80028a10:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
80028a14:	e14f2000 	mrs	r2, SPSR
80028a18:	e92d0004 	stmfd	sp!, {r2}
80028a1c:	e92d4000 	stmfd	sp!, {lr}
80028a20:	e94d6000 	stmdb	sp, {sp, lr}^
80028a24:	e24dd008 	sub	sp, sp, #8
80028a28:	e1a0000d 	mov	r0, sp
80028a2c:	eb00009f 	bl	80028cb0 <fiq_handler>
80028a30:	eafffffe 	b	80028a30 <trap_fiq+0x24>

80028a34 <swi_handler>:
80028a34:	e92d4800 	push	{fp, lr}
80028a38:	e28db004 	add	fp, sp, #4
80028a3c:	e24dd008 	sub	sp, sp, #8
80028a40:	e50b0008 	str	r0, [fp, #-8]
80028a44:	e59f3018 	ldr	r3, [pc, #24]	@ 80028a64 <swi_handler+0x30>
80028a48:	e5933000 	ldr	r3, [r3]
80028a4c:	e51b2008 	ldr	r2, [fp, #-8]
80028a50:	e5832018 	str	r2, [r3, #24]
80028a54:	ebfff8b9 	bl	80026d40 <syscall>
80028a58:	e1a00000 	nop			@ (mov r0, r0)
80028a5c:	e24bd004 	sub	sp, fp, #4
80028a60:	e8bd8800 	pop	{fp, pc}
80028a64:	800d97a8 	.word	0x800d97a8

80028a68 <irq_handler>:
80028a68:	e92d4800 	push	{fp, lr}
80028a6c:	e28db004 	add	fp, sp, #4
80028a70:	e24dd008 	sub	sp, sp, #8
80028a74:	e50b0008 	str	r0, [fp, #-8]
80028a78:	e59f302c 	ldr	r3, [pc, #44]	@ 80028aac <irq_handler+0x44>
80028a7c:	e5933000 	ldr	r3, [r3]
80028a80:	e3530000 	cmp	r3, #0
80028a84:	0a000003 	beq	80028a98 <irq_handler+0x30>
80028a88:	e59f301c 	ldr	r3, [pc, #28]	@ 80028aac <irq_handler+0x44>
80028a8c:	e5933000 	ldr	r3, [r3]
80028a90:	e51b2008 	ldr	r2, [fp, #-8]
80028a94:	e5832018 	str	r2, [r3, #24]
80028a98:	e51b0008 	ldr	r0, [fp, #-8]
80028a9c:	eb000672 	bl	8002a46c <pic_dispatch>
80028aa0:	e1a00000 	nop			@ (mov r0, r0)
80028aa4:	e24bd004 	sub	sp, fp, #4
80028aa8:	e8bd8800 	pop	{fp, pc}
80028aac:	800d97a8 	.word	0x800d97a8

80028ab0 <reset_handler>:
80028ab0:	e92d4800 	push	{fp, lr}
80028ab4:	e28db004 	add	fp, sp, #4
80028ab8:	e24dd008 	sub	sp, sp, #8
80028abc:	e50b0008 	str	r0, [fp, #-8]
80028ac0:	ebffde9e 	bl	80020540 <cli>
80028ac4:	e51b3008 	ldr	r3, [fp, #-8]
80028ac8:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
80028acc:	e1a01003 	mov	r1, r3
80028ad0:	e59f000c 	ldr	r0, [pc, #12]	@ 80028ae4 <reset_handler+0x34>
80028ad4:	ebffe36e 	bl	80021894 <cprintf>
80028ad8:	e1a00000 	nop			@ (mov r0, r0)
80028adc:	e24bd004 	sub	sp, fp, #4
80028ae0:	e8bd8800 	pop	{fp, pc}
80028ae4:	8002b030 	.word	0x8002b030

80028ae8 <und_handler>:
80028ae8:	e92d4800 	push	{fp, lr}
80028aec:	e28db004 	add	fp, sp, #4
80028af0:	e24dd008 	sub	sp, sp, #8
80028af4:	e50b0008 	str	r0, [fp, #-8]
80028af8:	ebffde90 	bl	80020540 <cli>
80028afc:	e51b3008 	ldr	r3, [fp, #-8]
80028b00:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
80028b04:	e1a01003 	mov	r1, r3
80028b08:	e59f000c 	ldr	r0, [pc, #12]	@ 80028b1c <und_handler+0x34>
80028b0c:	ebffe360 	bl	80021894 <cprintf>
80028b10:	e1a00000 	nop			@ (mov r0, r0)
80028b14:	e24bd004 	sub	sp, fp, #4
80028b18:	e8bd8800 	pop	{fp, pc}
80028b1c:	8002b044 	.word	0x8002b044

80028b20 <dabort_handler>:
80028b20:	e92d4800 	push	{fp, lr}
80028b24:	e28db004 	add	fp, sp, #4
80028b28:	e24dd020 	sub	sp, sp, #32
80028b2c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80028b30:	ebffde82 	bl	80020540 <cli>
80028b34:	ee153f10 	mrc	15, 0, r3, cr5, cr0, {0}
80028b38:	e50b3008 	str	r3, [fp, #-8]
80028b3c:	ee163f10 	mrc	15, 0, r3, cr6, cr0, {0}
80028b40:	e50b300c 	str	r3, [fp, #-12]
80028b44:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80028b48:	e5931044 	ldr	r1, [r3, #68]	@ 0x44
80028b4c:	e51b3008 	ldr	r3, [fp, #-8]
80028b50:	e51b200c 	ldr	r2, [fp, #-12]
80028b54:	e59f00bc 	ldr	r0, [pc, #188]	@ 80028c18 <dabort_handler+0xf8>
80028b58:	ebffe34d 	bl	80021894 <cprintf>
80028b5c:	e51b300c 	ldr	r3, [fp, #-12]
80028b60:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80028b64:	e3c3300f 	bic	r3, r3, #15
80028b68:	e50b3010 	str	r3, [fp, #-16]
80028b6c:	ebffe2af 	bl	80021630 <alloc_page>
80028b70:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80028b74:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80028b78:	e3530000 	cmp	r3, #0
80028b7c:	1a000006 	bne	80028b9c <dabort_handler+0x7c>
80028b80:	e59f0094 	ldr	r0, [pc, #148]	@ 80028c1c <dabort_handler+0xfc>
80028b84:	ebffe342 	bl	80021894 <cprintf>
80028b88:	e59f3090 	ldr	r3, [pc, #144]	@ 80028c20 <dabort_handler+0x100>
80028b8c:	e5933000 	ldr	r3, [r3]
80028b90:	e3a02001 	mov	r2, #1
80028b94:	e5832024 	str	r2, [r3, #36]	@ 0x24
80028b98:	ea00001c 	b	80028c10 <dabort_handler+0xf0>
80028b9c:	e3a02a01 	mov	r2, #4096	@ 0x1000
80028ba0:	e3a01000 	mov	r1, #0
80028ba4:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80028ba8:	ebffdd14 	bl	80020000 <memset>
80028bac:	e59f306c 	ldr	r3, [pc, #108]	@ 80028c20 <dabort_handler+0x100>
80028bb0:	e5933000 	ldr	r3, [r3]
80028bb4:	e5930004 	ldr	r0, [r3, #4]
80028bb8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80028bbc:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
80028bc0:	e3a02003 	mov	r2, #3
80028bc4:	e58d2000 	str	r2, [sp]
80028bc8:	e3a02a01 	mov	r2, #4096	@ 0x1000
80028bcc:	e51b1010 	ldr	r1, [fp, #-16]
80028bd0:	eb000247 	bl	800294f4 <mappages>
80028bd4:	e1a03000 	mov	r3, r0
80028bd8:	e3530000 	cmp	r3, #0
80028bdc:	aa000008 	bge	80028c04 <dabort_handler+0xe4>
80028be0:	e59f003c 	ldr	r0, [pc, #60]	@ 80028c24 <dabort_handler+0x104>
80028be4:	ebffe32a 	bl	80021894 <cprintf>
80028be8:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80028bec:	ebffe285 	bl	80021608 <free_page>
80028bf0:	e59f3028 	ldr	r3, [pc, #40]	@ 80028c20 <dabort_handler+0x100>
80028bf4:	e5933000 	ldr	r3, [r3]
80028bf8:	e3a02001 	mov	r2, #1
80028bfc:	e5832024 	str	r2, [r3, #36]	@ 0x24
80028c00:	ea000002 	b	80028c10 <dabort_handler+0xf0>
80028c04:	e51b1010 	ldr	r1, [fp, #-16]
80028c08:	e59f0018 	ldr	r0, [pc, #24]	@ 80028c28 <dabort_handler+0x108>
80028c0c:	ebffe320 	bl	80021894 <cprintf>
80028c10:	e24bd004 	sub	sp, fp, #4
80028c14:	e8bd8800 	pop	{fp, pc}
80028c18:	8002b054 	.word	0x8002b054
80028c1c:	8002b090 	.word	0x8002b090
80028c20:	800d97a8 	.word	0x800d97a8
80028c24:	8002b0a8 	.word	0x8002b0a8
80028c28:	8002b0bc 	.word	0x8002b0bc

80028c2c <iabort_handler>:
80028c2c:	e92d4800 	push	{fp, lr}
80028c30:	e28db004 	add	fp, sp, #4
80028c34:	e24dd010 	sub	sp, sp, #16
80028c38:	e50b0010 	str	r0, [fp, #-16]
80028c3c:	ee153f10 	mrc	15, 0, r3, cr5, cr0, {0}
80028c40:	e50b3008 	str	r3, [fp, #-8]
80028c44:	ebffde3d 	bl	80020540 <cli>
80028c48:	e51b3010 	ldr	r3, [fp, #-16]
80028c4c:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
80028c50:	e51b2008 	ldr	r2, [fp, #-8]
80028c54:	e1a01003 	mov	r1, r3
80028c58:	e59f0014 	ldr	r0, [pc, #20]	@ 80028c74 <iabort_handler+0x48>
80028c5c:	ebffe30c 	bl	80021894 <cprintf>
80028c60:	e51b0010 	ldr	r0, [fp, #-16]
80028c64:	eb0000a0 	bl	80028eec <dump_trapframe>
80028c68:	e1a00000 	nop			@ (mov r0, r0)
80028c6c:	e24bd004 	sub	sp, fp, #4
80028c70:	e8bd8800 	pop	{fp, pc}
80028c74:	8002b0dc 	.word	0x8002b0dc

80028c78 <na_handler>:
80028c78:	e92d4800 	push	{fp, lr}
80028c7c:	e28db004 	add	fp, sp, #4
80028c80:	e24dd008 	sub	sp, sp, #8
80028c84:	e50b0008 	str	r0, [fp, #-8]
80028c88:	ebffde2c 	bl	80020540 <cli>
80028c8c:	e51b3008 	ldr	r3, [fp, #-8]
80028c90:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
80028c94:	e1a01003 	mov	r1, r3
80028c98:	e59f000c 	ldr	r0, [pc, #12]	@ 80028cac <na_handler+0x34>
80028c9c:	ebffe2fc 	bl	80021894 <cprintf>
80028ca0:	e1a00000 	nop			@ (mov r0, r0)
80028ca4:	e24bd004 	sub	sp, fp, #4
80028ca8:	e8bd8800 	pop	{fp, pc}
80028cac:	8002b104 	.word	0x8002b104

80028cb0 <fiq_handler>:
80028cb0:	e92d4800 	push	{fp, lr}
80028cb4:	e28db004 	add	fp, sp, #4
80028cb8:	e24dd008 	sub	sp, sp, #8
80028cbc:	e50b0008 	str	r0, [fp, #-8]
80028cc0:	ebffde1e 	bl	80020540 <cli>
80028cc4:	e51b3008 	ldr	r3, [fp, #-8]
80028cc8:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
80028ccc:	e1a01003 	mov	r1, r3
80028cd0:	e59f000c 	ldr	r0, [pc, #12]	@ 80028ce4 <fiq_handler+0x34>
80028cd4:	ebffe2ee 	bl	80021894 <cprintf>
80028cd8:	e1a00000 	nop			@ (mov r0, r0)
80028cdc:	e24bd004 	sub	sp, fp, #4
80028ce0:	e8bd8800 	pop	{fp, pc}
80028ce4:	8002b114 	.word	0x8002b114

80028ce8 <trap_init>:
80028ce8:	e92d4800 	push	{fp, lr}
80028cec:	e28db004 	add	fp, sp, #4
80028cf0:	e24dd020 	sub	sp, sp, #32
80028cf4:	e59f31c0 	ldr	r3, [pc, #448]	@ 80028ebc <trap_init+0x1d4>
80028cf8:	e24bc020 	sub	ip, fp, #32
80028cfc:	e893000f 	ldm	r3, {r0, r1, r2, r3}
80028d00:	e88c000f 	stm	ip, {r0, r1, r2, r3}
80028d04:	e59f31b4 	ldr	r3, [pc, #436]	@ 80028ec0 <trap_init+0x1d8>
80028d08:	e50b300c 	str	r3, [fp, #-12]
80028d0c:	e59f31b0 	ldr	r3, [pc, #432]	@ 80028ec4 <trap_init+0x1dc>
80028d10:	e5933000 	ldr	r3, [r3]
80028d14:	e3832018 	orr	r2, r3, #24
80028d18:	e51b300c 	ldr	r3, [fp, #-12]
80028d1c:	e5832000 	str	r2, [r3]
80028d20:	e59f319c 	ldr	r3, [pc, #412]	@ 80028ec4 <trap_init+0x1dc>
80028d24:	e5932000 	ldr	r2, [r3]
80028d28:	e51b300c 	ldr	r3, [fp, #-12]
80028d2c:	e2833004 	add	r3, r3, #4
80028d30:	e3822018 	orr	r2, r2, #24
80028d34:	e5832000 	str	r2, [r3]
80028d38:	e59f3184 	ldr	r3, [pc, #388]	@ 80028ec4 <trap_init+0x1dc>
80028d3c:	e5932000 	ldr	r2, [r3]
80028d40:	e51b300c 	ldr	r3, [fp, #-12]
80028d44:	e2833008 	add	r3, r3, #8
80028d48:	e3822018 	orr	r2, r2, #24
80028d4c:	e5832000 	str	r2, [r3]
80028d50:	e59f316c 	ldr	r3, [pc, #364]	@ 80028ec4 <trap_init+0x1dc>
80028d54:	e5932000 	ldr	r2, [r3]
80028d58:	e51b300c 	ldr	r3, [fp, #-12]
80028d5c:	e283300c 	add	r3, r3, #12
80028d60:	e3822018 	orr	r2, r2, #24
80028d64:	e5832000 	str	r2, [r3]
80028d68:	e59f3154 	ldr	r3, [pc, #340]	@ 80028ec4 <trap_init+0x1dc>
80028d6c:	e5932000 	ldr	r2, [r3]
80028d70:	e51b300c 	ldr	r3, [fp, #-12]
80028d74:	e2833010 	add	r3, r3, #16
80028d78:	e3822018 	orr	r2, r2, #24
80028d7c:	e5832000 	str	r2, [r3]
80028d80:	e59f313c 	ldr	r3, [pc, #316]	@ 80028ec4 <trap_init+0x1dc>
80028d84:	e5932000 	ldr	r2, [r3]
80028d88:	e51b300c 	ldr	r3, [fp, #-12]
80028d8c:	e2833014 	add	r3, r3, #20
80028d90:	e3822018 	orr	r2, r2, #24
80028d94:	e5832000 	str	r2, [r3]
80028d98:	e59f3124 	ldr	r3, [pc, #292]	@ 80028ec4 <trap_init+0x1dc>
80028d9c:	e5932000 	ldr	r2, [r3]
80028da0:	e51b300c 	ldr	r3, [fp, #-12]
80028da4:	e2833018 	add	r3, r3, #24
80028da8:	e3822018 	orr	r2, r2, #24
80028dac:	e5832000 	str	r2, [r3]
80028db0:	e59f310c 	ldr	r3, [pc, #268]	@ 80028ec4 <trap_init+0x1dc>
80028db4:	e5932000 	ldr	r2, [r3]
80028db8:	e51b300c 	ldr	r3, [fp, #-12]
80028dbc:	e283301c 	add	r3, r3, #28
80028dc0:	e3822018 	orr	r2, r2, #24
80028dc4:	e5832000 	str	r2, [r3]
80028dc8:	e51b300c 	ldr	r3, [fp, #-12]
80028dcc:	e2833020 	add	r3, r3, #32
80028dd0:	e59f20f0 	ldr	r2, [pc, #240]	@ 80028ec8 <trap_init+0x1e0>
80028dd4:	e5832000 	str	r2, [r3]
80028dd8:	e51b300c 	ldr	r3, [fp, #-12]
80028ddc:	e2833024 	add	r3, r3, #36	@ 0x24
80028de0:	e59f20e4 	ldr	r2, [pc, #228]	@ 80028ecc <trap_init+0x1e4>
80028de4:	e5832000 	str	r2, [r3]
80028de8:	e51b300c 	ldr	r3, [fp, #-12]
80028dec:	e2833028 	add	r3, r3, #40	@ 0x28
80028df0:	e59f20d8 	ldr	r2, [pc, #216]	@ 80028ed0 <trap_init+0x1e8>
80028df4:	e5832000 	str	r2, [r3]
80028df8:	e51b300c 	ldr	r3, [fp, #-12]
80028dfc:	e283302c 	add	r3, r3, #44	@ 0x2c
80028e00:	e59f20cc 	ldr	r2, [pc, #204]	@ 80028ed4 <trap_init+0x1ec>
80028e04:	e5832000 	str	r2, [r3]
80028e08:	e51b300c 	ldr	r3, [fp, #-12]
80028e0c:	e2833030 	add	r3, r3, #48	@ 0x30
80028e10:	e59f20c0 	ldr	r2, [pc, #192]	@ 80028ed8 <trap_init+0x1f0>
80028e14:	e5832000 	str	r2, [r3]
80028e18:	e51b300c 	ldr	r3, [fp, #-12]
80028e1c:	e2833034 	add	r3, r3, #52	@ 0x34
80028e20:	e59f20b4 	ldr	r2, [pc, #180]	@ 80028edc <trap_init+0x1f4>
80028e24:	e5832000 	str	r2, [r3]
80028e28:	e51b300c 	ldr	r3, [fp, #-12]
80028e2c:	e2833038 	add	r3, r3, #56	@ 0x38
80028e30:	e59f20a8 	ldr	r2, [pc, #168]	@ 80028ee0 <trap_init+0x1f8>
80028e34:	e5832000 	str	r2, [r3]
80028e38:	e51b300c 	ldr	r3, [fp, #-12]
80028e3c:	e283303c 	add	r3, r3, #60	@ 0x3c
80028e40:	e59f209c 	ldr	r2, [pc, #156]	@ 80028ee4 <trap_init+0x1fc>
80028e44:	e5832000 	str	r2, [r3]
80028e48:	e3a03000 	mov	r3, #0
80028e4c:	e50b3008 	str	r3, [fp, #-8]
80028e50:	ea000012 	b	80028ea0 <trap_init+0x1b8>
80028e54:	ebffe1f5 	bl	80021630 <alloc_page>
80028e58:	e50b0010 	str	r0, [fp, #-16]
80028e5c:	e51b3010 	ldr	r3, [fp, #-16]
80028e60:	e3530000 	cmp	r3, #0
80028e64:	1a000001 	bne	80028e70 <trap_init+0x188>
80028e68:	e59f0078 	ldr	r0, [pc, #120]	@ 80028ee8 <trap_init+0x200>
80028e6c:	ebffe320 	bl	80021af4 <panic>
80028e70:	e51b3008 	ldr	r3, [fp, #-8]
80028e74:	e1a03103 	lsl	r3, r3, #2
80028e78:	e2433004 	sub	r3, r3, #4
80028e7c:	e083300b 	add	r3, r3, fp
80028e80:	e513301c 	ldr	r3, [r3, #-28]	@ 0xffffffe4
80028e84:	e51b2010 	ldr	r2, [fp, #-16]
80028e88:	e1a01002 	mov	r1, r2
80028e8c:	e1a00003 	mov	r0, r3
80028e90:	ebffde83 	bl	800208a4 <set_stk>
80028e94:	e51b3008 	ldr	r3, [fp, #-8]
80028e98:	e2833001 	add	r3, r3, #1
80028e9c:	e50b3008 	str	r3, [fp, #-8]
80028ea0:	e51b3008 	ldr	r3, [fp, #-8]
80028ea4:	e3530003 	cmp	r3, #3
80028ea8:	9affffe9 	bls	80028e54 <trap_init+0x16c>
80028eac:	e1a00000 	nop			@ (mov r0, r0)
80028eb0:	e1a00000 	nop			@ (mov r0, r0)
80028eb4:	e24bd004 	sub	sp, fp, #4
80028eb8:	e8bd8800 	pop	{fp, pc}
80028ebc:	8002b14c 	.word	0x8002b14c
80028ec0:	ffff0000 	.word	0xffff0000
80028ec4:	8002b25c 	.word	0x8002b25c
80028ec8:	8002894c 	.word	0x8002894c
80028ecc:	80028974 	.word	0x80028974
80028ed0:	800288c0 	.word	0x800288c0
80028ed4:	80028998 	.word	0x80028998
80028ed8:	800289c0 	.word	0x800289c0
80028edc:	800289e8 	.word	0x800289e8
80028ee0:	800288f8 	.word	0x800288f8
80028ee4:	80028a0c 	.word	0x80028a0c
80028ee8:	8002b124 	.word	0x8002b124

80028eec <dump_trapframe>:
80028eec:	e92d4800 	push	{fp, lr}
80028ef0:	e28db004 	add	fp, sp, #4
80028ef4:	e24dd008 	sub	sp, sp, #8
80028ef8:	e50b0008 	str	r0, [fp, #-8]
80028efc:	e51b3008 	ldr	r3, [fp, #-8]
80028f00:	e5933008 	ldr	r3, [r3, #8]
80028f04:	e1a01003 	mov	r1, r3
80028f08:	e59f0138 	ldr	r0, [pc, #312]	@ 80029048 <dump_trapframe+0x15c>
80028f0c:	ebffe260 	bl	80021894 <cprintf>
80028f10:	e51b3008 	ldr	r3, [fp, #-8]
80028f14:	e593300c 	ldr	r3, [r3, #12]
80028f18:	e1a01003 	mov	r1, r3
80028f1c:	e59f0128 	ldr	r0, [pc, #296]	@ 8002904c <dump_trapframe+0x160>
80028f20:	ebffe25b 	bl	80021894 <cprintf>
80028f24:	e51b3008 	ldr	r3, [fp, #-8]
80028f28:	e5933010 	ldr	r3, [r3, #16]
80028f2c:	e1a01003 	mov	r1, r3
80028f30:	e59f0118 	ldr	r0, [pc, #280]	@ 80029050 <dump_trapframe+0x164>
80028f34:	ebffe256 	bl	80021894 <cprintf>
80028f38:	e51b3008 	ldr	r3, [fp, #-8]
80028f3c:	e5933014 	ldr	r3, [r3, #20]
80028f40:	e1a01003 	mov	r1, r3
80028f44:	e59f0108 	ldr	r0, [pc, #264]	@ 80029054 <dump_trapframe+0x168>
80028f48:	ebffe251 	bl	80021894 <cprintf>
80028f4c:	e51b3008 	ldr	r3, [fp, #-8]
80028f50:	e5933018 	ldr	r3, [r3, #24]
80028f54:	e1a01003 	mov	r1, r3
80028f58:	e59f00f8 	ldr	r0, [pc, #248]	@ 80029058 <dump_trapframe+0x16c>
80028f5c:	ebffe24c 	bl	80021894 <cprintf>
80028f60:	e51b3008 	ldr	r3, [fp, #-8]
80028f64:	e593301c 	ldr	r3, [r3, #28]
80028f68:	e1a01003 	mov	r1, r3
80028f6c:	e59f00e8 	ldr	r0, [pc, #232]	@ 8002905c <dump_trapframe+0x170>
80028f70:	ebffe247 	bl	80021894 <cprintf>
80028f74:	e51b3008 	ldr	r3, [fp, #-8]
80028f78:	e5933020 	ldr	r3, [r3, #32]
80028f7c:	e1a01003 	mov	r1, r3
80028f80:	e59f00d8 	ldr	r0, [pc, #216]	@ 80029060 <dump_trapframe+0x174>
80028f84:	ebffe242 	bl	80021894 <cprintf>
80028f88:	e51b3008 	ldr	r3, [fp, #-8]
80028f8c:	e5933024 	ldr	r3, [r3, #36]	@ 0x24
80028f90:	e1a01003 	mov	r1, r3
80028f94:	e59f00c8 	ldr	r0, [pc, #200]	@ 80029064 <dump_trapframe+0x178>
80028f98:	ebffe23d 	bl	80021894 <cprintf>
80028f9c:	e51b3008 	ldr	r3, [fp, #-8]
80028fa0:	e5933028 	ldr	r3, [r3, #40]	@ 0x28
80028fa4:	e1a01003 	mov	r1, r3
80028fa8:	e59f00b8 	ldr	r0, [pc, #184]	@ 80029068 <dump_trapframe+0x17c>
80028fac:	ebffe238 	bl	80021894 <cprintf>
80028fb0:	e51b3008 	ldr	r3, [fp, #-8]
80028fb4:	e593302c 	ldr	r3, [r3, #44]	@ 0x2c
80028fb8:	e1a01003 	mov	r1, r3
80028fbc:	e59f00a8 	ldr	r0, [pc, #168]	@ 8002906c <dump_trapframe+0x180>
80028fc0:	ebffe233 	bl	80021894 <cprintf>
80028fc4:	e51b3008 	ldr	r3, [fp, #-8]
80028fc8:	e5933030 	ldr	r3, [r3, #48]	@ 0x30
80028fcc:	e1a01003 	mov	r1, r3
80028fd0:	e59f0098 	ldr	r0, [pc, #152]	@ 80029070 <dump_trapframe+0x184>
80028fd4:	ebffe22e 	bl	80021894 <cprintf>
80028fd8:	e51b3008 	ldr	r3, [fp, #-8]
80028fdc:	e5933034 	ldr	r3, [r3, #52]	@ 0x34
80028fe0:	e1a01003 	mov	r1, r3
80028fe4:	e59f0088 	ldr	r0, [pc, #136]	@ 80029074 <dump_trapframe+0x188>
80028fe8:	ebffe229 	bl	80021894 <cprintf>
80028fec:	e51b3008 	ldr	r3, [fp, #-8]
80028ff0:	e5933038 	ldr	r3, [r3, #56]	@ 0x38
80028ff4:	e1a01003 	mov	r1, r3
80028ff8:	e59f0078 	ldr	r0, [pc, #120]	@ 80029078 <dump_trapframe+0x18c>
80028ffc:	ebffe224 	bl	80021894 <cprintf>
80029000:	e51b3008 	ldr	r3, [fp, #-8]
80029004:	e593303c 	ldr	r3, [r3, #60]	@ 0x3c
80029008:	e1a01003 	mov	r1, r3
8002900c:	e59f0068 	ldr	r0, [pc, #104]	@ 8002907c <dump_trapframe+0x190>
80029010:	ebffe21f 	bl	80021894 <cprintf>
80029014:	e51b3008 	ldr	r3, [fp, #-8]
80029018:	e5933040 	ldr	r3, [r3, #64]	@ 0x40
8002901c:	e1a01003 	mov	r1, r3
80029020:	e59f0058 	ldr	r0, [pc, #88]	@ 80029080 <dump_trapframe+0x194>
80029024:	ebffe21a 	bl	80021894 <cprintf>
80029028:	e51b3008 	ldr	r3, [fp, #-8]
8002902c:	e5933044 	ldr	r3, [r3, #68]	@ 0x44
80029030:	e1a01003 	mov	r1, r3
80029034:	e59f0048 	ldr	r0, [pc, #72]	@ 80029084 <dump_trapframe+0x198>
80029038:	ebffe215 	bl	80021894 <cprintf>
8002903c:	e1a00000 	nop			@ (mov r0, r0)
80029040:	e24bd004 	sub	sp, fp, #4
80029044:	e8bd8800 	pop	{fp, pc}
80029048:	8002b15c 	.word	0x8002b15c
8002904c:	8002b16c 	.word	0x8002b16c
80029050:	8002b17c 	.word	0x8002b17c
80029054:	8002b18c 	.word	0x8002b18c
80029058:	8002b19c 	.word	0x8002b19c
8002905c:	8002b1ac 	.word	0x8002b1ac
80029060:	8002b1bc 	.word	0x8002b1bc
80029064:	8002b1cc 	.word	0x8002b1cc
80029068:	8002b1dc 	.word	0x8002b1dc
8002906c:	8002b1ec 	.word	0x8002b1ec
80029070:	8002b1fc 	.word	0x8002b1fc
80029074:	8002b20c 	.word	0x8002b20c
80029078:	8002b21c 	.word	0x8002b21c
8002907c:	8002b22c 	.word	0x8002b22c
80029080:	8002b23c 	.word	0x8002b23c
80029084:	8002b24c 	.word	0x8002b24c

80029088 <v2p>:
80029088:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
8002908c:	e28db000 	add	fp, sp, #0
80029090:	e24dd00c 	sub	sp, sp, #12
80029094:	e50b0008 	str	r0, [fp, #-8]
80029098:	e51b3008 	ldr	r3, [fp, #-8]
8002909c:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
800290a0:	e1a00003 	mov	r0, r3
800290a4:	e28bd000 	add	sp, fp, #0
800290a8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
800290ac:	e12fff1e 	bx	lr

800290b0 <p2v>:
800290b0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
800290b4:	e28db000 	add	fp, sp, #0
800290b8:	e24dd00c 	sub	sp, sp, #12
800290bc:	e50b0008 	str	r0, [fp, #-8]
800290c0:	e51b3008 	ldr	r3, [fp, #-8]
800290c4:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
800290c8:	e1a00003 	mov	r0, r3
800290cc:	e28bd000 	add	sp, fp, #0
800290d0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
800290d4:	e12fff1e 	bx	lr

800290d8 <handle_page_fault>:
800290d8:	e92d4830 	push	{r4, r5, fp, lr}
800290dc:	e28db00c 	add	fp, sp, #12
800290e0:	e24dd020 	sub	sp, sp, #32
800290e4:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
800290e8:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
800290ec:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
800290f0:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
800290f4:	e3c3300f 	bic	r3, r3, #15
800290f8:	e50b3010 	str	r3, [fp, #-16]
800290fc:	e51b3010 	ldr	r3, [fp, #-16]
80029100:	e3530000 	cmp	r3, #0
80029104:	aa000004 	bge	8002911c <handle_page_fault+0x44>
80029108:	e51b1010 	ldr	r1, [fp, #-16]
8002910c:	e59f0140 	ldr	r0, [pc, #320]	@ 80029254 <handle_page_fault+0x17c>
80029110:	ebffe1df 	bl	80021894 <cprintf>
80029114:	e3e03000 	mvn	r3, #0
80029118:	ea00004a 	b	80029248 <handle_page_fault+0x170>
8002911c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029120:	e5933000 	ldr	r3, [r3]
80029124:	e51b2010 	ldr	r2, [fp, #-16]
80029128:	e1520003 	cmp	r2, r3
8002912c:	3a000008 	bcc	80029154 <handle_page_fault+0x7c>
80029130:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029134:	e5932000 	ldr	r2, [r3]
80029138:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8002913c:	e5933010 	ldr	r3, [r3, #16]
80029140:	e51b1010 	ldr	r1, [fp, #-16]
80029144:	e59f010c 	ldr	r0, [pc, #268]	@ 80029258 <handle_page_fault+0x180>
80029148:	ebffe1d1 	bl	80021894 <cprintf>
8002914c:	e3e03000 	mvn	r3, #0
80029150:	ea00003c 	b	80029248 <handle_page_fault+0x170>
80029154:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029158:	e5933004 	ldr	r3, [r3, #4]
8002915c:	e51b1010 	ldr	r1, [fp, #-16]
80029160:	e3a02000 	mov	r2, #0
80029164:	e1a00003 	mov	r0, r3
80029168:	eb0000ab 	bl	8002941c <walkpgdir>
8002916c:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80029170:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80029174:	e3530000 	cmp	r3, #0
80029178:	0a000006 	beq	80029198 <handle_page_fault+0xc0>
8002917c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80029180:	e5933000 	ldr	r3, [r3]
80029184:	e2033003 	and	r3, r3, #3
80029188:	e3530000 	cmp	r3, #0
8002918c:	0a000001 	beq	80029198 <handle_page_fault+0xc0>
80029190:	e3a03000 	mov	r3, #0
80029194:	ea00002b 	b	80029248 <handle_page_fault+0x170>
80029198:	ebffe124 	bl	80021630 <alloc_page>
8002919c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
800291a0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800291a4:	e3530000 	cmp	r3, #0
800291a8:	1a000006 	bne	800291c8 <handle_page_fault+0xf0>
800291ac:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800291b0:	e5933010 	ldr	r3, [r3, #16]
800291b4:	e1a01003 	mov	r1, r3
800291b8:	e59f009c 	ldr	r0, [pc, #156]	@ 8002925c <handle_page_fault+0x184>
800291bc:	ebffe1b4 	bl	80021894 <cprintf>
800291c0:	e3e03000 	mvn	r3, #0
800291c4:	ea00001f 	b	80029248 <handle_page_fault+0x170>
800291c8:	e3a02a01 	mov	r2, #4096	@ 0x1000
800291cc:	e3a01000 	mov	r1, #0
800291d0:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
800291d4:	ebffdb89 	bl	80020000 <memset>
800291d8:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800291dc:	e5934004 	ldr	r4, [r3, #4]
800291e0:	e51b5010 	ldr	r5, [fp, #-16]
800291e4:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
800291e8:	ebffffa6 	bl	80029088 <v2p>
800291ec:	e1a03000 	mov	r3, r0
800291f0:	e3a02003 	mov	r2, #3
800291f4:	e58d2000 	str	r2, [sp]
800291f8:	e3a02a01 	mov	r2, #4096	@ 0x1000
800291fc:	e1a01005 	mov	r1, r5
80029200:	e1a00004 	mov	r0, r4
80029204:	eb0000ba 	bl	800294f4 <mappages>
80029208:	e1a03000 	mov	r3, r0
8002920c:	e3530000 	cmp	r3, #0
80029210:	aa000009 	bge	8002923c <handle_page_fault+0x164>
80029214:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029218:	e5933010 	ldr	r3, [r3, #16]
8002921c:	e1a02003 	mov	r2, r3
80029220:	e51b1010 	ldr	r1, [fp, #-16]
80029224:	e59f0034 	ldr	r0, [pc, #52]	@ 80029260 <handle_page_fault+0x188>
80029228:	ebffe199 	bl	80021894 <cprintf>
8002922c:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80029230:	ebffe0f4 	bl	80021608 <free_page>
80029234:	e3e03000 	mvn	r3, #0
80029238:	ea000002 	b	80029248 <handle_page_fault+0x170>
8002923c:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80029240:	eb0000f6 	bl	80029620 <switchuvm>
80029244:	e3a03000 	mov	r3, #0
80029248:	e1a00003 	mov	r0, r3
8002924c:	e24bd00c 	sub	sp, fp, #12
80029250:	e8bd8830 	pop	{r4, r5, fp, pc}
80029254:	8002b260 	.word	0x8002b260
80029258:	8002b298 	.word	0x8002b298
8002925c:	8002b2cc 	.word	0x8002b2cc
80029260:	8002b300 	.word	0x8002b300

80029264 <init_vmm>:
80029264:	e92d4800 	push	{fp, lr}
80029268:	e28db004 	add	fp, sp, #4
8002926c:	e59f1018 	ldr	r1, [pc, #24]	@ 8002928c <init_vmm+0x28>
80029270:	e59f0018 	ldr	r0, [pc, #24]	@ 80029290 <init_vmm+0x2c>
80029274:	ebfff5d4 	bl	800269cc <initlock>
80029278:	e59f3010 	ldr	r3, [pc, #16]	@ 80029290 <init_vmm+0x2c>
8002927c:	e3a02000 	mov	r2, #0
80029280:	e5832034 	str	r2, [r3, #52]	@ 0x34
80029284:	e1a00000 	nop			@ (mov r0, r0)
80029288:	e8bd8800 	pop	{fp, pc}
8002928c:	8002b338 	.word	0x8002b338
80029290:	800d97b0 	.word	0x800d97b0

80029294 <_kpt_free>:
80029294:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80029298:	e28db000 	add	fp, sp, #0
8002929c:	e24dd014 	sub	sp, sp, #20
800292a0:	e50b0010 	str	r0, [fp, #-16]
800292a4:	e51b3010 	ldr	r3, [fp, #-16]
800292a8:	e50b3008 	str	r3, [fp, #-8]
800292ac:	e59f3024 	ldr	r3, [pc, #36]	@ 800292d8 <_kpt_free+0x44>
800292b0:	e5932034 	ldr	r2, [r3, #52]	@ 0x34
800292b4:	e51b3008 	ldr	r3, [fp, #-8]
800292b8:	e5832000 	str	r2, [r3]
800292bc:	e59f2014 	ldr	r2, [pc, #20]	@ 800292d8 <_kpt_free+0x44>
800292c0:	e51b3008 	ldr	r3, [fp, #-8]
800292c4:	e5823034 	str	r3, [r2, #52]	@ 0x34
800292c8:	e1a00000 	nop			@ (mov r0, r0)
800292cc:	e28bd000 	add	sp, fp, #0
800292d0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
800292d4:	e12fff1e 	bx	lr
800292d8:	800d97b0 	.word	0x800d97b0

800292dc <kpt_free>:
800292dc:	e92d4800 	push	{fp, lr}
800292e0:	e28db004 	add	fp, sp, #4
800292e4:	e24dd008 	sub	sp, sp, #8
800292e8:	e50b0008 	str	r0, [fp, #-8]
800292ec:	e51b3008 	ldr	r3, [fp, #-8]
800292f0:	e59f2034 	ldr	r2, [pc, #52]	@ 8002932c <kpt_free+0x50>
800292f4:	e1530002 	cmp	r3, r2
800292f8:	9a000003 	bls	8002930c <kpt_free+0x30>
800292fc:	e3a0100a 	mov	r1, #10
80029300:	e51b0008 	ldr	r0, [fp, #-8]
80029304:	ebffe09d 	bl	80021580 <kfree>
80029308:	ea000005 	b	80029324 <kpt_free+0x48>
8002930c:	e59f001c 	ldr	r0, [pc, #28]	@ 80029330 <kpt_free+0x54>
80029310:	ebfff5bf 	bl	80026a14 <acquire>
80029314:	e51b0008 	ldr	r0, [fp, #-8]
80029318:	ebffffdd 	bl	80029294 <_kpt_free>
8002931c:	e59f000c 	ldr	r0, [pc, #12]	@ 80029330 <kpt_free+0x54>
80029320:	ebfff5c6 	bl	80026a40 <release>
80029324:	e24bd004 	sub	sp, fp, #4
80029328:	e8bd8800 	pop	{fp, pc}
8002932c:	800fffff 	.word	0x800fffff
80029330:	800d97b0 	.word	0x800d97b0

80029334 <kpt_freerange>:
80029334:	e92d4800 	push	{fp, lr}
80029338:	e28db004 	add	fp, sp, #4
8002933c:	e24dd008 	sub	sp, sp, #8
80029340:	e50b0008 	str	r0, [fp, #-8]
80029344:	e50b100c 	str	r1, [fp, #-12]
80029348:	ea000005 	b	80029364 <kpt_freerange+0x30>
8002934c:	e51b3008 	ldr	r3, [fp, #-8]
80029350:	e1a00003 	mov	r0, r3
80029354:	ebffffce 	bl	80029294 <_kpt_free>
80029358:	e51b3008 	ldr	r3, [fp, #-8]
8002935c:	e2833b01 	add	r3, r3, #1024	@ 0x400
80029360:	e50b3008 	str	r3, [fp, #-8]
80029364:	e51b2008 	ldr	r2, [fp, #-8]
80029368:	e51b300c 	ldr	r3, [fp, #-12]
8002936c:	e1520003 	cmp	r2, r3
80029370:	3afffff5 	bcc	8002934c <kpt_freerange+0x18>
80029374:	e1a00000 	nop			@ (mov r0, r0)
80029378:	e1a00000 	nop			@ (mov r0, r0)
8002937c:	e24bd004 	sub	sp, fp, #4
80029380:	e8bd8800 	pop	{fp, pc}

80029384 <kpt_alloc>:
80029384:	e92d4800 	push	{fp, lr}
80029388:	e28db004 	add	fp, sp, #4
8002938c:	e24dd008 	sub	sp, sp, #8
80029390:	e59f007c 	ldr	r0, [pc, #124]	@ 80029414 <kpt_alloc+0x90>
80029394:	ebfff59e 	bl	80026a14 <acquire>
80029398:	e59f3074 	ldr	r3, [pc, #116]	@ 80029414 <kpt_alloc+0x90>
8002939c:	e5933034 	ldr	r3, [r3, #52]	@ 0x34
800293a0:	e50b3008 	str	r3, [fp, #-8]
800293a4:	e51b3008 	ldr	r3, [fp, #-8]
800293a8:	e3530000 	cmp	r3, #0
800293ac:	0a000003 	beq	800293c0 <kpt_alloc+0x3c>
800293b0:	e51b3008 	ldr	r3, [fp, #-8]
800293b4:	e5933000 	ldr	r3, [r3]
800293b8:	e59f2054 	ldr	r2, [pc, #84]	@ 80029414 <kpt_alloc+0x90>
800293bc:	e5823034 	str	r3, [r2, #52]	@ 0x34
800293c0:	e59f004c 	ldr	r0, [pc, #76]	@ 80029414 <kpt_alloc+0x90>
800293c4:	ebfff59d 	bl	80026a40 <release>
800293c8:	e51b3008 	ldr	r3, [fp, #-8]
800293cc:	e3530000 	cmp	r3, #0
800293d0:	1a000007 	bne	800293f4 <kpt_alloc+0x70>
800293d4:	e3a0000a 	mov	r0, #10
800293d8:	ebffe011 	bl	80021424 <kmalloc>
800293dc:	e50b0008 	str	r0, [fp, #-8]
800293e0:	e51b3008 	ldr	r3, [fp, #-8]
800293e4:	e3530000 	cmp	r3, #0
800293e8:	1a000001 	bne	800293f4 <kpt_alloc+0x70>
800293ec:	e59f0024 	ldr	r0, [pc, #36]	@ 80029418 <kpt_alloc+0x94>
800293f0:	ebffe1bf 	bl	80021af4 <panic>
800293f4:	e3a02b01 	mov	r2, #1024	@ 0x400
800293f8:	e3a01000 	mov	r1, #0
800293fc:	e51b0008 	ldr	r0, [fp, #-8]
80029400:	ebffdafe 	bl	80020000 <memset>
80029404:	e51b3008 	ldr	r3, [fp, #-8]
80029408:	e1a00003 	mov	r0, r3
8002940c:	e24bd004 	sub	sp, fp, #4
80029410:	e8bd8800 	pop	{fp, pc}
80029414:	800d97b0 	.word	0x800d97b0
80029418:	8002b33c 	.word	0x8002b33c

8002941c <walkpgdir>:
8002941c:	e92d4800 	push	{fp, lr}
80029420:	e28db004 	add	fp, sp, #4
80029424:	e24dd018 	sub	sp, sp, #24
80029428:	e50b0010 	str	r0, [fp, #-16]
8002942c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80029430:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80029434:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80029438:	e1a03a23 	lsr	r3, r3, #20
8002943c:	e1a03103 	lsl	r3, r3, #2
80029440:	e51b2010 	ldr	r2, [fp, #-16]
80029444:	e0823003 	add	r3, r2, r3
80029448:	e50b300c 	str	r3, [fp, #-12]
8002944c:	e51b300c 	ldr	r3, [fp, #-12]
80029450:	e5933000 	ldr	r3, [r3]
80029454:	e2033003 	and	r3, r3, #3
80029458:	e3530000 	cmp	r3, #0
8002945c:	0a000007 	beq	80029480 <walkpgdir+0x64>
80029460:	e51b300c 	ldr	r3, [fp, #-12]
80029464:	e5933000 	ldr	r3, [r3]
80029468:	e3c33fff 	bic	r3, r3, #1020	@ 0x3fc
8002946c:	e3c33003 	bic	r3, r3, #3
80029470:	e1a00003 	mov	r0, r3
80029474:	ebffff0d 	bl	800290b0 <p2v>
80029478:	e50b0008 	str	r0, [fp, #-8]
8002947c:	ea000013 	b	800294d0 <walkpgdir+0xb4>
80029480:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80029484:	e3530000 	cmp	r3, #0
80029488:	0a000004 	beq	800294a0 <walkpgdir+0x84>
8002948c:	ebffffbc 	bl	80029384 <kpt_alloc>
80029490:	e50b0008 	str	r0, [fp, #-8]
80029494:	e51b3008 	ldr	r3, [fp, #-8]
80029498:	e3530000 	cmp	r3, #0
8002949c:	1a000001 	bne	800294a8 <walkpgdir+0x8c>
800294a0:	e3a03000 	mov	r3, #0
800294a4:	ea00000f 	b	800294e8 <walkpgdir+0xcc>
800294a8:	e3a02b01 	mov	r2, #1024	@ 0x400
800294ac:	e3a01000 	mov	r1, #0
800294b0:	e51b0008 	ldr	r0, [fp, #-8]
800294b4:	ebffdad1 	bl	80020000 <memset>
800294b8:	e51b0008 	ldr	r0, [fp, #-8]
800294bc:	ebfffef1 	bl	80029088 <v2p>
800294c0:	e1a03000 	mov	r3, r0
800294c4:	e3832001 	orr	r2, r3, #1
800294c8:	e51b300c 	ldr	r3, [fp, #-12]
800294cc:	e5832000 	str	r2, [r3]
800294d0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800294d4:	e1a03623 	lsr	r3, r3, #12
800294d8:	e6ef3073 	uxtb	r3, r3
800294dc:	e1a03103 	lsl	r3, r3, #2
800294e0:	e51b2008 	ldr	r2, [fp, #-8]
800294e4:	e0823003 	add	r3, r2, r3
800294e8:	e1a00003 	mov	r0, r3
800294ec:	e24bd004 	sub	sp, fp, #4
800294f0:	e8bd8800 	pop	{fp, pc}

800294f4 <mappages>:
800294f4:	e92d4800 	push	{fp, lr}
800294f8:	e28db004 	add	fp, sp, #4
800294fc:	e24dd020 	sub	sp, sp, #32
80029500:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80029504:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
80029508:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
8002950c:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80029510:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80029514:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80029518:	e3c3300f 	bic	r3, r3, #15
8002951c:	e50b3008 	str	r3, [fp, #-8]
80029520:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
80029524:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029528:	e0823003 	add	r3, r2, r3
8002952c:	e2433001 	sub	r3, r3, #1
80029530:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80029534:	e3c3300f 	bic	r3, r3, #15
80029538:	e50b300c 	str	r3, [fp, #-12]
8002953c:	e3a02001 	mov	r2, #1
80029540:	e51b1008 	ldr	r1, [fp, #-8]
80029544:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80029548:	ebffffb3 	bl	8002941c <walkpgdir>
8002954c:	e50b0010 	str	r0, [fp, #-16]
80029550:	e51b3010 	ldr	r3, [fp, #-16]
80029554:	e3530000 	cmp	r3, #0
80029558:	1a000001 	bne	80029564 <mappages+0x70>
8002955c:	e3e03000 	mvn	r3, #0
80029560:	ea00001b 	b	800295d4 <mappages+0xe0>
80029564:	e51b3010 	ldr	r3, [fp, #-16]
80029568:	e5933000 	ldr	r3, [r3]
8002956c:	e2033003 	and	r3, r3, #3
80029570:	e3530000 	cmp	r3, #0
80029574:	0a000001 	beq	80029580 <mappages+0x8c>
80029578:	e59f0060 	ldr	r0, [pc, #96]	@ 800295e0 <mappages+0xec>
8002957c:	ebffe15c 	bl	80021af4 <panic>
80029580:	e59b3004 	ldr	r3, [fp, #4]
80029584:	e1a03203 	lsl	r3, r3, #4
80029588:	e2032030 	and	r2, r3, #48	@ 0x30
8002958c:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80029590:	e1823003 	orr	r3, r2, r3
80029594:	e383200e 	orr	r2, r3, #14
80029598:	e51b3010 	ldr	r3, [fp, #-16]
8002959c:	e5832000 	str	r2, [r3]
800295a0:	e51b2008 	ldr	r2, [fp, #-8]
800295a4:	e51b300c 	ldr	r3, [fp, #-12]
800295a8:	e1520003 	cmp	r2, r3
800295ac:	0a000006 	beq	800295cc <mappages+0xd8>
800295b0:	e51b3008 	ldr	r3, [fp, #-8]
800295b4:	e2833a01 	add	r3, r3, #4096	@ 0x1000
800295b8:	e50b3008 	str	r3, [fp, #-8]
800295bc:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
800295c0:	e2833a01 	add	r3, r3, #4096	@ 0x1000
800295c4:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
800295c8:	eaffffdb 	b	8002953c <mappages+0x48>
800295cc:	e1a00000 	nop			@ (mov r0, r0)
800295d0:	e3a03000 	mov	r3, #0
800295d4:	e1a00003 	mov	r0, r3
800295d8:	e24bd004 	sub	sp, fp, #4
800295dc:	e8bd8800 	pop	{fp, pc}
800295e0:	8002b34c 	.word	0x8002b34c

800295e4 <flush_tlb>:
800295e4:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
800295e8:	e28db000 	add	fp, sp, #0
800295ec:	e24dd00c 	sub	sp, sp, #12
800295f0:	e3a03000 	mov	r3, #0
800295f4:	e50b3008 	str	r3, [fp, #-8]
800295f8:	e51b3008 	ldr	r3, [fp, #-8]
800295fc:	ee083f17 	mcr	15, 0, r3, cr8, cr7, {0}
80029600:	e51b3008 	ldr	r3, [fp, #-8]
80029604:	ee073f1a 	mcr	15, 0, r3, cr7, cr10, {0}
80029608:	e51b3008 	ldr	r3, [fp, #-8]
8002960c:	ee073f1b 	mcr	15, 0, r3, cr7, cr11, {0}
80029610:	e1a00000 	nop			@ (mov r0, r0)
80029614:	e28bd000 	add	sp, fp, #0
80029618:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
8002961c:	e12fff1e 	bx	lr

80029620 <switchuvm>:
80029620:	e92d4800 	push	{fp, lr}
80029624:	e28db004 	add	fp, sp, #4
80029628:	e24dd010 	sub	sp, sp, #16
8002962c:	e50b0010 	str	r0, [fp, #-16]
80029630:	ebffdbfd 	bl	8002062c <pushcli>
80029634:	e51b3010 	ldr	r3, [fp, #-16]
80029638:	e5933004 	ldr	r3, [r3, #4]
8002963c:	e3530000 	cmp	r3, #0
80029640:	1a000001 	bne	8002964c <switchuvm+0x2c>
80029644:	e59f002c 	ldr	r0, [pc, #44]	@ 80029678 <switchuvm+0x58>
80029648:	ebffe129 	bl	80021af4 <panic>
8002964c:	e51b3010 	ldr	r3, [fp, #-16]
80029650:	e5933004 	ldr	r3, [r3, #4]
80029654:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
80029658:	e50b3008 	str	r3, [fp, #-8]
8002965c:	e51b3008 	ldr	r3, [fp, #-8]
80029660:	ee023f10 	mcr	15, 0, r3, cr2, cr0, {0}
80029664:	ebffffde 	bl	800295e4 <flush_tlb>
80029668:	ebffdc04 	bl	80020680 <popcli>
8002966c:	e1a00000 	nop			@ (mov r0, r0)
80029670:	e24bd004 	sub	sp, fp, #4
80029674:	e8bd8800 	pop	{fp, pc}
80029678:	8002b354 	.word	0x8002b354

8002967c <inituvm>:
8002967c:	e92d4800 	push	{fp, lr}
80029680:	e28db004 	add	fp, sp, #4
80029684:	e24dd020 	sub	sp, sp, #32
80029688:	e50b0010 	str	r0, [fp, #-16]
8002968c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80029690:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80029694:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80029698:	e3530a01 	cmp	r3, #4096	@ 0x1000
8002969c:	3a000001 	bcc	800296a8 <inituvm+0x2c>
800296a0:	e59f0058 	ldr	r0, [pc, #88]	@ 80029700 <inituvm+0x84>
800296a4:	ebffe112 	bl	80021af4 <panic>
800296a8:	ebffdfe0 	bl	80021630 <alloc_page>
800296ac:	e50b0008 	str	r0, [fp, #-8]
800296b0:	e3a02a01 	mov	r2, #4096	@ 0x1000
800296b4:	e3a01000 	mov	r1, #0
800296b8:	e51b0008 	ldr	r0, [fp, #-8]
800296bc:	ebffda4f 	bl	80020000 <memset>
800296c0:	e51b0008 	ldr	r0, [fp, #-8]
800296c4:	ebfffe6f 	bl	80029088 <v2p>
800296c8:	e1a03000 	mov	r3, r0
800296cc:	e3a02003 	mov	r2, #3
800296d0:	e58d2000 	str	r2, [sp]
800296d4:	e3a02a01 	mov	r2, #4096	@ 0x1000
800296d8:	e3a01000 	mov	r1, #0
800296dc:	e51b0010 	ldr	r0, [fp, #-16]
800296e0:	ebffff83 	bl	800294f4 <mappages>
800296e4:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
800296e8:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
800296ec:	e51b0008 	ldr	r0, [fp, #-8]
800296f0:	ebffdab4 	bl	800201c8 <memmove>
800296f4:	e1a00000 	nop			@ (mov r0, r0)
800296f8:	e24bd004 	sub	sp, fp, #4
800296fc:	e8bd8800 	pop	{fp, pc}
80029700:	8002b368 	.word	0x8002b368

80029704 <loaduvm>:
80029704:	e92d4800 	push	{fp, lr}
80029708:	e28db004 	add	fp, sp, #4
8002970c:	e24dd020 	sub	sp, sp, #32
80029710:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80029714:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
80029718:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
8002971c:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80029720:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80029724:	e1a03a03 	lsl	r3, r3, #20
80029728:	e1a03a23 	lsr	r3, r3, #20
8002972c:	e3530000 	cmp	r3, #0
80029730:	0a000001 	beq	8002973c <loaduvm+0x38>
80029734:	e59f00f0 	ldr	r0, [pc, #240]	@ 8002982c <loaduvm+0x128>
80029738:	ebffe0ed 	bl	80021af4 <panic>
8002973c:	e3a03000 	mov	r3, #0
80029740:	e50b3008 	str	r3, [fp, #-8]
80029744:	ea000030 	b	8002980c <loaduvm+0x108>
80029748:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
8002974c:	e51b3008 	ldr	r3, [fp, #-8]
80029750:	e0823003 	add	r3, r2, r3
80029754:	e3a02000 	mov	r2, #0
80029758:	e1a01003 	mov	r1, r3
8002975c:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80029760:	ebffff2d 	bl	8002941c <walkpgdir>
80029764:	e50b0010 	str	r0, [fp, #-16]
80029768:	e51b3010 	ldr	r3, [fp, #-16]
8002976c:	e3530000 	cmp	r3, #0
80029770:	1a000001 	bne	8002977c <loaduvm+0x78>
80029774:	e59f00b4 	ldr	r0, [pc, #180]	@ 80029830 <loaduvm+0x12c>
80029778:	ebffe0dd 	bl	80021af4 <panic>
8002977c:	e51b3010 	ldr	r3, [fp, #-16]
80029780:	e5933000 	ldr	r3, [r3]
80029784:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80029788:	e3c3300f 	bic	r3, r3, #15
8002978c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80029790:	e59b2004 	ldr	r2, [fp, #4]
80029794:	e51b3008 	ldr	r3, [fp, #-8]
80029798:	e0423003 	sub	r3, r2, r3
8002979c:	e3530a01 	cmp	r3, #4096	@ 0x1000
800297a0:	2a000004 	bcs	800297b8 <loaduvm+0xb4>
800297a4:	e59b2004 	ldr	r2, [fp, #4]
800297a8:	e51b3008 	ldr	r3, [fp, #-8]
800297ac:	e0423003 	sub	r3, r2, r3
800297b0:	e50b300c 	str	r3, [fp, #-12]
800297b4:	ea000001 	b	800297c0 <loaduvm+0xbc>
800297b8:	e3a03a01 	mov	r3, #4096	@ 0x1000
800297bc:	e50b300c 	str	r3, [fp, #-12]
800297c0:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
800297c4:	ebfffe39 	bl	800290b0 <p2v>
800297c8:	e1a01000 	mov	r1, r0
800297cc:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
800297d0:	e51b3008 	ldr	r3, [fp, #-8]
800297d4:	e0822003 	add	r2, r2, r3
800297d8:	e51b300c 	ldr	r3, [fp, #-12]
800297dc:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
800297e0:	ebffe8ac 	bl	80023a98 <readi>
800297e4:	e1a03000 	mov	r3, r0
800297e8:	e1a02003 	mov	r2, r3
800297ec:	e51b300c 	ldr	r3, [fp, #-12]
800297f0:	e1530002 	cmp	r3, r2
800297f4:	0a000001 	beq	80029800 <loaduvm+0xfc>
800297f8:	e3e03000 	mvn	r3, #0
800297fc:	ea000007 	b	80029820 <loaduvm+0x11c>
80029800:	e51b3008 	ldr	r3, [fp, #-8]
80029804:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80029808:	e50b3008 	str	r3, [fp, #-8]
8002980c:	e51b2008 	ldr	r2, [fp, #-8]
80029810:	e59b3004 	ldr	r3, [fp, #4]
80029814:	e1520003 	cmp	r2, r3
80029818:	3affffca 	bcc	80029748 <loaduvm+0x44>
8002981c:	e3a03000 	mov	r3, #0
80029820:	e1a00003 	mov	r0, r3
80029824:	e24bd004 	sub	sp, fp, #4
80029828:	e8bd8800 	pop	{fp, pc}
8002982c:	8002b384 	.word	0x8002b384
80029830:	8002b3a8 	.word	0x8002b3a8

80029834 <allocuvm>:
80029834:	e92d4810 	push	{r4, fp, lr}
80029838:	e28db008 	add	fp, sp, #8
8002983c:	e24dd024 	sub	sp, sp, #36	@ 0x24
80029840:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80029844:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
80029848:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
8002984c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029850:	e373021f 	cmn	r3, #-268435455	@ 0xf0000001
80029854:	9a000001 	bls	80029860 <allocuvm+0x2c>
80029858:	e3a03000 	mov	r3, #0
8002985c:	ea00002f 	b	80029920 <allocuvm+0xec>
80029860:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
80029864:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80029868:	e1520003 	cmp	r2, r3
8002986c:	2a000001 	bcs	80029878 <allocuvm+0x44>
80029870:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80029874:	ea000029 	b	80029920 <allocuvm+0xec>
80029878:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8002987c:	e2833eff 	add	r3, r3, #4080	@ 0xff0
80029880:	e283300f 	add	r3, r3, #15
80029884:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80029888:	e3c3300f 	bic	r3, r3, #15
8002988c:	e50b3010 	str	r3, [fp, #-16]
80029890:	ea00001d 	b	8002990c <allocuvm+0xd8>
80029894:	ebffdf65 	bl	80021630 <alloc_page>
80029898:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
8002989c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800298a0:	e3530000 	cmp	r3, #0
800298a4:	1a000007 	bne	800298c8 <allocuvm+0x94>
800298a8:	e59f007c 	ldr	r0, [pc, #124]	@ 8002992c <allocuvm+0xf8>
800298ac:	ebffdff8 	bl	80021894 <cprintf>
800298b0:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
800298b4:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
800298b8:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
800298bc:	eb00001b 	bl	80029930 <deallocuvm>
800298c0:	e3a03000 	mov	r3, #0
800298c4:	ea000015 	b	80029920 <allocuvm+0xec>
800298c8:	e3a02a01 	mov	r2, #4096	@ 0x1000
800298cc:	e3a01000 	mov	r1, #0
800298d0:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
800298d4:	ebffd9c9 	bl	80020000 <memset>
800298d8:	e51b4010 	ldr	r4, [fp, #-16]
800298dc:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
800298e0:	ebfffde8 	bl	80029088 <v2p>
800298e4:	e1a03000 	mov	r3, r0
800298e8:	e3a02003 	mov	r2, #3
800298ec:	e58d2000 	str	r2, [sp]
800298f0:	e3a02a01 	mov	r2, #4096	@ 0x1000
800298f4:	e1a01004 	mov	r1, r4
800298f8:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
800298fc:	ebfffefc 	bl	800294f4 <mappages>
80029900:	e51b3010 	ldr	r3, [fp, #-16]
80029904:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80029908:	e50b3010 	str	r3, [fp, #-16]
8002990c:	e51b2010 	ldr	r2, [fp, #-16]
80029910:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029914:	e1520003 	cmp	r2, r3
80029918:	3affffdd 	bcc	80029894 <allocuvm+0x60>
8002991c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029920:	e1a00003 	mov	r0, r3
80029924:	e24bd008 	sub	sp, fp, #8
80029928:	e8bd8810 	pop	{r4, fp, pc}
8002992c:	8002b3c8 	.word	0x8002b3c8

80029930 <deallocuvm>:
80029930:	e92d4800 	push	{fp, lr}
80029934:	e28db004 	add	fp, sp, #4
80029938:	e24dd020 	sub	sp, sp, #32
8002993c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80029940:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
80029944:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
80029948:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8002994c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80029950:	e1520003 	cmp	r2, r3
80029954:	3a000001 	bcc	80029960 <deallocuvm+0x30>
80029958:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8002995c:	ea000035 	b	80029a38 <deallocuvm+0x108>
80029960:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029964:	e2833eff 	add	r3, r3, #4080	@ 0xff0
80029968:	e283300f 	add	r3, r3, #15
8002996c:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80029970:	e3c3300f 	bic	r3, r3, #15
80029974:	e50b3008 	str	r3, [fp, #-8]
80029978:	ea000029 	b	80029a24 <deallocuvm+0xf4>
8002997c:	e51b3008 	ldr	r3, [fp, #-8]
80029980:	e3a02000 	mov	r2, #0
80029984:	e1a01003 	mov	r1, r3
80029988:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
8002998c:	ebfffea2 	bl	8002941c <walkpgdir>
80029990:	e50b000c 	str	r0, [fp, #-12]
80029994:	e51b300c 	ldr	r3, [fp, #-12]
80029998:	e3530000 	cmp	r3, #0
8002999c:	1a000006 	bne	800299bc <deallocuvm+0x8c>
800299a0:	e51b3008 	ldr	r3, [fp, #-8]
800299a4:	e243337f 	sub	r3, r3, #-67108863	@ 0xfc000001
800299a8:	e243363f 	sub	r3, r3, #66060288	@ 0x3f00000
800299ac:	e1a03a23 	lsr	r3, r3, #20
800299b0:	e1a03a03 	lsl	r3, r3, #20
800299b4:	e50b3008 	str	r3, [fp, #-8]
800299b8:	ea000016 	b	80029a18 <deallocuvm+0xe8>
800299bc:	e51b300c 	ldr	r3, [fp, #-12]
800299c0:	e5933000 	ldr	r3, [r3]
800299c4:	e2033003 	and	r3, r3, #3
800299c8:	e3530000 	cmp	r3, #0
800299cc:	0a000011 	beq	80029a18 <deallocuvm+0xe8>
800299d0:	e51b300c 	ldr	r3, [fp, #-12]
800299d4:	e5933000 	ldr	r3, [r3]
800299d8:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
800299dc:	e3c3300f 	bic	r3, r3, #15
800299e0:	e50b3010 	str	r3, [fp, #-16]
800299e4:	e51b3010 	ldr	r3, [fp, #-16]
800299e8:	e3530000 	cmp	r3, #0
800299ec:	1a000001 	bne	800299f8 <deallocuvm+0xc8>
800299f0:	e59f004c 	ldr	r0, [pc, #76]	@ 80029a44 <deallocuvm+0x114>
800299f4:	ebffe03e 	bl	80021af4 <panic>
800299f8:	e51b0010 	ldr	r0, [fp, #-16]
800299fc:	ebfffdab 	bl	800290b0 <p2v>
80029a00:	e1a03000 	mov	r3, r0
80029a04:	e1a00003 	mov	r0, r3
80029a08:	ebffdefe 	bl	80021608 <free_page>
80029a0c:	e51b300c 	ldr	r3, [fp, #-12]
80029a10:	e3a02000 	mov	r2, #0
80029a14:	e5832000 	str	r2, [r3]
80029a18:	e51b3008 	ldr	r3, [fp, #-8]
80029a1c:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80029a20:	e50b3008 	str	r3, [fp, #-8]
80029a24:	e51b2008 	ldr	r2, [fp, #-8]
80029a28:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80029a2c:	e1520003 	cmp	r2, r3
80029a30:	3affffd1 	bcc	8002997c <deallocuvm+0x4c>
80029a34:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029a38:	e1a00003 	mov	r0, r3
80029a3c:	e24bd004 	sub	sp, fp, #4
80029a40:	e8bd8800 	pop	{fp, pc}
80029a44:	8002b3e0 	.word	0x8002b3e0

80029a48 <freevm>:
80029a48:	e92d4800 	push	{fp, lr}
80029a4c:	e28db004 	add	fp, sp, #4
80029a50:	e24dd010 	sub	sp, sp, #16
80029a54:	e50b0010 	str	r0, [fp, #-16]
80029a58:	e51b3010 	ldr	r3, [fp, #-16]
80029a5c:	e3530000 	cmp	r3, #0
80029a60:	1a000001 	bne	80029a6c <freevm+0x24>
80029a64:	e59f0098 	ldr	r0, [pc, #152]	@ 80029b04 <freevm+0xbc>
80029a68:	ebffe021 	bl	80021af4 <panic>
80029a6c:	e3a02000 	mov	r2, #0
80029a70:	e3a01201 	mov	r1, #268435456	@ 0x10000000
80029a74:	e51b0010 	ldr	r0, [fp, #-16]
80029a78:	ebffffac 	bl	80029930 <deallocuvm>
80029a7c:	e3a03000 	mov	r3, #0
80029a80:	e50b3008 	str	r3, [fp, #-8]
80029a84:	ea000016 	b	80029ae4 <freevm+0x9c>
80029a88:	e51b3008 	ldr	r3, [fp, #-8]
80029a8c:	e1a03103 	lsl	r3, r3, #2
80029a90:	e51b2010 	ldr	r2, [fp, #-16]
80029a94:	e0823003 	add	r3, r2, r3
80029a98:	e5933000 	ldr	r3, [r3]
80029a9c:	e2033003 	and	r3, r3, #3
80029aa0:	e3530000 	cmp	r3, #0
80029aa4:	0a00000b 	beq	80029ad8 <freevm+0x90>
80029aa8:	e51b3008 	ldr	r3, [fp, #-8]
80029aac:	e1a03103 	lsl	r3, r3, #2
80029ab0:	e51b2010 	ldr	r2, [fp, #-16]
80029ab4:	e0823003 	add	r3, r2, r3
80029ab8:	e5933000 	ldr	r3, [r3]
80029abc:	e3c33fff 	bic	r3, r3, #1020	@ 0x3fc
80029ac0:	e3c33003 	bic	r3, r3, #3
80029ac4:	e1a00003 	mov	r0, r3
80029ac8:	ebfffd78 	bl	800290b0 <p2v>
80029acc:	e50b000c 	str	r0, [fp, #-12]
80029ad0:	e51b000c 	ldr	r0, [fp, #-12]
80029ad4:	ebfffe00 	bl	800292dc <kpt_free>
80029ad8:	e51b3008 	ldr	r3, [fp, #-8]
80029adc:	e2833001 	add	r3, r3, #1
80029ae0:	e50b3008 	str	r3, [fp, #-8]
80029ae4:	e51b3008 	ldr	r3, [fp, #-8]
80029ae8:	e35300ff 	cmp	r3, #255	@ 0xff
80029aec:	9affffe5 	bls	80029a88 <freevm+0x40>
80029af0:	e51b0010 	ldr	r0, [fp, #-16]
80029af4:	ebfffdf8 	bl	800292dc <kpt_free>
80029af8:	e1a00000 	nop			@ (mov r0, r0)
80029afc:	e24bd004 	sub	sp, fp, #4
80029b00:	e8bd8800 	pop	{fp, pc}
80029b04:	8002b3ec 	.word	0x8002b3ec

80029b08 <clearpteu>:
80029b08:	e92d4800 	push	{fp, lr}
80029b0c:	e28db004 	add	fp, sp, #4
80029b10:	e24dd010 	sub	sp, sp, #16
80029b14:	e50b0010 	str	r0, [fp, #-16]
80029b18:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80029b1c:	e3a02000 	mov	r2, #0
80029b20:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
80029b24:	e51b0010 	ldr	r0, [fp, #-16]
80029b28:	ebfffe3b 	bl	8002941c <walkpgdir>
80029b2c:	e50b0008 	str	r0, [fp, #-8]
80029b30:	e51b3008 	ldr	r3, [fp, #-8]
80029b34:	e3530000 	cmp	r3, #0
80029b38:	1a000001 	bne	80029b44 <clearpteu+0x3c>
80029b3c:	e59f0024 	ldr	r0, [pc, #36]	@ 80029b68 <clearpteu+0x60>
80029b40:	ebffdfeb 	bl	80021af4 <panic>
80029b44:	e51b3008 	ldr	r3, [fp, #-8]
80029b48:	e5933000 	ldr	r3, [r3]
80029b4c:	e3c33030 	bic	r3, r3, #48	@ 0x30
80029b50:	e3832010 	orr	r2, r3, #16
80029b54:	e51b3008 	ldr	r3, [fp, #-8]
80029b58:	e5832000 	str	r2, [r3]
80029b5c:	e1a00000 	nop			@ (mov r0, r0)
80029b60:	e24bd004 	sub	sp, fp, #4
80029b64:	e8bd8800 	pop	{fp, pc}
80029b68:	8002b400 	.word	0x8002b400

80029b6c <copyuvm>:
80029b6c:	e92d4810 	push	{r4, fp, lr}
80029b70:	e28db008 	add	fp, sp, #8
80029b74:	e24dd02c 	sub	sp, sp, #44	@ 0x2c
80029b78:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
80029b7c:	e50b102c 	str	r1, [fp, #-44]	@ 0xffffffd4
80029b80:	ebfffdff 	bl	80029384 <kpt_alloc>
80029b84:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80029b88:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80029b8c:	e3530000 	cmp	r3, #0
80029b90:	1a000001 	bne	80029b9c <copyuvm+0x30>
80029b94:	e3a03000 	mov	r3, #0
80029b98:	ea000047 	b	80029cbc <copyuvm+0x150>
80029b9c:	e3a03000 	mov	r3, #0
80029ba0:	e50b3010 	str	r3, [fp, #-16]
80029ba4:	ea000038 	b	80029c8c <copyuvm+0x120>
80029ba8:	e51b3010 	ldr	r3, [fp, #-16]
80029bac:	e3a02000 	mov	r2, #0
80029bb0:	e1a01003 	mov	r1, r3
80029bb4:	e51b0028 	ldr	r0, [fp, #-40]	@ 0xffffffd8
80029bb8:	ebfffe17 	bl	8002941c <walkpgdir>
80029bbc:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80029bc0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80029bc4:	e3530000 	cmp	r3, #0
80029bc8:	1a000001 	bne	80029bd4 <copyuvm+0x68>
80029bcc:	e59f00f4 	ldr	r0, [pc, #244]	@ 80029cc8 <copyuvm+0x15c>
80029bd0:	ebffdfc7 	bl	80021af4 <panic>
80029bd4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80029bd8:	e5933000 	ldr	r3, [r3]
80029bdc:	e2033003 	and	r3, r3, #3
80029be0:	e3530000 	cmp	r3, #0
80029be4:	1a000001 	bne	80029bf0 <copyuvm+0x84>
80029be8:	e59f00dc 	ldr	r0, [pc, #220]	@ 80029ccc <copyuvm+0x160>
80029bec:	ebffdfc0 	bl	80021af4 <panic>
80029bf0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80029bf4:	e5933000 	ldr	r3, [r3]
80029bf8:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80029bfc:	e3c3300f 	bic	r3, r3, #15
80029c00:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80029c04:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80029c08:	e5933000 	ldr	r3, [r3]
80029c0c:	e1a03223 	lsr	r3, r3, #4
80029c10:	e2033003 	and	r3, r3, #3
80029c14:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80029c18:	ebffde84 	bl	80021630 <alloc_page>
80029c1c:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
80029c20:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80029c24:	e3530000 	cmp	r3, #0
80029c28:	0a00001d 	beq	80029ca4 <copyuvm+0x138>
80029c2c:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
80029c30:	ebfffd1e 	bl	800290b0 <p2v>
80029c34:	e1a03000 	mov	r3, r0
80029c38:	e3a02a01 	mov	r2, #4096	@ 0x1000
80029c3c:	e1a01003 	mov	r1, r3
80029c40:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
80029c44:	ebffd95f 	bl	800201c8 <memmove>
80029c48:	e51b4010 	ldr	r4, [fp, #-16]
80029c4c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
80029c50:	ebfffd0c 	bl	80029088 <v2p>
80029c54:	e1a02000 	mov	r2, r0
80029c58:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029c5c:	e58d3000 	str	r3, [sp]
80029c60:	e1a03002 	mov	r3, r2
80029c64:	e3a02a01 	mov	r2, #4096	@ 0x1000
80029c68:	e1a01004 	mov	r1, r4
80029c6c:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80029c70:	ebfffe1f 	bl	800294f4 <mappages>
80029c74:	e1a03000 	mov	r3, r0
80029c78:	e3530000 	cmp	r3, #0
80029c7c:	ba00000a 	blt	80029cac <copyuvm+0x140>
80029c80:	e51b3010 	ldr	r3, [fp, #-16]
80029c84:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80029c88:	e50b3010 	str	r3, [fp, #-16]
80029c8c:	e51b2010 	ldr	r2, [fp, #-16]
80029c90:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80029c94:	e1520003 	cmp	r2, r3
80029c98:	3affffc2 	bcc	80029ba8 <copyuvm+0x3c>
80029c9c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80029ca0:	ea000005 	b	80029cbc <copyuvm+0x150>
80029ca4:	e1a00000 	nop			@ (mov r0, r0)
80029ca8:	ea000000 	b	80029cb0 <copyuvm+0x144>
80029cac:	e1a00000 	nop			@ (mov r0, r0)
80029cb0:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80029cb4:	ebffff63 	bl	80029a48 <freevm>
80029cb8:	e3a03000 	mov	r3, #0
80029cbc:	e1a00003 	mov	r0, r3
80029cc0:	e24bd008 	sub	sp, fp, #8
80029cc4:	e8bd8810 	pop	{r4, fp, pc}
80029cc8:	8002b40c 	.word	0x8002b40c
80029ccc:	8002b428 	.word	0x8002b428

80029cd0 <uva2ka>:
80029cd0:	e92d4800 	push	{fp, lr}
80029cd4:	e28db004 	add	fp, sp, #4
80029cd8:	e24dd010 	sub	sp, sp, #16
80029cdc:	e50b0010 	str	r0, [fp, #-16]
80029ce0:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80029ce4:	e3a02000 	mov	r2, #0
80029ce8:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
80029cec:	e51b0010 	ldr	r0, [fp, #-16]
80029cf0:	ebfffdc9 	bl	8002941c <walkpgdir>
80029cf4:	e50b0008 	str	r0, [fp, #-8]
80029cf8:	e51b3008 	ldr	r3, [fp, #-8]
80029cfc:	e5933000 	ldr	r3, [r3]
80029d00:	e2033003 	and	r3, r3, #3
80029d04:	e3530000 	cmp	r3, #0
80029d08:	1a000001 	bne	80029d14 <uva2ka+0x44>
80029d0c:	e3a03000 	mov	r3, #0
80029d10:	ea00000e 	b	80029d50 <uva2ka+0x80>
80029d14:	e51b3008 	ldr	r3, [fp, #-8]
80029d18:	e5933000 	ldr	r3, [r3]
80029d1c:	e2033030 	and	r3, r3, #48	@ 0x30
80029d20:	e3530030 	cmp	r3, #48	@ 0x30
80029d24:	0a000001 	beq	80029d30 <uva2ka+0x60>
80029d28:	e3a03000 	mov	r3, #0
80029d2c:	ea000007 	b	80029d50 <uva2ka+0x80>
80029d30:	e51b3008 	ldr	r3, [fp, #-8]
80029d34:	e5933000 	ldr	r3, [r3]
80029d38:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80029d3c:	e3c3300f 	bic	r3, r3, #15
80029d40:	e1a00003 	mov	r0, r3
80029d44:	ebfffcd9 	bl	800290b0 <p2v>
80029d48:	e1a03000 	mov	r3, r0
80029d4c:	e1a00000 	nop			@ (mov r0, r0)
80029d50:	e1a00003 	mov	r0, r3
80029d54:	e24bd004 	sub	sp, fp, #4
80029d58:	e8bd8800 	pop	{fp, pc}

80029d5c <copyout>:
80029d5c:	e92d4800 	push	{fp, lr}
80029d60:	e28db004 	add	fp, sp, #4
80029d64:	e24dd020 	sub	sp, sp, #32
80029d68:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80029d6c:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
80029d70:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
80029d74:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80029d78:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80029d7c:	e50b3008 	str	r3, [fp, #-8]
80029d80:	ea00002c 	b	80029e38 <copyout+0xdc>
80029d84:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80029d88:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80029d8c:	e3c3300f 	bic	r3, r3, #15
80029d90:	e50b3010 	str	r3, [fp, #-16]
80029d94:	e51b3010 	ldr	r3, [fp, #-16]
80029d98:	e1a01003 	mov	r1, r3
80029d9c:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80029da0:	ebffffca 	bl	80029cd0 <uva2ka>
80029da4:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80029da8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80029dac:	e3530000 	cmp	r3, #0
80029db0:	1a000001 	bne	80029dbc <copyout+0x60>
80029db4:	e3e03000 	mvn	r3, #0
80029db8:	ea000022 	b	80029e48 <copyout+0xec>
80029dbc:	e51b2010 	ldr	r2, [fp, #-16]
80029dc0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80029dc4:	e0423003 	sub	r3, r2, r3
80029dc8:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80029dcc:	e50b300c 	str	r3, [fp, #-12]
80029dd0:	e51b200c 	ldr	r2, [fp, #-12]
80029dd4:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80029dd8:	e1520003 	cmp	r2, r3
80029ddc:	9a000001 	bls	80029de8 <copyout+0x8c>
80029de0:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80029de4:	e50b300c 	str	r3, [fp, #-12]
80029de8:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
80029dec:	e51b3010 	ldr	r3, [fp, #-16]
80029df0:	e0423003 	sub	r3, r2, r3
80029df4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
80029df8:	e0823003 	add	r3, r2, r3
80029dfc:	e51b200c 	ldr	r2, [fp, #-12]
80029e00:	e51b1008 	ldr	r1, [fp, #-8]
80029e04:	e1a00003 	mov	r0, r3
80029e08:	ebffd8ee 	bl	800201c8 <memmove>
80029e0c:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
80029e10:	e51b300c 	ldr	r3, [fp, #-12]
80029e14:	e0423003 	sub	r3, r2, r3
80029e18:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80029e1c:	e51b2008 	ldr	r2, [fp, #-8]
80029e20:	e51b300c 	ldr	r3, [fp, #-12]
80029e24:	e0823003 	add	r3, r2, r3
80029e28:	e50b3008 	str	r3, [fp, #-8]
80029e2c:	e51b3010 	ldr	r3, [fp, #-16]
80029e30:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80029e34:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80029e38:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80029e3c:	e3530000 	cmp	r3, #0
80029e40:	1affffcf 	bne	80029d84 <copyout+0x28>
80029e44:	e3a03000 	mov	r3, #0
80029e48:	e1a00003 	mov	r0, r3
80029e4c:	e24bd004 	sub	sp, fp, #4
80029e50:	e8bd8800 	pop	{fp, pc}

80029e54 <paging_init>:
80029e54:	e92d4800 	push	{fp, lr}
80029e58:	e28db004 	add	fp, sp, #4
80029e5c:	e24dd010 	sub	sp, sp, #16
80029e60:	e50b0008 	str	r0, [fp, #-8]
80029e64:	e50b100c 	str	r1, [fp, #-12]
80029e68:	e59f0034 	ldr	r0, [pc, #52]	@ 80029ea4 <paging_init+0x50>
80029e6c:	e51b3008 	ldr	r3, [fp, #-8]
80029e70:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
80029e74:	e1a01003 	mov	r1, r3
80029e78:	e51b200c 	ldr	r2, [fp, #-12]
80029e7c:	e51b3008 	ldr	r3, [fp, #-8]
80029e80:	e0422003 	sub	r2, r2, r3
80029e84:	e3a03003 	mov	r3, #3
80029e88:	e58d3000 	str	r3, [sp]
80029e8c:	e51b3008 	ldr	r3, [fp, #-8]
80029e90:	ebfffd97 	bl	800294f4 <mappages>
80029e94:	ebfffdd2 	bl	800295e4 <flush_tlb>
80029e98:	e1a00000 	nop			@ (mov r0, r0)
80029e9c:	e24bd004 	sub	sp, fp, #4
80029ea0:	e8bd8800 	pop	{fp, pc}
80029ea4:	80014000 	.word	0x80014000

80029ea8 <switchkvm>:
80029ea8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
80029eac:	e28db000 	add	fp, sp, #0
80029eb0:	e1a00000 	nop			@ (mov r0, r0)
80029eb4:	e28bd000 	add	sp, fp, #0
80029eb8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
80029ebc:	e12fff1e 	bx	lr

80029ec0 <pgpte_kernel>:
80029ec0:	e92d4800 	push	{fp, lr}
80029ec4:	e28db004 	add	fp, sp, #4
80029ec8:	e24dd048 	sub	sp, sp, #72	@ 0x48
80029ecc:	e50b0048 	str	r0, [fp, #-72]	@ 0xffffffb8
80029ed0:	e50b104c 	str	r1, [fp, #-76]	@ 0xffffffb4
80029ed4:	e51b304c 	ldr	r3, [fp, #-76]	@ 0xffffffb4
80029ed8:	e50b300c 	str	r3, [fp, #-12]
80029edc:	e3a03602 	mov	r3, #2097152	@ 0x200000
80029ee0:	e50b3010 	str	r3, [fp, #-16]
80029ee4:	e51b3010 	ldr	r3, [fp, #-16]
80029ee8:	e2633000 	rsb	r3, r3, #0
80029eec:	e51b200c 	ldr	r2, [fp, #-12]
80029ef0:	e0033002 	and	r3, r3, r2
80029ef4:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80029ef8:	e51b3048 	ldr	r3, [fp, #-72]	@ 0xffffffb8
80029efc:	e5932004 	ldr	r2, [r3, #4]
80029f00:	e51b300c 	ldr	r3, [fp, #-12]
80029f04:	e1a03a23 	lsr	r3, r3, #20
80029f08:	e1a03103 	lsl	r3, r3, #2
80029f0c:	e0823003 	add	r3, r2, r3
80029f10:	e5933000 	ldr	r3, [r3]
80029f14:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80029f18:	e51b3048 	ldr	r3, [fp, #-72]	@ 0xffffffb8
80029f1c:	e5933004 	ldr	r3, [r3, #4]
80029f20:	e3a02000 	mov	r2, #0
80029f24:	e51b104c 	ldr	r1, [fp, #-76]	@ 0xffffffb4
80029f28:	e1a00003 	mov	r0, r3
80029f2c:	ebfffd3a 	bl	8002941c <walkpgdir>
80029f30:	e50b001c 	str	r0, [fp, #-28]	@ 0xffffffe4
80029f34:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80029f38:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80029f3c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80029f40:	e3530000 	cmp	r3, #0
80029f44:	0a000002 	beq	80029f54 <pgpte_kernel+0x94>
80029f48:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80029f4c:	e5933000 	ldr	r3, [r3]
80029f50:	ea000000 	b	80029f58 <pgpte_kernel+0x98>
80029f54:	e3a03000 	mov	r3, #0
80029f58:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80029f5c:	e3a03000 	mov	r3, #0
80029f60:	e50b3008 	str	r3, [fp, #-8]
80029f64:	e51b3048 	ldr	r3, [fp, #-72]	@ 0xffffffb8
80029f68:	e5933004 	ldr	r3, [r3, #4]
80029f6c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
80029f70:	e3a02000 	mov	r2, #0
80029f74:	e1a00003 	mov	r0, r3
80029f78:	ebfffd27 	bl	8002941c <walkpgdir>
80029f7c:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
80029f80:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80029f84:	e3530000 	cmp	r3, #0
80029f88:	0a000002 	beq	80029f98 <pgpte_kernel+0xd8>
80029f8c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80029f90:	e5933000 	ldr	r3, [r3]
80029f94:	ea000000 	b	80029f9c <pgpte_kernel+0xdc>
80029f98:	e3a03000 	mov	r3, #0
80029f9c:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
80029fa0:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80029fa4:	e3530000 	cmp	r3, #0
80029fa8:	0a000011 	beq	80029ff4 <pgpte_kernel+0x134>
80029fac:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80029fb0:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80029fb4:	e3c3300f 	bic	r3, r3, #15
80029fb8:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
80029fbc:	e51b3010 	ldr	r3, [fp, #-16]
80029fc0:	e2633000 	rsb	r3, r3, #0
80029fc4:	e51b203c 	ldr	r2, [fp, #-60]	@ 0xffffffc4
80029fc8:	e0033002 	and	r3, r3, r2
80029fcc:	e50b3040 	str	r3, [fp, #-64]	@ 0xffffffc0
80029fd0:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80029fd4:	e1a03a03 	lsl	r3, r3, #20
80029fd8:	e1a03a23 	lsr	r3, r3, #20
80029fdc:	e50b3044 	str	r3, [fp, #-68]	@ 0xffffffbc
80029fe0:	e51b2040 	ldr	r2, [fp, #-64]	@ 0xffffffc0
80029fe4:	e51b3044 	ldr	r3, [fp, #-68]	@ 0xffffffbc
80029fe8:	e1823003 	orr	r3, r2, r3
80029fec:	e50b3008 	str	r3, [fp, #-8]
80029ff0:	ea00001d 	b	8002a06c <pgpte_kernel+0x1ac>
80029ff4:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80029ff8:	e3530000 	cmp	r3, #0
80029ffc:	0a000011 	beq	8002a048 <pgpte_kernel+0x188>
8002a000:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8002a004:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
8002a008:	e3c3300f 	bic	r3, r3, #15
8002a00c:	e50b3030 	str	r3, [fp, #-48]	@ 0xffffffd0
8002a010:	e51b3010 	ldr	r3, [fp, #-16]
8002a014:	e2633000 	rsb	r3, r3, #0
8002a018:	e51b2030 	ldr	r2, [fp, #-48]	@ 0xffffffd0
8002a01c:	e0033002 	and	r3, r3, r2
8002a020:	e50b3034 	str	r3, [fp, #-52]	@ 0xffffffcc
8002a024:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8002a028:	e1a03a03 	lsl	r3, r3, #20
8002a02c:	e1a03a23 	lsr	r3, r3, #20
8002a030:	e50b3038 	str	r3, [fp, #-56]	@ 0xffffffc8
8002a034:	e51b2034 	ldr	r2, [fp, #-52]	@ 0xffffffcc
8002a038:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8002a03c:	e1823003 	orr	r3, r2, r3
8002a040:	e50b3008 	str	r3, [fp, #-8]
8002a044:	ea000008 	b	8002a06c <pgpte_kernel+0x1ac>
8002a048:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8002a04c:	e2033003 	and	r3, r3, #3
8002a050:	e3530000 	cmp	r3, #0
8002a054:	0a000002 	beq	8002a064 <pgpte_kernel+0x1a4>
8002a058:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8002a05c:	e50b3008 	str	r3, [fp, #-8]
8002a060:	ea000001 	b	8002a06c <pgpte_kernel+0x1ac>
8002a064:	e3a03000 	mov	r3, #0
8002a068:	e50b3008 	str	r3, [fp, #-8]
8002a06c:	e51b3008 	ldr	r3, [fp, #-8]
8002a070:	e1a00003 	mov	r0, r3
8002a074:	e24bd004 	sub	sp, fp, #4
8002a078:	e8bd8800 	pop	{fp, pc}

8002a07c <kpt>:
8002a07c:	e92d4800 	push	{fp, lr}
8002a080:	e28db004 	add	fp, sp, #4
8002a084:	e24dd030 	sub	sp, sp, #48	@ 0x30
8002a088:	e59f015c 	ldr	r0, [pc, #348]	@ 8002a1ec <kpt+0x170>
8002a08c:	ebffde00 	bl	80021894 <cprintf>
8002a090:	e3a03000 	mov	r3, #0
8002a094:	e50b3008 	str	r3, [fp, #-8]
8002a098:	ea000021 	b	8002a124 <kpt+0xa8>
8002a09c:	e51b3008 	ldr	r3, [fp, #-8]
8002a0a0:	e2833702 	add	r3, r3, #524288	@ 0x80000
8002a0a4:	e1a03603 	lsl	r3, r3, #12
8002a0a8:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
8002a0ac:	e59f313c 	ldr	r3, [pc, #316]	@ 8002a1f0 <kpt+0x174>
8002a0b0:	e5933000 	ldr	r3, [r3]
8002a0b4:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
8002a0b8:	e3a02000 	mov	r2, #0
8002a0bc:	e1a00003 	mov	r0, r3
8002a0c0:	ebfffcd5 	bl	8002941c <walkpgdir>
8002a0c4:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
8002a0c8:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8002a0cc:	e3530000 	cmp	r3, #0
8002a0d0:	0a000002 	beq	8002a0e0 <kpt+0x64>
8002a0d4:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8002a0d8:	e5933000 	ldr	r3, [r3]
8002a0dc:	ea000000 	b	8002a0e4 <kpt+0x68>
8002a0e0:	e3a03000 	mov	r3, #0
8002a0e4:	e50b3028 	str	r3, [fp, #-40]	@ 0xffffffd8
8002a0e8:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8002a0ec:	e3c32eff 	bic	r2, r3, #4080	@ 0xff0
8002a0f0:	e3c2200f 	bic	r2, r2, #15
8002a0f4:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8002a0f8:	e1a03a03 	lsl	r3, r3, #20
8002a0fc:	e1a03a23 	lsr	r3, r3, #20
8002a100:	e58d3000 	str	r3, [sp]
8002a104:	e1a03002 	mov	r3, r2
8002a108:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
8002a10c:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
8002a110:	e59f00dc 	ldr	r0, [pc, #220]	@ 8002a1f4 <kpt+0x178>
8002a114:	ebffddde 	bl	80021894 <cprintf>
8002a118:	e51b3008 	ldr	r3, [fp, #-8]
8002a11c:	e2833001 	add	r3, r3, #1
8002a120:	e50b3008 	str	r3, [fp, #-8]
8002a124:	e51b3008 	ldr	r3, [fp, #-8]
8002a128:	e3530009 	cmp	r3, #9
8002a12c:	9affffda 	bls	8002a09c <kpt+0x20>
8002a130:	e3a03801 	mov	r3, #65536	@ 0x10000
8002a134:	e50b3010 	str	r3, [fp, #-16]
8002a138:	e51b3010 	ldr	r3, [fp, #-16]
8002a13c:	e243300a 	sub	r3, r3, #10
8002a140:	e50b300c 	str	r3, [fp, #-12]
8002a144:	ea000020 	b	8002a1cc <kpt+0x150>
8002a148:	e51b300c 	ldr	r3, [fp, #-12]
8002a14c:	e1a03603 	lsl	r3, r3, #12
8002a150:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8002a154:	e59f3094 	ldr	r3, [pc, #148]	@ 8002a1f0 <kpt+0x174>
8002a158:	e5933000 	ldr	r3, [r3]
8002a15c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
8002a160:	e3a02000 	mov	r2, #0
8002a164:	e1a00003 	mov	r0, r3
8002a168:	ebfffcab 	bl	8002941c <walkpgdir>
8002a16c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8002a170:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002a174:	e3530000 	cmp	r3, #0
8002a178:	0a000002 	beq	8002a188 <kpt+0x10c>
8002a17c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8002a180:	e5933000 	ldr	r3, [r3]
8002a184:	ea000000 	b	8002a18c <kpt+0x110>
8002a188:	e3a03000 	mov	r3, #0
8002a18c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8002a190:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8002a194:	e3c32eff 	bic	r2, r3, #4080	@ 0xff0
8002a198:	e3c2200f 	bic	r2, r2, #15
8002a19c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8002a1a0:	e1a03a03 	lsl	r3, r3, #20
8002a1a4:	e1a03a23 	lsr	r3, r3, #20
8002a1a8:	e58d3000 	str	r3, [sp]
8002a1ac:	e1a03002 	mov	r3, r2
8002a1b0:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
8002a1b4:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
8002a1b8:	e59f0034 	ldr	r0, [pc, #52]	@ 8002a1f4 <kpt+0x178>
8002a1bc:	ebffddb4 	bl	80021894 <cprintf>
8002a1c0:	e51b300c 	ldr	r3, [fp, #-12]
8002a1c4:	e2833001 	add	r3, r3, #1
8002a1c8:	e50b300c 	str	r3, [fp, #-12]
8002a1cc:	e51b200c 	ldr	r2, [fp, #-12]
8002a1d0:	e51b3010 	ldr	r3, [fp, #-16]
8002a1d4:	e1520003 	cmp	r2, r3
8002a1d8:	3affffda 	bcc	8002a148 <kpt+0xcc>
8002a1dc:	e1a00000 	nop			@ (mov r0, r0)
8002a1e0:	e1a00000 	nop			@ (mov r0, r0)
8002a1e4:	e24bd004 	sub	sp, fp, #4
8002a1e8:	e8bd8800 	pop	{fp, pc}
8002a1ec:	8002b444 	.word	0x8002b444
8002a1f0:	800d97ac 	.word	0x800d97ac
8002a1f4:	8002b474 	.word	0x8002b474

8002a1f8 <barrier_init>:
8002a1f8:	e92d4800 	push	{fp, lr}
8002a1fc:	e28db004 	add	fp, sp, #4
8002a200:	e24dd008 	sub	sp, sp, #8
8002a204:	e50b0008 	str	r0, [fp, #-8]
8002a208:	e59f103c 	ldr	r1, [pc, #60]	@ 8002a24c <barrier_init+0x54>
8002a20c:	e59f003c 	ldr	r0, [pc, #60]	@ 8002a250 <barrier_init+0x58>
8002a210:	ebfff1ed 	bl	800269cc <initlock>
8002a214:	e59f0034 	ldr	r0, [pc, #52]	@ 8002a250 <barrier_init+0x58>
8002a218:	ebfff1fd 	bl	80026a14 <acquire>
8002a21c:	e59f2030 	ldr	r2, [pc, #48]	@ 8002a254 <barrier_init+0x5c>
8002a220:	e51b3008 	ldr	r3, [fp, #-8]
8002a224:	e5823000 	str	r3, [r2]
8002a228:	e59f3024 	ldr	r3, [pc, #36]	@ 8002a254 <barrier_init+0x5c>
8002a22c:	e3a02000 	mov	r2, #0
8002a230:	e5832004 	str	r2, [r3, #4]
8002a234:	e59f0014 	ldr	r0, [pc, #20]	@ 8002a250 <barrier_init+0x58>
8002a238:	ebfff200 	bl	80026a40 <release>
8002a23c:	e3a03000 	mov	r3, #0
8002a240:	e1a00003 	mov	r0, r3
8002a244:	e24bd004 	sub	sp, fp, #4
8002a248:	e8bd8800 	pop	{fp, pc}
8002a24c:	8002b498 	.word	0x8002b498
8002a250:	800d97f0 	.word	0x800d97f0
8002a254:	800d97e8 	.word	0x800d97e8

8002a258 <barrier_check>:
8002a258:	e92d4800 	push	{fp, lr}
8002a25c:	e28db004 	add	fp, sp, #4
8002a260:	e59f0058 	ldr	r0, [pc, #88]	@ 8002a2c0 <barrier_check+0x68>
8002a264:	ebfff1ea 	bl	80026a14 <acquire>
8002a268:	e59f3054 	ldr	r3, [pc, #84]	@ 8002a2c4 <barrier_check+0x6c>
8002a26c:	e5933004 	ldr	r3, [r3, #4]
8002a270:	e2833001 	add	r3, r3, #1
8002a274:	e59f2048 	ldr	r2, [pc, #72]	@ 8002a2c4 <barrier_check+0x6c>
8002a278:	e5823004 	str	r3, [r2, #4]
8002a27c:	e59f3040 	ldr	r3, [pc, #64]	@ 8002a2c4 <barrier_check+0x6c>
8002a280:	e5932004 	ldr	r2, [r3, #4]
8002a284:	e59f3038 	ldr	r3, [pc, #56]	@ 8002a2c4 <barrier_check+0x6c>
8002a288:	e5933000 	ldr	r3, [r3]
8002a28c:	e1520003 	cmp	r2, r3
8002a290:	aa000003 	bge	8002a2a4 <barrier_check+0x4c>
8002a294:	e59f1024 	ldr	r1, [pc, #36]	@ 8002a2c0 <barrier_check+0x68>
8002a298:	e59f0024 	ldr	r0, [pc, #36]	@ 8002a2c4 <barrier_check+0x6c>
8002a29c:	ebffeec9 	bl	80025dc8 <sleep>
8002a2a0:	ea000001 	b	8002a2ac <barrier_check+0x54>
8002a2a4:	e59f0018 	ldr	r0, [pc, #24]	@ 8002a2c4 <barrier_check+0x6c>
8002a2a8:	ebffef3a 	bl	80025f98 <wakeup>
8002a2ac:	e59f000c 	ldr	r0, [pc, #12]	@ 8002a2c0 <barrier_check+0x68>
8002a2b0:	ebfff1e2 	bl	80026a40 <release>
8002a2b4:	e3a03000 	mov	r3, #0
8002a2b8:	e1a00003 	mov	r0, r3
8002a2bc:	e8bd8800 	pop	{fp, pc}
8002a2c0:	800d97f0 	.word	0x800d97f0
8002a2c4:	800d97e8 	.word	0x800d97e8

8002a2c8 <default_isr>:
8002a2c8:	e92d4800 	push	{fp, lr}
8002a2cc:	e28db004 	add	fp, sp, #4
8002a2d0:	e24dd008 	sub	sp, sp, #8
8002a2d4:	e50b0008 	str	r0, [fp, #-8]
8002a2d8:	e50b100c 	str	r1, [fp, #-12]
8002a2dc:	e51b100c 	ldr	r1, [fp, #-12]
8002a2e0:	e59f000c 	ldr	r0, [pc, #12]	@ 8002a2f4 <default_isr+0x2c>
8002a2e4:	ebffdd6a 	bl	80021894 <cprintf>
8002a2e8:	e1a00000 	nop			@ (mov r0, r0)
8002a2ec:	e24bd004 	sub	sp, fp, #4
8002a2f0:	e8bd8800 	pop	{fp, pc}
8002a2f4:	8002b4a0 	.word	0x8002b4a0

8002a2f8 <pic_init>:
8002a2f8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
8002a2fc:	e28db000 	add	fp, sp, #0
8002a300:	e24dd014 	sub	sp, sp, #20
8002a304:	e50b0010 	str	r0, [fp, #-16]
8002a308:	e59f2060 	ldr	r2, [pc, #96]	@ 8002a370 <pic_init+0x78>
8002a30c:	e51b3010 	ldr	r3, [fp, #-16]
8002a310:	e5823000 	str	r3, [r2]
8002a314:	e59f3054 	ldr	r3, [pc, #84]	@ 8002a370 <pic_init+0x78>
8002a318:	e5933000 	ldr	r3, [r3]
8002a31c:	e2833014 	add	r3, r3, #20
8002a320:	e3e02000 	mvn	r2, #0
8002a324:	e5832000 	str	r2, [r3]
8002a328:	e3a03000 	mov	r3, #0
8002a32c:	e50b3008 	str	r3, [fp, #-8]
8002a330:	ea000006 	b	8002a350 <pic_init+0x58>
8002a334:	e59f2038 	ldr	r2, [pc, #56]	@ 8002a374 <pic_init+0x7c>
8002a338:	e51b3008 	ldr	r3, [fp, #-8]
8002a33c:	e59f1034 	ldr	r1, [pc, #52]	@ 8002a378 <pic_init+0x80>
8002a340:	e7821103 	str	r1, [r2, r3, lsl #2]
8002a344:	e51b3008 	ldr	r3, [fp, #-8]
8002a348:	e2833001 	add	r3, r3, #1
8002a34c:	e50b3008 	str	r3, [fp, #-8]
8002a350:	e51b3008 	ldr	r3, [fp, #-8]
8002a354:	e353001f 	cmp	r3, #31
8002a358:	dafffff5 	ble	8002a334 <pic_init+0x3c>
8002a35c:	e1a00000 	nop			@ (mov r0, r0)
8002a360:	e1a00000 	nop			@ (mov r0, r0)
8002a364:	e28bd000 	add	sp, fp, #0
8002a368:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
8002a36c:	e12fff1e 	bx	lr
8002a370:	800d9824 	.word	0x800d9824
8002a374:	800d9828 	.word	0x800d9828
8002a378:	8002a2c8 	.word	0x8002a2c8

8002a37c <pic_enable>:
8002a37c:	e92d4800 	push	{fp, lr}
8002a380:	e28db004 	add	fp, sp, #4
8002a384:	e24dd008 	sub	sp, sp, #8
8002a388:	e50b0008 	str	r0, [fp, #-8]
8002a38c:	e50b100c 	str	r1, [fp, #-12]
8002a390:	e51b3008 	ldr	r3, [fp, #-8]
8002a394:	e3530000 	cmp	r3, #0
8002a398:	ba000002 	blt	8002a3a8 <pic_enable+0x2c>
8002a39c:	e51b3008 	ldr	r3, [fp, #-8]
8002a3a0:	e353001f 	cmp	r3, #31
8002a3a4:	da000001 	ble	8002a3b0 <pic_enable+0x34>
8002a3a8:	e59f0038 	ldr	r0, [pc, #56]	@ 8002a3e8 <pic_enable+0x6c>
8002a3ac:	ebffddd0 	bl	80021af4 <panic>
8002a3b0:	e59f1034 	ldr	r1, [pc, #52]	@ 8002a3ec <pic_enable+0x70>
8002a3b4:	e51b3008 	ldr	r3, [fp, #-8]
8002a3b8:	e51b200c 	ldr	r2, [fp, #-12]
8002a3bc:	e7812103 	str	r2, [r1, r3, lsl #2]
8002a3c0:	e3a02001 	mov	r2, #1
8002a3c4:	e51b3008 	ldr	r3, [fp, #-8]
8002a3c8:	e1a02312 	lsl	r2, r2, r3
8002a3cc:	e59f301c 	ldr	r3, [pc, #28]	@ 8002a3f0 <pic_enable+0x74>
8002a3d0:	e5933000 	ldr	r3, [r3]
8002a3d4:	e2833010 	add	r3, r3, #16
8002a3d8:	e5832000 	str	r2, [r3]
8002a3dc:	e1a00000 	nop			@ (mov r0, r0)
8002a3e0:	e24bd004 	sub	sp, fp, #4
8002a3e4:	e8bd8800 	pop	{fp, pc}
8002a3e8:	8002b4bc 	.word	0x8002b4bc
8002a3ec:	800d9828 	.word	0x800d9828
8002a3f0:	800d9824 	.word	0x800d9824

8002a3f4 <pic_disable>:
8002a3f4:	e92d4800 	push	{fp, lr}
8002a3f8:	e28db004 	add	fp, sp, #4
8002a3fc:	e24dd008 	sub	sp, sp, #8
8002a400:	e50b0008 	str	r0, [fp, #-8]
8002a404:	e51b3008 	ldr	r3, [fp, #-8]
8002a408:	e3530000 	cmp	r3, #0
8002a40c:	ba000002 	blt	8002a41c <pic_disable+0x28>
8002a410:	e51b3008 	ldr	r3, [fp, #-8]
8002a414:	e353001f 	cmp	r3, #31
8002a418:	da000001 	ble	8002a424 <pic_disable+0x30>
8002a41c:	e59f0038 	ldr	r0, [pc, #56]	@ 8002a45c <pic_disable+0x68>
8002a420:	ebffddb3 	bl	80021af4 <panic>
8002a424:	e3a02001 	mov	r2, #1
8002a428:	e51b3008 	ldr	r3, [fp, #-8]
8002a42c:	e1a02312 	lsl	r2, r2, r3
8002a430:	e59f3028 	ldr	r3, [pc, #40]	@ 8002a460 <pic_disable+0x6c>
8002a434:	e5933000 	ldr	r3, [r3]
8002a438:	e2833014 	add	r3, r3, #20
8002a43c:	e5832000 	str	r2, [r3]
8002a440:	e59f201c 	ldr	r2, [pc, #28]	@ 8002a464 <pic_disable+0x70>
8002a444:	e51b3008 	ldr	r3, [fp, #-8]
8002a448:	e59f1018 	ldr	r1, [pc, #24]	@ 8002a468 <pic_disable+0x74>
8002a44c:	e7821103 	str	r1, [r2, r3, lsl #2]
8002a450:	e1a00000 	nop			@ (mov r0, r0)
8002a454:	e24bd004 	sub	sp, fp, #4
8002a458:	e8bd8800 	pop	{fp, pc}
8002a45c:	8002b4bc 	.word	0x8002b4bc
8002a460:	800d9824 	.word	0x800d9824
8002a464:	800d9828 	.word	0x800d9828
8002a468:	8002a2c8 	.word	0x8002a2c8

8002a46c <pic_dispatch>:
8002a46c:	e92d4800 	push	{fp, lr}
8002a470:	e28db004 	add	fp, sp, #4
8002a474:	e24dd010 	sub	sp, sp, #16
8002a478:	e50b0010 	str	r0, [fp, #-16]
8002a47c:	e59f3080 	ldr	r3, [pc, #128]	@ 8002a504 <pic_dispatch+0x98>
8002a480:	e5933000 	ldr	r3, [r3]
8002a484:	e5933000 	ldr	r3, [r3]
8002a488:	e50b300c 	str	r3, [fp, #-12]
8002a48c:	e3a03000 	mov	r3, #0
8002a490:	e50b3008 	str	r3, [fp, #-8]
8002a494:	ea000010 	b	8002a4dc <pic_dispatch+0x70>
8002a498:	e3a02001 	mov	r2, #1
8002a49c:	e51b3008 	ldr	r3, [fp, #-8]
8002a4a0:	e1a03312 	lsl	r3, r2, r3
8002a4a4:	e1a02003 	mov	r2, r3
8002a4a8:	e51b300c 	ldr	r3, [fp, #-12]
8002a4ac:	e0033002 	and	r3, r3, r2
8002a4b0:	e3530000 	cmp	r3, #0
8002a4b4:	0a000005 	beq	8002a4d0 <pic_dispatch+0x64>
8002a4b8:	e59f2048 	ldr	r2, [pc, #72]	@ 8002a508 <pic_dispatch+0x9c>
8002a4bc:	e51b3008 	ldr	r3, [fp, #-8]
8002a4c0:	e7923103 	ldr	r3, [r2, r3, lsl #2]
8002a4c4:	e51b1008 	ldr	r1, [fp, #-8]
8002a4c8:	e51b0010 	ldr	r0, [fp, #-16]
8002a4cc:	e12fff33 	blx	r3
8002a4d0:	e51b3008 	ldr	r3, [fp, #-8]
8002a4d4:	e2833001 	add	r3, r3, #1
8002a4d8:	e50b3008 	str	r3, [fp, #-8]
8002a4dc:	e51b3008 	ldr	r3, [fp, #-8]
8002a4e0:	e353001f 	cmp	r3, #31
8002a4e4:	daffffeb 	ble	8002a498 <pic_dispatch+0x2c>
8002a4e8:	e59f3014 	ldr	r3, [pc, #20]	@ 8002a504 <pic_dispatch+0x98>
8002a4ec:	e5933000 	ldr	r3, [r3]
8002a4f0:	e5933000 	ldr	r3, [r3]
8002a4f4:	e50b300c 	str	r3, [fp, #-12]
8002a4f8:	e1a00000 	nop			@ (mov r0, r0)
8002a4fc:	e24bd004 	sub	sp, fp, #4
8002a500:	e8bd8800 	pop	{fp, pc}
8002a504:	800d9824 	.word	0x800d9824
8002a508:	800d9828 	.word	0x800d9828

8002a50c <ack_timer>:
8002a50c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
8002a510:	e28db000 	add	fp, sp, #0
8002a514:	e24dd00c 	sub	sp, sp, #12
8002a518:	e59f3020 	ldr	r3, [pc, #32]	@ 8002a540 <ack_timer+0x34>
8002a51c:	e50b3008 	str	r3, [fp, #-8]
8002a520:	e51b3008 	ldr	r3, [fp, #-8]
8002a524:	e283300c 	add	r3, r3, #12
8002a528:	e3a02001 	mov	r2, #1
8002a52c:	e5832000 	str	r2, [r3]
8002a530:	e1a00000 	nop			@ (mov r0, r0)
8002a534:	e28bd000 	add	sp, fp, #0
8002a538:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
8002a53c:	e12fff1e 	bx	lr
8002a540:	901e2000 	.word	0x901e2000

8002a544 <timer_init>:
8002a544:	e92d4800 	push	{fp, lr}
8002a548:	e28db004 	add	fp, sp, #4
8002a54c:	e24dd010 	sub	sp, sp, #16
8002a550:	e50b0010 	str	r0, [fp, #-16]
8002a554:	e59f3050 	ldr	r3, [pc, #80]	@ 8002a5ac <timer_init+0x68>
8002a558:	e50b3008 	str	r3, [fp, #-8]
8002a55c:	e59f104c 	ldr	r1, [pc, #76]	@ 8002a5b0 <timer_init+0x6c>
8002a560:	e59f004c 	ldr	r0, [pc, #76]	@ 8002a5b4 <timer_init+0x70>
8002a564:	ebfff118 	bl	800269cc <initlock>
8002a568:	e51b1010 	ldr	r1, [fp, #-16]
8002a56c:	e59f0044 	ldr	r0, [pc, #68]	@ 8002a5b8 <timer_init+0x74>
8002a570:	eb000109 	bl	8002a99c <__divsi3>
8002a574:	e1a03000 	mov	r3, r0
8002a578:	e1a02003 	mov	r2, r3
8002a57c:	e51b3008 	ldr	r3, [fp, #-8]
8002a580:	e5832000 	str	r2, [r3]
8002a584:	e51b3008 	ldr	r3, [fp, #-8]
8002a588:	e2833008 	add	r3, r3, #8
8002a58c:	e3a020e2 	mov	r2, #226	@ 0xe2
8002a590:	e5832000 	str	r2, [r3]
8002a594:	e59f1020 	ldr	r1, [pc, #32]	@ 8002a5bc <timer_init+0x78>
8002a598:	e3a00004 	mov	r0, #4
8002a59c:	ebffff76 	bl	8002a37c <pic_enable>
8002a5a0:	e1a00000 	nop			@ (mov r0, r0)
8002a5a4:	e24bd004 	sub	sp, fp, #4
8002a5a8:	e8bd8800 	pop	{fp, pc}
8002a5ac:	901e2000 	.word	0x901e2000
8002a5b0:	8002b4d8 	.word	0x8002b4d8
8002a5b4:	800d98a8 	.word	0x800d98a8
8002a5b8:	000f4240 	.word	0x000f4240
8002a5bc:	8002a5c0 	.word	0x8002a5c0

8002a5c0 <isr_timer>:
8002a5c0:	e92d4800 	push	{fp, lr}
8002a5c4:	e28db004 	add	fp, sp, #4
8002a5c8:	e24dd008 	sub	sp, sp, #8
8002a5cc:	e50b0008 	str	r0, [fp, #-8]
8002a5d0:	e50b100c 	str	r1, [fp, #-12]
8002a5d4:	e59f0034 	ldr	r0, [pc, #52]	@ 8002a610 <isr_timer+0x50>
8002a5d8:	ebfff10d 	bl	80026a14 <acquire>
8002a5dc:	e59f3030 	ldr	r3, [pc, #48]	@ 8002a614 <isr_timer+0x54>
8002a5e0:	e5933000 	ldr	r3, [r3]
8002a5e4:	e2833001 	add	r3, r3, #1
8002a5e8:	e59f2024 	ldr	r2, [pc, #36]	@ 8002a614 <isr_timer+0x54>
8002a5ec:	e5823000 	str	r3, [r2]
8002a5f0:	e59f001c 	ldr	r0, [pc, #28]	@ 8002a614 <isr_timer+0x54>
8002a5f4:	ebffee67 	bl	80025f98 <wakeup>
8002a5f8:	e59f0010 	ldr	r0, [pc, #16]	@ 8002a610 <isr_timer+0x50>
8002a5fc:	ebfff10f 	bl	80026a40 <release>
8002a600:	ebffffc1 	bl	8002a50c <ack_timer>
8002a604:	e1a00000 	nop			@ (mov r0, r0)
8002a608:	e24bd004 	sub	sp, fp, #4
8002a60c:	e8bd8800 	pop	{fp, pc}
8002a610:	800d98a8 	.word	0x800d98a8
8002a614:	800d98dc 	.word	0x800d98dc

8002a618 <micro_delay>:
8002a618:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
8002a61c:	e28db000 	add	fp, sp, #0
8002a620:	e24dd014 	sub	sp, sp, #20
8002a624:	e50b0010 	str	r0, [fp, #-16]
8002a628:	e59f3054 	ldr	r3, [pc, #84]	@ 8002a684 <micro_delay+0x6c>
8002a62c:	e50b3008 	str	r3, [fp, #-8]
8002a630:	e51b3008 	ldr	r3, [fp, #-8]
8002a634:	e2833008 	add	r3, r3, #8
8002a638:	e3a02082 	mov	r2, #130	@ 0x82
8002a63c:	e5832000 	str	r2, [r3]
8002a640:	e51b2010 	ldr	r2, [fp, #-16]
8002a644:	e51b3008 	ldr	r3, [fp, #-8]
8002a648:	e5832000 	str	r2, [r3]
8002a64c:	e1a00000 	nop			@ (mov r0, r0)
8002a650:	e51b3008 	ldr	r3, [fp, #-8]
8002a654:	e2833004 	add	r3, r3, #4
8002a658:	e5933000 	ldr	r3, [r3]
8002a65c:	e3530000 	cmp	r3, #0
8002a660:	cafffffa 	bgt	8002a650 <micro_delay+0x38>
8002a664:	e51b3008 	ldr	r3, [fp, #-8]
8002a668:	e2833008 	add	r3, r3, #8
8002a66c:	e3a02000 	mov	r2, #0
8002a670:	e5832000 	str	r2, [r3]
8002a674:	e1a00000 	nop			@ (mov r0, r0)
8002a678:	e28bd000 	add	sp, fp, #0
8002a67c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
8002a680:	e12fff1e 	bx	lr
8002a684:	901e2020 	.word	0x901e2020

8002a688 <uart_init>:
8002a688:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
8002a68c:	e28db000 	add	fp, sp, #0
8002a690:	e24dd014 	sub	sp, sp, #20
8002a694:	e50b0010 	str	r0, [fp, #-16]
8002a698:	e59f20a4 	ldr	r2, [pc, #164]	@ 8002a744 <uart_init+0xbc>
8002a69c:	e51b3010 	ldr	r3, [fp, #-16]
8002a6a0:	e5823000 	str	r3, [r2]
8002a6a4:	e59f3098 	ldr	r3, [pc, #152]	@ 8002a744 <uart_init+0xbc>
8002a6a8:	e5933000 	ldr	r3, [r3]
8002a6ac:	e2833024 	add	r3, r3, #36	@ 0x24
8002a6b0:	e3a0204e 	mov	r2, #78	@ 0x4e
8002a6b4:	e5832000 	str	r2, [r3]
8002a6b8:	e3a03c96 	mov	r3, #38400	@ 0x9600
8002a6bc:	e50b3008 	str	r3, [fp, #-8]
8002a6c0:	e51b3008 	ldr	r3, [fp, #-8]
8002a6c4:	e2833e96 	add	r3, r3, #2400	@ 0x960
8002a6c8:	e1a02103 	lsl	r2, r3, #2
8002a6cc:	e59f3070 	ldr	r3, [pc, #112]	@ 8002a744 <uart_init+0xbc>
8002a6d0:	e5933000 	ldr	r3, [r3]
8002a6d4:	e2833028 	add	r3, r3, #40	@ 0x28
8002a6d8:	e59f1068 	ldr	r1, [pc, #104]	@ 8002a748 <uart_init+0xc0>
8002a6dc:	e0821291 	umull	r1, r2, r1, r2
8002a6e0:	e1a025a2 	lsr	r2, r2, #11
8002a6e4:	e5832000 	str	r2, [r3]
8002a6e8:	e59f3054 	ldr	r3, [pc, #84]	@ 8002a744 <uart_init+0xbc>
8002a6ec:	e5933000 	ldr	r3, [r3]
8002a6f0:	e2833030 	add	r3, r3, #48	@ 0x30
8002a6f4:	e5933000 	ldr	r3, [r3]
8002a6f8:	e59f2044 	ldr	r2, [pc, #68]	@ 8002a744 <uart_init+0xbc>
8002a6fc:	e5922000 	ldr	r2, [r2]
8002a700:	e2822030 	add	r2, r2, #48	@ 0x30
8002a704:	e3833c03 	orr	r3, r3, #768	@ 0x300
8002a708:	e3833001 	orr	r3, r3, #1
8002a70c:	e5823000 	str	r3, [r2]
8002a710:	e59f302c 	ldr	r3, [pc, #44]	@ 8002a744 <uart_init+0xbc>
8002a714:	e5933000 	ldr	r3, [r3]
8002a718:	e283302c 	add	r3, r3, #44	@ 0x2c
8002a71c:	e5932000 	ldr	r2, [r3]
8002a720:	e59f301c 	ldr	r3, [pc, #28]	@ 8002a744 <uart_init+0xbc>
8002a724:	e5933000 	ldr	r3, [r3]
8002a728:	e283302c 	add	r3, r3, #44	@ 0x2c
8002a72c:	e3822010 	orr	r2, r2, #16
8002a730:	e5832000 	str	r2, [r3]
8002a734:	e1a00000 	nop			@ (mov r0, r0)
8002a738:	e28bd000 	add	sp, fp, #0
8002a73c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
8002a740:	e12fff1e 	bx	lr
8002a744:	800d98e0 	.word	0x800d98e0
8002a748:	1b4e81b5 	.word	0x1b4e81b5

8002a74c <uart_enable_rx>:
8002a74c:	e92d4800 	push	{fp, lr}
8002a750:	e28db004 	add	fp, sp, #4
8002a754:	e59f3020 	ldr	r3, [pc, #32]	@ 8002a77c <uart_enable_rx+0x30>
8002a758:	e5933000 	ldr	r3, [r3]
8002a75c:	e2833038 	add	r3, r3, #56	@ 0x38
8002a760:	e3a02010 	mov	r2, #16
8002a764:	e5832000 	str	r2, [r3]
8002a768:	e59f1010 	ldr	r1, [pc, #16]	@ 8002a780 <uart_enable_rx+0x34>
8002a76c:	e3a0000c 	mov	r0, #12
8002a770:	ebffff01 	bl	8002a37c <pic_enable>
8002a774:	e1a00000 	nop			@ (mov r0, r0)
8002a778:	e8bd8800 	pop	{fp, pc}
8002a77c:	800d98e0 	.word	0x800d98e0
8002a780:	8002a828 	.word	0x8002a828

8002a784 <uartputc>:
8002a784:	e92d4800 	push	{fp, lr}
8002a788:	e28db004 	add	fp, sp, #4
8002a78c:	e24dd008 	sub	sp, sp, #8
8002a790:	e50b0008 	str	r0, [fp, #-8]
8002a794:	ea000001 	b	8002a7a0 <uartputc+0x1c>
8002a798:	e3a0000a 	mov	r0, #10
8002a79c:	ebffff9d 	bl	8002a618 <micro_delay>
8002a7a0:	e59f3030 	ldr	r3, [pc, #48]	@ 8002a7d8 <uartputc+0x54>
8002a7a4:	e5933000 	ldr	r3, [r3]
8002a7a8:	e2833018 	add	r3, r3, #24
8002a7ac:	e5933000 	ldr	r3, [r3]
8002a7b0:	e2033020 	and	r3, r3, #32
8002a7b4:	e3530000 	cmp	r3, #0
8002a7b8:	1afffff6 	bne	8002a798 <uartputc+0x14>
8002a7bc:	e59f3014 	ldr	r3, [pc, #20]	@ 8002a7d8 <uartputc+0x54>
8002a7c0:	e5933000 	ldr	r3, [r3]
8002a7c4:	e51b2008 	ldr	r2, [fp, #-8]
8002a7c8:	e5832000 	str	r2, [r3]
8002a7cc:	e1a00000 	nop			@ (mov r0, r0)
8002a7d0:	e24bd004 	sub	sp, fp, #4
8002a7d4:	e8bd8800 	pop	{fp, pc}
8002a7d8:	800d98e0 	.word	0x800d98e0

8002a7dc <uartgetc>:
8002a7dc:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
8002a7e0:	e28db000 	add	fp, sp, #0
8002a7e4:	e59f3038 	ldr	r3, [pc, #56]	@ 8002a824 <uartgetc+0x48>
8002a7e8:	e5933000 	ldr	r3, [r3]
8002a7ec:	e2833018 	add	r3, r3, #24
8002a7f0:	e5933000 	ldr	r3, [r3]
8002a7f4:	e2033010 	and	r3, r3, #16
8002a7f8:	e3530000 	cmp	r3, #0
8002a7fc:	0a000001 	beq	8002a808 <uartgetc+0x2c>
8002a800:	e3e03000 	mvn	r3, #0
8002a804:	ea000002 	b	8002a814 <uartgetc+0x38>
8002a808:	e59f3014 	ldr	r3, [pc, #20]	@ 8002a824 <uartgetc+0x48>
8002a80c:	e5933000 	ldr	r3, [r3]
8002a810:	e5933000 	ldr	r3, [r3]
8002a814:	e1a00003 	mov	r0, r3
8002a818:	e28bd000 	add	sp, fp, #0
8002a81c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
8002a820:	e12fff1e 	bx	lr
8002a824:	800d98e0 	.word	0x800d98e0

8002a828 <isr_uart>:
8002a828:	e92d4800 	push	{fp, lr}
8002a82c:	e28db004 	add	fp, sp, #4
8002a830:	e24dd008 	sub	sp, sp, #8
8002a834:	e50b0008 	str	r0, [fp, #-8]
8002a838:	e50b100c 	str	r1, [fp, #-12]
8002a83c:	e59f303c 	ldr	r3, [pc, #60]	@ 8002a880 <isr_uart+0x58>
8002a840:	e5933000 	ldr	r3, [r3]
8002a844:	e2833040 	add	r3, r3, #64	@ 0x40
8002a848:	e5933000 	ldr	r3, [r3]
8002a84c:	e2033010 	and	r3, r3, #16
8002a850:	e3530000 	cmp	r3, #0
8002a854:	0a000001 	beq	8002a860 <isr_uart+0x38>
8002a858:	e59f0024 	ldr	r0, [pc, #36]	@ 8002a884 <isr_uart+0x5c>
8002a85c:	ebffdcd8 	bl	80021bc4 <consoleintr>
8002a860:	e59f3018 	ldr	r3, [pc, #24]	@ 8002a880 <isr_uart+0x58>
8002a864:	e5933000 	ldr	r3, [r3]
8002a868:	e2833044 	add	r3, r3, #68	@ 0x44
8002a86c:	e3a02030 	mov	r2, #48	@ 0x30
8002a870:	e5832000 	str	r2, [r3]
8002a874:	e1a00000 	nop			@ (mov r0, r0)
8002a878:	e24bd004 	sub	sp, fp, #4
8002a87c:	e8bd8800 	pop	{fp, pc}
8002a880:	800d98e0 	.word	0x800d98e0
8002a884:	8002a7dc 	.word	0x8002a7dc

8002a888 <__udivsi3>:
8002a888:	e2512001 	subs	r2, r1, #1
8002a88c:	012fff1e 	bxeq	lr
8002a890:	3a000036 	bcc	8002a970 <__udivsi3+0xe8>
8002a894:	e1500001 	cmp	r0, r1
8002a898:	9a000022 	bls	8002a928 <__udivsi3+0xa0>
8002a89c:	e1110002 	tst	r1, r2
8002a8a0:	0a000023 	beq	8002a934 <__udivsi3+0xac>
8002a8a4:	e311020e 	tst	r1, #-536870912	@ 0xe0000000
8002a8a8:	01a01181 	lsleq	r1, r1, #3
8002a8ac:	03a03008 	moveq	r3, #8
8002a8b0:	13a03001 	movne	r3, #1
8002a8b4:	e3510201 	cmp	r1, #268435456	@ 0x10000000
8002a8b8:	31510000 	cmpcc	r1, r0
8002a8bc:	31a01201 	lslcc	r1, r1, #4
8002a8c0:	31a03203 	lslcc	r3, r3, #4
8002a8c4:	3afffffa 	bcc	8002a8b4 <__udivsi3+0x2c>
8002a8c8:	e3510102 	cmp	r1, #-2147483648	@ 0x80000000
8002a8cc:	31510000 	cmpcc	r1, r0
8002a8d0:	31a01081 	lslcc	r1, r1, #1
8002a8d4:	31a03083 	lslcc	r3, r3, #1
8002a8d8:	3afffffa 	bcc	8002a8c8 <__udivsi3+0x40>
8002a8dc:	e3a02000 	mov	r2, #0
8002a8e0:	e1500001 	cmp	r0, r1
8002a8e4:	20400001 	subcs	r0, r0, r1
8002a8e8:	21822003 	orrcs	r2, r2, r3
8002a8ec:	e15000a1 	cmp	r0, r1, lsr #1
8002a8f0:	204000a1 	subcs	r0, r0, r1, lsr #1
8002a8f4:	218220a3 	orrcs	r2, r2, r3, lsr #1
8002a8f8:	e1500121 	cmp	r0, r1, lsr #2
8002a8fc:	20400121 	subcs	r0, r0, r1, lsr #2
8002a900:	21822123 	orrcs	r2, r2, r3, lsr #2
8002a904:	e15001a1 	cmp	r0, r1, lsr #3
8002a908:	204001a1 	subcs	r0, r0, r1, lsr #3
8002a90c:	218221a3 	orrcs	r2, r2, r3, lsr #3
8002a910:	e3500000 	cmp	r0, #0
8002a914:	11b03223 	lsrsne	r3, r3, #4
8002a918:	11a01221 	lsrne	r1, r1, #4
8002a91c:	1affffef 	bne	8002a8e0 <__udivsi3+0x58>
8002a920:	e1a00002 	mov	r0, r2
8002a924:	e12fff1e 	bx	lr
8002a928:	03a00001 	moveq	r0, #1
8002a92c:	13a00000 	movne	r0, #0
8002a930:	e12fff1e 	bx	lr
8002a934:	e3510801 	cmp	r1, #65536	@ 0x10000
8002a938:	21a01821 	lsrcs	r1, r1, #16
8002a93c:	23a02010 	movcs	r2, #16
8002a940:	33a02000 	movcc	r2, #0
8002a944:	e3510c01 	cmp	r1, #256	@ 0x100
8002a948:	21a01421 	lsrcs	r1, r1, #8
8002a94c:	22822008 	addcs	r2, r2, #8
8002a950:	e3510010 	cmp	r1, #16
8002a954:	21a01221 	lsrcs	r1, r1, #4
8002a958:	22822004 	addcs	r2, r2, #4
8002a95c:	e3510004 	cmp	r1, #4
8002a960:	82822003 	addhi	r2, r2, #3
8002a964:	908220a1 	addls	r2, r2, r1, lsr #1
8002a968:	e1a00230 	lsr	r0, r0, r2
8002a96c:	e12fff1e 	bx	lr
8002a970:	e3500000 	cmp	r0, #0
8002a974:	13e00000 	mvnne	r0, #0
8002a978:	ea000059 	b	8002aae4 <__aeabi_idiv0>

8002a97c <__aeabi_uidivmod>:
8002a97c:	e3510000 	cmp	r1, #0
8002a980:	0afffffa 	beq	8002a970 <__udivsi3+0xe8>
8002a984:	e92d4003 	push	{r0, r1, lr}
8002a988:	ebffffbe 	bl	8002a888 <__udivsi3>
8002a98c:	e8bd4006 	pop	{r1, r2, lr}
8002a990:	e0030092 	mul	r3, r2, r0
8002a994:	e0411003 	sub	r1, r1, r3
8002a998:	e12fff1e 	bx	lr

8002a99c <__divsi3>:
8002a99c:	e3510000 	cmp	r1, #0
8002a9a0:	0a000043 	beq	8002aab4 <.divsi3_skip_div0_test+0x110>

8002a9a4 <.divsi3_skip_div0_test>:
8002a9a4:	e020c001 	eor	ip, r0, r1
8002a9a8:	42611000 	rsbmi	r1, r1, #0
8002a9ac:	e2512001 	subs	r2, r1, #1
8002a9b0:	0a000027 	beq	8002aa54 <.divsi3_skip_div0_test+0xb0>
8002a9b4:	e1b03000 	movs	r3, r0
8002a9b8:	42603000 	rsbmi	r3, r0, #0
8002a9bc:	e1530001 	cmp	r3, r1
8002a9c0:	9a000026 	bls	8002aa60 <.divsi3_skip_div0_test+0xbc>
8002a9c4:	e1110002 	tst	r1, r2
8002a9c8:	0a000028 	beq	8002aa70 <.divsi3_skip_div0_test+0xcc>
8002a9cc:	e311020e 	tst	r1, #-536870912	@ 0xe0000000
8002a9d0:	01a01181 	lsleq	r1, r1, #3
8002a9d4:	03a02008 	moveq	r2, #8
8002a9d8:	13a02001 	movne	r2, #1
8002a9dc:	e3510201 	cmp	r1, #268435456	@ 0x10000000
8002a9e0:	31510003 	cmpcc	r1, r3
8002a9e4:	31a01201 	lslcc	r1, r1, #4
8002a9e8:	31a02202 	lslcc	r2, r2, #4
8002a9ec:	3afffffa 	bcc	8002a9dc <.divsi3_skip_div0_test+0x38>
8002a9f0:	e3510102 	cmp	r1, #-2147483648	@ 0x80000000
8002a9f4:	31510003 	cmpcc	r1, r3
8002a9f8:	31a01081 	lslcc	r1, r1, #1
8002a9fc:	31a02082 	lslcc	r2, r2, #1
8002aa00:	3afffffa 	bcc	8002a9f0 <.divsi3_skip_div0_test+0x4c>
8002aa04:	e3a00000 	mov	r0, #0
8002aa08:	e1530001 	cmp	r3, r1
8002aa0c:	20433001 	subcs	r3, r3, r1
8002aa10:	21800002 	orrcs	r0, r0, r2
8002aa14:	e15300a1 	cmp	r3, r1, lsr #1
8002aa18:	204330a1 	subcs	r3, r3, r1, lsr #1
8002aa1c:	218000a2 	orrcs	r0, r0, r2, lsr #1
8002aa20:	e1530121 	cmp	r3, r1, lsr #2
8002aa24:	20433121 	subcs	r3, r3, r1, lsr #2
8002aa28:	21800122 	orrcs	r0, r0, r2, lsr #2
8002aa2c:	e15301a1 	cmp	r3, r1, lsr #3
8002aa30:	204331a1 	subcs	r3, r3, r1, lsr #3
8002aa34:	218001a2 	orrcs	r0, r0, r2, lsr #3
8002aa38:	e3530000 	cmp	r3, #0
8002aa3c:	11b02222 	lsrsne	r2, r2, #4
8002aa40:	11a01221 	lsrne	r1, r1, #4
8002aa44:	1affffef 	bne	8002aa08 <.divsi3_skip_div0_test+0x64>
8002aa48:	e35c0000 	cmp	ip, #0
8002aa4c:	42600000 	rsbmi	r0, r0, #0
8002aa50:	e12fff1e 	bx	lr
8002aa54:	e13c0000 	teq	ip, r0
8002aa58:	42600000 	rsbmi	r0, r0, #0
8002aa5c:	e12fff1e 	bx	lr
8002aa60:	33a00000 	movcc	r0, #0
8002aa64:	01a00fcc 	asreq	r0, ip, #31
8002aa68:	03800001 	orreq	r0, r0, #1
8002aa6c:	e12fff1e 	bx	lr
8002aa70:	e3510801 	cmp	r1, #65536	@ 0x10000
8002aa74:	21a01821 	lsrcs	r1, r1, #16
8002aa78:	23a02010 	movcs	r2, #16
8002aa7c:	33a02000 	movcc	r2, #0
8002aa80:	e3510c01 	cmp	r1, #256	@ 0x100
8002aa84:	21a01421 	lsrcs	r1, r1, #8
8002aa88:	22822008 	addcs	r2, r2, #8
8002aa8c:	e3510010 	cmp	r1, #16
8002aa90:	21a01221 	lsrcs	r1, r1, #4
8002aa94:	22822004 	addcs	r2, r2, #4
8002aa98:	e3510004 	cmp	r1, #4
8002aa9c:	82822003 	addhi	r2, r2, #3
8002aaa0:	908220a1 	addls	r2, r2, r1, lsr #1
8002aaa4:	e35c0000 	cmp	ip, #0
8002aaa8:	e1a00233 	lsr	r0, r3, r2
8002aaac:	42600000 	rsbmi	r0, r0, #0
8002aab0:	e12fff1e 	bx	lr
8002aab4:	e3500000 	cmp	r0, #0
8002aab8:	c3e00102 	mvngt	r0, #-2147483648	@ 0x80000000
8002aabc:	b3a00102 	movlt	r0, #-2147483648	@ 0x80000000
8002aac0:	ea000007 	b	8002aae4 <__aeabi_idiv0>

8002aac4 <__aeabi_idivmod>:
8002aac4:	e3510000 	cmp	r1, #0
8002aac8:	0afffff9 	beq	8002aab4 <.divsi3_skip_div0_test+0x110>
8002aacc:	e92d4003 	push	{r0, r1, lr}
8002aad0:	ebffffb3 	bl	8002a9a4 <.divsi3_skip_div0_test>
8002aad4:	e8bd4006 	pop	{r1, r2, lr}
8002aad8:	e0030092 	mul	r3, r2, r0
8002aadc:	e0411003 	sub	r1, r1, r3
8002aae0:	e12fff1e 	bx	lr

8002aae4 <__aeabi_idiv0>:
8002aae4:	e12fff1e 	bx	lr
