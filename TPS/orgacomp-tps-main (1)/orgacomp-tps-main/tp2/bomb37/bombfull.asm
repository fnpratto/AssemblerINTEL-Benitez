
./bomb:     formato del fichero elf64-x86-64


Desensamblado de la sección .interp:

00000000000002a8 <.interp>:
 2a8:	2f                   	(bad)  
 2a9:	6c                   	insb   (%dx),%es:(%rdi)
 2aa:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
 2b1:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
 2b6:	78 2d                	js     2e5 <_init-0xd1b>
 2b8:	78 38                	js     2f2 <_init-0xd0e>
 2ba:	36 2d 36 34 2e 73    	ss sub $0x732e3436,%eax
 2c0:	6f                   	outsl  %ds:(%rsi),(%dx)
 2c1:	2e 32 00             	xor    %cs:(%rax),%al

Desensamblado de la sección .note.gnu.build-id:

00000000000002c4 <.note.gnu.build-id>:
 2c4:	04 00                	add    $0x0,%al
 2c6:	00 00                	add    %al,(%rax)
 2c8:	14 00                	adc    $0x0,%al
 2ca:	00 00                	add    %al,(%rax)
 2cc:	03 00                	add    (%rax),%eax
 2ce:	00 00                	add    %al,(%rax)
 2d0:	47                   	rex.RXB
 2d1:	4e 55                	rex.WRX push %rbp
 2d3:	00 e0                	add    %ah,%al
 2d5:	d6                   	(bad)  
 2d6:	af                   	scas   %es:(%rdi),%eax
 2d7:	c6                   	(bad)  
 2d8:	89 c8                	mov    %ecx,%eax
 2da:	99                   	cltd   
 2db:	65 88 a9 b5 61 52 bb 	mov    %ch,%gs:-0x44ad9e4b(%rcx)
 2e2:	cb                   	lret   
 2e3:	fb                   	sti    
 2e4:	de 37                	fidivs (%rdi)
 2e6:	e6 01                	out    %al,$0x1

Desensamblado de la sección .note.ABI-tag:

00000000000002e8 <.note.ABI-tag>:
 2e8:	04 00                	add    $0x0,%al
 2ea:	00 00                	add    %al,(%rax)
 2ec:	10 00                	adc    %al,(%rax)
 2ee:	00 00                	add    %al,(%rax)
 2f0:	01 00                	add    %eax,(%rax)
 2f2:	00 00                	add    %al,(%rax)
 2f4:	47                   	rex.RXB
 2f5:	4e 55                	rex.WRX push %rbp
 2f7:	00 00                	add    %al,(%rax)
 2f9:	00 00                	add    %al,(%rax)
 2fb:	00 03                	add    %al,(%rbx)
 2fd:	00 00                	add    %al,(%rax)
 2ff:	00 02                	add    %al,(%rdx)
 301:	00 00                	add    %al,(%rax)
 303:	00 00                	add    %al,(%rax)
 305:	00 00                	add    %al,(%rax)
	...

Desensamblado de la sección .gnu.hash:

0000000000000308 <.gnu.hash>:
 308:	03 00                	add    (%rax),%eax
 30a:	00 00                	add    %al,(%rax)
 30c:	20 00                	and    %al,(%rax)
 30e:	00 00                	add    %al,(%rax)
 310:	01 00                	add    %eax,(%rax)
 312:	00 00                	add    %al,(%rax)
 314:	06                   	(bad)  
 315:	00 00                	add    %al,(%rax)
 317:	00 00                	add    %al,(%rax)
 319:	01 a1 00 80 01 10    	add    %esp,0x10018000(%rcx)
 31f:	02 20                	add    (%rax),%ah
 321:	00 00                	add    %al,(%rax)
 323:	00 22                	add    %ah,(%rdx)
 325:	00 00                	add    %al,(%rax)
 327:	00 00                	add    %al,(%rax)
 329:	00 00                	add    %al,(%rax)
 32b:	00 28                	add    %ch,(%rax)
 32d:	1d 8c 1c d1 65       	sbb    $0x65d11c8c,%eax
 332:	ce                   	(bad)  
 333:	6d                   	insl   (%dx),%es:(%rdi)
 334:	66 55                	push   %bp
 336:	61                   	(bad)  
 337:	10 39                	adc    %bh,(%rcx)
 339:	f2                   	repnz
 33a:	8b                   	.byte 0x8b
 33b:	1c                   	.byte 0x1c

Desensamblado de la sección .dynsym:

0000000000000340 <.dynsym>:
	...
 358:	d2 00                	rolb   %cl,(%rax)
 35a:	00 00                	add    %al,(%rax)
 35c:	12 00                	adc    (%rax),%al
	...
 36e:	00 00                	add    %al,(%rax)
 370:	b9 00 00 00 12       	mov    $0x12000000,%ecx
	...
 385:	00 00                	add    %al,(%rax)
 387:	00 80 00 00 00 12    	add    %al,0x12000000(%rax)
	...
 39d:	00 00                	add    %al,(%rax)
 39f:	00 77 01             	add    %dh,0x1(%rdi)
 3a2:	00 00                	add    %al,(%rax)
 3a4:	20 00                	and    %al,(%rax)
	...
 3b6:	00 00                	add    %al,(%rax)
 3b8:	19 00                	sbb    %eax,(%rax)
 3ba:	00 00                	add    %al,(%rax)
 3bc:	12 00                	adc    (%rax),%al
	...
 3ce:	00 00                	add    %al,(%rax)
 3d0:	57                   	push   %rdi
 3d1:	00 00                	add    %al,(%rax)
 3d3:	00 12                	add    %dl,(%rdx)
	...
 3e5:	00 00                	add    %al,(%rax)
 3e7:	00 3b                	add    %bh,(%rbx)
 3e9:	01 00                	add    %eax,(%rax)
 3eb:	00 12                	add    %dl,(%rdx)
	...
 3fd:	00 00                	add    %al,(%rax)
 3ff:	00 5c 00 00          	add    %bl,0x0(%rax,%rax,1)
 403:	00 12                	add    %dl,(%rdx)
	...
 415:	00 00                	add    %al,(%rax)
 417:	00 e0                	add    %ah,%al
 419:	00 00                	add    %al,(%rax)
 41b:	00 12                	add    %dl,(%rdx)
	...
 431:	01 00                	add    %eax,(%rax)
 433:	00 12                	add    %dl,(%rdx)
	...
 445:	00 00                	add    %al,(%rax)
 447:	00 91 00 00 00 12    	add    %dl,0x12000000(%rcx)
	...
 45d:	00 00                	add    %al,(%rax)
 45f:	00 29                	add    %ch,(%rcx)
 461:	01 00                	add    %eax,(%rax)
 463:	00 12                	add    %dl,(%rdx)
	...
 475:	00 00                	add    %al,(%rax)
 477:	00 7a 00             	add    %bh,0x0(%rdx)
 47a:	00 00                	add    %al,(%rax)
 47c:	12 00                	adc    (%rax),%al
	...
 48e:	00 00                	add    %al,(%rax)
 490:	50                   	push   %rax
 491:	00 00                	add    %al,(%rax)
 493:	00 12                	add    %dl,(%rdx)
	...
 4a5:	00 00                	add    %al,(%rax)
 4a7:	00 e6                	add    %ah,%dh
 4a9:	00 00                	add    %al,(%rax)
 4ab:	00 12                	add    %dl,(%rdx)
	...
 4bd:	00 00                	add    %al,(%rax)
 4bf:	00 ab 00 00 00 12    	add    %ch,0x12000000(%rbx)
	...
 4d5:	00 00                	add    %al,(%rax)
 4d7:	00 93 01 00 00 20    	add    %dl,0x20000001(%rbx)
	...
 4ed:	00 00                	add    %al,(%rax)
 4ef:	00 73 00             	add    %dh,0x0(%rbx)
 4f2:	00 00                	add    %al,(%rax)
 4f4:	12 00                	adc    (%rax),%al
	...
 506:	00 00                	add    %al,(%rax)
 508:	12 00                	adc    (%rax),%al
 50a:	00 00                	add    %al,(%rax)
 50c:	12 00                	adc    (%rax),%al
	...
 51e:	00 00                	add    %al,(%rax)
 520:	38 00                	cmp    %al,(%rax)
 522:	00 00                	add    %al,(%rax)
 524:	12 00                	adc    (%rax),%al
	...
 536:	00 00                	add    %al,(%rax)
 538:	20 00                	and    %al,(%rax)
 53a:	00 00                	add    %al,(%rax)
 53c:	12 00                	adc    (%rax),%al
	...
 54e:	00 00                	add    %al,(%rax)
 550:	32 00                	xor    (%rax),%al
 552:	00 00                	add    %al,(%rax)
 554:	12 00                	adc    (%rax),%al
	...
 566:	00 00                	add    %al,(%rax)
 568:	f4                   	hlt    
 569:	00 00                	add    %al,(%rax)
 56b:	00 12                	add    %dl,(%rdx)
	...
 57d:	00 00                	add    %al,(%rax)
 57f:	00 2d 00 00 00 12    	add    %ch,0x12000000(%rip)        # 12000585 <_end+0x11ffa7f5>
	...
 595:	00 00                	add    %al,(%rax)
 597:	00 48 00             	add    %cl,0x0(%rax)
 59a:	00 00                	add    %al,(%rax)
 59c:	12 00                	adc    (%rax),%al
	...
 5ae:	00 00                	add    %al,(%rax)
 5b0:	96                   	xchg   %eax,%esi
 5b1:	00 00                	add    %al,(%rax)
 5b3:	00 12                	add    %dl,(%rdx)
	...
 5c5:	00 00                	add    %al,(%rax)
 5c7:	00 a2 01 00 00 20    	add    %ah,0x20000001(%rdx)
	...
 5dd:	00 00                	add    %al,(%rax)
 5df:	00 06                	add    %al,(%rsi)
 5e1:	01 00                	add    %eax,(%rax)
 5e3:	00 12                	add    %dl,(%rdx)
	...
 5f5:	00 00                	add    %al,(%rax)
 5f7:	00 c4                	add    %al,%ah
 5f9:	00 00                	add    %al,(%rax)
 5fb:	00 12                	add    %dl,(%rdx)
	...
 60d:	00 00                	add    %al,(%rax)
 60f:	00 1b                	add    %bl,(%rbx)
 611:	01 00                	add    %eax,(%rax)
 613:	00 12                	add    %dl,(%rdx)
	...
 625:	00 00                	add    %al,(%rax)
 627:	00 0b                	add    %cl,(%rbx)
 629:	00 00                	add    %al,(%rax)
 62b:	00 12                	add    %dl,(%rdx)
	...
 63d:	00 00                	add    %al,(%rax)
 63f:	00 a4 00 00 00 11 00 	add    %ah,0x110000(%rax,%rax,1)
 646:	18 00                	sbb    %al,(%rax)
 648:	80 52 00 00          	adcb   $0x0,0x0(%rdx)
 64c:	00 00                	add    %al,(%rax)
 64e:	00 00                	add    %al,(%rax)
 650:	08 00                	or     %al,(%rax)
 652:	00 00                	add    %al,(%rax)
 654:	00 00                	add    %al,(%rax)
 656:	00 00                	add    %al,(%rax)
 658:	0c 01                	or     $0x1,%al
 65a:	00 00                	add    %al,(%rax)
 65c:	22 00                	and    (%rax),%al
	...
 66e:	00 00                	add    %al,(%rax)
 670:	6d                   	insl   (%dx),%es:(%rdi)
 671:	00 00                	add    %al,(%rax)
 673:	00 11                	add    %dl,(%rcx)
 675:	00 18                	add    %bl,(%rax)
 677:	00 90 52 00 00 00    	add    %dl,0x52(%rax)
 67d:	00 00                	add    %al,(%rax)
 67f:	00 08                	add    %cl,(%rax)
 681:	00 00                	add    %al,(%rax)
 683:	00 00                	add    %al,(%rax)
 685:	00 00                	add    %al,(%rax)
 687:	00 d9                	add    %bl,%cl
 689:	00 00                	add    %al,(%rax)
 68b:	00 11                	add    %dl,(%rcx)
 68d:	00 18                	add    %bl,(%rax)
 68f:	00 a0 52 00 00 00    	add    %ah,0x52(%rax)
 695:	00 00                	add    %al,(%rax)
 697:	00 08                	add    %cl,(%rax)
 699:	00 00                	add    %al,(%rax)
 69b:	00 00                	add    %al,(%rax)
 69d:	00 00                	add    %al,(%rax)
	...

Desensamblado de la sección .dynstr:

00000000000006a0 <.dynstr>:
 6a0:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
 6a4:	63 2e                	movslq (%rsi),%ebp
 6a6:	73 6f                	jae    717 <_init-0x8e9>
 6a8:	2e 36 00 73 6f       	cs add %dh,%ss:0x6f(%rbx)
 6ad:	63 6b 65             	movslq 0x65(%rbx),%ebp
 6b0:	74 00                	je     6b2 <_init-0x94e>
 6b2:	66 66 6c             	data16 data16 insb (%dx),%es:(%rdi)
 6b5:	75 73                	jne    72a <_init-0x8d6>
 6b7:	68 00 73 74 72       	pushq  $0x72747300
 6bc:	63 70 79             	movslq 0x79(%rax),%esi
 6bf:	00 5f 5f             	add    %bl,0x5f(%rdi)
 6c2:	70 72                	jo     736 <_init-0x8ca>
 6c4:	69 6e 74 66 5f 63 68 	imul   $0x68635f66,0x74(%rsi),%ebp
 6cb:	6b 00 65             	imul   $0x65,(%rax),%eax
 6ce:	78 69                	js     739 <_init-0x8c7>
 6d0:	74 00                	je     6d2 <_init-0x92e>
 6d2:	66 6f                	outsw  %ds:(%rsi),(%dx)
 6d4:	70 65                	jo     73b <_init-0x8c5>
 6d6:	6e                   	outsb  %ds:(%rsi),(%dx)
 6d7:	00 5f 5f             	add    %bl,0x5f(%rdi)
 6da:	69 73 6f 63 39 39 5f 	imul   $0x5f393963,0x6f(%rbx),%esi
 6e1:	73 73                	jae    756 <_init-0x8aa>
 6e3:	63 61 6e             	movslq 0x6e(%rcx),%esp
 6e6:	66 00 63 6f          	data16 add %ah,0x6f(%rbx)
 6ea:	6e                   	outsb  %ds:(%rsi),(%dx)
 6eb:	6e                   	outsb  %ds:(%rsi),(%dx)
 6ec:	65 63 74 00 73       	movslq %gs:0x73(%rax,%rax,1),%esi
 6f1:	69 67 6e 61 6c 00 70 	imul   $0x70006c61,0x6e(%rdi),%esp
 6f8:	75 74                	jne    76e <_init-0x892>
 6fa:	73 00                	jae    6fc <_init-0x904>
 6fc:	5f                   	pop    %rdi
 6fd:	5f                   	pop    %rdi
 6fe:	73 74                	jae    774 <_init-0x88c>
 700:	61                   	(bad)  
 701:	63 6b 5f             	movslq 0x5f(%rbx),%ebp
 704:	63 68 6b             	movslq 0x6b(%rax),%ebp
 707:	5f                   	pop    %rdi
 708:	66 61                	data16 (bad) 
 70a:	69 6c 00 73 74 64 69 	imul   $0x6e696474,0x73(%rax,%rax,1),%ebp
 711:	6e 
 712:	00 73 74             	add    %dh,0x74(%rbx)
 715:	72 74                	jb     78b <_init-0x875>
 717:	6f                   	outsl  %ds:(%rsi),(%dx)
 718:	6c                   	insb   (%dx),%es:(%rdi)
 719:	00 66 67             	add    %ah,0x67(%rsi)
 71c:	65 74 73             	gs je  792 <_init-0x86e>
 71f:	00 5f 5f             	add    %bl,0x5f(%rdi)
 722:	65 72 72             	gs jb  797 <_init-0x869>
 725:	6e                   	outsb  %ds:(%rsi),(%dx)
 726:	6f                   	outsl  %ds:(%rsi),(%dx)
 727:	5f                   	pop    %rdi
 728:	6c                   	insb   (%dx),%es:(%rdi)
 729:	6f                   	outsl  %ds:(%rsi),(%dx)
 72a:	63 61 74             	movslq 0x74(%rcx),%esp
 72d:	69 6f 6e 00 72 65 61 	imul   $0x61657200,0x6e(%rdi),%ebp
 734:	64 00 5f 5f          	add    %bl,%fs:0x5f(%rdi)
 738:	66 70 72             	data16 jo 7ad <_init-0x853>
 73b:	69 6e 74 66 5f 63 68 	imul   $0x68635f66,0x74(%rsi),%ebp
 742:	6b 00 73             	imul   $0x73,(%rax),%eax
 745:	74 64                	je     7ab <_init-0x855>
 747:	6f                   	outsl  %ds:(%rsi),(%dx)
 748:	75 74                	jne    7be <_init-0x842>
 74a:	00 5f 5f             	add    %bl,0x5f(%rdi)
 74d:	6d                   	insl   (%dx),%es:(%rdi)
 74e:	65 6d                	gs insl (%dx),%es:(%rdi)
 750:	6d                   	insl   (%dx),%es:(%rdi)
 751:	6f                   	outsl  %ds:(%rsi),(%dx)
 752:	76 65                	jbe    7b9 <_init-0x847>
 754:	5f                   	pop    %rdi
 755:	63 68 6b             	movslq 0x6b(%rax),%ebp
 758:	00 73 74             	add    %dh,0x74(%rbx)
 75b:	72 63                	jb     7c0 <_init-0x840>
 75d:	61                   	(bad)  
 75e:	73 65                	jae    7c5 <_init-0x83b>
 760:	63 6d 70             	movslq 0x70(%rbp),%ebp
 763:	00 5f 5f             	add    %bl,0x5f(%rdi)
 766:	63 74 79 70          	movslq 0x70(%rcx,%rdi,2),%esi
 76a:	65 5f                	gs pop %rdi
 76c:	62                   	(bad)  
 76d:	5f                   	pop    %rdi
 76e:	6c                   	insb   (%dx),%es:(%rdi)
 76f:	6f                   	outsl  %ds:(%rsi),(%dx)
 770:	63 00                	movslq (%rax),%eax
 772:	67 65 74 65          	addr32 gs je 7db <_init-0x825>
 776:	6e                   	outsb  %ds:(%rsi),(%dx)
 777:	76 00                	jbe    779 <_init-0x887>
 779:	73 74                	jae    7ef <_init-0x811>
 77b:	64 65 72 72          	fs gs jb 7f1 <_init-0x80f>
 77f:	00 61 6c             	add    %ah,0x6c(%rcx)
 782:	61                   	(bad)  
 783:	72 6d                	jb     7f2 <_init-0x80e>
 785:	00 67 65             	add    %ah,0x65(%rdi)
 788:	74 68                	je     7f2 <_init-0x80e>
 78a:	6f                   	outsl  %ds:(%rsi),(%dx)
 78b:	73 74                	jae    801 <_init-0x7ff>
 78d:	62                   	(bad)  
 78e:	79 6e                	jns    7fe <_init-0x802>
 790:	61                   	(bad)  
 791:	6d                   	insl   (%dx),%es:(%rdi)
 792:	65 00 67 65          	add    %ah,%gs:0x65(%rdi)
 796:	74 68                	je     800 <_init-0x800>
 798:	6f                   	outsl  %ds:(%rsi),(%dx)
 799:	73 74                	jae    80f <_init-0x7f1>
 79b:	6e                   	outsb  %ds:(%rsi),(%dx)
 79c:	61                   	(bad)  
 79d:	6d                   	insl   (%dx),%es:(%rdi)
 79e:	65 00 63 6c          	add    %ah,%gs:0x6c(%rbx)
 7a2:	6f                   	outsl  %ds:(%rsi),(%dx)
 7a3:	73 65                	jae    80a <_init-0x7f6>
 7a5:	00 73 6c             	add    %dh,0x6c(%rbx)
 7a8:	65 65 70 00          	gs gs jo 7ac <_init-0x854>
 7ac:	5f                   	pop    %rdi
 7ad:	5f                   	pop    %rdi
 7ae:	63 78 61             	movslq 0x61(%rax),%edi
 7b1:	5f                   	pop    %rdi
 7b2:	66 69 6e 61 6c 69    	imul   $0x696c,0x61(%rsi),%bp
 7b8:	7a 65                	jp     81f <_init-0x7e1>
 7ba:	00 5f 5f             	add    %bl,0x5f(%rdi)
 7bd:	73 70                	jae    82f <_init-0x7d1>
 7bf:	72 69                	jb     82a <_init-0x7d6>
 7c1:	6e                   	outsb  %ds:(%rsi),(%dx)
 7c2:	74 66                	je     82a <_init-0x7d6>
 7c4:	5f                   	pop    %rdi
 7c5:	63 68 6b             	movslq 0x6b(%rax),%ebp
 7c8:	00 5f 5f             	add    %bl,0x5f(%rdi)
 7cb:	6c                   	insb   (%dx),%es:(%rdi)
 7cc:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
 7d3:	72 74                	jb     849 <_init-0x7b7>
 7d5:	5f                   	pop    %rdi
 7d6:	6d                   	insl   (%dx),%es:(%rdi)
 7d7:	61                   	(bad)  
 7d8:	69 6e 00 77 72 69 74 	imul   $0x74697277,0x0(%rsi),%ebp
 7df:	65 00 47 4c          	add    %al,%gs:0x4c(%rdi)
 7e3:	49                   	rex.WB
 7e4:	42                   	rex.X
 7e5:	43 5f                	rex.XB pop %r15
 7e7:	32 2e                	xor    (%rsi),%ch
 7e9:	33 00                	xor    (%rax),%eax
 7eb:	47                   	rex.RXB
 7ec:	4c                   	rex.WR
 7ed:	49                   	rex.WB
 7ee:	42                   	rex.X
 7ef:	43 5f                	rex.XB pop %r15
 7f1:	32 2e                	xor    (%rsi),%ch
 7f3:	37                   	(bad)  
 7f4:	00 47 4c             	add    %al,0x4c(%rdi)
 7f7:	49                   	rex.WB
 7f8:	42                   	rex.X
 7f9:	43 5f                	rex.XB pop %r15
 7fb:	32 2e                	xor    (%rsi),%ch
 7fd:	33 2e                	xor    (%rsi),%ebp
 7ff:	34 00                	xor    $0x0,%al
 801:	47                   	rex.RXB
 802:	4c                   	rex.WR
 803:	49                   	rex.WB
 804:	42                   	rex.X
 805:	43 5f                	rex.XB pop %r15
 807:	32 2e                	xor    (%rsi),%ch
 809:	34 00                	xor    $0x0,%al
 80b:	47                   	rex.RXB
 80c:	4c                   	rex.WR
 80d:	49                   	rex.WB
 80e:	42                   	rex.X
 80f:	43 5f                	rex.XB pop %r15
 811:	32 2e                	xor    (%rsi),%ch
 813:	32 2e                	xor    (%rsi),%ch
 815:	35 00 5f 49 54       	xor    $0x54495f00,%eax
 81a:	4d 5f                	rex.WRB pop %r15
 81c:	64 65 72 65          	fs gs jb 885 <_init-0x77b>
 820:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
 827:	4d 
 828:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
 82a:	6f                   	outsl  %ds:(%rsi),(%dx)
 82b:	6e                   	outsb  %ds:(%rsi),(%dx)
 82c:	65 54                	gs push %rsp
 82e:	61                   	(bad)  
 82f:	62                   	(bad)  
 830:	6c                   	insb   (%dx),%es:(%rdi)
 831:	65 00 5f 5f          	add    %bl,%gs:0x5f(%rdi)
 835:	67 6d                	insl   (%dx),%es:(%edi)
 837:	6f                   	outsl  %ds:(%rsi),(%dx)
 838:	6e                   	outsb  %ds:(%rsi),(%dx)
 839:	5f                   	pop    %rdi
 83a:	73 74                	jae    8b0 <_init-0x750>
 83c:	61                   	(bad)  
 83d:	72 74                	jb     8b3 <_init-0x74d>
 83f:	5f                   	pop    %rdi
 840:	5f                   	pop    %rdi
 841:	00 5f 49             	add    %bl,0x49(%rdi)
 844:	54                   	push   %rsp
 845:	4d 5f                	rex.WRB pop %r15
 847:	72 65                	jb     8ae <_init-0x752>
 849:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
 850:	4d 
 851:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
 853:	6f                   	outsl  %ds:(%rsi),(%dx)
 854:	6e                   	outsb  %ds:(%rsi),(%dx)
 855:	65 54                	gs push %rsp
 857:	61                   	(bad)  
 858:	62                   	.byte 0x62
 859:	6c                   	insb   (%dx),%es:(%rdi)
 85a:	65                   	gs
	...

Desensamblado de la sección .gnu.version:

000000000000085c <.gnu.version>:
 85c:	00 00                	add    %al,(%rax)
 85e:	02 00                	add    (%rax),%al
 860:	02 00                	add    (%rax),%al
 862:	02 00                	add    (%rax),%al
 864:	00 00                	add    %al,(%rax)
 866:	02 00                	add    (%rax),%al
 868:	02 00                	add    (%rax),%al
 86a:	02 00                	add    (%rax),%al
 86c:	03 00                	add    (%rax),%eax
 86e:	02 00                	add    (%rax),%al
 870:	02 00                	add    (%rax),%al
 872:	02 00                	add    (%rax),%al
 874:	02 00                	add    (%rax),%al
 876:	02 00                	add    (%rax),%al
 878:	02 00                	add    (%rax),%al
 87a:	02 00                	add    (%rax),%al
 87c:	04 00                	add    $0x0,%al
 87e:	00 00                	add    %al,(%rax)
 880:	02 00                	add    (%rax),%al
 882:	02 00                	add    (%rax),%al
 884:	05 00 04 00 02       	add    $0x2000400,%eax
 889:	00 02                	add    %al,(%rdx)
 88b:	00 02                	add    %al,(%rdx)
 88d:	00 02                	add    %al,(%rdx)
 88f:	00 04 00             	add    %al,(%rax,%rax,1)
 892:	00 00                	add    %al,(%rax)
 894:	02 00                	add    (%rax),%al
 896:	06                   	(bad)  
 897:	00 04 00             	add    %al,(%rax,%rax,1)
 89a:	02 00                	add    (%rax),%al
 89c:	02 00                	add    (%rax),%al
 89e:	02 00                	add    (%rax),%al
 8a0:	02 00                	add    (%rax),%al
 8a2:	02 00                	add    (%rax),%al

Desensamblado de la sección .gnu.version_r:

00000000000008a8 <.gnu.version_r>:
 8a8:	01 00                	add    %eax,(%rax)
 8aa:	05 00 01 00 00       	add    $0x100,%eax
 8af:	00 10                	add    %dl,(%rax)
 8b1:	00 00                	add    %al,(%rax)
 8b3:	00 00                	add    %al,(%rax)
 8b5:	00 00                	add    %al,(%rax)
 8b7:	00 13                	add    %dl,(%rbx)
 8b9:	69 69 0d 00 00 06 00 	imul   $0x60000,0xd(%rcx),%ebp
 8c0:	41 01 00             	add    %eax,(%r8)
 8c3:	00 10                	add    %dl,(%rax)
 8c5:	00 00                	add    %al,(%rax)
 8c7:	00 17                	add    %dl,(%rdi)
 8c9:	69 69 0d 00 00 05 00 	imul   $0x50000,0xd(%rcx),%ebp
 8d0:	4b 01 00             	rex.WXB add %rax,(%r8)
 8d3:	00 10                	add    %dl,(%rax)
 8d5:	00 00                	add    %al,(%rax)
 8d7:	00 74 19 69          	add    %dh,0x69(%rcx,%rbx,1)
 8db:	09 00                	or     %eax,(%rax)
 8dd:	00 04 00             	add    %al,(%rax,%rax,1)
 8e0:	55                   	push   %rbp
 8e1:	01 00                	add    %eax,(%rax)
 8e3:	00 10                	add    %dl,(%rax)
 8e5:	00 00                	add    %al,(%rax)
 8e7:	00 14 69             	add    %dl,(%rcx,%rbp,2)
 8ea:	69 0d 00 00 03 00 61 	imul   $0x161,0x30000(%rip),%ecx        # 308f4 <_end+0x2ab64>
 8f1:	01 00 00 
 8f4:	10 00                	adc    %al,(%rax)
 8f6:	00 00                	add    %al,(%rax)
 8f8:	75 1a                	jne    914 <_init-0x6ec>
 8fa:	69 09 00 00 02 00    	imul   $0x20000,(%rcx),%ecx
 900:	6b 01 00             	imul   $0x0,(%rcx),%eax
 903:	00 00                	add    %al,(%rax)
 905:	00 00                	add    %al,(%rax)
	...

Desensamblado de la sección .rela.dyn:

0000000000000908 <.rela.dyn>:
 908:	e8 4c 00 00 00       	callq  959 <_init-0x6a7>
 90d:	00 00                	add    %al,(%rax)
 90f:	00 08                	add    %cl,(%rax)
 911:	00 00                	add    %al,(%rax)
 913:	00 00                	add    %al,(%rax)
 915:	00 00                	add    %al,(%rax)
 917:	00 f0                	add    %dh,%al
 919:	12 00                	adc    (%rax),%al
 91b:	00 00                	add    %al,(%rax)
 91d:	00 00                	add    %al,(%rax)
 91f:	00 f0                	add    %dh,%al
 921:	4c 00 00             	rex.WR add %r8b,(%rax)
 924:	00 00                	add    %al,(%rax)
 926:	00 00                	add    %al,(%rax)
 928:	08 00                	or     %al,(%rax)
 92a:	00 00                	add    %al,(%rax)
 92c:	00 00                	add    %al,(%rax)
 92e:	00 00                	add    %al,(%rax)
 930:	b0 12                	mov    $0x12,%al
 932:	00 00                	add    %al,(%rax)
 934:	00 00                	add    %al,(%rax)
 936:	00 00                	add    %al,(%rax)
 938:	08 50 00             	or     %dl,0x0(%rax)
 93b:	00 00                	add    %al,(%rax)
 93d:	00 00                	add    %al,(%rax)
 93f:	00 08                	add    %cl,(%rax)
 941:	00 00                	add    %al,(%rax)
 943:	00 00                	add    %al,(%rax)
 945:	00 00                	add    %al,(%rax)
 947:	00 08                	add    %cl,(%rax)
 949:	50                   	push   %rax
 94a:	00 00                	add    %al,(%rax)
 94c:	00 00                	add    %al,(%rax)
 94e:	00 00                	add    %al,(%rax)
 950:	58                   	pop    %rax
 951:	51                   	push   %rcx
 952:	00 00                	add    %al,(%rax)
 954:	00 00                	add    %al,(%rax)
 956:	00 00                	add    %al,(%rax)
 958:	08 00                	or     %al,(%rax)
 95a:	00 00                	add    %al,(%rax)
 95c:	00 00                	add    %al,(%rax)
 95e:	00 00                	add    %al,(%rax)
 960:	70 51                	jo     9b3 <_init-0x64d>
 962:	00 00                	add    %al,(%rax)
 964:	00 00                	add    %al,(%rax)
 966:	00 00                	add    %al,(%rax)
 968:	60                   	(bad)  
 969:	51                   	push   %rcx
 96a:	00 00                	add    %al,(%rax)
 96c:	00 00                	add    %al,(%rax)
 96e:	00 00                	add    %al,(%rax)
 970:	08 00                	or     %al,(%rax)
 972:	00 00                	add    %al,(%rax)
 974:	00 00                	add    %al,(%rax)
 976:	00 00                	add    %al,(%rax)
 978:	90                   	nop
 979:	51                   	push   %rcx
 97a:	00 00                	add    %al,(%rax)
 97c:	00 00                	add    %al,(%rax)
 97e:	00 00                	add    %al,(%rax)
 980:	78 51                	js     9d3 <_init-0x62d>
 982:	00 00                	add    %al,(%rax)
 984:	00 00                	add    %al,(%rax)
 986:	00 00                	add    %al,(%rax)
 988:	08 00                	or     %al,(%rax)
 98a:	00 00                	add    %al,(%rax)
 98c:	00 00                	add    %al,(%rax)
 98e:	00 00                	add    %al,(%rax)
 990:	f0 51                	lock push %rcx
 992:	00 00                	add    %al,(%rax)
 994:	00 00                	add    %al,(%rax)
 996:	00 00                	add    %al,(%rax)
 998:	80 51 00 00          	adcb   $0x0,0x0(%rcx)
 99c:	00 00                	add    %al,(%rax)
 99e:	00 00                	add    %al,(%rax)
 9a0:	08 00                	or     %al,(%rax)
 9a2:	00 00                	add    %al,(%rax)
 9a4:	00 00                	add    %al,(%rax)
 9a6:	00 00                	add    %al,(%rax)
 9a8:	b0 51                	mov    $0x51,%al
 9aa:	00 00                	add    %al,(%rax)
 9ac:	00 00                	add    %al,(%rax)
 9ae:	00 00                	add    %al,(%rax)
 9b0:	98                   	cwtl   
 9b1:	51                   	push   %rcx
 9b2:	00 00                	add    %al,(%rax)
 9b4:	00 00                	add    %al,(%rax)
 9b6:	00 00                	add    %al,(%rax)
 9b8:	08 00                	or     %al,(%rax)
 9ba:	00 00                	add    %al,(%rax)
 9bc:	00 00                	add    %al,(%rax)
 9be:	00 00                	add    %al,(%rax)
 9c0:	d0 51 00             	rclb   0x0(%rcx)
 9c3:	00 00                	add    %al,(%rax)
 9c5:	00 00                	add    %al,(%rax)
 9c7:	00 a0 51 00 00 00    	add    %ah,0x51(%rax)
 9cd:	00 00                	add    %al,(%rax)
 9cf:	00 08                	add    %cl,(%rax)
 9d1:	00 00                	add    %al,(%rax)
 9d3:	00 00                	add    %al,(%rax)
 9d5:	00 00                	add    %al,(%rax)
 9d7:	00 10                	add    %dl,(%rax)
 9d9:	52                   	push   %rdx
 9da:	00 00                	add    %al,(%rax)
 9dc:	00 00                	add    %al,(%rax)
 9de:	00 00                	add    %al,(%rax)
 9e0:	b8 51 00 00 00       	mov    $0x51,%eax
 9e5:	00 00                	add    %al,(%rax)
 9e7:	00 08                	add    %cl,(%rax)
 9e9:	00 00                	add    %al,(%rax)
 9eb:	00 00                	add    %al,(%rax)
 9ed:	00 00                	add    %al,(%rax)
 9ef:	00 b0 50 00 00 00    	add    %dh,0x50(%rax)
 9f5:	00 00                	add    %al,(%rax)
 9f7:	00 c0                	add    %al,%al
 9f9:	51                   	push   %rcx
 9fa:	00 00                	add    %al,(%rax)
 9fc:	00 00                	add    %al,(%rax)
 9fe:	00 00                	add    %al,(%rax)
 a00:	08 00                	or     %al,(%rax)
 a02:	00 00                	add    %al,(%rax)
 a04:	00 00                	add    %al,(%rax)
 a06:	00 00                	add    %al,(%rax)
 a08:	70 50                	jo     a5a <_init-0x5a6>
 a0a:	00 00                	add    %al,(%rax)
 a0c:	00 00                	add    %al,(%rax)
 a0e:	00 00                	add    %al,(%rax)
 a10:	d8 51 00             	fcoms  0x0(%rcx)
 a13:	00 00                	add    %al,(%rax)
 a15:	00 00                	add    %al,(%rax)
 a17:	00 08                	add    %cl,(%rax)
 a19:	00 00                	add    %al,(%rax)
 a1b:	00 00                	add    %al,(%rax)
 a1d:	00 00                	add    %al,(%rax)
 a1f:	00 10                	add    %dl,(%rax)
 a21:	50                   	push   %rax
 a22:	00 00                	add    %al,(%rax)
 a24:	00 00                	add    %al,(%rax)
 a26:	00 00                	add    %al,(%rax)
 a28:	e0 51                	loopne a7b <_init-0x585>
 a2a:	00 00                	add    %al,(%rax)
 a2c:	00 00                	add    %al,(%rax)
 a2e:	00 00                	add    %al,(%rax)
 a30:	08 00                	or     %al,(%rax)
 a32:	00 00                	add    %al,(%rax)
 a34:	00 00                	add    %al,(%rax)
 a36:	00 00                	add    %al,(%rax)
 a38:	d0 50 00             	rclb   0x0(%rax)
 a3b:	00 00                	add    %al,(%rax)
 a3d:	00 00                	add    %al,(%rax)
 a3f:	00 f8                	add    %bh,%al
 a41:	51                   	push   %rcx
 a42:	00 00                	add    %al,(%rax)
 a44:	00 00                	add    %al,(%rax)
 a46:	00 00                	add    %al,(%rax)
 a48:	08 00                	or     %al,(%rax)
 a4a:	00 00                	add    %al,(%rax)
 a4c:	00 00                	add    %al,(%rax)
 a4e:	00 00                	add    %al,(%rax)
 a50:	30 50 00             	xor    %dl,0x0(%rax)
 a53:	00 00                	add    %al,(%rax)
 a55:	00 00                	add    %al,(%rax)
 a57:	00 00                	add    %al,(%rax)
 a59:	52                   	push   %rdx
 a5a:	00 00                	add    %al,(%rax)
 a5c:	00 00                	add    %al,(%rax)
 a5e:	00 00                	add    %al,(%rax)
 a60:	08 00                	or     %al,(%rax)
 a62:	00 00                	add    %al,(%rax)
 a64:	00 00                	add    %al,(%rax)
 a66:	00 00                	add    %al,(%rax)
 a68:	90                   	nop
 a69:	50                   	push   %rax
 a6a:	00 00                	add    %al,(%rax)
 a6c:	00 00                	add    %al,(%rax)
 a6e:	00 00                	add    %al,(%rax)
 a70:	18 52 00             	sbb    %dl,0x0(%rdx)
 a73:	00 00                	add    %al,(%rax)
 a75:	00 00                	add    %al,(%rax)
 a77:	00 08                	add    %cl,(%rax)
 a79:	00 00                	add    %al,(%rax)
 a7b:	00 00                	add    %al,(%rax)
 a7d:	00 00                	add    %al,(%rax)
 a7f:	00 50 50             	add    %dl,0x50(%rax)
 a82:	00 00                	add    %al,(%rax)
 a84:	00 00                	add    %al,(%rax)
 a86:	00 00                	add    %al,(%rax)
 a88:	20 52 00             	and    %dl,0x0(%rdx)
 a8b:	00 00                	add    %al,(%rax)
 a8d:	00 00                	add    %al,(%rax)
 a8f:	00 08                	add    %cl,(%rax)
 a91:	00 00                	add    %al,(%rax)
 a93:	00 00                	add    %al,(%rax)
 a95:	00 00                	add    %al,(%rax)
 a97:	00 f0                	add    %dh,%al
 a99:	50                   	push   %rax
 a9a:	00 00                	add    %al,(%rax)
 a9c:	00 00                	add    %al,(%rax)
 a9e:	00 00                	add    %al,(%rax)
 aa0:	38 52 00             	cmp    %dl,0x0(%rdx)
 aa3:	00 00                	add    %al,(%rax)
 aa5:	00 00                	add    %al,(%rax)
 aa7:	00 08                	add    %cl,(%rax)
 aa9:	00 00                	add    %al,(%rax)
 aab:	00 00                	add    %al,(%rax)
 aad:	00 00                	add    %al,(%rax)
 aaf:	00 40 52             	add    %al,0x52(%rax)
 ab2:	00 00                	add    %al,(%rax)
 ab4:	00 00                	add    %al,(%rax)
 ab6:	00 00                	add    %al,(%rax)
 ab8:	48 52                	rex.W push %rdx
 aba:	00 00                	add    %al,(%rax)
 abc:	00 00                	add    %al,(%rax)
 abe:	00 00                	add    %al,(%rax)
 ac0:	08 00                	or     %al,(%rax)
 ac2:	00 00                	add    %al,(%rax)
 ac4:	00 00                	add    %al,(%rax)
 ac6:	00 00                	add    %al,(%rax)
 ac8:	50                   	push   %rax
 ac9:	52                   	push   %rdx
 aca:	00 00                	add    %al,(%rax)
 acc:	00 00                	add    %al,(%rax)
 ace:	00 00                	add    %al,(%rax)
 ad0:	58                   	pop    %rax
 ad1:	52                   	push   %rdx
 ad2:	00 00                	add    %al,(%rax)
 ad4:	00 00                	add    %al,(%rax)
 ad6:	00 00                	add    %al,(%rax)
 ad8:	08 00                	or     %al,(%rax)
 ada:	00 00                	add    %al,(%rax)
 adc:	00 00                	add    %al,(%rax)
 ade:	00 00                	add    %al,(%rax)
 ae0:	60                   	(bad)  
 ae1:	52                   	push   %rdx
 ae2:	00 00                	add    %al,(%rax)
 ae4:	00 00                	add    %al,(%rax)
 ae6:	00 00                	add    %al,(%rax)
 ae8:	68 52 00 00 00       	pushq  $0x52
 aed:	00 00                	add    %al,(%rax)
 aef:	00 08                	add    %cl,(%rax)
 af1:	00 00                	add    %al,(%rax)
 af3:	00 00                	add    %al,(%rax)
 af5:	00 00                	add    %al,(%rax)
 af7:	00 70 52             	add    %dh,0x52(%rax)
 afa:	00 00                	add    %al,(%rax)
 afc:	00 00                	add    %al,(%rax)
 afe:	00 00                	add    %al,(%rax)
 b00:	78 52                	js     b54 <_init-0x4ac>
 b02:	00 00                	add    %al,(%rax)
 b04:	00 00                	add    %al,(%rax)
 b06:	00 00                	add    %al,(%rax)
 b08:	08 00                	or     %al,(%rax)
 b0a:	00 00                	add    %al,(%rax)
 b0c:	00 00                	add    %al,(%rax)
 b0e:	00 00                	add    %al,(%rax)
 b10:	10 51 00             	adc    %dl,0x0(%rcx)
 b13:	00 00                	add    %al,(%rax)
 b15:	00 00                	add    %al,(%rax)
 b17:	00 d8                	add    %bl,%al
 b19:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 b1c:	00 00                	add    %al,(%rax)
 b1e:	00 00                	add    %al,(%rax)
 b20:	06                   	(bad)  
 b21:	00 00                	add    %al,(%rax)
 b23:	00 04 00             	add    %al,(%rax,%rax,1)
	...
 b2e:	00 00                	add    %al,(%rax)
 b30:	e0 4f                	loopne b81 <_init-0x47f>
 b32:	00 00                	add    %al,(%rax)
 b34:	00 00                	add    %al,(%rax)
 b36:	00 00                	add    %al,(%rax)
 b38:	06                   	(bad)  
 b39:	00 00                	add    %al,(%rax)
 b3b:	00 0c 00             	add    %cl,(%rax,%rax,1)
	...
 b46:	00 00                	add    %al,(%rax)
 b48:	e8 4f 00 00 00       	callq  b9c <_init-0x464>
 b4d:	00 00                	add    %al,(%rax)
 b4f:	00 06                	add    %al,(%rsi)
 b51:	00 00                	add    %al,(%rax)
 b53:	00 11                	add    %dl,(%rcx)
	...
 b5d:	00 00                	add    %al,(%rax)
 b5f:	00 f0                	add    %dh,%al
 b61:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 b64:	00 00                	add    %al,(%rax)
 b66:	00 00                	add    %al,(%rax)
 b68:	06                   	(bad)  
 b69:	00 00                	add    %al,(%rax)
 b6b:	00 1b                	add    %bl,(%rbx)
	...
 b75:	00 00                	add    %al,(%rax)
 b77:	00 f8                	add    %bh,%al
 b79:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 b7c:	00 00                	add    %al,(%rax)
 b7e:	00 00                	add    %al,(%rax)
 b80:	06                   	(bad)  
 b81:	00 00                	add    %al,(%rax)
 b83:	00 21                	add    %ah,(%rcx)
	...
 b8d:	00 00                	add    %al,(%rax)
 b8f:	00 80 52 00 00 00    	add    %al,0x52(%rax)
 b95:	00 00                	add    %al,(%rax)
 b97:	00 05 00 00 00 20    	add    %al,0x20000000(%rip)        # 20000b9d <_end+0x1fffae0d>
	...
 ba5:	00 00                	add    %al,(%rax)
 ba7:	00 90 52 00 00 00    	add    %dl,0x52(%rax)
 bad:	00 00                	add    %al,(%rax)
 baf:	00 05 00 00 00 22    	add    %al,0x22000000(%rip)        # 22000bb5 <_end+0x21ffae25>
	...
 bbd:	00 00                	add    %al,(%rax)
 bbf:	00 a0 52 00 00 00    	add    %ah,0x52(%rax)
 bc5:	00 00                	add    %al,(%rax)
 bc7:	00 05 00 00 00 23    	add    %al,0x23000000(%rip)        # 23000bcd <_end+0x22ffae3d>
	...

Desensamblado de la sección .rela.plt:

0000000000000bd8 <.rela.plt>:
 bd8:	00 4f 00             	add    %cl,0x0(%rdi)
 bdb:	00 00                	add    %al,(%rax)
 bdd:	00 00                	add    %al,(%rax)
 bdf:	00 07                	add    %al,(%rdi)
 be1:	00 00                	add    %al,(%rax)
 be3:	00 01                	add    %al,(%rcx)
	...
 bed:	00 00                	add    %al,(%rax)
 bef:	00 08                	add    %cl,(%rax)
 bf1:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 bf4:	00 00                	add    %al,(%rax)
 bf6:	00 00                	add    %al,(%rax)
 bf8:	07                   	(bad)  
 bf9:	00 00                	add    %al,(%rax)
 bfb:	00 02                	add    %al,(%rdx)
	...
 c05:	00 00                	add    %al,(%rax)
 c07:	00 10                	add    %dl,(%rax)
 c09:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 c0c:	00 00                	add    %al,(%rax)
 c0e:	00 00                	add    %al,(%rax)
 c10:	07                   	(bad)  
 c11:	00 00                	add    %al,(%rax)
 c13:	00 03                	add    %al,(%rbx)
	...
 c1d:	00 00                	add    %al,(%rax)
 c1f:	00 18                	add    %bl,(%rax)
 c21:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 c24:	00 00                	add    %al,(%rax)
 c26:	00 00                	add    %al,(%rax)
 c28:	07                   	(bad)  
 c29:	00 00                	add    %al,(%rax)
 c2b:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # c31 <_init-0x3cf>
 c31:	00 00                	add    %al,(%rax)
 c33:	00 00                	add    %al,(%rax)
 c35:	00 00                	add    %al,(%rax)
 c37:	00 20                	add    %ah,(%rax)
 c39:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 c3c:	00 00                	add    %al,(%rax)
 c3e:	00 00                	add    %al,(%rax)
 c40:	07                   	(bad)  
 c41:	00 00                	add    %al,(%rax)
 c43:	00 06                	add    %al,(%rsi)
	...
 c4d:	00 00                	add    %al,(%rax)
 c4f:	00 28                	add    %ch,(%rax)
 c51:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 c54:	00 00                	add    %al,(%rax)
 c56:	00 00                	add    %al,(%rax)
 c58:	07                   	(bad)  
 c59:	00 00                	add    %al,(%rax)
 c5b:	00 07                	add    %al,(%rdi)
	...
 c65:	00 00                	add    %al,(%rax)
 c67:	00 30                	add    %dh,(%rax)
 c69:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 c6c:	00 00                	add    %al,(%rax)
 c6e:	00 00                	add    %al,(%rax)
 c70:	07                   	(bad)  
 c71:	00 00                	add    %al,(%rax)
 c73:	00 08                	add    %cl,(%rax)
	...
 c7d:	00 00                	add    %al,(%rax)
 c7f:	00 38                	add    %bh,(%rax)
 c81:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 c84:	00 00                	add    %al,(%rax)
 c86:	00 00                	add    %al,(%rax)
 c88:	07                   	(bad)  
 c89:	00 00                	add    %al,(%rax)
 c8b:	00 09                	add    %cl,(%rcx)
	...
 c95:	00 00                	add    %al,(%rax)
 c97:	00 40 4f             	add    %al,0x4f(%rax)
 c9a:	00 00                	add    %al,(%rax)
 c9c:	00 00                	add    %al,(%rax)
 c9e:	00 00                	add    %al,(%rax)
 ca0:	07                   	(bad)  
 ca1:	00 00                	add    %al,(%rax)
 ca3:	00 0a                	add    %cl,(%rdx)
	...
 cad:	00 00                	add    %al,(%rax)
 caf:	00 48 4f             	add    %cl,0x4f(%rax)
 cb2:	00 00                	add    %al,(%rax)
 cb4:	00 00                	add    %al,(%rax)
 cb6:	00 00                	add    %al,(%rax)
 cb8:	07                   	(bad)  
 cb9:	00 00                	add    %al,(%rax)
 cbb:	00 0b                	add    %cl,(%rbx)
	...
 cc5:	00 00                	add    %al,(%rax)
 cc7:	00 50 4f             	add    %dl,0x4f(%rax)
 cca:	00 00                	add    %al,(%rax)
 ccc:	00 00                	add    %al,(%rax)
 cce:	00 00                	add    %al,(%rax)
 cd0:	07                   	(bad)  
 cd1:	00 00                	add    %al,(%rax)
 cd3:	00 0d 00 00 00 00    	add    %cl,0x0(%rip)        # cd9 <_init-0x327>
 cd9:	00 00                	add    %al,(%rax)
 cdb:	00 00                	add    %al,(%rax)
 cdd:	00 00                	add    %al,(%rax)
 cdf:	00 58 4f             	add    %bl,0x4f(%rax)
 ce2:	00 00                	add    %al,(%rax)
 ce4:	00 00                	add    %al,(%rax)
 ce6:	00 00                	add    %al,(%rax)
 ce8:	07                   	(bad)  
 ce9:	00 00                	add    %al,(%rax)
 ceb:	00 0e                	add    %cl,(%rsi)
	...
 cf5:	00 00                	add    %al,(%rax)
 cf7:	00 60 4f             	add    %ah,0x4f(%rax)
 cfa:	00 00                	add    %al,(%rax)
 cfc:	00 00                	add    %al,(%rax)
 cfe:	00 00                	add    %al,(%rax)
 d00:	07                   	(bad)  
 d01:	00 00                	add    %al,(%rax)
 d03:	00 0f                	add    %cl,(%rdi)
	...
 d0d:	00 00                	add    %al,(%rax)
 d0f:	00 68 4f             	add    %ch,0x4f(%rax)
 d12:	00 00                	add    %al,(%rax)
 d14:	00 00                	add    %al,(%rax)
 d16:	00 00                	add    %al,(%rax)
 d18:	07                   	(bad)  
 d19:	00 00                	add    %al,(%rax)
 d1b:	00 10                	add    %dl,(%rax)
	...
 d25:	00 00                	add    %al,(%rax)
 d27:	00 70 4f             	add    %dh,0x4f(%rax)
 d2a:	00 00                	add    %al,(%rax)
 d2c:	00 00                	add    %al,(%rax)
 d2e:	00 00                	add    %al,(%rax)
 d30:	07                   	(bad)  
 d31:	00 00                	add    %al,(%rax)
 d33:	00 12                	add    %dl,(%rdx)
	...
 d3d:	00 00                	add    %al,(%rax)
 d3f:	00 78 4f             	add    %bh,0x4f(%rax)
 d42:	00 00                	add    %al,(%rax)
 d44:	00 00                	add    %al,(%rax)
 d46:	00 00                	add    %al,(%rax)
 d48:	07                   	(bad)  
 d49:	00 00                	add    %al,(%rax)
 d4b:	00 13                	add    %dl,(%rbx)
	...
 d55:	00 00                	add    %al,(%rax)
 d57:	00 80 4f 00 00 00    	add    %al,0x4f(%rax)
 d5d:	00 00                	add    %al,(%rax)
 d5f:	00 07                	add    %al,(%rdi)
 d61:	00 00                	add    %al,(%rax)
 d63:	00 14 00             	add    %dl,(%rax,%rax,1)
	...
 d6e:	00 00                	add    %al,(%rax)
 d70:	88 4f 00             	mov    %cl,0x0(%rdi)
 d73:	00 00                	add    %al,(%rax)
 d75:	00 00                	add    %al,(%rax)
 d77:	00 07                	add    %al,(%rdi)
 d79:	00 00                	add    %al,(%rax)
 d7b:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # d81 <_init-0x27f>
 d81:	00 00                	add    %al,(%rax)
 d83:	00 00                	add    %al,(%rax)
 d85:	00 00                	add    %al,(%rax)
 d87:	00 90 4f 00 00 00    	add    %dl,0x4f(%rax)
 d8d:	00 00                	add    %al,(%rax)
 d8f:	00 07                	add    %al,(%rdi)
 d91:	00 00                	add    %al,(%rax)
 d93:	00 16                	add    %dl,(%rsi)
	...
 d9d:	00 00                	add    %al,(%rax)
 d9f:	00 98 4f 00 00 00    	add    %bl,0x4f(%rax)
 da5:	00 00                	add    %al,(%rax)
 da7:	00 07                	add    %al,(%rdi)
 da9:	00 00                	add    %al,(%rax)
 dab:	00 17                	add    %dl,(%rdi)
	...
 db5:	00 00                	add    %al,(%rax)
 db7:	00 a0 4f 00 00 00    	add    %ah,0x4f(%rax)
 dbd:	00 00                	add    %al,(%rax)
 dbf:	00 07                	add    %al,(%rdi)
 dc1:	00 00                	add    %al,(%rax)
 dc3:	00 18                	add    %bl,(%rax)
	...
 dcd:	00 00                	add    %al,(%rax)
 dcf:	00 a8 4f 00 00 00    	add    %ch,0x4f(%rax)
 dd5:	00 00                	add    %al,(%rax)
 dd7:	00 07                	add    %al,(%rdi)
 dd9:	00 00                	add    %al,(%rax)
 ddb:	00 19                	add    %bl,(%rcx)
	...
 de5:	00 00                	add    %al,(%rax)
 de7:	00 b0 4f 00 00 00    	add    %dh,0x4f(%rax)
 ded:	00 00                	add    %al,(%rax)
 def:	00 07                	add    %al,(%rdi)
 df1:	00 00                	add    %al,(%rax)
 df3:	00 1a                	add    %bl,(%rdx)
	...
 dfd:	00 00                	add    %al,(%rax)
 dff:	00 b8 4f 00 00 00    	add    %bh,0x4f(%rax)
 e05:	00 00                	add    %al,(%rax)
 e07:	00 07                	add    %al,(%rdi)
 e09:	00 00                	add    %al,(%rax)
 e0b:	00 1c 00             	add    %bl,(%rax,%rax,1)
	...
 e16:	00 00                	add    %al,(%rax)
 e18:	c0 4f 00 00          	rorb   $0x0,0x0(%rdi)
 e1c:	00 00                	add    %al,(%rax)
 e1e:	00 00                	add    %al,(%rax)
 e20:	07                   	(bad)  
 e21:	00 00                	add    %al,(%rax)
 e23:	00 1d 00 00 00 00    	add    %bl,0x0(%rip)        # e29 <_init-0x1d7>
 e29:	00 00                	add    %al,(%rax)
 e2b:	00 00                	add    %al,(%rax)
 e2d:	00 00                	add    %al,(%rax)
 e2f:	00 c8                	add    %cl,%al
 e31:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 e34:	00 00                	add    %al,(%rax)
 e36:	00 00                	add    %al,(%rax)
 e38:	07                   	(bad)  
 e39:	00 00                	add    %al,(%rax)
 e3b:	00 1e                	add    %bl,(%rsi)
	...
 e45:	00 00                	add    %al,(%rax)
 e47:	00 d0                	add    %dl,%al
 e49:	4f 00 00             	rex.WRXB add %r8b,(%r8)
 e4c:	00 00                	add    %al,(%rax)
 e4e:	00 00                	add    %al,(%rax)
 e50:	07                   	(bad)  
 e51:	00 00                	add    %al,(%rax)
 e53:	00 1f                	add    %bl,(%rdi)
	...

Desensamblado de la sección .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 3f 00 00 	mov    0x3fd9(%rip),%rax        # 4fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Desensamblado de la sección .plt:

0000000000001020 <.plt>:
    1020:	ff 35 ca 3e 00 00    	pushq  0x3eca(%rip)        # 4ef0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 3e 00 00    	jmpq   *0x3ecc(%rip)        # 4ef8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <getenv@plt>:
    1030:	ff 25 ca 3e 00 00    	jmpq   *0x3eca(%rip)        # 4f00 <getenv@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	pushq  $0x0
    103b:	e9 e0 ff ff ff       	jmpq   1020 <.plt>

0000000000001040 <strcasecmp@plt>:
    1040:	ff 25 c2 3e 00 00    	jmpq   *0x3ec2(%rip)        # 4f08 <strcasecmp@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	pushq  $0x1
    104b:	e9 d0 ff ff ff       	jmpq   1020 <.plt>

0000000000001050 <__errno_location@plt>:
    1050:	ff 25 ba 3e 00 00    	jmpq   *0x3eba(%rip)        # 4f10 <__errno_location@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	pushq  $0x2
    105b:	e9 c0 ff ff ff       	jmpq   1020 <.plt>

0000000000001060 <strcpy@plt>:
    1060:	ff 25 b2 3e 00 00    	jmpq   *0x3eb2(%rip)        # 4f18 <strcpy@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	pushq  $0x3
    106b:	e9 b0 ff ff ff       	jmpq   1020 <.plt>

0000000000001070 <puts@plt>:
    1070:	ff 25 aa 3e 00 00    	jmpq   *0x3eaa(%rip)        # 4f20 <puts@GLIBC_2.2.5>
    1076:	68 04 00 00 00       	pushq  $0x4
    107b:	e9 a0 ff ff ff       	jmpq   1020 <.plt>

0000000000001080 <write@plt>:
    1080:	ff 25 a2 3e 00 00    	jmpq   *0x3ea2(%rip)        # 4f28 <write@GLIBC_2.2.5>
    1086:	68 05 00 00 00       	pushq  $0x5
    108b:	e9 90 ff ff ff       	jmpq   1020 <.plt>

0000000000001090 <__stack_chk_fail@plt>:
    1090:	ff 25 9a 3e 00 00    	jmpq   *0x3e9a(%rip)        # 4f30 <__stack_chk_fail@GLIBC_2.4>
    1096:	68 06 00 00 00       	pushq  $0x6
    109b:	e9 80 ff ff ff       	jmpq   1020 <.plt>

00000000000010a0 <alarm@plt>:
    10a0:	ff 25 92 3e 00 00    	jmpq   *0x3e92(%rip)        # 4f38 <alarm@GLIBC_2.2.5>
    10a6:	68 07 00 00 00       	pushq  $0x7
    10ab:	e9 70 ff ff ff       	jmpq   1020 <.plt>

00000000000010b0 <close@plt>:
    10b0:	ff 25 8a 3e 00 00    	jmpq   *0x3e8a(%rip)        # 4f40 <close@GLIBC_2.2.5>
    10b6:	68 08 00 00 00       	pushq  $0x8
    10bb:	e9 60 ff ff ff       	jmpq   1020 <.plt>

00000000000010c0 <read@plt>:
    10c0:	ff 25 82 3e 00 00    	jmpq   *0x3e82(%rip)        # 4f48 <read@GLIBC_2.2.5>
    10c6:	68 09 00 00 00       	pushq  $0x9
    10cb:	e9 50 ff ff ff       	jmpq   1020 <.plt>

00000000000010d0 <fgets@plt>:
    10d0:	ff 25 7a 3e 00 00    	jmpq   *0x3e7a(%rip)        # 4f50 <fgets@GLIBC_2.2.5>
    10d6:	68 0a 00 00 00       	pushq  $0xa
    10db:	e9 40 ff ff ff       	jmpq   1020 <.plt>

00000000000010e0 <signal@plt>:
    10e0:	ff 25 72 3e 00 00    	jmpq   *0x3e72(%rip)        # 4f58 <signal@GLIBC_2.2.5>
    10e6:	68 0b 00 00 00       	pushq  $0xb
    10eb:	e9 30 ff ff ff       	jmpq   1020 <.plt>

00000000000010f0 <gethostbyname@plt>:
    10f0:	ff 25 6a 3e 00 00    	jmpq   *0x3e6a(%rip)        # 4f60 <gethostbyname@GLIBC_2.2.5>
    10f6:	68 0c 00 00 00       	pushq  $0xc
    10fb:	e9 20 ff ff ff       	jmpq   1020 <.plt>

0000000000001100 <__memmove_chk@plt>:
    1100:	ff 25 62 3e 00 00    	jmpq   *0x3e62(%rip)        # 4f68 <__memmove_chk@GLIBC_2.3.4>
    1106:	68 0d 00 00 00       	pushq  $0xd
    110b:	e9 10 ff ff ff       	jmpq   1020 <.plt>

0000000000001110 <strtol@plt>:
    1110:	ff 25 5a 3e 00 00    	jmpq   *0x3e5a(%rip)        # 4f70 <strtol@GLIBC_2.2.5>
    1116:	68 0e 00 00 00       	pushq  $0xe
    111b:	e9 00 ff ff ff       	jmpq   1020 <.plt>

0000000000001120 <fflush@plt>:
    1120:	ff 25 52 3e 00 00    	jmpq   *0x3e52(%rip)        # 4f78 <fflush@GLIBC_2.2.5>
    1126:	68 0f 00 00 00       	pushq  $0xf
    112b:	e9 f0 fe ff ff       	jmpq   1020 <.plt>

0000000000001130 <__isoc99_sscanf@plt>:
    1130:	ff 25 4a 3e 00 00    	jmpq   *0x3e4a(%rip)        # 4f80 <__isoc99_sscanf@GLIBC_2.7>
    1136:	68 10 00 00 00       	pushq  $0x10
    113b:	e9 e0 fe ff ff       	jmpq   1020 <.plt>

0000000000001140 <__printf_chk@plt>:
    1140:	ff 25 42 3e 00 00    	jmpq   *0x3e42(%rip)        # 4f88 <__printf_chk@GLIBC_2.3.4>
    1146:	68 11 00 00 00       	pushq  $0x11
    114b:	e9 d0 fe ff ff       	jmpq   1020 <.plt>

0000000000001150 <fopen@plt>:
    1150:	ff 25 3a 3e 00 00    	jmpq   *0x3e3a(%rip)        # 4f90 <fopen@GLIBC_2.2.5>
    1156:	68 12 00 00 00       	pushq  $0x12
    115b:	e9 c0 fe ff ff       	jmpq   1020 <.plt>

0000000000001160 <gethostname@plt>:
    1160:	ff 25 32 3e 00 00    	jmpq   *0x3e32(%rip)        # 4f98 <gethostname@GLIBC_2.2.5>
    1166:	68 13 00 00 00       	pushq  $0x13
    116b:	e9 b0 fe ff ff       	jmpq   1020 <.plt>

0000000000001170 <exit@plt>:
    1170:	ff 25 2a 3e 00 00    	jmpq   *0x3e2a(%rip)        # 4fa0 <exit@GLIBC_2.2.5>
    1176:	68 14 00 00 00       	pushq  $0x14
    117b:	e9 a0 fe ff ff       	jmpq   1020 <.plt>

0000000000001180 <connect@plt>:
    1180:	ff 25 22 3e 00 00    	jmpq   *0x3e22(%rip)        # 4fa8 <connect@GLIBC_2.2.5>
    1186:	68 15 00 00 00       	pushq  $0x15
    118b:	e9 90 fe ff ff       	jmpq   1020 <.plt>

0000000000001190 <__fprintf_chk@plt>:
    1190:	ff 25 1a 3e 00 00    	jmpq   *0x3e1a(%rip)        # 4fb0 <__fprintf_chk@GLIBC_2.3.4>
    1196:	68 16 00 00 00       	pushq  $0x16
    119b:	e9 80 fe ff ff       	jmpq   1020 <.plt>

00000000000011a0 <sleep@plt>:
    11a0:	ff 25 12 3e 00 00    	jmpq   *0x3e12(%rip)        # 4fb8 <sleep@GLIBC_2.2.5>
    11a6:	68 17 00 00 00       	pushq  $0x17
    11ab:	e9 70 fe ff ff       	jmpq   1020 <.plt>

00000000000011b0 <__ctype_b_loc@plt>:
    11b0:	ff 25 0a 3e 00 00    	jmpq   *0x3e0a(%rip)        # 4fc0 <__ctype_b_loc@GLIBC_2.3>
    11b6:	68 18 00 00 00       	pushq  $0x18
    11bb:	e9 60 fe ff ff       	jmpq   1020 <.plt>

00000000000011c0 <__sprintf_chk@plt>:
    11c0:	ff 25 02 3e 00 00    	jmpq   *0x3e02(%rip)        # 4fc8 <__sprintf_chk@GLIBC_2.3.4>
    11c6:	68 19 00 00 00       	pushq  $0x19
    11cb:	e9 50 fe ff ff       	jmpq   1020 <.plt>

00000000000011d0 <socket@plt>:
    11d0:	ff 25 fa 3d 00 00    	jmpq   *0x3dfa(%rip)        # 4fd0 <socket@GLIBC_2.2.5>
    11d6:	68 1a 00 00 00       	pushq  $0x1a
    11db:	e9 40 fe ff ff       	jmpq   1020 <.plt>

Desensamblado de la sección .plt.got:

00000000000011e0 <__cxa_finalize@plt>:
    11e0:	ff 25 12 3e 00 00    	jmpq   *0x3e12(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    11e6:	66 90                	xchg   %ax,%ax

Desensamblado de la sección .text:

00000000000011f0 <_start>:
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	31 ed                	xor    %ebp,%ebp
    11f6:	49 89 d1             	mov    %rdx,%r9
    11f9:	5e                   	pop    %rsi
    11fa:	48 89 e2             	mov    %rsp,%rdx
    11fd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1201:	50                   	push   %rax
    1202:	54                   	push   %rsp
    1203:	4c 8d 05 06 19 00 00 	lea    0x1906(%rip),%r8        # 2b10 <__libc_csu_fini>
    120a:	48 8d 0d 8f 18 00 00 	lea    0x188f(%rip),%rcx        # 2aa0 <__libc_csu_init>
    1211:	48 8d 3d e2 00 00 00 	lea    0xe2(%rip),%rdi        # 12fa <main>
    1218:	ff 15 c2 3d 00 00    	callq  *0x3dc2(%rip)        # 4fe0 <__libc_start_main@GLIBC_2.2.5>
    121e:	f4                   	hlt    
    121f:	90                   	nop

0000000000001220 <deregister_tm_clones>:
    1220:	48 8d 3d 59 40 00 00 	lea    0x4059(%rip),%rdi        # 5280 <stdout@@GLIBC_2.2.5>
    1227:	55                   	push   %rbp
    1228:	48 8d 05 51 40 00 00 	lea    0x4051(%rip),%rax        # 5280 <stdout@@GLIBC_2.2.5>
    122f:	48 39 f8             	cmp    %rdi,%rax
    1232:	48 89 e5             	mov    %rsp,%rbp
    1235:	74 19                	je     1250 <deregister_tm_clones+0x30>
    1237:	48 8b 05 9a 3d 00 00 	mov    0x3d9a(%rip),%rax        # 4fd8 <_ITM_deregisterTMCloneTable>
    123e:	48 85 c0             	test   %rax,%rax
    1241:	74 0d                	je     1250 <deregister_tm_clones+0x30>
    1243:	5d                   	pop    %rbp
    1244:	ff e0                	jmpq   *%rax
    1246:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    124d:	00 00 00 
    1250:	5d                   	pop    %rbp
    1251:	c3                   	retq   
    1252:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    1259:	00 00 00 00 
    125d:	0f 1f 00             	nopl   (%rax)

0000000000001260 <register_tm_clones>:
    1260:	48 8d 3d 19 40 00 00 	lea    0x4019(%rip),%rdi        # 5280 <stdout@@GLIBC_2.2.5>
    1267:	48 8d 35 12 40 00 00 	lea    0x4012(%rip),%rsi        # 5280 <stdout@@GLIBC_2.2.5>
    126e:	55                   	push   %rbp
    126f:	48 29 fe             	sub    %rdi,%rsi
    1272:	48 89 e5             	mov    %rsp,%rbp
    1275:	48 c1 fe 03          	sar    $0x3,%rsi
    1279:	48 89 f0             	mov    %rsi,%rax
    127c:	48 c1 e8 3f          	shr    $0x3f,%rax
    1280:	48 01 c6             	add    %rax,%rsi
    1283:	48 d1 fe             	sar    %rsi
    1286:	74 18                	je     12a0 <register_tm_clones+0x40>
    1288:	48 8b 05 61 3d 00 00 	mov    0x3d61(%rip),%rax        # 4ff0 <_ITM_registerTMCloneTable>
    128f:	48 85 c0             	test   %rax,%rax
    1292:	74 0c                	je     12a0 <register_tm_clones+0x40>
    1294:	5d                   	pop    %rbp
    1295:	ff e0                	jmpq   *%rax
    1297:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    129e:	00 00 
    12a0:	5d                   	pop    %rbp
    12a1:	c3                   	retq   
    12a2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    12a9:	00 00 00 00 
    12ad:	0f 1f 00             	nopl   (%rax)

00000000000012b0 <__do_global_dtors_aux>:
    12b0:	80 3d f1 3f 00 00 00 	cmpb   $0x0,0x3ff1(%rip)        # 52a8 <completed.7658>
    12b7:	75 2f                	jne    12e8 <__do_global_dtors_aux+0x38>
    12b9:	48 83 3d 37 3d 00 00 	cmpq   $0x0,0x3d37(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    12c0:	00 
    12c1:	55                   	push   %rbp
    12c2:	48 89 e5             	mov    %rsp,%rbp
    12c5:	74 0c                	je     12d3 <__do_global_dtors_aux+0x23>
    12c7:	48 8b 3d 3a 3d 00 00 	mov    0x3d3a(%rip),%rdi        # 5008 <__dso_handle>
    12ce:	e8 0d ff ff ff       	callq  11e0 <__cxa_finalize@plt>
    12d3:	e8 48 ff ff ff       	callq  1220 <deregister_tm_clones>
    12d8:	c6 05 c9 3f 00 00 01 	movb   $0x1,0x3fc9(%rip)        # 52a8 <completed.7658>
    12df:	5d                   	pop    %rbp
    12e0:	c3                   	retq   
    12e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    12e8:	f3 c3                	repz retq 
    12ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000012f0 <frame_dummy>:
    12f0:	55                   	push   %rbp
    12f1:	48 89 e5             	mov    %rsp,%rbp
    12f4:	5d                   	pop    %rbp
    12f5:	e9 66 ff ff ff       	jmpq   1260 <register_tm_clones>

00000000000012fa <main>:
    12fa:	53                   	push   %rbx
    12fb:	83 ff 01             	cmp    $0x1,%edi
    12fe:	0f 84 f8 00 00 00    	je     13fc <main+0x102>
    1304:	48 89 f3             	mov    %rsi,%rbx
    1307:	83 ff 02             	cmp    $0x2,%edi
    130a:	0f 85 21 01 00 00    	jne    1431 <main+0x137>
    1310:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    1314:	48 8d 35 c0 22 00 00 	lea    0x22c0(%rip),%rsi        # 35db <array.3340+0x3fb>
    131b:	e8 30 fe ff ff       	callq  1150 <fopen@plt>
    1320:	48 89 05 b9 43 00 00 	mov    %rax,0x43b9(%rip)        # 56e0 <infile>
    1327:	48 85 c0             	test   %rax,%rax
    132a:	0f 84 df 00 00 00    	je     140f <main+0x115>
    1330:	e8 60 06 00 00       	callq  1995 <initialize_bomb>
    1335:	48 8d 3d 4c 1d 00 00 	lea    0x1d4c(%rip),%rdi        # 3088 <_IO_stdin_used+0x88>
    133c:	e8 2f fd ff ff       	callq  1070 <puts@plt>
    1341:	48 8d 3d 80 1d 00 00 	lea    0x1d80(%rip),%rdi        # 30c8 <_IO_stdin_used+0xc8>
    1348:	e8 23 fd ff ff       	callq  1070 <puts@plt>
    134d:	e8 6c 09 00 00       	callq  1cbe <read_line>
    1352:	48 89 c7             	mov    %rax,%rdi
    1355:	e8 fa 00 00 00       	callq  1454 <phase_1>
    135a:	e8 a3 0a 00 00       	callq  1e02 <phase_defused>
    135f:	48 8d 3d 92 1d 00 00 	lea    0x1d92(%rip),%rdi        # 30f8 <_IO_stdin_used+0xf8>
    1366:	e8 05 fd ff ff       	callq  1070 <puts@plt>
    136b:	e8 4e 09 00 00       	callq  1cbe <read_line>
    1370:	48 89 c7             	mov    %rax,%rdi
    1373:	e8 fc 00 00 00       	callq  1474 <phase_2>
    1378:	e8 85 0a 00 00       	callq  1e02 <phase_defused>
    137d:	48 8d 3d b7 1c 00 00 	lea    0x1cb7(%rip),%rdi        # 303b <_IO_stdin_used+0x3b>
    1384:	e8 e7 fc ff ff       	callq  1070 <puts@plt>
    1389:	e8 30 09 00 00       	callq  1cbe <read_line>
    138e:	48 89 c7             	mov    %rax,%rdi
    1391:	e8 4d 01 00 00       	callq  14e3 <phase_3>
    1396:	e8 67 0a 00 00       	callq  1e02 <phase_defused>
    139b:	48 8d 3d b7 1c 00 00 	lea    0x1cb7(%rip),%rdi        # 3059 <_IO_stdin_used+0x59>
    13a2:	e8 c9 fc ff ff       	callq  1070 <puts@plt>
    13a7:	e8 12 09 00 00       	callq  1cbe <read_line>
    13ac:	48 89 c7             	mov    %rax,%rdi
    13af:	e8 49 02 00 00       	callq  15fd <phase_4>
    13b4:	e8 49 0a 00 00       	callq  1e02 <phase_defused>
    13b9:	48 8d 3d 68 1d 00 00 	lea    0x1d68(%rip),%rdi        # 3128 <_IO_stdin_used+0x128>
    13c0:	e8 ab fc ff ff       	callq  1070 <puts@plt>
    13c5:	e8 f4 08 00 00       	callq  1cbe <read_line>
    13ca:	48 89 c7             	mov    %rax,%rdi
    13cd:	e8 9a 02 00 00       	callq  166c <phase_5>
    13d2:	e8 2b 0a 00 00       	callq  1e02 <phase_defused>
    13d7:	48 8d 3d 8a 1c 00 00 	lea    0x1c8a(%rip),%rdi        # 3068 <_IO_stdin_used+0x68>
    13de:	e8 8d fc ff ff       	callq  1070 <puts@plt>
    13e3:	e8 d6 08 00 00       	callq  1cbe <read_line>
    13e8:	48 89 c7             	mov    %rax,%rdi
    13eb:	e8 c2 02 00 00       	callq  16b2 <phase_6>
    13f0:	e8 0d 0a 00 00       	callq  1e02 <phase_defused>
    13f5:	b8 00 00 00 00       	mov    $0x0,%eax
    13fa:	5b                   	pop    %rbx
    13fb:	c3                   	retq   
    13fc:	48 8b 05 8d 3e 00 00 	mov    0x3e8d(%rip),%rax        # 5290 <stdin@@GLIBC_2.2.5>
    1403:	48 89 05 d6 42 00 00 	mov    %rax,0x42d6(%rip)        # 56e0 <infile>
    140a:	e9 21 ff ff ff       	jmpq   1330 <main+0x36>
    140f:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
    1413:	48 8b 13             	mov    (%rbx),%rdx
    1416:	48 8d 35 e7 1b 00 00 	lea    0x1be7(%rip),%rsi        # 3004 <_IO_stdin_used+0x4>
    141d:	bf 01 00 00 00       	mov    $0x1,%edi
    1422:	e8 19 fd ff ff       	callq  1140 <__printf_chk@plt>
    1427:	bf 08 00 00 00       	mov    $0x8,%edi
    142c:	e8 3f fd ff ff       	callq  1170 <exit@plt>
    1431:	48 8b 16             	mov    (%rsi),%rdx
    1434:	48 8d 35 e6 1b 00 00 	lea    0x1be6(%rip),%rsi        # 3021 <_IO_stdin_used+0x21>
    143b:	bf 01 00 00 00       	mov    $0x1,%edi
    1440:	b8 00 00 00 00       	mov    $0x0,%eax
    1445:	e8 f6 fc ff ff       	callq  1140 <__printf_chk@plt>
    144a:	bf 08 00 00 00       	mov    $0x8,%edi
    144f:	e8 1c fd ff ff       	callq  1170 <exit@plt>

0000000000001454 <phase_1>:
    1454:	48 83 ec 08          	sub    $0x8,%rsp
    1458:	48 8d 35 f1 1c 00 00 	lea    0x1cf1(%rip),%rsi        # 3150 <_IO_stdin_used+0x150>
    145f:	e8 ca 04 00 00       	callq  192e <strings_not_equal>
    1464:	85 c0                	test   %eax,%eax
    1466:	75 05                	jne    146d <phase_1+0x19>
    1468:	48 83 c4 08          	add    $0x8,%rsp
    146c:	c3                   	retq   
    146d:	e8 cf 07 00 00       	callq  1c41 <explode_bomb>
    1472:	eb f4                	jmp    1468 <phase_1+0x14>

0000000000001474 <phase_2>:
    1474:	55                   	push   %rbp
    1475:	53                   	push   %rbx
    1476:	48 83 ec 28          	sub    $0x28,%rsp
    147a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1481:	00 00 
    1483:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1488:	31 c0                	xor    %eax,%eax
    148a:	48 89 e6             	mov    %rsp,%rsi
    148d:	e8 eb 07 00 00       	callq  1c7d <read_six_numbers>
    1492:	83 3c 24 00          	cmpl   $0x0,(%rsp)
    1496:	75 07                	jne    149f <phase_2+0x2b>
    1498:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
    149d:	74 05                	je     14a4 <phase_2+0x30>
    149f:	e8 9d 07 00 00       	callq  1c41 <explode_bomb>
    14a4:	48 89 e3             	mov    %rsp,%rbx
    14a7:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
    14ab:	eb 09                	jmp    14b6 <phase_2+0x42>
    14ad:	48 83 c3 04          	add    $0x4,%rbx
    14b1:	48 39 eb             	cmp    %rbp,%rbx
    14b4:	74 11                	je     14c7 <phase_2+0x53>
    14b6:	8b 43 04             	mov    0x4(%rbx),%eax
    14b9:	03 03                	add    (%rbx),%eax
    14bb:	39 43 08             	cmp    %eax,0x8(%rbx)
    14be:	74 ed                	je     14ad <phase_2+0x39>
    14c0:	e8 7c 07 00 00       	callq  1c41 <explode_bomb>
    14c5:	eb e6                	jmp    14ad <phase_2+0x39>
    14c7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    14cc:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    14d3:	00 00 
    14d5:	75 07                	jne    14de <phase_2+0x6a>
    14d7:	48 83 c4 28          	add    $0x28,%rsp
    14db:	5b                   	pop    %rbx
    14dc:	5d                   	pop    %rbp
    14dd:	c3                   	retq   
    14de:	e8 ad fb ff ff       	callq  1090 <__stack_chk_fail@plt>

00000000000014e3 <phase_3>:
    14e3:	48 83 ec 18          	sub    $0x18,%rsp
    14e7:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    14ee:	00 00 
    14f0:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    14f5:	31 c0                	xor    %eax,%eax
    14f7:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
    14fc:	48 89 e2             	mov    %rsp,%rdx
    14ff:	48 8d 35 67 1f 00 00 	lea    0x1f67(%rip),%rsi        # 346d <array.3340+0x28d>
    1506:	e8 25 fc ff ff       	callq  1130 <__isoc99_sscanf@plt>
    150b:	83 f8 01             	cmp    $0x1,%eax
    150e:	7e 1d                	jle    152d <phase_3+0x4a>
    1510:	83 3c 24 07          	cmpl   $0x7,(%rsp)
    1514:	0f 87 99 00 00 00    	ja     15b3 <phase_3+0xd0>
    151a:	8b 04 24             	mov    (%rsp),%eax
    151d:	48 8d 15 9c 1c 00 00 	lea    0x1c9c(%rip),%rdx        # 31c0 <_IO_stdin_used+0x1c0>
    1524:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
    1528:	48 01 d0             	add    %rdx,%rax
    152b:	ff e0                	jmpq   *%rax
    152d:	e8 0f 07 00 00       	callq  1c41 <explode_bomb>
    1532:	eb dc                	jmp    1510 <phase_3+0x2d>
    1534:	b8 f9 01 00 00       	mov    $0x1f9,%eax
    1539:	eb 05                	jmp    1540 <phase_3+0x5d>
    153b:	b8 00 00 00 00       	mov    $0x0,%eax
    1540:	2d 65 02 00 00       	sub    $0x265,%eax
    1545:	05 ff 01 00 00       	add    $0x1ff,%eax
    154a:	2d bb 02 00 00       	sub    $0x2bb,%eax
    154f:	05 bb 02 00 00       	add    $0x2bb,%eax
    1554:	2d bb 02 00 00       	sub    $0x2bb,%eax
    1559:	05 bb 02 00 00       	add    $0x2bb,%eax
    155e:	2d bb 02 00 00       	sub    $0x2bb,%eax
    1563:	83 3c 24 05          	cmpl   $0x5,(%rsp)
    1567:	7f 06                	jg     156f <phase_3+0x8c>
    1569:	39 44 24 04          	cmp    %eax,0x4(%rsp)
    156d:	74 05                	je     1574 <phase_3+0x91>
    156f:	e8 cd 06 00 00       	callq  1c41 <explode_bomb>
    1574:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1579:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1580:	00 00 
    1582:	75 3b                	jne    15bf <phase_3+0xdc>
    1584:	48 83 c4 18          	add    $0x18,%rsp
    1588:	c3                   	retq   
    1589:	b8 00 00 00 00       	mov    $0x0,%eax
    158e:	eb b5                	jmp    1545 <phase_3+0x62>
    1590:	b8 00 00 00 00       	mov    $0x0,%eax
    1595:	eb b3                	jmp    154a <phase_3+0x67>
    1597:	b8 00 00 00 00       	mov    $0x0,%eax
    159c:	eb b1                	jmp    154f <phase_3+0x6c>
    159e:	b8 00 00 00 00       	mov    $0x0,%eax
    15a3:	eb af                	jmp    1554 <phase_3+0x71>
    15a5:	b8 00 00 00 00       	mov    $0x0,%eax
    15aa:	eb ad                	jmp    1559 <phase_3+0x76>
    15ac:	b8 00 00 00 00       	mov    $0x0,%eax
    15b1:	eb ab                	jmp    155e <phase_3+0x7b>
    15b3:	e8 89 06 00 00       	callq  1c41 <explode_bomb>
    15b8:	b8 00 00 00 00       	mov    $0x0,%eax
    15bd:	eb a4                	jmp    1563 <phase_3+0x80>
    15bf:	e8 cc fa ff ff       	callq  1090 <__stack_chk_fail@plt>

00000000000015c4 <func4>:
    15c4:	b8 00 00 00 00       	mov    $0x0,%eax
    15c9:	85 ff                	test   %edi,%edi
    15cb:	7e 07                	jle    15d4 <func4+0x10>
    15cd:	89 f0                	mov    %esi,%eax
    15cf:	83 ff 01             	cmp    $0x1,%edi
    15d2:	75 02                	jne    15d6 <func4+0x12>
    15d4:	f3 c3                	repz retq 
    15d6:	41 54                	push   %r12
    15d8:	55                   	push   %rbp
    15d9:	53                   	push   %rbx
    15da:	41 89 f4             	mov    %esi,%r12d
    15dd:	89 fb                	mov    %edi,%ebx
    15df:	8d 7f ff             	lea    -0x1(%rdi),%edi
    15e2:	e8 dd ff ff ff       	callq  15c4 <func4>
    15e7:	42 8d 2c 20          	lea    (%rax,%r12,1),%ebp
    15eb:	8d 7b fe             	lea    -0x2(%rbx),%edi
    15ee:	44 89 e6             	mov    %r12d,%esi
    15f1:	e8 ce ff ff ff       	callq  15c4 <func4>
    15f6:	01 e8                	add    %ebp,%eax
    15f8:	5b                   	pop    %rbx
    15f9:	5d                   	pop    %rbp
    15fa:	41 5c                	pop    %r12
    15fc:	c3                   	retq   

00000000000015fd <phase_4>:
    15fd:	48 83 ec 18          	sub    $0x18,%rsp
    1601:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1608:	00 00 
    160a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    160f:	31 c0                	xor    %eax,%eax
    1611:	48 89 e1             	mov    %rsp,%rcx
    1614:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
    1619:	48 8d 35 4d 1e 00 00 	lea    0x1e4d(%rip),%rsi        # 346d <array.3340+0x28d>
    1620:	e8 0b fb ff ff       	callq  1130 <__isoc99_sscanf@plt>
    1625:	83 f8 02             	cmp    $0x2,%eax
    1628:	75 0b                	jne    1635 <phase_4+0x38>
    162a:	8b 04 24             	mov    (%rsp),%eax
    162d:	83 e8 02             	sub    $0x2,%eax
    1630:	83 f8 02             	cmp    $0x2,%eax
    1633:	76 05                	jbe    163a <phase_4+0x3d>
    1635:	e8 07 06 00 00       	callq  1c41 <explode_bomb>
    163a:	8b 34 24             	mov    (%rsp),%esi
    163d:	bf 08 00 00 00       	mov    $0x8,%edi
    1642:	e8 7d ff ff ff       	callq  15c4 <func4>
    1647:	39 44 24 04          	cmp    %eax,0x4(%rsp)
    164b:	74 05                	je     1652 <phase_4+0x55>
    164d:	e8 ef 05 00 00       	callq  1c41 <explode_bomb>
    1652:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1657:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    165e:	00 00 
    1660:	75 05                	jne    1667 <phase_4+0x6a>
    1662:	48 83 c4 18          	add    $0x18,%rsp
    1666:	c3                   	retq   
    1667:	e8 24 fa ff ff       	callq  1090 <__stack_chk_fail@plt>

000000000000166c <phase_5>:
    166c:	53                   	push   %rbx
    166d:	48 89 fb             	mov    %rdi,%rbx
    1670:	e8 9c 02 00 00       	callq  1911 <string_length>
    1675:	83 f8 06             	cmp    $0x6,%eax
    1678:	75 31                	jne    16ab <phase_5+0x3f>
    167a:	48 89 d8             	mov    %rbx,%rax
    167d:	48 8d 7b 06          	lea    0x6(%rbx),%rdi
    1681:	b9 00 00 00 00       	mov    $0x0,%ecx
    1686:	48 8d 35 53 1b 00 00 	lea    0x1b53(%rip),%rsi        # 31e0 <array.3340>
    168d:	0f b6 10             	movzbl (%rax),%edx
    1690:	83 e2 0f             	and    $0xf,%edx
    1693:	03 0c 96             	add    (%rsi,%rdx,4),%ecx
    1696:	48 83 c0 01          	add    $0x1,%rax
    169a:	48 39 f8             	cmp    %rdi,%rax
    169d:	75 ee                	jne    168d <phase_5+0x21>
    169f:	83 f9 3e             	cmp    $0x3e,%ecx
    16a2:	74 05                	je     16a9 <phase_5+0x3d>
    16a4:	e8 98 05 00 00       	callq  1c41 <explode_bomb>
    16a9:	5b                   	pop    %rbx
    16aa:	c3                   	retq   
    16ab:	e8 91 05 00 00       	callq  1c41 <explode_bomb>
    16b0:	eb c8                	jmp    167a <phase_5+0xe>

00000000000016b2 <phase_6>:
    16b2:	41 56                	push   %r14
    16b4:	41 55                	push   %r13
    16b6:	41 54                	push   %r12
    16b8:	55                   	push   %rbp
    16b9:	53                   	push   %rbx
    16ba:	48 83 ec 60          	sub    $0x60,%rsp
    16be:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    16c5:	00 00 
    16c7:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    16cc:	31 c0                	xor    %eax,%eax
    16ce:	49 89 e5             	mov    %rsp,%r13
    16d1:	4c 89 ee             	mov    %r13,%rsi
    16d4:	e8 a4 05 00 00       	callq  1c7d <read_six_numbers>
    16d9:	4d 89 ec             	mov    %r13,%r12
    16dc:	41 be 00 00 00 00    	mov    $0x0,%r14d
    16e2:	eb 25                	jmp    1709 <phase_6+0x57>
    16e4:	e8 58 05 00 00       	callq  1c41 <explode_bomb>
    16e9:	eb 2d                	jmp    1718 <phase_6+0x66>
    16eb:	83 c3 01             	add    $0x1,%ebx
    16ee:	83 fb 05             	cmp    $0x5,%ebx
    16f1:	7f 12                	jg     1705 <phase_6+0x53>
    16f3:	48 63 c3             	movslq %ebx,%rax
    16f6:	8b 04 84             	mov    (%rsp,%rax,4),%eax
    16f9:	39 45 00             	cmp    %eax,0x0(%rbp)
    16fc:	75 ed                	jne    16eb <phase_6+0x39>
    16fe:	e8 3e 05 00 00       	callq  1c41 <explode_bomb>
    1703:	eb e6                	jmp    16eb <phase_6+0x39>
    1705:	49 83 c5 04          	add    $0x4,%r13
    1709:	4c 89 ed             	mov    %r13,%rbp
    170c:	41 8b 45 00          	mov    0x0(%r13),%eax
    1710:	83 e8 01             	sub    $0x1,%eax
    1713:	83 f8 05             	cmp    $0x5,%eax
    1716:	77 cc                	ja     16e4 <phase_6+0x32>
    1718:	41 83 c6 01          	add    $0x1,%r14d
    171c:	41 83 fe 06          	cmp    $0x6,%r14d
    1720:	74 05                	je     1727 <phase_6+0x75>
    1722:	44 89 f3             	mov    %r14d,%ebx
    1725:	eb cc                	jmp    16f3 <phase_6+0x41>
    1727:	49 8d 4c 24 18       	lea    0x18(%r12),%rcx
    172c:	ba 07 00 00 00       	mov    $0x7,%edx
    1731:	89 d0                	mov    %edx,%eax
    1733:	41 2b 04 24          	sub    (%r12),%eax
    1737:	41 89 04 24          	mov    %eax,(%r12)
    173b:	49 83 c4 04          	add    $0x4,%r12
    173f:	4c 39 e1             	cmp    %r12,%rcx
    1742:	75 ed                	jne    1731 <phase_6+0x7f>
    1744:	be 00 00 00 00       	mov    $0x0,%esi
    1749:	eb 1a                	jmp    1765 <phase_6+0xb3>
    174b:	48 8b 52 08          	mov    0x8(%rdx),%rdx
    174f:	83 c0 01             	add    $0x1,%eax
    1752:	39 c8                	cmp    %ecx,%eax
    1754:	75 f5                	jne    174b <phase_6+0x99>
    1756:	48 89 54 f4 20       	mov    %rdx,0x20(%rsp,%rsi,8)
    175b:	48 83 c6 01          	add    $0x1,%rsi
    175f:	48 83 fe 06          	cmp    $0x6,%rsi
    1763:	74 16                	je     177b <phase_6+0xc9>
    1765:	8b 0c b4             	mov    (%rsp,%rsi,4),%ecx
    1768:	b8 01 00 00 00       	mov    $0x1,%eax
    176d:	48 8d 15 bc 3a 00 00 	lea    0x3abc(%rip),%rdx        # 5230 <node1>
    1774:	83 f9 01             	cmp    $0x1,%ecx
    1777:	7f d2                	jg     174b <phase_6+0x99>
    1779:	eb db                	jmp    1756 <phase_6+0xa4>
    177b:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
    1780:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    1785:	48 89 43 08          	mov    %rax,0x8(%rbx)
    1789:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    178e:	48 89 50 08          	mov    %rdx,0x8(%rax)
    1792:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    1797:	48 89 42 08          	mov    %rax,0x8(%rdx)
    179b:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
    17a0:	48 89 50 08          	mov    %rdx,0x8(%rax)
    17a4:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    17a9:	48 89 42 08          	mov    %rax,0x8(%rdx)
    17ad:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    17b4:	00 
    17b5:	bd 05 00 00 00       	mov    $0x5,%ebp
    17ba:	eb 09                	jmp    17c5 <phase_6+0x113>
    17bc:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
    17c0:	83 ed 01             	sub    $0x1,%ebp
    17c3:	74 11                	je     17d6 <phase_6+0x124>
    17c5:	48 8b 43 08          	mov    0x8(%rbx),%rax
    17c9:	8b 00                	mov    (%rax),%eax
    17cb:	39 03                	cmp    %eax,(%rbx)
    17cd:	7d ed                	jge    17bc <phase_6+0x10a>
    17cf:	e8 6d 04 00 00       	callq  1c41 <explode_bomb>
    17d4:	eb e6                	jmp    17bc <phase_6+0x10a>
    17d6:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
    17db:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    17e2:	00 00 
    17e4:	75 0d                	jne    17f3 <phase_6+0x141>
    17e6:	48 83 c4 60          	add    $0x60,%rsp
    17ea:	5b                   	pop    %rbx
    17eb:	5d                   	pop    %rbp
    17ec:	41 5c                	pop    %r12
    17ee:	41 5d                	pop    %r13
    17f0:	41 5e                	pop    %r14
    17f2:	c3                   	retq   
    17f3:	e8 98 f8 ff ff       	callq  1090 <__stack_chk_fail@plt>

00000000000017f8 <fun7>:
    17f8:	48 85 ff             	test   %rdi,%rdi
    17fb:	74 34                	je     1831 <fun7+0x39>
    17fd:	48 83 ec 08          	sub    $0x8,%rsp
    1801:	8b 17                	mov    (%rdi),%edx
    1803:	39 f2                	cmp    %esi,%edx
    1805:	7f 0e                	jg     1815 <fun7+0x1d>
    1807:	b8 00 00 00 00       	mov    $0x0,%eax
    180c:	39 f2                	cmp    %esi,%edx
    180e:	75 12                	jne    1822 <fun7+0x2a>
    1810:	48 83 c4 08          	add    $0x8,%rsp
    1814:	c3                   	retq   
    1815:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    1819:	e8 da ff ff ff       	callq  17f8 <fun7>
    181e:	01 c0                	add    %eax,%eax
    1820:	eb ee                	jmp    1810 <fun7+0x18>
    1822:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
    1826:	e8 cd ff ff ff       	callq  17f8 <fun7>
    182b:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
    182f:	eb df                	jmp    1810 <fun7+0x18>
    1831:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1836:	c3                   	retq   

0000000000001837 <secret_phase>:
    1837:	53                   	push   %rbx
    1838:	e8 81 04 00 00       	callq  1cbe <read_line>
    183d:	ba 0a 00 00 00       	mov    $0xa,%edx
    1842:	be 00 00 00 00       	mov    $0x0,%esi
    1847:	48 89 c7             	mov    %rax,%rdi
    184a:	e8 c1 f8 ff ff       	callq  1110 <strtol@plt>
    184f:	48 89 c3             	mov    %rax,%rbx
    1852:	8d 40 ff             	lea    -0x1(%rax),%eax
    1855:	3d e8 03 00 00       	cmp    $0x3e8,%eax
    185a:	77 2b                	ja     1887 <secret_phase+0x50>
    185c:	89 de                	mov    %ebx,%esi
    185e:	48 8d 3d eb 38 00 00 	lea    0x38eb(%rip),%rdi        # 5150 <n1>
    1865:	e8 8e ff ff ff       	callq  17f8 <fun7>
    186a:	83 f8 03             	cmp    $0x3,%eax
    186d:	74 05                	je     1874 <secret_phase+0x3d>
    186f:	e8 cd 03 00 00       	callq  1c41 <explode_bomb>
    1874:	48 8d 3d 0d 19 00 00 	lea    0x190d(%rip),%rdi        # 3188 <_IO_stdin_used+0x188>
    187b:	e8 f0 f7 ff ff       	callq  1070 <puts@plt>
    1880:	e8 7d 05 00 00       	callq  1e02 <phase_defused>
    1885:	5b                   	pop    %rbx
    1886:	c3                   	retq   
    1887:	e8 b5 03 00 00       	callq  1c41 <explode_bomb>
    188c:	eb ce                	jmp    185c <secret_phase+0x25>

000000000000188e <sig_handler>:
    188e:	48 83 ec 08          	sub    $0x8,%rsp
    1892:	48 8d 3d 87 19 00 00 	lea    0x1987(%rip),%rdi        # 3220 <array.3340+0x40>
    1899:	e8 d2 f7 ff ff       	callq  1070 <puts@plt>
    189e:	bf 03 00 00 00       	mov    $0x3,%edi
    18a3:	e8 f8 f8 ff ff       	callq  11a0 <sleep@plt>
    18a8:	48 8d 35 3a 1b 00 00 	lea    0x1b3a(%rip),%rsi        # 33e9 <array.3340+0x209>
    18af:	bf 01 00 00 00       	mov    $0x1,%edi
    18b4:	b8 00 00 00 00       	mov    $0x0,%eax
    18b9:	e8 82 f8 ff ff       	callq  1140 <__printf_chk@plt>
    18be:	48 8b 3d bb 39 00 00 	mov    0x39bb(%rip),%rdi        # 5280 <stdout@@GLIBC_2.2.5>
    18c5:	e8 56 f8 ff ff       	callq  1120 <fflush@plt>
    18ca:	bf 01 00 00 00       	mov    $0x1,%edi
    18cf:	e8 cc f8 ff ff       	callq  11a0 <sleep@plt>
    18d4:	48 8d 3d 16 1b 00 00 	lea    0x1b16(%rip),%rdi        # 33f1 <array.3340+0x211>
    18db:	e8 90 f7 ff ff       	callq  1070 <puts@plt>
    18e0:	bf 10 00 00 00       	mov    $0x10,%edi
    18e5:	e8 86 f8 ff ff       	callq  1170 <exit@plt>

00000000000018ea <invalid_phase>:
    18ea:	48 83 ec 08          	sub    $0x8,%rsp
    18ee:	48 89 fa             	mov    %rdi,%rdx
    18f1:	48 8d 35 01 1b 00 00 	lea    0x1b01(%rip),%rsi        # 33f9 <array.3340+0x219>
    18f8:	bf 01 00 00 00       	mov    $0x1,%edi
    18fd:	b8 00 00 00 00       	mov    $0x0,%eax
    1902:	e8 39 f8 ff ff       	callq  1140 <__printf_chk@plt>
    1907:	bf 08 00 00 00       	mov    $0x8,%edi
    190c:	e8 5f f8 ff ff       	callq  1170 <exit@plt>

0000000000001911 <string_length>:
    1911:	80 3f 00             	cmpb   $0x0,(%rdi)
    1914:	74 12                	je     1928 <string_length+0x17>
    1916:	48 89 fa             	mov    %rdi,%rdx
    1919:	48 83 c2 01          	add    $0x1,%rdx
    191d:	89 d0                	mov    %edx,%eax
    191f:	29 f8                	sub    %edi,%eax
    1921:	80 3a 00             	cmpb   $0x0,(%rdx)
    1924:	75 f3                	jne    1919 <string_length+0x8>
    1926:	f3 c3                	repz retq 
    1928:	b8 00 00 00 00       	mov    $0x0,%eax
    192d:	c3                   	retq   

000000000000192e <strings_not_equal>:
    192e:	41 54                	push   %r12
    1930:	55                   	push   %rbp
    1931:	53                   	push   %rbx
    1932:	48 89 fb             	mov    %rdi,%rbx
    1935:	48 89 f5             	mov    %rsi,%rbp
    1938:	e8 d4 ff ff ff       	callq  1911 <string_length>
    193d:	41 89 c4             	mov    %eax,%r12d
    1940:	48 89 ef             	mov    %rbp,%rdi
    1943:	e8 c9 ff ff ff       	callq  1911 <string_length>
    1948:	ba 01 00 00 00       	mov    $0x1,%edx
    194d:	41 39 c4             	cmp    %eax,%r12d
    1950:	74 07                	je     1959 <strings_not_equal+0x2b>
    1952:	89 d0                	mov    %edx,%eax
    1954:	5b                   	pop    %rbx
    1955:	5d                   	pop    %rbp
    1956:	41 5c                	pop    %r12
    1958:	c3                   	retq   
    1959:	0f b6 03             	movzbl (%rbx),%eax
    195c:	84 c0                	test   %al,%al
    195e:	74 27                	je     1987 <strings_not_equal+0x59>
    1960:	3a 45 00             	cmp    0x0(%rbp),%al
    1963:	75 29                	jne    198e <strings_not_equal+0x60>
    1965:	48 83 c3 01          	add    $0x1,%rbx
    1969:	48 83 c5 01          	add    $0x1,%rbp
    196d:	0f b6 03             	movzbl (%rbx),%eax
    1970:	84 c0                	test   %al,%al
    1972:	74 0c                	je     1980 <strings_not_equal+0x52>
    1974:	38 45 00             	cmp    %al,0x0(%rbp)
    1977:	74 ec                	je     1965 <strings_not_equal+0x37>
    1979:	ba 01 00 00 00       	mov    $0x1,%edx
    197e:	eb d2                	jmp    1952 <strings_not_equal+0x24>
    1980:	ba 00 00 00 00       	mov    $0x0,%edx
    1985:	eb cb                	jmp    1952 <strings_not_equal+0x24>
    1987:	ba 00 00 00 00       	mov    $0x0,%edx
    198c:	eb c4                	jmp    1952 <strings_not_equal+0x24>
    198e:	ba 01 00 00 00       	mov    $0x1,%edx
    1993:	eb bd                	jmp    1952 <strings_not_equal+0x24>

0000000000001995 <initialize_bomb>:
    1995:	41 54                	push   %r12
    1997:	55                   	push   %rbp
    1998:	53                   	push   %rbx
    1999:	48 81 ec 50 20 00 00 	sub    $0x2050,%rsp
    19a0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    19a7:	00 00 
    19a9:	48 89 84 24 48 20 00 	mov    %rax,0x2048(%rsp)
    19b0:	00 
    19b1:	31 c0                	xor    %eax,%eax
    19b3:	48 8d 35 d4 fe ff ff 	lea    -0x12c(%rip),%rsi        # 188e <sig_handler>
    19ba:	bf 02 00 00 00       	mov    $0x2,%edi
    19bf:	e8 1c f7 ff ff       	callq  10e0 <signal@plt>
    19c4:	48 89 e7             	mov    %rsp,%rdi
    19c7:	be 40 00 00 00       	mov    $0x40,%esi
    19cc:	e8 8f f7 ff ff       	callq  1160 <gethostname@plt>
    19d1:	85 c0                	test   %eax,%eax
    19d3:	75 67                	jne    1a3c <initialize_bomb+0xa7>
    19d5:	48 8b 3d 04 39 00 00 	mov    0x3904(%rip),%rdi        # 52e0 <host_table>
    19dc:	bb 01 00 00 00       	mov    $0x1,%ebx
    19e1:	48 89 e5             	mov    %rsp,%rbp
    19e4:	4c 8d 25 ed 38 00 00 	lea    0x38ed(%rip),%r12        # 52d8 <num_input_strings+0x18>
    19eb:	48 85 ff             	test   %rdi,%rdi
    19ee:	74 1f                	je     1a0f <initialize_bomb+0x7a>
    19f0:	48 89 ee             	mov    %rbp,%rsi
    19f3:	e8 48 f6 ff ff       	callq  1040 <strcasecmp@plt>
    19f8:	85 c0                	test   %eax,%eax
    19fa:	74 13                	je     1a0f <initialize_bomb+0x7a>
    19fc:	89 d8                	mov    %ebx,%eax
    19fe:	48 83 c3 01          	add    $0x1,%rbx
    1a02:	49 8b 3c dc          	mov    (%r12,%rbx,8),%rdi
    1a06:	48 85 ff             	test   %rdi,%rdi
    1a09:	75 e5                	jne    19f0 <initialize_bomb+0x5b>
    1a0b:	85 c0                	test   %eax,%eax
    1a0d:	7f 43                	jg     1a52 <initialize_bomb+0xbd>
    1a0f:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    1a14:	e8 05 0e 00 00       	callq  281e <init_driver>
    1a19:	85 c0                	test   %eax,%eax
    1a1b:	78 4b                	js     1a68 <initialize_bomb+0xd3>
    1a1d:	48 8b 84 24 48 20 00 	mov    0x2048(%rsp),%rax
    1a24:	00 
    1a25:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1a2c:	00 00 
    1a2e:	75 5d                	jne    1a8d <initialize_bomb+0xf8>
    1a30:	48 81 c4 50 20 00 00 	add    $0x2050,%rsp
    1a37:	5b                   	pop    %rbx
    1a38:	5d                   	pop    %rbp
    1a39:	41 5c                	pop    %r12
    1a3b:	c3                   	retq   
    1a3c:	48 8d 3d 15 18 00 00 	lea    0x1815(%rip),%rdi        # 3258 <array.3340+0x78>
    1a43:	e8 28 f6 ff ff       	callq  1070 <puts@plt>
    1a48:	bf 08 00 00 00       	mov    $0x8,%edi
    1a4d:	e8 1e f7 ff ff       	callq  1170 <exit@plt>
    1a52:	48 8d 3d 37 18 00 00 	lea    0x1837(%rip),%rdi        # 3290 <array.3340+0xb0>
    1a59:	e8 12 f6 ff ff       	callq  1070 <puts@plt>
    1a5e:	bf 08 00 00 00       	mov    $0x8,%edi
    1a63:	e8 08 f7 ff ff       	callq  1170 <exit@plt>
    1a68:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
    1a6d:	48 8d 35 96 19 00 00 	lea    0x1996(%rip),%rsi        # 340a <array.3340+0x22a>
    1a74:	bf 01 00 00 00       	mov    $0x1,%edi
    1a79:	b8 00 00 00 00       	mov    $0x0,%eax
    1a7e:	e8 bd f6 ff ff       	callq  1140 <__printf_chk@plt>
    1a83:	bf 08 00 00 00       	mov    $0x8,%edi
    1a88:	e8 e3 f6 ff ff       	callq  1170 <exit@plt>
    1a8d:	e8 fe f5 ff ff       	callq  1090 <__stack_chk_fail@plt>

0000000000001a92 <initialize_bomb_solve>:
    1a92:	f3 c3                	repz retq 

0000000000001a94 <blank_line>:
    1a94:	55                   	push   %rbp
    1a95:	53                   	push   %rbx
    1a96:	48 83 ec 08          	sub    $0x8,%rsp
    1a9a:	48 89 fd             	mov    %rdi,%rbp
    1a9d:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    1aa1:	84 db                	test   %bl,%bl
    1aa3:	74 1e                	je     1ac3 <blank_line+0x2f>
    1aa5:	e8 06 f7 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    1aaa:	48 83 c5 01          	add    $0x1,%rbp
    1aae:	48 0f be db          	movsbq %bl,%rbx
    1ab2:	48 8b 00             	mov    (%rax),%rax
    1ab5:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
    1aba:	75 e1                	jne    1a9d <blank_line+0x9>
    1abc:	b8 00 00 00 00       	mov    $0x0,%eax
    1ac1:	eb 05                	jmp    1ac8 <blank_line+0x34>
    1ac3:	b8 01 00 00 00       	mov    $0x1,%eax
    1ac8:	48 83 c4 08          	add    $0x8,%rsp
    1acc:	5b                   	pop    %rbx
    1acd:	5d                   	pop    %rbp
    1ace:	c3                   	retq   

0000000000001acf <skip>:
    1acf:	55                   	push   %rbp
    1ad0:	53                   	push   %rbx
    1ad1:	48 83 ec 08          	sub    $0x8,%rsp
    1ad5:	48 8d 2d 24 3c 00 00 	lea    0x3c24(%rip),%rbp        # 5700 <input_strings>
    1adc:	48 63 05 dd 37 00 00 	movslq 0x37dd(%rip),%rax        # 52c0 <num_input_strings>
    1ae3:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
    1ae7:	48 c1 e7 04          	shl    $0x4,%rdi
    1aeb:	48 01 ef             	add    %rbp,%rdi
    1aee:	48 8b 15 eb 3b 00 00 	mov    0x3beb(%rip),%rdx        # 56e0 <infile>
    1af5:	be 50 00 00 00       	mov    $0x50,%esi
    1afa:	e8 d1 f5 ff ff       	callq  10d0 <fgets@plt>
    1aff:	48 89 c3             	mov    %rax,%rbx
    1b02:	48 85 c0             	test   %rax,%rax
    1b05:	74 0c                	je     1b13 <skip+0x44>
    1b07:	48 89 c7             	mov    %rax,%rdi
    1b0a:	e8 85 ff ff ff       	callq  1a94 <blank_line>
    1b0f:	85 c0                	test   %eax,%eax
    1b11:	75 c9                	jne    1adc <skip+0xd>
    1b13:	48 89 d8             	mov    %rbx,%rax
    1b16:	48 83 c4 08          	add    $0x8,%rsp
    1b1a:	5b                   	pop    %rbx
    1b1b:	5d                   	pop    %rbp
    1b1c:	c3                   	retq   

0000000000001b1d <send_msg>:
    1b1d:	53                   	push   %rbx
    1b1e:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
    1b25:	41 89 f8             	mov    %edi,%r8d
    1b28:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1b2f:	00 00 
    1b31:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
    1b38:	00 
    1b39:	31 c0                	xor    %eax,%eax
    1b3b:	8b 35 7f 37 00 00    	mov    0x377f(%rip),%esi        # 52c0 <num_input_strings>
    1b41:	8d 46 ff             	lea    -0x1(%rsi),%eax
    1b44:	48 98                	cltq   
    1b46:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
    1b4a:	48 c1 e2 04          	shl    $0x4,%rdx
    1b4e:	48 8d 05 ab 3b 00 00 	lea    0x3bab(%rip),%rax        # 5700 <input_strings>
    1b55:	48 01 c2             	add    %rax,%rdx
    1b58:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1b5f:	b8 00 00 00 00       	mov    $0x0,%eax
    1b64:	48 89 d7             	mov    %rdx,%rdi
    1b67:	f2 ae                	repnz scas %es:(%rdi),%al
    1b69:	48 89 c8             	mov    %rcx,%rax
    1b6c:	48 f7 d0             	not    %rax
    1b6f:	48 83 c0 63          	add    $0x63,%rax
    1b73:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    1b79:	0f 87 86 00 00 00    	ja     1c05 <send_msg+0xe8>
    1b7f:	45 85 c0             	test   %r8d,%r8d
    1b82:	4c 8d 0d 9b 18 00 00 	lea    0x189b(%rip),%r9        # 3424 <array.3340+0x244>
    1b89:	48 8d 05 9c 18 00 00 	lea    0x189c(%rip),%rax        # 342c <array.3340+0x24c>
    1b90:	4c 0f 44 c8          	cmove  %rax,%r9
    1b94:	48 89 e3             	mov    %rsp,%rbx
    1b97:	52                   	push   %rdx
    1b98:	56                   	push   %rsi
    1b99:	44 8b 05 a8 35 00 00 	mov    0x35a8(%rip),%r8d        # 5148 <bomb_id>
    1ba0:	48 8d 0d 8e 18 00 00 	lea    0x188e(%rip),%rcx        # 3435 <array.3340+0x255>
    1ba7:	ba 00 20 00 00       	mov    $0x2000,%edx
    1bac:	be 01 00 00 00       	mov    $0x1,%esi
    1bb1:	48 89 df             	mov    %rbx,%rdi
    1bb4:	b8 00 00 00 00       	mov    $0x0,%eax
    1bb9:	e8 02 f6 ff ff       	callq  11c0 <__sprintf_chk@plt>
    1bbe:	4c 8d 84 24 10 20 00 	lea    0x2010(%rsp),%r8
    1bc5:	00 
    1bc6:	b9 00 00 00 00       	mov    $0x0,%ecx
    1bcb:	48 89 da             	mov    %rbx,%rdx
    1bce:	48 8d 35 4b 35 00 00 	lea    0x354b(%rip),%rsi        # 5120 <user_password>
    1bd5:	48 8d 3d 5c 35 00 00 	lea    0x355c(%rip),%rdi        # 5138 <userid>
    1bdc:	e8 46 0e 00 00       	callq  2a27 <driver_post>
    1be1:	48 83 c4 10          	add    $0x10,%rsp
    1be5:	85 c0                	test   %eax,%eax
    1be7:	78 3c                	js     1c25 <send_msg+0x108>
    1be9:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
    1bf0:	00 
    1bf1:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1bf8:	00 00 
    1bfa:	75 40                	jne    1c3c <send_msg+0x11f>
    1bfc:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
    1c03:	5b                   	pop    %rbx
    1c04:	c3                   	retq   
    1c05:	48 8d 35 bc 16 00 00 	lea    0x16bc(%rip),%rsi        # 32c8 <array.3340+0xe8>
    1c0c:	bf 01 00 00 00       	mov    $0x1,%edi
    1c11:	b8 00 00 00 00       	mov    $0x0,%eax
    1c16:	e8 25 f5 ff ff       	callq  1140 <__printf_chk@plt>
    1c1b:	bf 08 00 00 00       	mov    $0x8,%edi
    1c20:	e8 4b f5 ff ff       	callq  1170 <exit@plt>
    1c25:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
    1c2c:	00 
    1c2d:	e8 3e f4 ff ff       	callq  1070 <puts@plt>
    1c32:	bf 00 00 00 00       	mov    $0x0,%edi
    1c37:	e8 34 f5 ff ff       	callq  1170 <exit@plt>
    1c3c:	e8 4f f4 ff ff       	callq  1090 <__stack_chk_fail@plt>

0000000000001c41 <explode_bomb>:
    1c41:	48 83 ec 08          	sub    $0x8,%rsp
    1c45:	48 8d 3d f5 17 00 00 	lea    0x17f5(%rip),%rdi        # 3441 <array.3340+0x261>
    1c4c:	e8 1f f4 ff ff       	callq  1070 <puts@plt>
    1c51:	48 8d 3d f2 17 00 00 	lea    0x17f2(%rip),%rdi        # 344a <array.3340+0x26a>
    1c58:	e8 13 f4 ff ff       	callq  1070 <puts@plt>
    1c5d:	bf 00 00 00 00       	mov    $0x0,%edi
    1c62:	e8 b6 fe ff ff       	callq  1b1d <send_msg>
    1c67:	48 8d 3d 82 16 00 00 	lea    0x1682(%rip),%rdi        # 32f0 <array.3340+0x110>
    1c6e:	e8 fd f3 ff ff       	callq  1070 <puts@plt>
    1c73:	bf 08 00 00 00       	mov    $0x8,%edi
    1c78:	e8 f3 f4 ff ff       	callq  1170 <exit@plt>

0000000000001c7d <read_six_numbers>:
    1c7d:	48 83 ec 08          	sub    $0x8,%rsp
    1c81:	48 89 f2             	mov    %rsi,%rdx
    1c84:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
    1c88:	48 8d 46 14          	lea    0x14(%rsi),%rax
    1c8c:	50                   	push   %rax
    1c8d:	48 8d 46 10          	lea    0x10(%rsi),%rax
    1c91:	50                   	push   %rax
    1c92:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
    1c96:	4c 8d 46 08          	lea    0x8(%rsi),%r8
    1c9a:	48 8d 35 c0 17 00 00 	lea    0x17c0(%rip),%rsi        # 3461 <array.3340+0x281>
    1ca1:	b8 00 00 00 00       	mov    $0x0,%eax
    1ca6:	e8 85 f4 ff ff       	callq  1130 <__isoc99_sscanf@plt>
    1cab:	48 83 c4 10          	add    $0x10,%rsp
    1caf:	83 f8 05             	cmp    $0x5,%eax
    1cb2:	7e 05                	jle    1cb9 <read_six_numbers+0x3c>
    1cb4:	48 83 c4 08          	add    $0x8,%rsp
    1cb8:	c3                   	retq   
    1cb9:	e8 83 ff ff ff       	callq  1c41 <explode_bomb>

0000000000001cbe <read_line>:
    1cbe:	48 83 ec 08          	sub    $0x8,%rsp
    1cc2:	b8 00 00 00 00       	mov    $0x0,%eax
    1cc7:	e8 03 fe ff ff       	callq  1acf <skip>
    1ccc:	48 85 c0             	test   %rax,%rax
    1ccf:	74 6f                	je     1d40 <read_line+0x82>
    1cd1:	8b 35 e9 35 00 00    	mov    0x35e9(%rip),%esi        # 52c0 <num_input_strings>
    1cd7:	48 63 c6             	movslq %esi,%rax
    1cda:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
    1cde:	48 c1 e2 04          	shl    $0x4,%rdx
    1ce2:	48 8d 05 17 3a 00 00 	lea    0x3a17(%rip),%rax        # 5700 <input_strings>
    1ce9:	48 01 c2             	add    %rax,%rdx
    1cec:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1cf3:	b8 00 00 00 00       	mov    $0x0,%eax
    1cf8:	48 89 d7             	mov    %rdx,%rdi
    1cfb:	f2 ae                	repnz scas %es:(%rdi),%al
    1cfd:	48 f7 d1             	not    %rcx
    1d00:	48 83 e9 01          	sub    $0x1,%rcx
    1d04:	83 f9 4e             	cmp    $0x4e,%ecx
    1d07:	0f 8f ab 00 00 00    	jg     1db8 <read_line+0xfa>
    1d0d:	83 e9 01             	sub    $0x1,%ecx
    1d10:	48 63 c9             	movslq %ecx,%rcx
    1d13:	48 63 c6             	movslq %esi,%rax
    1d16:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    1d1a:	48 c1 e0 04          	shl    $0x4,%rax
    1d1e:	48 89 c7             	mov    %rax,%rdi
    1d21:	48 8d 05 d8 39 00 00 	lea    0x39d8(%rip),%rax        # 5700 <input_strings>
    1d28:	48 01 f8             	add    %rdi,%rax
    1d2b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    1d2f:	83 c6 01             	add    $0x1,%esi
    1d32:	89 35 88 35 00 00    	mov    %esi,0x3588(%rip)        # 52c0 <num_input_strings>
    1d38:	48 89 d0             	mov    %rdx,%rax
    1d3b:	48 83 c4 08          	add    $0x8,%rsp
    1d3f:	c3                   	retq   
    1d40:	48 8b 05 49 35 00 00 	mov    0x3549(%rip),%rax        # 5290 <stdin@@GLIBC_2.2.5>
    1d47:	48 39 05 92 39 00 00 	cmp    %rax,0x3992(%rip)        # 56e0 <infile>
    1d4e:	74 1b                	je     1d6b <read_line+0xad>
    1d50:	48 8d 3d 3a 17 00 00 	lea    0x173a(%rip),%rdi        # 3491 <array.3340+0x2b1>
    1d57:	e8 d4 f2 ff ff       	callq  1030 <getenv@plt>
    1d5c:	48 85 c0             	test   %rax,%rax
    1d5f:	74 20                	je     1d81 <read_line+0xc3>
    1d61:	bf 00 00 00 00       	mov    $0x0,%edi
    1d66:	e8 05 f4 ff ff       	callq  1170 <exit@plt>
    1d6b:	48 8d 3d 01 17 00 00 	lea    0x1701(%rip),%rdi        # 3473 <array.3340+0x293>
    1d72:	e8 f9 f2 ff ff       	callq  1070 <puts@plt>
    1d77:	bf 08 00 00 00       	mov    $0x8,%edi
    1d7c:	e8 ef f3 ff ff       	callq  1170 <exit@plt>
    1d81:	48 8b 05 08 35 00 00 	mov    0x3508(%rip),%rax        # 5290 <stdin@@GLIBC_2.2.5>
    1d88:	48 89 05 51 39 00 00 	mov    %rax,0x3951(%rip)        # 56e0 <infile>
    1d8f:	b8 00 00 00 00       	mov    $0x0,%eax
    1d94:	e8 36 fd ff ff       	callq  1acf <skip>
    1d99:	48 85 c0             	test   %rax,%rax
    1d9c:	0f 85 2f ff ff ff    	jne    1cd1 <read_line+0x13>
    1da2:	48 8d 3d ca 16 00 00 	lea    0x16ca(%rip),%rdi        # 3473 <array.3340+0x293>
    1da9:	e8 c2 f2 ff ff       	callq  1070 <puts@plt>
    1dae:	bf 00 00 00 00       	mov    $0x0,%edi
    1db3:	e8 b8 f3 ff ff       	callq  1170 <exit@plt>
    1db8:	48 8d 3d dd 16 00 00 	lea    0x16dd(%rip),%rdi        # 349c <array.3340+0x2bc>
    1dbf:	e8 ac f2 ff ff       	callq  1070 <puts@plt>
    1dc4:	8b 05 f6 34 00 00    	mov    0x34f6(%rip),%eax        # 52c0 <num_input_strings>
    1dca:	8d 50 01             	lea    0x1(%rax),%edx
    1dcd:	89 15 ed 34 00 00    	mov    %edx,0x34ed(%rip)        # 52c0 <num_input_strings>
    1dd3:	48 98                	cltq   
    1dd5:	48 6b c0 50          	imul   $0x50,%rax,%rax
    1dd9:	48 8d 15 20 39 00 00 	lea    0x3920(%rip),%rdx        # 5700 <input_strings>
    1de0:	48 be 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rsi
    1de7:	75 6e 63 
    1dea:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
    1df1:	2a 2a 00 
    1df4:	48 89 34 02          	mov    %rsi,(%rdx,%rax,1)
    1df8:	48 89 7c 02 08       	mov    %rdi,0x8(%rdx,%rax,1)
    1dfd:	e8 3f fe ff ff       	callq  1c41 <explode_bomb>

0000000000001e02 <phase_defused>:
    1e02:	48 83 ec 78          	sub    $0x78,%rsp
    1e06:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1e0d:	00 00 
    1e0f:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
    1e14:	31 c0                	xor    %eax,%eax
    1e16:	bf 01 00 00 00       	mov    $0x1,%edi
    1e1b:	e8 fd fc ff ff       	callq  1b1d <send_msg>
    1e20:	83 3d 99 34 00 00 06 	cmpl   $0x6,0x3499(%rip)        # 52c0 <num_input_strings>
    1e27:	74 19                	je     1e42 <phase_defused+0x40>
    1e29:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    1e2e:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1e35:	00 00 
    1e37:	0f 85 84 00 00 00    	jne    1ec1 <phase_defused+0xbf>
    1e3d:	48 83 c4 78          	add    $0x78,%rsp
    1e41:	c3                   	retq   
    1e42:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
    1e47:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    1e4c:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
    1e51:	48 8d 35 5f 16 00 00 	lea    0x165f(%rip),%rsi        # 34b7 <array.3340+0x2d7>
    1e58:	48 8d 3d 91 39 00 00 	lea    0x3991(%rip),%rdi        # 57f0 <input_strings+0xf0>
    1e5f:	b8 00 00 00 00       	mov    $0x0,%eax
    1e64:	e8 c7 f2 ff ff       	callq  1130 <__isoc99_sscanf@plt>
    1e69:	83 f8 03             	cmp    $0x3,%eax
    1e6c:	74 1a                	je     1e88 <phase_defused+0x86>
    1e6e:	48 8d 3d 03 15 00 00 	lea    0x1503(%rip),%rdi        # 3378 <array.3340+0x198>
    1e75:	e8 f6 f1 ff ff       	callq  1070 <puts@plt>
    1e7a:	48 8d 3d 27 15 00 00 	lea    0x1527(%rip),%rdi        # 33a8 <array.3340+0x1c8>
    1e81:	e8 ea f1 ff ff       	callq  1070 <puts@plt>
    1e86:	eb a1                	jmp    1e29 <phase_defused+0x27>
    1e88:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    1e8d:	48 8d 35 2c 16 00 00 	lea    0x162c(%rip),%rsi        # 34c0 <array.3340+0x2e0>
    1e94:	e8 95 fa ff ff       	callq  192e <strings_not_equal>
    1e99:	85 c0                	test   %eax,%eax
    1e9b:	75 d1                	jne    1e6e <phase_defused+0x6c>
    1e9d:	48 8d 3d 74 14 00 00 	lea    0x1474(%rip),%rdi        # 3318 <array.3340+0x138>
    1ea4:	e8 c7 f1 ff ff       	callq  1070 <puts@plt>
    1ea9:	48 8d 3d 90 14 00 00 	lea    0x1490(%rip),%rdi        # 3340 <array.3340+0x160>
    1eb0:	e8 bb f1 ff ff       	callq  1070 <puts@plt>
    1eb5:	b8 00 00 00 00       	mov    $0x0,%eax
    1eba:	e8 78 f9 ff ff       	callq  1837 <secret_phase>
    1ebf:	eb ad                	jmp    1e6e <phase_defused+0x6c>
    1ec1:	e8 ca f1 ff ff       	callq  1090 <__stack_chk_fail@plt>

0000000000001ec6 <sigalrm_handler>:
    1ec6:	48 83 ec 08          	sub    $0x8,%rsp
    1eca:	b9 00 00 00 00       	mov    $0x0,%ecx
    1ecf:	48 8d 15 02 16 00 00 	lea    0x1602(%rip),%rdx        # 34d8 <array.3340+0x2f8>
    1ed6:	be 01 00 00 00       	mov    $0x1,%esi
    1edb:	48 8b 3d be 33 00 00 	mov    0x33be(%rip),%rdi        # 52a0 <stderr@@GLIBC_2.2.5>
    1ee2:	b8 00 00 00 00       	mov    $0x0,%eax
    1ee7:	e8 a4 f2 ff ff       	callq  1190 <__fprintf_chk@plt>
    1eec:	bf 01 00 00 00       	mov    $0x1,%edi
    1ef1:	e8 7a f2 ff ff       	callq  1170 <exit@plt>

0000000000001ef6 <rio_readlineb>:
    1ef6:	41 56                	push   %r14
    1ef8:	41 55                	push   %r13
    1efa:	41 54                	push   %r12
    1efc:	55                   	push   %rbp
    1efd:	53                   	push   %rbx
    1efe:	48 89 fb             	mov    %rdi,%rbx
    1f01:	49 89 f4             	mov    %rsi,%r12
    1f04:	49 89 d6             	mov    %rdx,%r14
    1f07:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    1f0d:	48 8d 6f 10          	lea    0x10(%rdi),%rbp
    1f11:	48 83 fa 01          	cmp    $0x1,%rdx
    1f15:	77 0c                	ja     1f23 <rio_readlineb+0x2d>
    1f17:	eb 60                	jmp    1f79 <rio_readlineb+0x83>
    1f19:	e8 32 f1 ff ff       	callq  1050 <__errno_location@plt>
    1f1e:	83 38 04             	cmpl   $0x4,(%rax)
    1f21:	75 67                	jne    1f8a <rio_readlineb+0x94>
    1f23:	8b 43 04             	mov    0x4(%rbx),%eax
    1f26:	85 c0                	test   %eax,%eax
    1f28:	7f 20                	jg     1f4a <rio_readlineb+0x54>
    1f2a:	ba 00 20 00 00       	mov    $0x2000,%edx
    1f2f:	48 89 ee             	mov    %rbp,%rsi
    1f32:	8b 3b                	mov    (%rbx),%edi
    1f34:	e8 87 f1 ff ff       	callq  10c0 <read@plt>
    1f39:	89 43 04             	mov    %eax,0x4(%rbx)
    1f3c:	85 c0                	test   %eax,%eax
    1f3e:	78 d9                	js     1f19 <rio_readlineb+0x23>
    1f40:	85 c0                	test   %eax,%eax
    1f42:	74 4f                	je     1f93 <rio_readlineb+0x9d>
    1f44:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    1f48:	eb d9                	jmp    1f23 <rio_readlineb+0x2d>
    1f4a:	48 8b 53 08          	mov    0x8(%rbx),%rdx
    1f4e:	0f b6 0a             	movzbl (%rdx),%ecx
    1f51:	48 83 c2 01          	add    $0x1,%rdx
    1f55:	48 89 53 08          	mov    %rdx,0x8(%rbx)
    1f59:	83 e8 01             	sub    $0x1,%eax
    1f5c:	89 43 04             	mov    %eax,0x4(%rbx)
    1f5f:	49 83 c4 01          	add    $0x1,%r12
    1f63:	41 88 4c 24 ff       	mov    %cl,-0x1(%r12)
    1f68:	80 f9 0a             	cmp    $0xa,%cl
    1f6b:	74 0c                	je     1f79 <rio_readlineb+0x83>
    1f6d:	41 83 c5 01          	add    $0x1,%r13d
    1f71:	49 63 c5             	movslq %r13d,%rax
    1f74:	4c 39 f0             	cmp    %r14,%rax
    1f77:	72 aa                	jb     1f23 <rio_readlineb+0x2d>
    1f79:	41 c6 04 24 00       	movb   $0x0,(%r12)
    1f7e:	49 63 c5             	movslq %r13d,%rax
    1f81:	5b                   	pop    %rbx
    1f82:	5d                   	pop    %rbp
    1f83:	41 5c                	pop    %r12
    1f85:	41 5d                	pop    %r13
    1f87:	41 5e                	pop    %r14
    1f89:	c3                   	retq   
    1f8a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    1f91:	eb 05                	jmp    1f98 <rio_readlineb+0xa2>
    1f93:	b8 00 00 00 00       	mov    $0x0,%eax
    1f98:	85 c0                	test   %eax,%eax
    1f9a:	75 0d                	jne    1fa9 <rio_readlineb+0xb3>
    1f9c:	b8 00 00 00 00       	mov    $0x0,%eax
    1fa1:	41 83 fd 01          	cmp    $0x1,%r13d
    1fa5:	75 d2                	jne    1f79 <rio_readlineb+0x83>
    1fa7:	eb d8                	jmp    1f81 <rio_readlineb+0x8b>
    1fa9:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    1fb0:	eb cf                	jmp    1f81 <rio_readlineb+0x8b>

0000000000001fb2 <submitr>:
    1fb2:	41 57                	push   %r15
    1fb4:	41 56                	push   %r14
    1fb6:	41 55                	push   %r13
    1fb8:	41 54                	push   %r12
    1fba:	55                   	push   %rbp
    1fbb:	53                   	push   %rbx
    1fbc:	48 81 ec 78 a0 00 00 	sub    $0xa078,%rsp
    1fc3:	49 89 fd             	mov    %rdi,%r13
    1fc6:	89 f5                	mov    %esi,%ebp
    1fc8:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    1fcd:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    1fd2:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
    1fd7:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
    1fdc:	48 8b 9c 24 b0 a0 00 	mov    0xa0b0(%rsp),%rbx
    1fe3:	00 
    1fe4:	4c 8b bc 24 b8 a0 00 	mov    0xa0b8(%rsp),%r15
    1feb:	00 
    1fec:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1ff3:	00 00 
    1ff5:	48 89 84 24 68 a0 00 	mov    %rax,0xa068(%rsp)
    1ffc:	00 
    1ffd:	31 c0                	xor    %eax,%eax
    1fff:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%rsp)
    2006:	00 
    2007:	ba 00 00 00 00       	mov    $0x0,%edx
    200c:	be 01 00 00 00       	mov    $0x1,%esi
    2011:	bf 02 00 00 00       	mov    $0x2,%edi
    2016:	e8 b5 f1 ff ff       	callq  11d0 <socket@plt>
    201b:	85 c0                	test   %eax,%eax
    201d:	0f 88 35 01 00 00    	js     2158 <submitr+0x1a6>
    2023:	41 89 c4             	mov    %eax,%r12d
    2026:	4c 89 ef             	mov    %r13,%rdi
    2029:	e8 c2 f0 ff ff       	callq  10f0 <gethostbyname@plt>
    202e:	48 85 c0             	test   %rax,%rax
    2031:	0f 84 71 01 00 00    	je     21a8 <submitr+0x1f6>
    2037:	4c 8d 6c 24 40       	lea    0x40(%rsp),%r13
    203c:	48 c7 44 24 42 00 00 	movq   $0x0,0x42(%rsp)
    2043:	00 00 
    2045:	c7 44 24 4a 00 00 00 	movl   $0x0,0x4a(%rsp)
    204c:	00 
    204d:	66 c7 44 24 4e 00 00 	movw   $0x0,0x4e(%rsp)
    2054:	66 c7 44 24 40 02 00 	movw   $0x2,0x40(%rsp)
    205b:	48 63 50 14          	movslq 0x14(%rax),%rdx
    205f:	48 8b 40 18          	mov    0x18(%rax),%rax
    2063:	48 8d 7c 24 44       	lea    0x44(%rsp),%rdi
    2068:	b9 0c 00 00 00       	mov    $0xc,%ecx
    206d:	48 8b 30             	mov    (%rax),%rsi
    2070:	e8 8b f0 ff ff       	callq  1100 <__memmove_chk@plt>
    2075:	66 c1 c5 08          	rol    $0x8,%bp
    2079:	66 89 6c 24 42       	mov    %bp,0x42(%rsp)
    207e:	ba 10 00 00 00       	mov    $0x10,%edx
    2083:	4c 89 ee             	mov    %r13,%rsi
    2086:	44 89 e7             	mov    %r12d,%edi
    2089:	e8 f2 f0 ff ff       	callq  1180 <connect@plt>
    208e:	85 c0                	test   %eax,%eax
    2090:	0f 88 7d 01 00 00    	js     2213 <submitr+0x261>
    2096:	49 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%r9
    209d:	b8 00 00 00 00       	mov    $0x0,%eax
    20a2:	4c 89 c9             	mov    %r9,%rcx
    20a5:	48 89 df             	mov    %rbx,%rdi
    20a8:	f2 ae                	repnz scas %es:(%rdi),%al
    20aa:	48 89 ce             	mov    %rcx,%rsi
    20ad:	48 f7 d6             	not    %rsi
    20b0:	4c 89 c9             	mov    %r9,%rcx
    20b3:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    20b8:	f2 ae                	repnz scas %es:(%rdi),%al
    20ba:	49 89 c8             	mov    %rcx,%r8
    20bd:	4c 89 c9             	mov    %r9,%rcx
    20c0:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    20c5:	f2 ae                	repnz scas %es:(%rdi),%al
    20c7:	48 89 ca             	mov    %rcx,%rdx
    20ca:	48 f7 d2             	not    %rdx
    20cd:	4c 89 c9             	mov    %r9,%rcx
    20d0:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    20d5:	f2 ae                	repnz scas %es:(%rdi),%al
    20d7:	4c 29 c2             	sub    %r8,%rdx
    20da:	48 29 ca             	sub    %rcx,%rdx
    20dd:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
    20e2:	48 8d 44 02 7b       	lea    0x7b(%rdx,%rax,1),%rax
    20e7:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    20ed:	0f 87 7d 01 00 00    	ja     2270 <submitr+0x2be>
    20f3:	48 8d 94 24 60 40 00 	lea    0x4060(%rsp),%rdx
    20fa:	00 
    20fb:	b9 00 04 00 00       	mov    $0x400,%ecx
    2100:	b8 00 00 00 00       	mov    $0x0,%eax
    2105:	48 89 d7             	mov    %rdx,%rdi
    2108:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    210b:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    2112:	48 89 df             	mov    %rbx,%rdi
    2115:	f2 ae                	repnz scas %es:(%rdi),%al
    2117:	48 89 ca             	mov    %rcx,%rdx
    211a:	48 f7 d2             	not    %rdx
    211d:	48 89 d1             	mov    %rdx,%rcx
    2120:	48 83 e9 01          	sub    $0x1,%rcx
    2124:	85 c9                	test   %ecx,%ecx
    2126:	0f 84 3f 06 00 00    	je     276b <submitr+0x7b9>
    212c:	8d 41 ff             	lea    -0x1(%rcx),%eax
    212f:	4c 8d 74 03 01       	lea    0x1(%rbx,%rax,1),%r14
    2134:	48 8d ac 24 60 40 00 	lea    0x4060(%rsp),%rbp
    213b:	00 
    213c:	48 8d 84 24 60 80 00 	lea    0x8060(%rsp),%rax
    2143:	00 
    2144:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    2149:	49 bd d9 ff 00 00 00 	movabs $0x2000000000ffd9,%r13
    2150:	00 20 00 
    2153:	e9 a6 01 00 00       	jmpq   22fe <submitr+0x34c>
    2158:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    215f:	3a 20 43 
    2162:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2169:	20 75 6e 
    216c:	49 89 07             	mov    %rax,(%r15)
    216f:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2173:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    217a:	74 6f 20 
    217d:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    2184:	65 20 73 
    2187:	49 89 47 10          	mov    %rax,0x10(%r15)
    218b:	49 89 57 18          	mov    %rdx,0x18(%r15)
    218f:	41 c7 47 20 6f 63 6b 	movl   $0x656b636f,0x20(%r15)
    2196:	65 
    2197:	66 41 c7 47 24 74 00 	movw   $0x74,0x24(%r15)
    219e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    21a3:	e9 9a 04 00 00       	jmpq   2642 <submitr+0x690>
    21a8:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    21af:	3a 20 44 
    21b2:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    21b9:	20 75 6e 
    21bc:	49 89 07             	mov    %rax,(%r15)
    21bf:	49 89 57 08          	mov    %rdx,0x8(%r15)
    21c3:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    21ca:	74 6f 20 
    21cd:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    21d4:	76 65 20 
    21d7:	49 89 47 10          	mov    %rax,0x10(%r15)
    21db:	49 89 57 18          	mov    %rdx,0x18(%r15)
    21df:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    21e6:	72 20 61 
    21e9:	49 89 47 20          	mov    %rax,0x20(%r15)
    21ed:	41 c7 47 28 64 64 72 	movl   $0x65726464,0x28(%r15)
    21f4:	65 
    21f5:	66 41 c7 47 2c 73 73 	movw   $0x7373,0x2c(%r15)
    21fc:	41 c6 47 2e 00       	movb   $0x0,0x2e(%r15)
    2201:	44 89 e7             	mov    %r12d,%edi
    2204:	e8 a7 ee ff ff       	callq  10b0 <close@plt>
    2209:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    220e:	e9 2f 04 00 00       	jmpq   2642 <submitr+0x690>
    2213:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    221a:	3a 20 55 
    221d:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    2224:	20 74 6f 
    2227:	49 89 07             	mov    %rax,(%r15)
    222a:	49 89 57 08          	mov    %rdx,0x8(%r15)
    222e:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    2235:	65 63 74 
    2238:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
    223f:	68 65 20 
    2242:	49 89 47 10          	mov    %rax,0x10(%r15)
    2246:	49 89 57 18          	mov    %rdx,0x18(%r15)
    224a:	41 c7 47 20 73 65 72 	movl   $0x76726573,0x20(%r15)
    2251:	76 
    2252:	66 41 c7 47 24 65 72 	movw   $0x7265,0x24(%r15)
    2259:	41 c6 47 26 00       	movb   $0x0,0x26(%r15)
    225e:	44 89 e7             	mov    %r12d,%edi
    2261:	e8 4a ee ff ff       	callq  10b0 <close@plt>
    2266:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    226b:	e9 d2 03 00 00       	jmpq   2642 <submitr+0x690>
    2270:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    2277:	3a 20 52 
    227a:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    2281:	20 73 74 
    2284:	49 89 07             	mov    %rax,(%r15)
    2287:	49 89 57 08          	mov    %rdx,0x8(%r15)
    228b:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
    2292:	74 6f 6f 
    2295:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
    229c:	65 2e 20 
    229f:	49 89 47 10          	mov    %rax,0x10(%r15)
    22a3:	49 89 57 18          	mov    %rdx,0x18(%r15)
    22a7:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
    22ae:	61 73 65 
    22b1:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
    22b8:	49 54 52 
    22bb:	49 89 47 20          	mov    %rax,0x20(%r15)
    22bf:	49 89 57 28          	mov    %rdx,0x28(%r15)
    22c3:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
    22ca:	55 46 00 
    22cd:	49 89 47 30          	mov    %rax,0x30(%r15)
    22d1:	44 89 e7             	mov    %r12d,%edi
    22d4:	e8 d7 ed ff ff       	callq  10b0 <close@plt>
    22d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    22de:	e9 5f 03 00 00       	jmpq   2642 <submitr+0x690>
    22e3:	49 0f a3 c5          	bt     %rax,%r13
    22e7:	73 21                	jae    230a <submitr+0x358>
    22e9:	44 88 45 00          	mov    %r8b,0x0(%rbp)
    22ed:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    22f1:	48 83 c3 01          	add    $0x1,%rbx
    22f5:	4c 39 f3             	cmp    %r14,%rbx
    22f8:	0f 84 6d 04 00 00    	je     276b <submitr+0x7b9>
    22fe:	44 0f b6 03          	movzbl (%rbx),%r8d
    2302:	41 8d 40 d6          	lea    -0x2a(%r8),%eax
    2306:	3c 35                	cmp    $0x35,%al
    2308:	76 d9                	jbe    22e3 <submitr+0x331>
    230a:	44 89 c0             	mov    %r8d,%eax
    230d:	83 e0 df             	and    $0xffffffdf,%eax
    2310:	83 e8 41             	sub    $0x41,%eax
    2313:	3c 19                	cmp    $0x19,%al
    2315:	76 d2                	jbe    22e9 <submitr+0x337>
    2317:	41 80 f8 20          	cmp    $0x20,%r8b
    231b:	74 60                	je     237d <submitr+0x3cb>
    231d:	41 8d 40 e0          	lea    -0x20(%r8),%eax
    2321:	3c 5f                	cmp    $0x5f,%al
    2323:	76 0a                	jbe    232f <submitr+0x37d>
    2325:	41 80 f8 09          	cmp    $0x9,%r8b
    2329:	0f 85 af 03 00 00    	jne    26de <submitr+0x72c>
    232f:	45 0f b6 c0          	movzbl %r8b,%r8d
    2333:	48 8d 0d 74 12 00 00 	lea    0x1274(%rip),%rcx        # 35ae <array.3340+0x3ce>
    233a:	ba 08 00 00 00       	mov    $0x8,%edx
    233f:	be 01 00 00 00       	mov    $0x1,%esi
    2344:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    2349:	b8 00 00 00 00       	mov    $0x0,%eax
    234e:	e8 6d ee ff ff       	callq  11c0 <__sprintf_chk@plt>
    2353:	0f b6 84 24 60 80 00 	movzbl 0x8060(%rsp),%eax
    235a:	00 
    235b:	88 45 00             	mov    %al,0x0(%rbp)
    235e:	0f b6 84 24 61 80 00 	movzbl 0x8061(%rsp),%eax
    2365:	00 
    2366:	88 45 01             	mov    %al,0x1(%rbp)
    2369:	0f b6 84 24 62 80 00 	movzbl 0x8062(%rsp),%eax
    2370:	00 
    2371:	88 45 02             	mov    %al,0x2(%rbp)
    2374:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
    2378:	e9 74 ff ff ff       	jmpq   22f1 <submitr+0x33f>
    237d:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
    2381:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    2385:	e9 67 ff ff ff       	jmpq   22f1 <submitr+0x33f>
    238a:	49 01 c5             	add    %rax,%r13
    238d:	48 29 c5             	sub    %rax,%rbp
    2390:	74 26                	je     23b8 <submitr+0x406>
    2392:	48 89 ea             	mov    %rbp,%rdx
    2395:	4c 89 ee             	mov    %r13,%rsi
    2398:	44 89 e7             	mov    %r12d,%edi
    239b:	e8 e0 ec ff ff       	callq  1080 <write@plt>
    23a0:	48 85 c0             	test   %rax,%rax
    23a3:	7f e5                	jg     238a <submitr+0x3d8>
    23a5:	e8 a6 ec ff ff       	callq  1050 <__errno_location@plt>
    23aa:	83 38 04             	cmpl   $0x4,(%rax)
    23ad:	0f 85 31 01 00 00    	jne    24e4 <submitr+0x532>
    23b3:	4c 89 f0             	mov    %r14,%rax
    23b6:	eb d2                	jmp    238a <submitr+0x3d8>
    23b8:	48 85 db             	test   %rbx,%rbx
    23bb:	0f 88 23 01 00 00    	js     24e4 <submitr+0x532>
    23c1:	44 89 64 24 50       	mov    %r12d,0x50(%rsp)
    23c6:	c7 44 24 54 00 00 00 	movl   $0x0,0x54(%rsp)
    23cd:	00 
    23ce:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
    23d3:	48 8d 47 10          	lea    0x10(%rdi),%rax
    23d7:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    23dc:	48 8d b4 24 60 20 00 	lea    0x2060(%rsp),%rsi
    23e3:	00 
    23e4:	ba 00 20 00 00       	mov    $0x2000,%edx
    23e9:	e8 08 fb ff ff       	callq  1ef6 <rio_readlineb>
    23ee:	48 85 c0             	test   %rax,%rax
    23f1:	0f 8e 4c 01 00 00    	jle    2543 <submitr+0x591>
    23f7:	48 8d 4c 24 3c       	lea    0x3c(%rsp),%rcx
    23fc:	48 8d 94 24 60 60 00 	lea    0x6060(%rsp),%rdx
    2403:	00 
    2404:	48 8d bc 24 60 20 00 	lea    0x2060(%rsp),%rdi
    240b:	00 
    240c:	4c 8d 84 24 60 80 00 	lea    0x8060(%rsp),%r8
    2413:	00 
    2414:	48 8d 35 9a 11 00 00 	lea    0x119a(%rip),%rsi        # 35b5 <array.3340+0x3d5>
    241b:	b8 00 00 00 00       	mov    $0x0,%eax
    2420:	e8 0b ed ff ff       	callq  1130 <__isoc99_sscanf@plt>
    2425:	44 8b 44 24 3c       	mov    0x3c(%rsp),%r8d
    242a:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
    2431:	0f 85 80 01 00 00    	jne    25b7 <submitr+0x605>
    2437:	48 8d 9c 24 60 20 00 	lea    0x2060(%rsp),%rbx
    243e:	00 
    243f:	48 8d 2d 80 11 00 00 	lea    0x1180(%rip),%rbp        # 35c6 <array.3340+0x3e6>
    2446:	4c 8d 6c 24 50       	lea    0x50(%rsp),%r13
    244b:	b9 03 00 00 00       	mov    $0x3,%ecx
    2450:	48 89 de             	mov    %rbx,%rsi
    2453:	48 89 ef             	mov    %rbp,%rdi
    2456:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    2458:	0f 97 c0             	seta   %al
    245b:	1c 00                	sbb    $0x0,%al
    245d:	84 c0                	test   %al,%al
    245f:	0f 84 89 01 00 00    	je     25ee <submitr+0x63c>
    2465:	ba 00 20 00 00       	mov    $0x2000,%edx
    246a:	48 89 de             	mov    %rbx,%rsi
    246d:	4c 89 ef             	mov    %r13,%rdi
    2470:	e8 81 fa ff ff       	callq  1ef6 <rio_readlineb>
    2475:	48 85 c0             	test   %rax,%rax
    2478:	7f d1                	jg     244b <submitr+0x499>
    247a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2481:	3a 20 43 
    2484:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    248b:	20 75 6e 
    248e:	49 89 07             	mov    %rax,(%r15)
    2491:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2495:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    249c:	74 6f 20 
    249f:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
    24a6:	68 65 61 
    24a9:	49 89 47 10          	mov    %rax,0x10(%r15)
    24ad:	49 89 57 18          	mov    %rdx,0x18(%r15)
    24b1:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
    24b8:	66 72 6f 
    24bb:	48 ba 6d 20 73 65 72 	movabs $0x726576726573206d,%rdx
    24c2:	76 65 72 
    24c5:	49 89 47 20          	mov    %rax,0x20(%r15)
    24c9:	49 89 57 28          	mov    %rdx,0x28(%r15)
    24cd:	41 c6 47 30 00       	movb   $0x0,0x30(%r15)
    24d2:	44 89 e7             	mov    %r12d,%edi
    24d5:	e8 d6 eb ff ff       	callq  10b0 <close@plt>
    24da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    24df:	e9 5e 01 00 00       	jmpq   2642 <submitr+0x690>
    24e4:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    24eb:	3a 20 43 
    24ee:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    24f5:	20 75 6e 
    24f8:	49 89 07             	mov    %rax,(%r15)
    24fb:	49 89 57 08          	mov    %rdx,0x8(%r15)
    24ff:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2506:	74 6f 20 
    2509:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
    2510:	20 74 6f 
    2513:	49 89 47 10          	mov    %rax,0x10(%r15)
    2517:	49 89 57 18          	mov    %rdx,0x18(%r15)
    251b:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
    2522:	73 65 72 
    2525:	49 89 47 20          	mov    %rax,0x20(%r15)
    2529:	41 c7 47 28 76 65 72 	movl   $0x726576,0x28(%r15)
    2530:	00 
    2531:	44 89 e7             	mov    %r12d,%edi
    2534:	e8 77 eb ff ff       	callq  10b0 <close@plt>
    2539:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    253e:	e9 ff 00 00 00       	jmpq   2642 <submitr+0x690>
    2543:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    254a:	3a 20 43 
    254d:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2554:	20 75 6e 
    2557:	49 89 07             	mov    %rax,(%r15)
    255a:	49 89 57 08          	mov    %rdx,0x8(%r15)
    255e:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2565:	74 6f 20 
    2568:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
    256f:	66 69 72 
    2572:	49 89 47 10          	mov    %rax,0x10(%r15)
    2576:	49 89 57 18          	mov    %rdx,0x18(%r15)
    257a:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
    2581:	61 64 65 
    2584:	48 ba 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rdx
    258b:	6d 20 73 
    258e:	49 89 47 20          	mov    %rax,0x20(%r15)
    2592:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2596:	41 c7 47 30 65 72 76 	movl   $0x65767265,0x30(%r15)
    259d:	65 
    259e:	66 41 c7 47 34 72 00 	movw   $0x72,0x34(%r15)
    25a5:	44 89 e7             	mov    %r12d,%edi
    25a8:	e8 03 eb ff ff       	callq  10b0 <close@plt>
    25ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    25b2:	e9 8b 00 00 00       	jmpq   2642 <submitr+0x690>
    25b7:	4c 8d 8c 24 60 80 00 	lea    0x8060(%rsp),%r9
    25be:	00 
    25bf:	48 8d 0d 3a 0f 00 00 	lea    0xf3a(%rip),%rcx        # 3500 <array.3340+0x320>
    25c6:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    25cd:	be 01 00 00 00       	mov    $0x1,%esi
    25d2:	4c 89 ff             	mov    %r15,%rdi
    25d5:	b8 00 00 00 00       	mov    $0x0,%eax
    25da:	e8 e1 eb ff ff       	callq  11c0 <__sprintf_chk@plt>
    25df:	44 89 e7             	mov    %r12d,%edi
    25e2:	e8 c9 ea ff ff       	callq  10b0 <close@plt>
    25e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    25ec:	eb 54                	jmp    2642 <submitr+0x690>
    25ee:	48 8d b4 24 60 20 00 	lea    0x2060(%rsp),%rsi
    25f5:	00 
    25f6:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
    25fb:	ba 00 20 00 00       	mov    $0x2000,%edx
    2600:	e8 f1 f8 ff ff       	callq  1ef6 <rio_readlineb>
    2605:	48 85 c0             	test   %rax,%rax
    2608:	7e 61                	jle    266b <submitr+0x6b9>
    260a:	48 8d b4 24 60 20 00 	lea    0x2060(%rsp),%rsi
    2611:	00 
    2612:	4c 89 ff             	mov    %r15,%rdi
    2615:	e8 46 ea ff ff       	callq  1060 <strcpy@plt>
    261a:	44 89 e7             	mov    %r12d,%edi
    261d:	e8 8e ea ff ff       	callq  10b0 <close@plt>
    2622:	b9 03 00 00 00       	mov    $0x3,%ecx
    2627:	48 8d 3d 9b 0f 00 00 	lea    0xf9b(%rip),%rdi        # 35c9 <array.3340+0x3e9>
    262e:	4c 89 fe             	mov    %r15,%rsi
    2631:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    2633:	0f 97 c0             	seta   %al
    2636:	1c 00                	sbb    $0x0,%al
    2638:	84 c0                	test   %al,%al
    263a:	0f 95 c0             	setne  %al
    263d:	0f b6 c0             	movzbl %al,%eax
    2640:	f7 d8                	neg    %eax
    2642:	48 8b 94 24 68 a0 00 	mov    0xa068(%rsp),%rdx
    2649:	00 
    264a:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
    2651:	00 00 
    2653:	0f 85 95 01 00 00    	jne    27ee <submitr+0x83c>
    2659:	48 81 c4 78 a0 00 00 	add    $0xa078,%rsp
    2660:	5b                   	pop    %rbx
    2661:	5d                   	pop    %rbp
    2662:	41 5c                	pop    %r12
    2664:	41 5d                	pop    %r13
    2666:	41 5e                	pop    %r14
    2668:	41 5f                	pop    %r15
    266a:	c3                   	retq   
    266b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2672:	3a 20 43 
    2675:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    267c:	20 75 6e 
    267f:	49 89 07             	mov    %rax,(%r15)
    2682:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2686:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    268d:	74 6f 20 
    2690:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
    2697:	73 74 61 
    269a:	49 89 47 10          	mov    %rax,0x10(%r15)
    269e:	49 89 57 18          	mov    %rdx,0x18(%r15)
    26a2:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
    26a9:	65 73 73 
    26ac:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
    26b3:	72 6f 6d 
    26b6:	49 89 47 20          	mov    %rax,0x20(%r15)
    26ba:	49 89 57 28          	mov    %rdx,0x28(%r15)
    26be:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
    26c5:	65 72 00 
    26c8:	49 89 47 30          	mov    %rax,0x30(%r15)
    26cc:	44 89 e7             	mov    %r12d,%edi
    26cf:	e8 dc e9 ff ff       	callq  10b0 <close@plt>
    26d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    26d9:	e9 64 ff ff ff       	jmpq   2642 <submitr+0x690>
    26de:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    26e5:	3a 20 52 
    26e8:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    26ef:	20 73 74 
    26f2:	49 89 07             	mov    %rax,(%r15)
    26f5:	49 89 57 08          	mov    %rdx,0x8(%r15)
    26f9:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
    2700:	63 6f 6e 
    2703:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
    270a:	20 61 6e 
    270d:	49 89 47 10          	mov    %rax,0x10(%r15)
    2711:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2715:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
    271c:	67 61 6c 
    271f:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
    2726:	6e 70 72 
    2729:	49 89 47 20          	mov    %rax,0x20(%r15)
    272d:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2731:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
    2738:	6c 65 20 
    273b:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
    2742:	63 74 65 
    2745:	49 89 47 30          	mov    %rax,0x30(%r15)
    2749:	49 89 57 38          	mov    %rdx,0x38(%r15)
    274d:	66 41 c7 47 40 72 2e 	movw   $0x2e72,0x40(%r15)
    2754:	41 c6 47 42 00       	movb   $0x0,0x42(%r15)
    2759:	44 89 e7             	mov    %r12d,%edi
    275c:	e8 4f e9 ff ff       	callq  10b0 <close@plt>
    2761:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2766:	e9 d7 fe ff ff       	jmpq   2642 <submitr+0x690>
    276b:	48 8d 9c 24 60 20 00 	lea    0x2060(%rsp),%rbx
    2772:	00 
    2773:	48 83 ec 08          	sub    $0x8,%rsp
    2777:	48 8d 84 24 68 40 00 	lea    0x4068(%rsp),%rax
    277e:	00 
    277f:	50                   	push   %rax
    2780:	ff 74 24 28          	pushq  0x28(%rsp)
    2784:	ff 74 24 38          	pushq  0x38(%rsp)
    2788:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    278d:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    2792:	48 8d 0d 97 0d 00 00 	lea    0xd97(%rip),%rcx        # 3530 <array.3340+0x350>
    2799:	ba 00 20 00 00       	mov    $0x2000,%edx
    279e:	be 01 00 00 00       	mov    $0x1,%esi
    27a3:	48 89 df             	mov    %rbx,%rdi
    27a6:	b8 00 00 00 00       	mov    $0x0,%eax
    27ab:	e8 10 ea ff ff       	callq  11c0 <__sprintf_chk@plt>
    27b0:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    27b7:	b8 00 00 00 00       	mov    $0x0,%eax
    27bc:	48 89 df             	mov    %rbx,%rdi
    27bf:	f2 ae                	repnz scas %es:(%rdi),%al
    27c1:	48 f7 d1             	not    %rcx
    27c4:	48 89 cb             	mov    %rcx,%rbx
    27c7:	48 83 eb 01          	sub    $0x1,%rbx
    27cb:	48 83 c4 20          	add    $0x20,%rsp
    27cf:	48 89 dd             	mov    %rbx,%rbp
    27d2:	4c 8d ac 24 60 20 00 	lea    0x2060(%rsp),%r13
    27d9:	00 
    27da:	41 be 00 00 00 00    	mov    $0x0,%r14d
    27e0:	48 85 db             	test   %rbx,%rbx
    27e3:	0f 85 a9 fb ff ff    	jne    2392 <submitr+0x3e0>
    27e9:	e9 d3 fb ff ff       	jmpq   23c1 <submitr+0x40f>
    27ee:	e8 9d e8 ff ff       	callq  1090 <__stack_chk_fail@plt>

00000000000027f3 <init_timeout>:
    27f3:	85 ff                	test   %edi,%edi
    27f5:	74 25                	je     281c <init_timeout+0x29>
    27f7:	53                   	push   %rbx
    27f8:	89 fb                	mov    %edi,%ebx
    27fa:	48 8d 35 c5 f6 ff ff 	lea    -0x93b(%rip),%rsi        # 1ec6 <sigalrm_handler>
    2801:	bf 0e 00 00 00       	mov    $0xe,%edi
    2806:	e8 d5 e8 ff ff       	callq  10e0 <signal@plt>
    280b:	85 db                	test   %ebx,%ebx
    280d:	bf 00 00 00 00       	mov    $0x0,%edi
    2812:	0f 49 fb             	cmovns %ebx,%edi
    2815:	e8 86 e8 ff ff       	callq  10a0 <alarm@plt>
    281a:	5b                   	pop    %rbx
    281b:	c3                   	retq   
    281c:	f3 c3                	repz retq 

000000000000281e <init_driver>:
    281e:	41 54                	push   %r12
    2820:	55                   	push   %rbp
    2821:	53                   	push   %rbx
    2822:	48 83 ec 20          	sub    $0x20,%rsp
    2826:	49 89 fc             	mov    %rdi,%r12
    2829:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2830:	00 00 
    2832:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    2837:	31 c0                	xor    %eax,%eax
    2839:	be 01 00 00 00       	mov    $0x1,%esi
    283e:	bf 0d 00 00 00       	mov    $0xd,%edi
    2843:	e8 98 e8 ff ff       	callq  10e0 <signal@plt>
    2848:	be 01 00 00 00       	mov    $0x1,%esi
    284d:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2852:	e8 89 e8 ff ff       	callq  10e0 <signal@plt>
    2857:	be 01 00 00 00       	mov    $0x1,%esi
    285c:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2861:	e8 7a e8 ff ff       	callq  10e0 <signal@plt>
    2866:	ba 00 00 00 00       	mov    $0x0,%edx
    286b:	be 01 00 00 00       	mov    $0x1,%esi
    2870:	bf 02 00 00 00       	mov    $0x2,%edi
    2875:	e8 56 e9 ff ff       	callq  11d0 <socket@plt>
    287a:	85 c0                	test   %eax,%eax
    287c:	0f 88 a3 00 00 00    	js     2925 <init_driver+0x107>
    2882:	89 c3                	mov    %eax,%ebx
    2884:	48 8d 3d 41 0d 00 00 	lea    0xd41(%rip),%rdi        # 35cc <array.3340+0x3ec>
    288b:	e8 60 e8 ff ff       	callq  10f0 <gethostbyname@plt>
    2890:	48 85 c0             	test   %rax,%rax
    2893:	0f 84 df 00 00 00    	je     2978 <init_driver+0x15a>
    2899:	48 89 e5             	mov    %rsp,%rbp
    289c:	48 c7 44 24 02 00 00 	movq   $0x0,0x2(%rsp)
    28a3:	00 00 
    28a5:	c7 45 0a 00 00 00 00 	movl   $0x0,0xa(%rbp)
    28ac:	66 c7 45 0e 00 00    	movw   $0x0,0xe(%rbp)
    28b2:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
    28b8:	48 63 50 14          	movslq 0x14(%rax),%rdx
    28bc:	48 8b 40 18          	mov    0x18(%rax),%rax
    28c0:	48 8d 7d 04          	lea    0x4(%rbp),%rdi
    28c4:	b9 0c 00 00 00       	mov    $0xc,%ecx
    28c9:	48 8b 30             	mov    (%rax),%rsi
    28cc:	e8 2f e8 ff ff       	callq  1100 <__memmove_chk@plt>
    28d1:	66 c7 44 24 02 3d 6a 	movw   $0x6a3d,0x2(%rsp)
    28d8:	ba 10 00 00 00       	mov    $0x10,%edx
    28dd:	48 89 ee             	mov    %rbp,%rsi
    28e0:	89 df                	mov    %ebx,%edi
    28e2:	e8 99 e8 ff ff       	callq  1180 <connect@plt>
    28e7:	85 c0                	test   %eax,%eax
    28e9:	0f 88 fb 00 00 00    	js     29ea <init_driver+0x1cc>
    28ef:	89 df                	mov    %ebx,%edi
    28f1:	e8 ba e7 ff ff       	callq  10b0 <close@plt>
    28f6:	66 41 c7 04 24 4f 4b 	movw   $0x4b4f,(%r12)
    28fd:	41 c6 44 24 02 00    	movb   $0x0,0x2(%r12)
    2903:	b8 00 00 00 00       	mov    $0x0,%eax
    2908:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    290d:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    2914:	00 00 
    2916:	0f 85 06 01 00 00    	jne    2a22 <init_driver+0x204>
    291c:	48 83 c4 20          	add    $0x20,%rsp
    2920:	5b                   	pop    %rbx
    2921:	5d                   	pop    %rbp
    2922:	41 5c                	pop    %r12
    2924:	c3                   	retq   
    2925:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    292c:	3a 20 43 
    292f:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2936:	20 75 6e 
    2939:	49 89 04 24          	mov    %rax,(%r12)
    293d:	49 89 54 24 08       	mov    %rdx,0x8(%r12)
    2942:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2949:	74 6f 20 
    294c:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    2953:	65 20 73 
    2956:	49 89 44 24 10       	mov    %rax,0x10(%r12)
    295b:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
    2960:	41 c7 44 24 20 6f 63 	movl   $0x656b636f,0x20(%r12)
    2967:	6b 65 
    2969:	66 41 c7 44 24 24 74 	movw   $0x74,0x24(%r12)
    2970:	00 
    2971:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2976:	eb 90                	jmp    2908 <init_driver+0xea>
    2978:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    297f:	3a 20 44 
    2982:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    2989:	20 75 6e 
    298c:	49 89 04 24          	mov    %rax,(%r12)
    2990:	49 89 54 24 08       	mov    %rdx,0x8(%r12)
    2995:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    299c:	74 6f 20 
    299f:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    29a6:	76 65 20 
    29a9:	49 89 44 24 10       	mov    %rax,0x10(%r12)
    29ae:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
    29b3:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    29ba:	72 20 61 
    29bd:	49 89 44 24 20       	mov    %rax,0x20(%r12)
    29c2:	41 c7 44 24 28 64 64 	movl   $0x65726464,0x28(%r12)
    29c9:	72 65 
    29cb:	66 41 c7 44 24 2c 73 	movw   $0x7373,0x2c(%r12)
    29d2:	73 
    29d3:	41 c6 44 24 2e 00    	movb   $0x0,0x2e(%r12)
    29d9:	89 df                	mov    %ebx,%edi
    29db:	e8 d0 e6 ff ff       	callq  10b0 <close@plt>
    29e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    29e5:	e9 1e ff ff ff       	jmpq   2908 <init_driver+0xea>
    29ea:	4c 8d 05 db 0b 00 00 	lea    0xbdb(%rip),%r8        # 35cc <array.3340+0x3ec>
    29f1:	48 8d 0d 90 0b 00 00 	lea    0xb90(%rip),%rcx        # 3588 <array.3340+0x3a8>
    29f8:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    29ff:	be 01 00 00 00       	mov    $0x1,%esi
    2a04:	4c 89 e7             	mov    %r12,%rdi
    2a07:	b8 00 00 00 00       	mov    $0x0,%eax
    2a0c:	e8 af e7 ff ff       	callq  11c0 <__sprintf_chk@plt>
    2a11:	89 df                	mov    %ebx,%edi
    2a13:	e8 98 e6 ff ff       	callq  10b0 <close@plt>
    2a18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2a1d:	e9 e6 fe ff ff       	jmpq   2908 <init_driver+0xea>
    2a22:	e8 69 e6 ff ff       	callq  1090 <__stack_chk_fail@plt>

0000000000002a27 <driver_post>:
    2a27:	53                   	push   %rbx
    2a28:	4c 89 c3             	mov    %r8,%rbx
    2a2b:	85 c9                	test   %ecx,%ecx
    2a2d:	75 17                	jne    2a46 <driver_post+0x1f>
    2a2f:	48 85 ff             	test   %rdi,%rdi
    2a32:	74 05                	je     2a39 <driver_post+0x12>
    2a34:	80 3f 00             	cmpb   $0x0,(%rdi)
    2a37:	75 33                	jne    2a6c <driver_post+0x45>
    2a39:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    2a3e:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    2a42:	89 c8                	mov    %ecx,%eax
    2a44:	5b                   	pop    %rbx
    2a45:	c3                   	retq   
    2a46:	48 8d 35 90 0b 00 00 	lea    0xb90(%rip),%rsi        # 35dd <array.3340+0x3fd>
    2a4d:	bf 01 00 00 00       	mov    $0x1,%edi
    2a52:	b8 00 00 00 00       	mov    $0x0,%eax
    2a57:	e8 e4 e6 ff ff       	callq  1140 <__printf_chk@plt>
    2a5c:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    2a61:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    2a65:	b8 00 00 00 00       	mov    $0x0,%eax
    2a6a:	eb d8                	jmp    2a44 <driver_post+0x1d>
    2a6c:	41 50                	push   %r8
    2a6e:	52                   	push   %rdx
    2a6f:	4c 8d 0d 7e 0b 00 00 	lea    0xb7e(%rip),%r9        # 35f4 <array.3340+0x414>
    2a76:	49 89 f0             	mov    %rsi,%r8
    2a79:	48 89 f9             	mov    %rdi,%rcx
    2a7c:	48 8d 15 77 0b 00 00 	lea    0xb77(%rip),%rdx        # 35fa <array.3340+0x41a>
    2a83:	be 6a 3d 00 00       	mov    $0x3d6a,%esi
    2a88:	48 8d 3d 3d 0b 00 00 	lea    0xb3d(%rip),%rdi        # 35cc <array.3340+0x3ec>
    2a8f:	e8 1e f5 ff ff       	callq  1fb2 <submitr>
    2a94:	48 83 c4 10          	add    $0x10,%rsp
    2a98:	eb aa                	jmp    2a44 <driver_post+0x1d>
    2a9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000002aa0 <__libc_csu_init>:
    2aa0:	f3 0f 1e fa          	endbr64 
    2aa4:	41 57                	push   %r15
    2aa6:	4c 8d 3d 3b 22 00 00 	lea    0x223b(%rip),%r15        # 4ce8 <__frame_dummy_init_array_entry>
    2aad:	41 56                	push   %r14
    2aaf:	49 89 d6             	mov    %rdx,%r14
    2ab2:	41 55                	push   %r13
    2ab4:	49 89 f5             	mov    %rsi,%r13
    2ab7:	41 54                	push   %r12
    2ab9:	41 89 fc             	mov    %edi,%r12d
    2abc:	55                   	push   %rbp
    2abd:	48 8d 2d 2c 22 00 00 	lea    0x222c(%rip),%rbp        # 4cf0 <__do_global_dtors_aux_fini_array_entry>
    2ac4:	53                   	push   %rbx
    2ac5:	4c 29 fd             	sub    %r15,%rbp
    2ac8:	48 83 ec 08          	sub    $0x8,%rsp
    2acc:	e8 2f e5 ff ff       	callq  1000 <_init>
    2ad1:	48 c1 fd 03          	sar    $0x3,%rbp
    2ad5:	74 1f                	je     2af6 <__libc_csu_init+0x56>
    2ad7:	31 db                	xor    %ebx,%ebx
    2ad9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2ae0:	4c 89 f2             	mov    %r14,%rdx
    2ae3:	4c 89 ee             	mov    %r13,%rsi
    2ae6:	44 89 e7             	mov    %r12d,%edi
    2ae9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    2aed:	48 83 c3 01          	add    $0x1,%rbx
    2af1:	48 39 dd             	cmp    %rbx,%rbp
    2af4:	75 ea                	jne    2ae0 <__libc_csu_init+0x40>
    2af6:	48 83 c4 08          	add    $0x8,%rsp
    2afa:	5b                   	pop    %rbx
    2afb:	5d                   	pop    %rbp
    2afc:	41 5c                	pop    %r12
    2afe:	41 5d                	pop    %r13
    2b00:	41 5e                	pop    %r14
    2b02:	41 5f                	pop    %r15
    2b04:	c3                   	retq   
    2b05:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    2b0c:	00 00 00 00 

0000000000002b10 <__libc_csu_fini>:
    2b10:	f3 0f 1e fa          	endbr64 
    2b14:	c3                   	retq   

Desensamblado de la sección .fini:

0000000000002b18 <_fini>:
    2b18:	f3 0f 1e fa          	endbr64 
    2b1c:	48 83 ec 08          	sub    $0x8,%rsp
    2b20:	48 83 c4 08          	add    $0x8,%rsp
    2b24:	c3                   	retq   

Desensamblado de la sección .rodata:

0000000000003000 <_IO_stdin_used>:
    3000:	01 00                	add    %eax,(%rax)
    3002:	02 00                	add    (%rax),%al
    3004:	25 73 3a 20 45       	and    $0x45203a73,%eax
    3009:	72 72                	jb     307d <_IO_stdin_used+0x7d>
    300b:	6f                   	outsl  %ds:(%rsi),(%dx)
    300c:	72 3a                	jb     3048 <_IO_stdin_used+0x48>
    300e:	20 43 6f             	and    %al,0x6f(%rbx)
    3011:	75 6c                	jne    307f <_IO_stdin_used+0x7f>
    3013:	64 6e                	outsb  %fs:(%rsi),(%dx)
    3015:	27                   	(bad)  
    3016:	74 20                	je     3038 <_IO_stdin_used+0x38>
    3018:	6f                   	outsl  %ds:(%rsi),(%dx)
    3019:	70 65                	jo     3080 <_IO_stdin_used+0x80>
    301b:	6e                   	outsb  %ds:(%rsi),(%dx)
    301c:	20 25 73 0a 00 55    	and    %ah,0x55000a73(%rip)        # 55003a95 <_end+0x54ffdd05>
    3022:	73 61                	jae    3085 <_IO_stdin_used+0x85>
    3024:	67 65 3a 20          	cmp    %gs:(%eax),%ah
    3028:	25 73 20 5b 3c       	and    $0x3c5b2073,%eax
    302d:	69 6e 70 75 74 5f 66 	imul   $0x665f7475,0x70(%rsi),%ebp
    3034:	69 6c 65 3e 5d 0a 00 	imul   $0x54000a5d,0x3e(%rbp,%riz,2),%ebp
    303b:	54 
    303c:	68 61 74 27 73       	pushq  $0x73277461
    3041:	20 6e 75             	and    %ch,0x75(%rsi)
    3044:	6d                   	insl   (%dx),%es:(%rdi)
    3045:	62                   	(bad)  
    3046:	65 72 20             	gs jb  3069 <_IO_stdin_used+0x69>
    3049:	32 2e                	xor    (%rsi),%ch
    304b:	20 20                	and    %ah,(%rax)
    304d:	4b                   	rex.WXB
    304e:	65 65 70 20          	gs gs jo 3072 <_IO_stdin_used+0x72>
    3052:	67 6f                	outsl  %ds:(%esi),(%dx)
    3054:	69 6e 67 21 00 48 61 	imul   $0x61480021,0x67(%rsi),%ebp
    305b:	6c                   	insb   (%dx),%es:(%rdi)
    305c:	66 77 61             	data16 ja 30c0 <_IO_stdin_used+0xc0>
    305f:	79 20                	jns    3081 <_IO_stdin_used+0x81>
    3061:	74 68                	je     30cb <_IO_stdin_used+0xcb>
    3063:	65 72 65             	gs jb  30cb <_IO_stdin_used+0xcb>
    3066:	21 00                	and    %eax,(%rax)
    3068:	47 6f                	rex.RXB outsl %ds:(%rsi),(%dx)
    306a:	6f                   	outsl  %ds:(%rsi),(%dx)
    306b:	64 20 77 6f          	and    %dh,%fs:0x6f(%rdi)
    306f:	72 6b                	jb     30dc <_IO_stdin_used+0xdc>
    3071:	21 20                	and    %esp,(%rax)
    3073:	20 4f 6e             	and    %cl,0x6e(%rdi)
    3076:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
    307a:	74 68                	je     30e4 <_IO_stdin_used+0xe4>
    307c:	65 20 6e 65          	and    %ch,%gs:0x65(%rsi)
    3080:	78 74                	js     30f6 <_IO_stdin_used+0xf6>
    3082:	2e 2e 2e 00 00       	cs cs add %al,%cs:(%rax)
    3087:	00 57 65             	add    %dl,0x65(%rdi)
    308a:	6c                   	insb   (%dx),%es:(%rdi)
    308b:	63 6f 6d             	movslq 0x6d(%rdi),%ebp
    308e:	65 20 74 6f 20       	and    %dh,%gs:0x20(%rdi,%rbp,2)
    3093:	6d                   	insl   (%dx),%es:(%rdi)
    3094:	79 20                	jns    30b6 <_IO_stdin_used+0xb6>
    3096:	66 69 65 6e 64 69    	imul   $0x6964,0x6e(%rbp),%sp
    309c:	73 68                	jae    3106 <_IO_stdin_used+0x106>
    309e:	20 6c 69 74          	and    %ch,0x74(%rcx,%rbp,2)
    30a2:	74 6c                	je     3110 <_IO_stdin_used+0x110>
    30a4:	65 20 62 6f          	and    %ah,%gs:0x6f(%rdx)
    30a8:	6d                   	insl   (%dx),%es:(%rdi)
    30a9:	62                   	(bad)  
    30aa:	2e 20 59 6f          	and    %bl,%cs:0x6f(%rcx)
    30ae:	75 20                	jne    30d0 <_IO_stdin_used+0xd0>
    30b0:	68 61 76 65 20       	pushq  $0x20657661
    30b5:	36 20 70 68          	and    %dh,%ss:0x68(%rax)
    30b9:	61                   	(bad)  
    30ba:	73 65                	jae    3121 <_IO_stdin_used+0x121>
    30bc:	73 20                	jae    30de <_IO_stdin_used+0xde>
    30be:	77 69                	ja     3129 <_IO_stdin_used+0x129>
    30c0:	74 68                	je     312a <_IO_stdin_used+0x12a>
    30c2:	00 00                	add    %al,(%rax)
    30c4:	00 00                	add    %al,(%rax)
    30c6:	00 00                	add    %al,(%rax)
    30c8:	77 68                	ja     3132 <_IO_stdin_used+0x132>
    30ca:	69 63 68 20 74 6f 20 	imul   $0x206f7420,0x68(%rbx),%esp
    30d1:	62                   	(bad)  
    30d2:	6c                   	insb   (%dx),%es:(%rdi)
    30d3:	6f                   	outsl  %ds:(%rsi),(%dx)
    30d4:	77 20                	ja     30f6 <_IO_stdin_used+0xf6>
    30d6:	79 6f                	jns    3147 <_IO_stdin_used+0x147>
    30d8:	75 72                	jne    314c <_IO_stdin_used+0x14c>
    30da:	73 65                	jae    3141 <_IO_stdin_used+0x141>
    30dc:	6c                   	insb   (%dx),%es:(%rdi)
    30dd:	66 20 75 70          	data16 and %dh,0x70(%rbp)
    30e1:	2e 20 48 61          	and    %cl,%cs:0x61(%rax)
    30e5:	76 65                	jbe    314c <_IO_stdin_used+0x14c>
    30e7:	20 61 20             	and    %ah,0x20(%rcx)
    30ea:	6e                   	outsb  %ds:(%rsi),(%dx)
    30eb:	69 63 65 20 64 61 79 	imul   $0x79616420,0x65(%rbx),%esp
    30f2:	21 00                	and    %eax,(%rax)
    30f4:	00 00                	add    %al,(%rax)
    30f6:	00 00                	add    %al,(%rax)
    30f8:	50                   	push   %rax
    30f9:	68 61 73 65 20       	pushq  $0x20657361
    30fe:	31 20                	xor    %esp,(%rax)
    3100:	64 65 66 75 73       	fs gs data16 jne 3178 <_IO_stdin_used+0x178>
    3105:	65 64 2e 20 48 6f    	gs fs and %cl,%cs:0x6f(%rax)
    310b:	77 20                	ja     312d <_IO_stdin_used+0x12d>
    310d:	61                   	(bad)  
    310e:	62                   	(bad)  
    310f:	6f                   	outsl  %ds:(%rsi),(%dx)
    3110:	75 74                	jne    3186 <_IO_stdin_used+0x186>
    3112:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
    3116:	20 6e 65             	and    %ch,0x65(%rsi)
    3119:	78 74                	js     318f <_IO_stdin_used+0x18f>
    311b:	20 6f 6e             	and    %ch,0x6e(%rdi)
    311e:	65 3f                	gs (bad) 
	...
    3128:	53                   	push   %rbx
    3129:	6f                   	outsl  %ds:(%rsi),(%dx)
    312a:	20 79 6f             	and    %bh,0x6f(%rcx)
    312d:	75 20                	jne    314f <_IO_stdin_used+0x14f>
    312f:	67 6f                	outsl  %ds:(%esi),(%dx)
    3131:	74 20                	je     3153 <_IO_stdin_used+0x153>
    3133:	74 68                	je     319d <_IO_stdin_used+0x19d>
    3135:	61                   	(bad)  
    3136:	74 20                	je     3158 <_IO_stdin_used+0x158>
    3138:	6f                   	outsl  %ds:(%rsi),(%dx)
    3139:	6e                   	outsb  %ds:(%rsi),(%dx)
    313a:	65 2e 20 20          	gs and %ah,%cs:(%rax)
    313e:	54                   	push   %rsp
    313f:	72 79                	jb     31ba <_IO_stdin_used+0x1ba>
    3141:	20 74 68 69          	and    %dh,0x69(%rax,%rbp,2)
    3145:	73 20                	jae    3167 <_IO_stdin_used+0x167>
    3147:	6f                   	outsl  %ds:(%rsi),(%dx)
    3148:	6e                   	outsb  %ds:(%rsi),(%dx)
    3149:	65 2e 00 00          	gs add %al,%cs:(%rax)
    314d:	00 00                	add    %al,(%rax)
    314f:	00 49 20             	add    %cl,0x20(%rcx)
    3152:	74 75                	je     31c9 <_IO_stdin_used+0x1c9>
    3154:	72 6e                	jb     31c4 <_IO_stdin_used+0x1c4>
    3156:	65 64 20 74 68 65    	gs and %dh,%fs:0x65(%rax,%rbp,2)
    315c:	20 6d 6f             	and    %ch,0x6f(%rbp)
    315f:	6f                   	outsl  %ds:(%rsi),(%dx)
    3160:	6e                   	outsb  %ds:(%rsi),(%dx)
    3161:	20 69 6e             	and    %ch,0x6e(%rcx)
    3164:	74 6f                	je     31d5 <_IO_stdin_used+0x1d5>
    3166:	20 73 6f             	and    %dh,0x6f(%rbx)
    3169:	6d                   	insl   (%dx),%es:(%rdi)
    316a:	65 74 68             	gs je  31d5 <_IO_stdin_used+0x1d5>
    316d:	69 6e 67 20 49 20 63 	imul   $0x63204920,0x67(%rsi),%ebp
    3174:	61                   	(bad)  
    3175:	6c                   	insb   (%dx),%es:(%rdi)
    3176:	6c                   	insb   (%dx),%es:(%rdi)
    3177:	20 61 20             	and    %ah,0x20(%rcx)
    317a:	44                   	rex.R
    317b:	65 61                	gs (bad) 
    317d:	74 68                	je     31e7 <array.3340+0x7>
    317f:	20 53 74             	and    %dl,0x74(%rbx)
    3182:	61                   	(bad)  
    3183:	72 2e                	jb     31b3 <_IO_stdin_used+0x1b3>
    3185:	00 00                	add    %al,(%rax)
    3187:	00 57 6f             	add    %dl,0x6f(%rdi)
    318a:	77 21                	ja     31ad <_IO_stdin_used+0x1ad>
    318c:	20 59 6f             	and    %bl,0x6f(%rcx)
    318f:	75 27                	jne    31b8 <_IO_stdin_used+0x1b8>
    3191:	76 65                	jbe    31f8 <array.3340+0x18>
    3193:	20 64 65 66          	and    %ah,0x66(%rbp,%riz,2)
    3197:	75 73                	jne    320c <array.3340+0x2c>
    3199:	65 64 20 74 68 65    	gs and %dh,%fs:0x65(%rax,%rbp,2)
    319f:	20 73 65             	and    %dh,0x65(%rbx)
    31a2:	63 72 65             	movslq 0x65(%rdx),%esi
    31a5:	74 20                	je     31c7 <_IO_stdin_used+0x1c7>
    31a7:	73 74                	jae    321d <array.3340+0x3d>
    31a9:	61                   	(bad)  
    31aa:	67 65 21 00          	and    %eax,%gs:(%eax)
	...
    31be:	00 00                	add    %al,(%rax)
    31c0:	74 e3                	je     31a5 <_IO_stdin_used+0x1a5>
    31c2:	ff                   	(bad)  
    31c3:	ff                   	(bad)  
    31c4:	7b e3                	jnp    31a9 <_IO_stdin_used+0x1a9>
    31c6:	ff                   	(bad)  
    31c7:	ff c9                	dec    %ecx
    31c9:	e3 ff                	jrcxz  31ca <_IO_stdin_used+0x1ca>
    31cb:	ff d0                	callq  *%rax
    31cd:	e3 ff                	jrcxz  31ce <_IO_stdin_used+0x1ce>
    31cf:	ff d7                	callq  *%rdi
    31d1:	e3 ff                	jrcxz  31d2 <_IO_stdin_used+0x1d2>
    31d3:	ff                   	(bad)  
    31d4:	de e3                	fsubp  %st,%st(3)
    31d6:	ff                   	(bad)  
    31d7:	ff e5                	jmpq   *%rbp
    31d9:	e3 ff                	jrcxz  31da <_IO_stdin_used+0x1da>
    31db:	ff                   	(bad)  
    31dc:	ec                   	in     (%dx),%al
    31dd:	e3 ff                	jrcxz  31de <_IO_stdin_used+0x1de>
    31df:	ff                 	incl   (%rdx)

00000000000031e0 <array.3340>:
    31e0:	02 00                	add    (%rax),%al
    31e2:	00 00                	add    %al,(%rax)
    31e4:	0a 00                	or     (%rax),%al
    31e6:	00 00                	add    %al,(%rax)
    31e8:	06                   	(bad)  
    31e9:	00 00                	add    %al,(%rax)
    31eb:	00 01                	add    %al,(%rcx)
    31ed:	00 00                	add    %al,(%rax)
    31ef:	00 0c 00             	add    %cl,(%rax,%rax,1)
    31f2:	00 00                	add    %al,(%rax)
    31f4:	10 00                	adc    %al,(%rax)
    31f6:	00 00                	add    %al,(%rax)
    31f8:	09 00                	or     %eax,(%rax)
    31fa:	00 00                	add    %al,(%rax)
    31fc:	03 00                	add    (%rax),%eax
    31fe:	00 00                	add    %al,(%rax)
    3200:	04 00                	add    $0x0,%al
    3202:	00 00                	add    %al,(%rax)
    3204:	07                   	(bad)  
    3205:	00 00                	add    %al,(%rax)
    3207:	00 0e                	add    %cl,(%rsi)
    3209:	00 00                	add    %al,(%rax)
    320b:	00 05 00 00 00 0b    	add    %al,0xb000000(%rip)        # b003211 <_end+0xaffd481>
    3211:	00 00                	add    %al,(%rax)
    3213:	00 08                	add    %cl,(%rax)
    3215:	00 00                	add    %al,(%rax)
    3217:	00 0f                	add    %cl,(%rdi)
    3219:	00 00                	add    %al,(%rax)
    321b:	00 0d 00 00 00 53    	add    %cl,0x53000000(%rip)        # 53003221 <_end+0x52ffd491>
    3221:	6f                   	outsl  %ds:(%rsi),(%dx)
    3222:	20 79 6f             	and    %bh,0x6f(%rcx)
    3225:	75 20                	jne    3247 <array.3340+0x67>
    3227:	74 68                	je     3291 <array.3340+0xb1>
    3229:	69 6e 6b 20 79 6f 75 	imul   $0x756f7920,0x6b(%rsi),%ebp
    3230:	20 63 61             	and    %ah,0x61(%rbx)
    3233:	6e                   	outsb  %ds:(%rsi),(%dx)
    3234:	20 73 74             	and    %dh,0x74(%rbx)
    3237:	6f                   	outsl  %ds:(%rsi),(%dx)
    3238:	70 20                	jo     325a <array.3340+0x7a>
    323a:	74 68                	je     32a4 <array.3340+0xc4>
    323c:	65 20 62 6f          	and    %ah,%gs:0x6f(%rdx)
    3240:	6d                   	insl   (%dx),%es:(%rdi)
    3241:	62                   	(bad)  
    3242:	20 77 69             	and    %dh,0x69(%rdi)
    3245:	74 68                	je     32af <array.3340+0xcf>
    3247:	20 63 74             	and    %ah,0x74(%rbx)
    324a:	72 6c                	jb     32b8 <array.3340+0xd8>
    324c:	2d 63 2c 20 64       	sub    $0x64202c63,%eax
    3251:	6f                   	outsl  %ds:(%rsi),(%dx)
    3252:	20 79 6f             	and    %bh,0x6f(%rcx)
    3255:	75 3f                	jne    3296 <array.3340+0xb6>
    3257:	00 49 6e             	add    %cl,0x6e(%rcx)
    325a:	69 74 69 61 6c 69 7a 	imul   $0x617a696c,0x61(%rcx,%rbp,2),%esi
    3261:	61 
    3262:	74 69                	je     32cd <array.3340+0xed>
    3264:	6f                   	outsl  %ds:(%rsi),(%dx)
    3265:	6e                   	outsb  %ds:(%rsi),(%dx)
    3266:	20 65 72             	and    %ah,0x72(%rbp)
    3269:	72 6f                	jb     32da <array.3340+0xfa>
    326b:	72 3a                	jb     32a7 <array.3340+0xc7>
    326d:	20 52 75             	and    %dl,0x75(%rdx)
    3270:	6e                   	outsb  %ds:(%rsi),(%dx)
    3271:	6e                   	outsb  %ds:(%rsi),(%dx)
    3272:	69 6e 67 20 6f 6e 20 	imul   $0x206e6f20,0x67(%rsi),%ebp
    3279:	61                   	(bad)  
    327a:	6e                   	outsb  %ds:(%rsi),(%dx)
    327b:	20 69 6c             	and    %ch,0x6c(%rcx)
    327e:	6c                   	insb   (%dx),%es:(%rdi)
    327f:	65 67 61             	gs addr32 (bad) 
    3282:	6c                   	insb   (%dx),%es:(%rdi)
    3283:	20 68 6f             	and    %ch,0x6f(%rax)
    3286:	73 74                	jae    32fc <array.3340+0x11c>
    3288:	20 5b 31             	and    %bl,0x31(%rbx)
    328b:	5d                   	pop    %rbp
    328c:	00 00                	add    %al,(%rax)
    328e:	00 00                	add    %al,(%rax)
    3290:	49 6e                	rex.WB outsb %ds:(%rsi),(%dx)
    3292:	69 74 69 61 6c 69 7a 	imul   $0x617a696c,0x61(%rcx,%rbp,2),%esi
    3299:	61 
    329a:	74 69                	je     3305 <array.3340+0x125>
    329c:	6f                   	outsl  %ds:(%rsi),(%dx)
    329d:	6e                   	outsb  %ds:(%rsi),(%dx)
    329e:	20 65 72             	and    %ah,0x72(%rbp)
    32a1:	72 6f                	jb     3312 <array.3340+0x132>
    32a3:	72 3a                	jb     32df <array.3340+0xff>
    32a5:	20 52 75             	and    %dl,0x75(%rdx)
    32a8:	6e                   	outsb  %ds:(%rsi),(%dx)
    32a9:	6e                   	outsb  %ds:(%rsi),(%dx)
    32aa:	69 6e 67 20 6f 6e 20 	imul   $0x206e6f20,0x67(%rsi),%ebp
    32b1:	61                   	(bad)  
    32b2:	6e                   	outsb  %ds:(%rsi),(%dx)
    32b3:	20 69 6c             	and    %ch,0x6c(%rcx)
    32b6:	6c                   	insb   (%dx),%es:(%rdi)
    32b7:	65 67 61             	gs addr32 (bad) 
    32ba:	6c                   	insb   (%dx),%es:(%rdi)
    32bb:	20 68 6f             	and    %ch,0x6f(%rax)
    32be:	73 74                	jae    3334 <array.3340+0x154>
    32c0:	20 5b 32             	and    %bl,0x32(%rbx)
    32c3:	5d                   	pop    %rbp
    32c4:	00 00                	add    %al,(%rax)
    32c6:	00 00                	add    %al,(%rax)
    32c8:	45 52                	rex.RB push %r10
    32ca:	52                   	push   %rdx
    32cb:	4f 52                	rex.WRXB push %r10
    32cd:	3a 20                	cmp    (%rax),%ah
    32cf:	49 6e                	rex.WB outsb %ds:(%rsi),(%dx)
    32d1:	70 75                	jo     3348 <array.3340+0x168>
    32d3:	74 20                	je     32f5 <array.3340+0x115>
    32d5:	73 74                	jae    334b <array.3340+0x16b>
    32d7:	72 69                	jb     3342 <array.3340+0x162>
    32d9:	6e                   	outsb  %ds:(%rsi),(%dx)
    32da:	67 20 69 73          	and    %ch,0x73(%ecx)
    32de:	20 74 6f 6f          	and    %dh,0x6f(%rdi,%rbp,2)
    32e2:	20 6c 61 72          	and    %ch,0x72(%rcx,%riz,2)
    32e6:	67 65 2e 00 00       	gs add %al,%cs:(%eax)
    32eb:	00 00                	add    %al,(%rax)
    32ed:	00 00                	add    %al,(%rax)
    32ef:	00 59 6f             	add    %bl,0x6f(%rcx)
    32f2:	75 72                	jne    3366 <array.3340+0x186>
    32f4:	20 69 6e             	and    %ch,0x6e(%rcx)
    32f7:	73 74                	jae    336d <array.3340+0x18d>
    32f9:	72 75                	jb     3370 <array.3340+0x190>
    32fb:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
    32ff:	20 68 61             	and    %ch,0x61(%rax)
    3302:	73 20                	jae    3324 <array.3340+0x144>
    3304:	62                   	(bad)  
    3305:	65 65 6e             	gs outsb %gs:(%rsi),(%dx)
    3308:	20 6e 6f             	and    %ch,0x6f(%rsi)
    330b:	74 69                	je     3376 <array.3340+0x196>
    330d:	66 69 65 64 2e 00    	imul   $0x2e,0x64(%rbp),%sp
    3313:	00 00                	add    %al,(%rax)
    3315:	00 00                	add    %al,(%rax)
    3317:	00 43 75             	add    %al,0x75(%rbx)
    331a:	72 73                	jb     338f <array.3340+0x1af>
    331c:	65 73 2c             	gs jae 334b <array.3340+0x16b>
    331f:	20 79 6f             	and    %bh,0x6f(%rcx)
    3322:	75 27                	jne    334b <array.3340+0x16b>
    3324:	76 65                	jbe    338b <array.3340+0x1ab>
    3326:	20 66 6f             	and    %ah,0x6f(%rsi)
    3329:	75 6e                	jne    3399 <array.3340+0x1b9>
    332b:	64 20 74 68 65       	and    %dh,%fs:0x65(%rax,%rbp,2)
    3330:	20 73 65             	and    %dh,0x65(%rbx)
    3333:	63 72 65             	movslq 0x65(%rdx),%esi
    3336:	74 20                	je     3358 <array.3340+0x178>
    3338:	70 68                	jo     33a2 <array.3340+0x1c2>
    333a:	61                   	(bad)  
    333b:	73 65                	jae    33a2 <array.3340+0x1c2>
    333d:	21 00                	and    %eax,(%rax)
    333f:	00 42 75             	add    %al,0x75(%rdx)
    3342:	74 20                	je     3364 <array.3340+0x184>
    3344:	66 69 6e 64 69 6e    	imul   $0x6e69,0x64(%rsi),%bp
    334a:	67 20 69 74          	and    %ch,0x74(%ecx)
    334e:	20 61 6e             	and    %ah,0x6e(%rcx)
    3351:	64 20 73 6f          	and    %dh,%fs:0x6f(%rbx)
    3355:	6c                   	insb   (%dx),%es:(%rdi)
    3356:	76 69                	jbe    33c1 <array.3340+0x1e1>
    3358:	6e                   	outsb  %ds:(%rsi),(%dx)
    3359:	67 20 69 74          	and    %ch,0x74(%ecx)
    335d:	20 61 72             	and    %ah,0x72(%rcx)
    3360:	65 20 71 75          	and    %dh,%gs:0x75(%rcx)
    3364:	69 74 65 20 64 69 66 	imul   $0x66666964,0x20(%rbp,%riz,2),%esi
    336b:	66 
    336c:	65 72 65             	gs jb  33d4 <array.3340+0x1f4>
    336f:	6e                   	outsb  %ds:(%rsi),(%dx)
    3370:	74 2e                	je     33a0 <array.3340+0x1c0>
    3372:	2e 2e 00 00          	cs add %al,%cs:(%rax)
    3376:	00 00                	add    %al,(%rax)
    3378:	43 6f                	rex.XB outsl %ds:(%rsi),(%dx)
    337a:	6e                   	outsb  %ds:(%rsi),(%dx)
    337b:	67 72 61             	addr32 jb 33df <array.3340+0x1ff>
    337e:	74 75                	je     33f5 <array.3340+0x215>
    3380:	6c                   	insb   (%dx),%es:(%rdi)
    3381:	61                   	(bad)  
    3382:	74 69                	je     33ed <array.3340+0x20d>
    3384:	6f                   	outsl  %ds:(%rsi),(%dx)
    3385:	6e                   	outsb  %ds:(%rsi),(%dx)
    3386:	73 21                	jae    33a9 <array.3340+0x1c9>
    3388:	20 59 6f             	and    %bl,0x6f(%rcx)
    338b:	75 27                	jne    33b4 <array.3340+0x1d4>
    338d:	76 65                	jbe    33f4 <array.3340+0x214>
    338f:	20 64 65 66          	and    %ah,0x66(%rbp,%riz,2)
    3393:	75 73                	jne    3408 <array.3340+0x228>
    3395:	65 64 20 74 68 65    	gs and %dh,%fs:0x65(%rax,%rbp,2)
    339b:	20 62 6f             	and    %ah,0x6f(%rdx)
    339e:	6d                   	insl   (%dx),%es:(%rdi)
    339f:	62 21                	(bad)  
    33a1:	00 00                	add    %al,(%rax)
    33a3:	00 00                	add    %al,(%rax)
    33a5:	00 00                	add    %al,(%rax)
    33a7:	00 59 6f             	add    %bl,0x6f(%rcx)
    33aa:	75 72                	jne    341e <array.3340+0x23e>
    33ac:	20 69 6e             	and    %ch,0x6e(%rcx)
    33af:	73 74                	jae    3425 <array.3340+0x245>
    33b1:	72 75                	jb     3428 <array.3340+0x248>
    33b3:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
    33b7:	20 68 61             	and    %ch,0x61(%rax)
    33ba:	73 20                	jae    33dc <array.3340+0x1fc>
    33bc:	62                   	(bad)  
    33bd:	65 65 6e             	gs outsb %gs:(%rsi),(%dx)
    33c0:	20 6e 6f             	and    %ch,0x6f(%rsi)
    33c3:	74 69                	je     342e <array.3340+0x24e>
    33c5:	66 69 65 64 20 61    	imul   $0x6120,0x64(%rbp),%sp
    33cb:	6e                   	outsb  %ds:(%rsi),(%dx)
    33cc:	64 20 77 69          	and    %dh,%fs:0x69(%rdi)
    33d0:	6c                   	insb   (%dx),%es:(%rdi)
    33d1:	6c                   	insb   (%dx),%es:(%rdi)
    33d2:	20 76 65             	and    %dh,0x65(%rsi)
    33d5:	72 69                	jb     3440 <array.3340+0x260>
    33d7:	66 79 20             	data16 jns 33fa <array.3340+0x21a>
    33da:	79 6f                	jns    344b <array.3340+0x26b>
    33dc:	75 72                	jne    3450 <array.3340+0x270>
    33de:	20 73 6f             	and    %dh,0x6f(%rbx)
    33e1:	6c                   	insb   (%dx),%es:(%rdi)
    33e2:	75 74                	jne    3458 <array.3340+0x278>
    33e4:	69 6f 6e 2e 00 57 65 	imul   $0x6557002e,0x6e(%rdi),%ebp
    33eb:	6c                   	insb   (%dx),%es:(%rdi)
    33ec:	6c                   	insb   (%dx),%es:(%rdi)
    33ed:	2e 2e 2e 00 4f 4b    	cs cs add %cl,%cs:0x4b(%rdi)
    33f3:	2e 20 3a             	and    %bh,%cs:(%rdx)
    33f6:	2d 29 00 49 6e       	sub    $0x6e490029,%eax
    33fb:	76 61                	jbe    345e <array.3340+0x27e>
    33fd:	6c                   	insb   (%dx),%es:(%rdi)
    33fe:	69 64 20 70 68 61 73 	imul   $0x65736168,0x70(%rax,%riz,1),%esp
    3405:	65 
    3406:	25 73 0a 00 49       	and    $0x49000a73,%eax
    340b:	6e                   	outsb  %ds:(%rsi),(%dx)
    340c:	69 74 69 61 6c 69 7a 	imul   $0x617a696c,0x61(%rcx,%rbp,2),%esi
    3413:	61 
    3414:	74 69                	je     347f <array.3340+0x29f>
    3416:	6f                   	outsl  %ds:(%rsi),(%dx)
    3417:	6e                   	outsb  %ds:(%rsi),(%dx)
    3418:	20 65 72             	and    %ah,0x72(%rbp)
    341b:	72 6f                	jb     348c <array.3340+0x2ac>
    341d:	72 3a                	jb     3459 <array.3340+0x279>
    341f:	0a 25 73 0a 00 64    	or     0x64000a73(%rip),%ah        # 64003e98 <_end+0x63ffe108>
    3425:	65 66 75 73          	gs data16 jne 349c <array.3340+0x2bc>
    3429:	65 64 00 65 78       	gs add %ah,%fs:0x78(%rbp)
    342e:	70 6c                	jo     349c <array.3340+0x2bc>
    3430:	6f                   	outsl  %ds:(%rsi),(%dx)
    3431:	64 65 64 00 25 64 3a 	fs gs add %ah,%fs:0x73253a64(%rip)        # 73256e9e <_end+0x7325110e>
    3438:	25 73 
    343a:	3a 25 64 3a 25 73    	cmp    0x73253a64(%rip),%ah        # 73256ea4 <_end+0x73251114>
    3440:	00 0a                	add    %cl,(%rdx)
    3442:	42                   	rex.X
    3443:	4f                   	rex.WRXB
    3444:	4f                   	rex.WRXB
    3445:	4d 21 21             	and    %r12,(%r9)
    3448:	21 00                	and    %eax,(%rax)
    344a:	54                   	push   %rsp
    344b:	68 65 20 62 6f       	pushq  $0x6f622065
    3450:	6d                   	insl   (%dx),%es:(%rdi)
    3451:	62                   	(bad)  
    3452:	20 68 61             	and    %ch,0x61(%rax)
    3455:	73 20                	jae    3477 <array.3340+0x297>
    3457:	62                   	(bad)  
    3458:	6c                   	insb   (%dx),%es:(%rdi)
    3459:	6f                   	outsl  %ds:(%rsi),(%dx)
    345a:	77 6e                	ja     34ca <array.3340+0x2ea>
    345c:	20 75 70             	and    %dh,0x70(%rbp)
    345f:	2e 00 25 64 20 25 64 	add    %ah,%cs:0x64252064(%rip)        # 642554ca <_end+0x6424f73a>
    3466:	20 25 64 20 25 64    	and    %ah,0x64252064(%rip)        # 642554d0 <_end+0x6424f740>
    346c:	20 25 64 20 25 64    	and    %ah,0x64252064(%rip)        # 642554d6 <_end+0x6424f746>
    3472:	00 45 72             	add    %al,0x72(%rbp)
    3475:	72 6f                	jb     34e6 <array.3340+0x306>
    3477:	72 3a                	jb     34b3 <array.3340+0x2d3>
    3479:	20 50 72             	and    %dl,0x72(%rax)
    347c:	65 6d                	gs insl (%dx),%es:(%rdi)
    347e:	61                   	(bad)  
    347f:	74 75                	je     34f6 <array.3340+0x316>
    3481:	72 65                	jb     34e8 <array.3340+0x308>
    3483:	20 45 4f             	and    %al,0x4f(%rbp)
    3486:	46 20 6f 6e          	rex.RX and %r13b,0x6e(%rdi)
    348a:	20 73 74             	and    %dh,0x74(%rbx)
    348d:	64 69 6e 00 47 52 41 	imul   $0x44415247,%fs:0x0(%rsi),%ebp
    3494:	44 
    3495:	45 5f                	rex.RB pop %r15
    3497:	42                   	rex.X
    3498:	4f                   	rex.WRXB
    3499:	4d                   	rex.WRB
    349a:	42 00 45 72          	rex.X add %al,0x72(%rbp)
    349e:	72 6f                	jb     350f <array.3340+0x32f>
    34a0:	72 3a                	jb     34dc <array.3340+0x2fc>
    34a2:	20 49 6e             	and    %cl,0x6e(%rcx)
    34a5:	70 75                	jo     351c <array.3340+0x33c>
    34a7:	74 20                	je     34c9 <array.3340+0x2e9>
    34a9:	6c                   	insb   (%dx),%es:(%rdi)
    34aa:	69 6e 65 20 74 6f 6f 	imul   $0x6f6f7420,0x65(%rsi),%ebp
    34b1:	20 6c 6f 6e          	and    %ch,0x6e(%rdi,%rbp,2)
    34b5:	67 00 25 64 20 25 64 	add    %ah,0x64252064(%eip)        # 64255520 <_end+0x6424f790>
    34bc:	20 25 73 00 37 4e    	and    %ah,0x4e370073(%rip)        # 4e373535 <_end+0x4e36d7a5>
    34c2:	65 72 4e             	gs jb  3513 <array.3340+0x333>
    34c5:	6d                   	insl   (%dx),%es:(%rdi)
    34c6:	4d 70 4f             	rex.WRB jo 3518 <array.3340+0x338>
    34c9:	65 44                	gs rex.R
    34cb:	44                   	rex.R
    34cc:	47                   	rex.RXB
    34cd:	42                   	rex.X
    34ce:	66 57                	push   %di
    34d0:	45 6d                	rex.RB insl (%dx),%es:(%rdi)
    34d2:	6b 68 00 00          	imul   $0x0,0x0(%rax),%ebp
    34d6:	00 00                	add    %al,(%rax)
    34d8:	50                   	push   %rax
    34d9:	72 6f                	jb     354a <array.3340+0x36a>
    34db:	67 72 61             	addr32 jb 353f <array.3340+0x35f>
    34de:	6d                   	insl   (%dx),%es:(%rdi)
    34df:	20 74 69 6d          	and    %dh,0x6d(%rcx,%rbp,2)
    34e3:	65 64 20 6f 75       	gs and %ch,%fs:0x75(%rdi)
    34e8:	74 20                	je     350a <array.3340+0x32a>
    34ea:	61                   	(bad)  
    34eb:	66 74 65             	data16 je 3553 <array.3340+0x373>
    34ee:	72 20                	jb     3510 <array.3340+0x330>
    34f0:	25 64 20 73 65       	and    $0x65732064,%eax
    34f5:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
    34f8:	64 73 0a             	fs jae 3505 <array.3340+0x325>
    34fb:	00 00                	add    %al,(%rax)
    34fd:	00 00                	add    %al,(%rax)
    34ff:	00 45 72             	add    %al,0x72(%rbp)
    3502:	72 6f                	jb     3573 <array.3340+0x393>
    3504:	72 3a                	jb     3540 <array.3340+0x360>
    3506:	20 48 54             	and    %cl,0x54(%rax)
    3509:	54                   	push   %rsp
    350a:	50                   	push   %rax
    350b:	20 72 65             	and    %dh,0x65(%rdx)
    350e:	71 75                	jno    3585 <array.3340+0x3a5>
    3510:	65 73 74             	gs jae 3587 <array.3340+0x3a7>
    3513:	20 66 61             	and    %ah,0x61(%rsi)
    3516:	69 6c 65 64 20 77 69 	imul   $0x74697720,0x64(%rbp,%riz,2),%ebp
    351d:	74 
    351e:	68 20 65 72 72       	pushq  $0x72726520
    3523:	6f                   	outsl  %ds:(%rsi),(%dx)
    3524:	72 20                	jb     3546 <array.3340+0x366>
    3526:	25 64 3a 20 25       	and    $0x25203a64,%eax
    352b:	73 00                	jae    352d <array.3340+0x34d>
    352d:	00 00                	add    %al,(%rax)
    352f:	00 47 45             	add    %al,0x45(%rdi)
    3532:	54                   	push   %rsp
    3533:	20 2f                	and    %ch,(%rdi)
    3535:	25 73 2f 73 75       	and    $0x75732f73,%eax
    353a:	62                   	(bad)  
    353b:	6d                   	insl   (%dx),%es:(%rdi)
    353c:	69 74 72 2e 70 6c 2f 	imul   $0x3f2f6c70,0x2e(%rdx,%rsi,2),%esi
    3543:	3f 
    3544:	75 73                	jne    35b9 <array.3340+0x3d9>
    3546:	65 72 69             	gs jb  35b2 <array.3340+0x3d2>
    3549:	64 3d 25 73 26 75    	fs cmp $0x75267325,%eax
    354f:	73 65                	jae    35b6 <array.3340+0x3d6>
    3551:	72 70                	jb     35c3 <array.3340+0x3e3>
    3553:	77 64                	ja     35b9 <array.3340+0x3d9>
    3555:	3d 25 73 26 6c       	cmp    $0x6c267325,%eax
    355a:	61                   	(bad)  
    355b:	62                   	(bad)  
    355c:	3d 25 73 26 72       	cmp    $0x72267325,%eax
    3561:	65 73 75             	gs jae 35d9 <array.3340+0x3f9>
    3564:	6c                   	insb   (%dx),%es:(%rdi)
    3565:	74 3d                	je     35a4 <array.3340+0x3c4>
    3567:	25 73 26 73 75       	and    $0x75732673,%eax
    356c:	62                   	(bad)  
    356d:	6d                   	insl   (%dx),%es:(%rdi)
    356e:	69 74 3d 73 75 62 6d 	imul   $0x696d6275,0x73(%rbp,%rdi,1),%esi
    3575:	69 
    3576:	74 20                	je     3598 <array.3340+0x3b8>
    3578:	48 54                	rex.W push %rsp
    357a:	54                   	push   %rsp
    357b:	50                   	push   %rax
    357c:	2f                   	(bad)  
    357d:	31 2e                	xor    %ebp,(%rsi)
    357f:	30 0d 0a 0d 0a 00    	xor    %cl,0xa0d0a(%rip)        # a428f <_end+0x9e4ff>
    3585:	00 00                	add    %al,(%rax)
    3587:	00 45 72             	add    %al,0x72(%rbp)
    358a:	72 6f                	jb     35fb <array.3340+0x41b>
    358c:	72 3a                	jb     35c8 <array.3340+0x3e8>
    358e:	20 55 6e             	and    %dl,0x6e(%rbp)
    3591:	61                   	(bad)  
    3592:	62                   	(bad)  
    3593:	6c                   	insb   (%dx),%es:(%rdi)
    3594:	65 20 74 6f 20       	and    %dh,%gs:0x20(%rdi,%rbp,2)
    3599:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
    359c:	6e                   	outsb  %ds:(%rsi),(%dx)
    359d:	65 63 74 20 74       	movslq %gs:0x74(%rax,%riz,1),%esi
    35a2:	6f                   	outsl  %ds:(%rsi),(%dx)
    35a3:	20 73 65             	and    %dh,0x65(%rbx)
    35a6:	72 76                	jb     361e <__GNU_EH_FRAME_HDR+0x1e>
    35a8:	65 72 20             	gs jb  35cb <array.3340+0x3eb>
    35ab:	25 73 00 25 25       	and    $0x25250073,%eax
    35b0:	25 30 32 58 00       	and    $0x583230,%eax
    35b5:	25 73 20 25 64       	and    $0x64252073,%eax
    35ba:	20 25 5b 61 2d 7a    	and    %ah,0x7a2d615b(%rip)        # 7a2d971b <_end+0x7a2d398b>
    35c0:	41 2d 7a 20 5d 00    	rex.B sub $0x5d207a,%eax
    35c6:	0d 0a 00 4f 4b       	or     $0x4b4f000a,%eax
    35cb:	00 6f 72             	add    %ch,0x72(%rdi)
    35ce:	67 61                	addr32 (bad) 
    35d0:	2e 64 69 6a 6b 73 74 	cs imul $0x61727473,%fs:0x6b(%rdx),%ebp
    35d7:	72 61 
    35d9:	2e 61                	cs (bad) 
    35db:	72 00                	jb     35dd <array.3340+0x3fd>
    35dd:	0a 41 55             	or     0x55(%rcx),%al
    35e0:	54                   	push   %rsp
    35e1:	4f 52                	rex.WRXB push %r10
    35e3:	45 53                	rex.RB push %r11
    35e5:	55                   	push   %rbp
    35e6:	4c 54                	rex.WR push %rsp
    35e8:	5f                   	pop    %rdi
    35e9:	53                   	push   %rbx
    35ea:	54                   	push   %rsp
    35eb:	52                   	push   %rdx
    35ec:	49                   	rex.WB
    35ed:	4e                   	rex.WRX
    35ee:	47 3d 25 73 0a 00    	rex.RXB cmp $0xa7325,%eax
    35f4:	32 30                	xor    (%rax),%dh
    35f6:	32 31                	xor    (%rcx),%dh
    35f8:	61                   	(bad)  
    35f9:	00 63 73             	add    %ah,0x73(%rbx)
    35fc:	61                   	(bad)  
    35fd:	70 70                	jo     366f <__GNU_EH_FRAME_HDR+0x6f>
	...

Desensamblado de la sección .eh_frame_hdr:

0000000000003600 <__GNU_EH_FRAME_HDR>:
    3600:	01 1b                	add    %ebx,(%rbx)
    3602:	03 3b                	add    (%rbx),%edi
    3604:	1c 01                	sbb    $0x1,%al
    3606:	00 00                	add    %al,(%rax)
    3608:	22 00                	and    (%rax),%al
    360a:	00 00                	add    %al,(%rax)
    360c:	20 da                	and    %bl,%dl
    360e:	ff                   	(bad)  
    360f:	ff 50 01             	callq  *0x1(%rax)
    3612:	00 00                	add    %al,(%rax)
    3614:	e0 db                	loopne 35f1 <array.3340+0x411>
    3616:	ff                   	(bad)  
    3617:	ff                   	(bad)  
    3618:	78 01                	js     361b <__GNU_EH_FRAME_HDR+0x1b>
    361a:	00 00                	add    %al,(%rax)
    361c:	f0 db ff             	lock (bad) 
    361f:	ff                   	(bad)  
    3620:	38 01                	cmp    %al,(%rcx)
    3622:	00 00                	add    %al,(%rax)
    3624:	fa                   	cli    
    3625:	dc ff                	fdivr  %st,%st(7)
    3627:	ff 90 01 00 00 54    	callq  *0x54000001(%rax)
    362d:	de ff                	fdivrp %st,%st(7)
    362f:	ff b0 01 00 00 74    	pushq  0x74000001(%rax)
    3635:	de ff                	fdivrp %st,%st(7)
    3637:	ff cc                	dec    %esp
    3639:	01 00                	add    %eax,(%rax)
    363b:	00 e3                	add    %ah,%bl
    363d:	de ff                	fdivrp %st,%st(7)
    363f:	ff                   	(bad)  
    3640:	f8                   	clc    
    3641:	01 00                	add    %eax,(%rax)
    3643:	00 c4                	add    %al,%ah
    3645:	df ff                	(bad)  
    3647:	ff 14 02             	callq  *(%rdx,%rax,1)
    364a:	00 00                	add    %al,(%rax)
    364c:	fd                   	std    
    364d:	df ff                	(bad)  
    364f:	ff 40 02             	incl   0x2(%rax)
    3652:	00 00                	add    %al,(%rax)
    3654:	6c                   	insb   (%dx),%es:(%rdi)
    3655:	e0 ff                	loopne 3656 <__GNU_EH_FRAME_HDR+0x56>
    3657:	ff 5c 02 00          	lcall  *0x0(%rdx,%rax,1)
    365b:	00 b2 e0 ff ff 78    	add    %dh,0x78ffffe0(%rdx)
    3661:	02 00                	add    (%rax),%al
    3663:	00 f8                	add    %bh,%al
    3665:	e1 ff                	loope  3666 <__GNU_EH_FRAME_HDR+0x66>
    3667:	ff c0                	inc    %eax
    3669:	02 00                	add    (%rax),%al
    366b:	00 37                	add    %dh,(%rdi)
    366d:	e2 ff                	loop   366e <__GNU_EH_FRAME_HDR+0x6e>
    366f:	ff e0                	jmpq   *%rax
    3671:	02 00                	add    (%rax),%al
    3673:	00 8e e2 ff ff 00    	add    %cl,0xffffe2(%rsi)
    3679:	03 00                	add    (%rax),%eax
    367b:	00 ea                	add    %ch,%dl
    367d:	e2 ff                	loop   367e <__GNU_EH_FRAME_HDR+0x7e>
    367f:	ff 14 03             	callq  *(%rbx,%rax,1)
    3682:	00 00                	add    %al,(%rax)
    3684:	11 e3                	adc    %esp,%ebx
    3686:	ff                   	(bad)  
    3687:	ff 28                	ljmp   *(%rax)
    3689:	03 00                	add    (%rax),%eax
    368b:	00 2e                	add    %ch,(%rsi)
    368d:	e3 ff                	jrcxz  368e <__GNU_EH_FRAME_HDR+0x8e>
    368f:	ff                   	(bad)  
    3690:	3c 03                	cmp    $0x3,%al
    3692:	00 00                	add    %al,(%rax)
    3694:	95                   	xchg   %eax,%ebp
    3695:	e3 ff                	jrcxz  3696 <__GNU_EH_FRAME_HDR+0x96>
    3697:	ff 68 03             	ljmp   *0x3(%rax)
    369a:	00 00                	add    %al,(%rax)
    369c:	92                   	xchg   %eax,%edx
    369d:	e4 ff                	in     $0xff,%al
    369f:	ff 9c 03 00 00 94 e4 	lcall  *-0x1b6c0000(%rbx,%rax,1)
    36a6:	ff                   	(bad)  
    36a7:	ff b0 03 00 00 cf    	pushq  -0x30fffffd(%rax)
    36ad:	e4 ff                	in     $0xff,%al
    36af:	ff                   	(bad)  
    36b0:	d8 03                	fadds  (%rbx)
    36b2:	00 00                	add    %al,(%rax)
    36b4:	1d e5 ff ff 00       	sbb    $0xffffe5,%eax
    36b9:	04 00                	add    $0x0,%al
    36bb:	00 41 e6             	add    %al,-0x1a(%rcx)
    36be:	ff                   	(bad)  
    36bf:	ff                   	(bad)  
    36c0:	38 04 00             	cmp    %al,(%rax,%rax,1)
    36c3:	00 7d e6             	add    %bh,-0x1a(%rbp)
    36c6:	ff                   	(bad)  
    36c7:	ff 4c 04 00          	decl   0x0(%rsp,%rax,1)
    36cb:	00 be e6 ff ff 70    	add    %bh,0x70ffffe6(%rsi)
    36d1:	04 00                	add    $0x0,%al
    36d3:	00 02                	add    %al,(%rdx)
    36d5:	e8 ff ff 8c 04       	callq  48d36d9 <_end+0x48cd949>
    36da:	00 00                	add    %al,(%rax)
    36dc:	c6                   	(bad)  
    36dd:	e8 ff ff a8 04       	callq  4a936e1 <_end+0x4a8d951>
    36e2:	00 00                	add    %al,(%rax)
    36e4:	f6 e8                	imul   %al
    36e6:	ff                   	(bad)  
    36e7:	ff                   	(bad)  
    36e8:	bc 04 00 00 b2       	mov    $0xb2000004,%esp
    36ed:	e9 ff ff fc 04       	jmpq   4fd36f1 <_end+0x4fcd961>
    36f2:	00 00                	add    %al,(%rax)
    36f4:	f3 f1                	repz icebp 
    36f6:	ff                   	(bad)  
    36f7:	ff 68 05             	ljmp   *0x5(%rax)
    36fa:	00 00                	add    %al,(%rax)
    36fc:	1e                   	(bad)  
    36fd:	f2 ff                	repnz (bad) 
    36ff:	ff 84 05 00 00 27 f4 	incl   -0xbd90000(%rbp,%rax,1)
    3706:	ff                   	(bad)  
    3707:	ff                   	(bad)  
    3708:	b8 05 00 00 a0       	mov    $0xa0000005,%eax
    370d:	f4                   	hlt    
    370e:	ff                   	(bad)  
    370f:	ff e0                	jmpq   *%rax
    3711:	05 00 00 10 f5       	add    $0xf5100000,%eax
    3716:	ff                   	(bad)  
    3717:	ff 28                	ljmp   *(%rax)
    3719:	06                   	(bad)  
	...

Desensamblado de la sección .eh_frame:

0000000000003720 <__FRAME_END__-0x51c>:
    3720:	14 00                	adc    $0x0,%al
    3722:	00 00                	add    %al,(%rax)
    3724:	00 00                	add    %al,(%rax)
    3726:	00 00                	add    %al,(%rax)
    3728:	01 7a 52             	add    %edi,0x52(%rdx)
    372b:	00 01                	add    %al,(%rcx)
    372d:	78 10                	js     373f <__GNU_EH_FRAME_HDR+0x13f>
    372f:	01 1b                	add    %ebx,(%rbx)
    3731:	0c 07                	or     $0x7,%al
    3733:	08 90 01 00 00 14    	or     %dl,0x14000001(%rax)
    3739:	00 00                	add    %al,(%rax)
    373b:	00 1c 00             	add    %bl,(%rax,%rax,1)
    373e:	00 00                	add    %al,(%rax)
    3740:	b0 da                	mov    $0xda,%al
    3742:	ff                   	(bad)  
    3743:	ff 2f                	ljmp   *(%rdi)
    3745:	00 00                	add    %al,(%rax)
    3747:	00 00                	add    %al,(%rax)
    3749:	44 07                	rex.R (bad) 
    374b:	10 00                	adc    %al,(%rax)
    374d:	00 00                	add    %al,(%rax)
    374f:	00 24 00             	add    %ah,(%rax,%rax,1)
    3752:	00 00                	add    %al,(%rax)
    3754:	34 00                	xor    $0x0,%al
    3756:	00 00                	add    %al,(%rax)
    3758:	c8 d8 ff ff          	enterq $0xffd8,$0xff
    375c:	c0 01 00             	rolb   $0x0,(%rcx)
    375f:	00 00                	add    %al,(%rax)
    3761:	0e                   	(bad)  
    3762:	10 46 0e             	adc    %al,0xe(%rsi)
    3765:	18 4a 0f             	sbb    %cl,0xf(%rdx)
    3768:	0b 77 08             	or     0x8(%rdi),%esi
    376b:	80 00 3f             	addb   $0x3f,(%rax)
    376e:	1a 3b                	sbb    (%rbx),%bh
    3770:	2a 33                	sub    (%rbx),%dh
    3772:	24 22                	and    $0x22,%al
    3774:	00 00                	add    %al,(%rax)
    3776:	00 00                	add    %al,(%rax)
    3778:	14 00                	adc    $0x0,%al
    377a:	00 00                	add    %al,(%rax)
    377c:	5c                   	pop    %rsp
    377d:	00 00                	add    %al,(%rax)
    377f:	00 60 da             	add    %ah,-0x26(%rax)
    3782:	ff                   	(bad)  
    3783:	ff 08                	decl   (%rax)
	...
    378d:	00 00                	add    %al,(%rax)
    378f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    3792:	00 00                	add    %al,(%rax)
    3794:	74 00                	je     3796 <__GNU_EH_FRAME_HDR+0x196>
    3796:	00 00                	add    %al,(%rax)
    3798:	62                   	(bad)  
    3799:	db ff                	(bad)  
    379b:	ff 5a 01             	lcall  *0x1(%rdx)
    379e:	00 00                	add    %al,(%rax)
    37a0:	00 41 0e             	add    %al,0xe(%rcx)
    37a3:	10 83 02 03 00 01    	adc    %al,0x1000302(%rbx)
    37a9:	0a 0e                	or     (%rsi),%cl
    37ab:	08 41 0b             	or     %al,0xb(%rcx)
    37ae:	00 00                	add    %al,(%rax)
    37b0:	18 00                	sbb    %al,(%rax)
    37b2:	00 00                	add    %al,(%rax)
    37b4:	94                   	xchg   %eax,%esp
    37b5:	00 00                	add    %al,(%rax)
    37b7:	00 9c dc ff ff 20 00 	add    %bl,0x20ffff(%rsp,%rbx,8)
    37be:	00 00                	add    %al,(%rax)
    37c0:	00 44 0e 10          	add    %al,0x10(%rsi,%rcx,1)
    37c4:	54                   	push   %rsp
    37c5:	0a 0e                	or     (%rsi),%cl
    37c7:	08 41 0b             	or     %al,0xb(%rcx)
    37ca:	00 00                	add    %al,(%rax)
    37cc:	28 00                	sub    %al,(%rax)
    37ce:	00 00                	add    %al,(%rax)
    37d0:	b0 00                	mov    $0x0,%al
    37d2:	00 00                	add    %al,(%rax)
    37d4:	a0 dc ff ff 6f 00 00 	movabs 0x6fffffdc,%al
    37db:	00 00 
    37dd:	41 0e                	rex.B (bad) 
    37df:	10 86 02 41 0e 18    	adc    %al,0x180e4102(%rsi)
    37e5:	83 03 44             	addl   $0x44,(%rbx)
    37e8:	0e                   	(bad)  
    37e9:	40 02 61 0a          	add    0xa(%rcx),%spl
    37ed:	0e                   	(bad)  
    37ee:	18 41 0e             	sbb    %al,0xe(%rcx)
    37f1:	10 41 0e             	adc    %al,0xe(%rcx)
    37f4:	08 41 0b             	or     %al,0xb(%rcx)
    37f7:	00 18                	add    %bl,(%rax)
    37f9:	00 00                	add    %al,(%rax)
    37fb:	00 dc                	add    %bl,%ah
    37fd:	00 00                	add    %al,(%rax)
    37ff:	00 e3                	add    %ah,%bl
    3801:	dc ff                	fdivr  %st,%st(7)
    3803:	ff e1                	jmpq   *%rcx
    3805:	00 00                	add    %al,(%rax)
    3807:	00 00                	add    %al,(%rax)
    3809:	44 0e                	rex.R (bad) 
    380b:	20 02                	and    %al,(%rdx)
    380d:	a1 0a 0e 08 41 0b 00 	movabs 0x28000b41080e0a,%eax
    3814:	28 00 
    3816:	00 00                	add    %al,(%rax)
    3818:	f8                   	clc    
    3819:	00 00                	add    %al,(%rax)
    381b:	00 a8 dd ff ff 39    	add    %ch,0x39ffffdd(%rax)
    3821:	00 00                	add    %al,(%rax)
    3823:	00 00                	add    %al,(%rax)
    3825:	54                   	push   %rsp
    3826:	0e                   	(bad)  
    3827:	10 8c 02 41 0e 18 86 	adc    %cl,-0x79e7f1bf(%rdx,%rax,1)
    382e:	03 41 0e             	add    0xe(%rcx),%eax
    3831:	20 83 04 5f 0e 18    	and    %al,0x180e5f04(%rbx)
    3837:	41 0e                	rex.B (bad) 
    3839:	10 42 0e             	adc    %al,0xe(%rdx)
    383c:	08 00                	or     %al,(%rax)
    383e:	00 00                	add    %al,(%rax)
    3840:	18 00                	sbb    %al,(%rax)
    3842:	00 00                	add    %al,(%rax)
    3844:	24 01                	and    $0x1,%al
    3846:	00 00                	add    %al,(%rax)
    3848:	b5 dd                	mov    $0xdd,%ch
    384a:	ff                   	(bad)  
    384b:	ff 6f 00             	ljmp   *0x0(%rdi)
    384e:	00 00                	add    %al,(%rax)
    3850:	00 44 0e 20          	add    %al,0x20(%rsi,%rcx,1)
    3854:	02 65 0a             	add    0xa(%rbp),%ah
    3857:	0e                   	(bad)  
    3858:	08 41 0b             	or     %al,0xb(%rcx)
    385b:	00 18                	add    %bl,(%rax)
    385d:	00 00                	add    %al,(%rax)
    385f:	00 40 01             	add    %al,0x1(%rax)
    3862:	00 00                	add    %al,(%rax)
    3864:	08 de                	or     %bl,%dh
    3866:	ff                   	(bad)  
    3867:	ff 46 00             	incl   0x0(%rsi)
    386a:	00 00                	add    %al,(%rax)
    386c:	00 41 0e             	add    %al,0xe(%rcx)
    386f:	10 83 02 7d 0a 0e    	adc    %al,0xe0a7d02(%rbx)
    3875:	08 41 0b             	or     %al,0xb(%rcx)
    3878:	44 00 00             	add    %r8b,(%rax)
    387b:	00 5c 01 00          	add    %bl,0x0(%rcx,%rax,1)
    387f:	00 32                	add    %dh,(%rdx)
    3881:	de ff                	fdivrp %st,%st(7)
    3883:	ff 46 01             	incl   0x1(%rsi)
    3886:	00 00                	add    %al,(%rax)
    3888:	00 42 0e             	add    %al,0xe(%rdx)
    388b:	10 8e 02 42 0e 18    	adc    %cl,0x180e4202(%rsi)
    3891:	8d 03                	lea    (%rbx),%eax
    3893:	42 0e                	rex.X (bad) 
    3895:	20 8c 04 41 0e 28 86 	and    %cl,-0x79d7f1bf(%rsp,%rax,1)
    389c:	05 41 0e 30 83       	add    $0x83300e41,%eax
    38a1:	06                   	(bad)  
    38a2:	44 0e                	rex.R (bad) 
    38a4:	90                   	nop
    38a5:	01 03                	add    %eax,(%rbx)
    38a7:	2c 01                	sub    $0x1,%al
    38a9:	0a 0e                	or     (%rsi),%cl
    38ab:	30 41 0e             	xor    %al,0xe(%rcx)
    38ae:	28 41 0e             	sub    %al,0xe(%rcx)
    38b1:	20 42 0e             	and    %al,0xe(%rdx)
    38b4:	18 42 0e             	sbb    %al,0xe(%rdx)
    38b7:	10 42 0e             	adc    %al,0xe(%rdx)
    38ba:	08 41 0b             	or     %al,0xb(%rcx)
    38bd:	00 00                	add    %al,(%rax)
    38bf:	00 1c 00             	add    %bl,(%rax,%rax,1)
    38c2:	00 00                	add    %al,(%rax)
    38c4:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
    38c5:	01 00                	add    %eax,(%rax)
    38c7:	00 30                	add    %dh,(%rax)
    38c9:	df ff                	(bad)  
    38cb:	ff                   	(bad)  
    38cc:	3f                   	(bad)  
    38cd:	00 00                	add    %al,(%rax)
    38cf:	00 00                	add    %al,(%rax)
    38d1:	49 0e                	rex.WB (bad) 
    38d3:	10 53 0a             	adc    %dl,0xa(%rbx)
    38d6:	0e                   	(bad)  
    38d7:	08 41 0b             	or     %al,0xb(%rcx)
    38da:	5c                   	pop    %rsp
    38db:	0e                   	(bad)  
    38dc:	08 00                	or     %al,(%rax)
    38de:	00 00                	add    %al,(%rax)
    38e0:	1c 00                	sbb    $0x0,%al
    38e2:	00 00                	add    %al,(%rax)
    38e4:	c4 01 00 00          	(bad)
    38e8:	4f df ff             	rex.WRXB (bad) 
    38eb:	ff 57 00             	callq  *0x0(%rdi)
    38ee:	00 00                	add    %al,(%rax)
    38f0:	00 41 0e             	add    %al,0xe(%rcx)
    38f3:	10 83 02 02 4e 0a    	adc    %al,0xa4e0202(%rbx)
    38f9:	0e                   	(bad)  
    38fa:	08 41 0b             	or     %al,0xb(%rcx)
    38fd:	00 00                	add    %al,(%rax)
    38ff:	00 10                	add    %dl,(%rax)
    3901:	00 00                	add    %al,(%rax)
    3903:	00 e4                	add    %ah,%ah
    3905:	01 00                	add    %eax,(%rax)
    3907:	00 86 df ff ff 5c    	add    %al,0x5cffffdf(%rsi)
    390d:	00 00                	add    %al,(%rax)
    390f:	00 00                	add    %al,(%rax)
    3911:	44 0e                	rex.R (bad) 
    3913:	10 10                	adc    %dl,(%rax)
    3915:	00 00                	add    %al,(%rax)
    3917:	00 f8                	add    %bh,%al
    3919:	01 00                	add    %eax,(%rax)
    391b:	00 ce                	add    %cl,%dh
    391d:	df ff                	(bad)  
    391f:	ff 27                	jmpq   *(%rdi)
    3921:	00 00                	add    %al,(%rax)
    3923:	00 00                	add    %al,(%rax)
    3925:	44 0e                	rex.R (bad) 
    3927:	10 10                	adc    %dl,(%rax)
    3929:	00 00                	add    %al,(%rax)
    392b:	00 0c 02             	add    %cl,(%rdx,%rax,1)
    392e:	00 00                	add    %al,(%rax)
    3930:	e1 df                	loope  3911 <__GNU_EH_FRAME_HDR+0x311>
    3932:	ff                   	(bad)  
    3933:	ff 1d 00 00 00 00    	lcall  *0x0(%rip)        # 3939 <__GNU_EH_FRAME_HDR+0x339>
    3939:	00 00                	add    %al,(%rax)
    393b:	00 28                	add    %ch,(%rax)
    393d:	00 00                	add    %al,(%rax)
    393f:	00 20                	add    %ah,(%rax)
    3941:	02 00                	add    (%rax),%al
    3943:	00 ea                	add    %ch,%dl
    3945:	df ff                	(bad)  
    3947:	ff 67 00             	jmpq   *0x0(%rdi)
    394a:	00 00                	add    %al,(%rax)
    394c:	00 42 0e             	add    %al,0xe(%rdx)
    394f:	10 8c 02 41 0e 18 86 	adc    %cl,-0x79e7f1bf(%rdx,%rax,1)
    3956:	03 41 0e             	add    0xe(%rcx),%eax
    3959:	20 83 04 63 0a 0e    	and    %al,0xe0a6304(%rbx)
    395f:	18 41 0e             	sbb    %al,0xe(%rcx)
    3962:	10 42 0e             	adc    %al,0xe(%rdx)
    3965:	08 41 0b             	or     %al,0xb(%rcx)
    3968:	30 00                	xor    %al,(%rax)
    396a:	00 00                	add    %al,(%rax)
    396c:	4c 02 00             	rex.WR add (%rax),%r8b
    396f:	00 25 e0 ff ff fd    	add    %ah,-0x2000020(%rip)        # fffffffffe003955 <_end+0xfffffffffdffdbc5>
    3975:	00 00                	add    %al,(%rax)
    3977:	00 00                	add    %al,(%rax)
    3979:	42 0e                	rex.X (bad) 
    397b:	10 8c 02 41 0e 18 86 	adc    %cl,-0x79e7f1bf(%rdx,%rax,1)
    3982:	03 41 0e             	add    0xe(%rcx),%eax
    3985:	20 83 04 47 0e f0    	and    %al,-0xff1b8fc(%rbx)
    398b:	40 02 97 0a 0e 20 41 	add    0x41200e0a(%rdi),%dl
    3992:	0e                   	(bad)  
    3993:	18 41 0e             	sbb    %al,0xe(%rcx)
    3996:	10 42 0e             	adc    %al,0xe(%rdx)
    3999:	08 41 0b             	or     %al,0xb(%rcx)
    399c:	10 00                	adc    %al,(%rax)
    399e:	00 00                	add    %al,(%rax)
    39a0:	80 02 00             	addb   $0x0,(%rdx)
    39a3:	00 ee                	add    %ch,%dh
    39a5:	e0 ff                	loopne 39a6 <__GNU_EH_FRAME_HDR+0x3a6>
    39a7:	ff 02                	incl   (%rdx)
    39a9:	00 00                	add    %al,(%rax)
    39ab:	00 00                	add    %al,(%rax)
    39ad:	00 00                	add    %al,(%rax)
    39af:	00 24 00             	add    %ah,(%rax,%rax,1)
    39b2:	00 00                	add    %al,(%rax)
    39b4:	94                   	xchg   %eax,%esp
    39b5:	02 00                	add    (%rax),%al
    39b7:	00 dc                	add    %bl,%ah
    39b9:	e0 ff                	loopne 39ba <__GNU_EH_FRAME_HDR+0x3ba>
    39bb:	ff                   	(bad)  
    39bc:	3b 00                	cmp    (%rax),%eax
    39be:	00 00                	add    %al,(%rax)
    39c0:	00 41 0e             	add    %al,0xe(%rcx)
    39c3:	10 86 02 41 0e 18    	adc    %al,0x180e4102(%rsi)
    39c9:	83 03 44             	addl   $0x44,(%rbx)
    39cc:	0e                   	(bad)  
    39cd:	20 72 0e             	and    %dh,0xe(%rdx)
    39d0:	18 41 0e             	sbb    %al,0xe(%rcx)
    39d3:	10 41 0e             	adc    %al,0xe(%rcx)
    39d6:	08 00                	or     %al,(%rax)
    39d8:	24 00                	and    $0x0,%al
    39da:	00 00                	add    %al,(%rax)
    39dc:	bc 02 00 00 ef       	mov    $0xef000002,%esp
    39e1:	e0 ff                	loopne 39e2 <__GNU_EH_FRAME_HDR+0x3e2>
    39e3:	ff 4e 00             	decl   0x0(%rsi)
    39e6:	00 00                	add    %al,(%rax)
    39e8:	00 41 0e             	add    %al,0xe(%rcx)
    39eb:	10 86 02 41 0e 18    	adc    %al,0x180e4102(%rsi)
    39f1:	83 03 44             	addl   $0x44,(%rbx)
    39f4:	0e                   	(bad)  
    39f5:	20 02                	and    %al,(%rdx)
    39f7:	45 0e                	rex.RB (bad) 
    39f9:	18 41 0e             	sbb    %al,0xe(%rcx)
    39fc:	10 41 0e             	adc    %al,0xe(%rcx)
    39ff:	08 34 00             	or     %dh,(%rax,%rax,1)
    3a02:	00 00                	add    %al,(%rax)
    3a04:	e4 02                	in     $0x2,%al
    3a06:	00 00                	add    %al,(%rax)
    3a08:	15 e1 ff ff 24       	adc    $0x24ffffe1,%eax
    3a0d:	01 00                	add    %eax,(%rax)
    3a0f:	00 00                	add    %al,(%rax)
    3a11:	41 0e                	rex.B (bad) 
    3a13:	10 83 02 47 0e a0    	adc    %al,-0x5ff1b8fe(%rbx)
    3a19:	80 01 02             	addb   $0x2,(%rcx)
    3a1c:	73 0e                	jae    3a2c <__GNU_EH_FRAME_HDR+0x42c>
    3a1e:	a8 80                	test   $0x80,%al
    3a20:	01 41 0e             	add    %eax,0xe(%rcx)
    3a23:	b0 80                	mov    $0x80,%al
    3a25:	01 02                	add    %eax,(%rdx)
    3a27:	4c 0e                	rex.WR (bad) 
    3a29:	a0 80 01 5e 0a 0e 10 	movabs 0xe41100e0a5e0180,%al
    3a30:	41 0e 
    3a32:	08 41 0b             	or     %al,0xb(%rcx)
    3a35:	00 00                	add    %al,(%rax)
    3a37:	00 10                	add    %dl,(%rax)
    3a39:	00 00                	add    %al,(%rax)
    3a3b:	00 1c 03             	add    %bl,(%rbx,%rax,1)
    3a3e:	00 00                	add    %al,(%rax)
    3a40:	01 e2                	add    %esp,%edx
    3a42:	ff                   	(bad)  
    3a43:	ff                   	(bad)  
    3a44:	3c 00                	cmp    $0x0,%al
    3a46:	00 00                	add    %al,(%rax)
    3a48:	00 44 0e 10          	add    %al,0x10(%rsi,%rcx,1)
    3a4c:	20 00                	and    %al,(%rax)
    3a4e:	00 00                	add    %al,(%rax)
    3a50:	30 03                	xor    %al,(%rbx)
    3a52:	00 00                	add    %al,(%rax)
    3a54:	29 e2                	sub    %esp,%edx
    3a56:	ff                   	(bad)  
    3a57:	ff 41 00             	incl   0x0(%rcx)
    3a5a:	00 00                	add    %al,(%rax)
    3a5c:	00 44 0e 10          	add    %al,0x10(%rsi,%rcx,1)
    3a60:	4c 0e                	rex.WR (bad) 
    3a62:	18 45 0e             	sbb    %al,0xe(%rbp)
    3a65:	20 5d 0e             	and    %bl,0xe(%rbp)
    3a68:	10 49 0a             	adc    %cl,0xa(%rcx)
    3a6b:	0e                   	(bad)  
    3a6c:	08 41 0b             	or     %al,0xb(%rcx)
    3a6f:	00 18                	add    %bl,(%rax)
    3a71:	00 00                	add    %al,(%rax)
    3a73:	00 54 03 00          	add    %dl,0x0(%rbx,%rax,1)
    3a77:	00 46 e2             	add    %al,-0x1e(%rsi)
    3a7a:	ff                   	(bad)  
    3a7b:	ff 44 01 00          	incl   0x0(%rcx,%rax,1)
    3a7f:	00 00                	add    %al,(%rax)
    3a81:	44 0e                	rex.R (bad) 
    3a83:	10 02                	adc    %al,(%rdx)
    3a85:	7d 0a                	jge    3a91 <__GNU_EH_FRAME_HDR+0x491>
    3a87:	0e                   	(bad)  
    3a88:	08 41 0b             	or     %al,0xb(%rcx)
    3a8b:	00 18                	add    %bl,(%rax)
    3a8d:	00 00                	add    %al,(%rax)
    3a8f:	00 70 03             	add    %dh,0x3(%rax)
    3a92:	00 00                	add    %al,(%rax)
    3a94:	6e                   	outsb  %ds:(%rsi),(%dx)
    3a95:	e3 ff                	jrcxz  3a96 <__GNU_EH_FRAME_HDR+0x496>
    3a97:	ff c4                	inc    %esp
    3a99:	00 00                	add    %al,(%rax)
    3a9b:	00 00                	add    %al,(%rax)
    3a9d:	44 0e                	rex.R (bad) 
    3a9f:	80 01 7b             	addb   $0x7b,(%rcx)
    3aa2:	0a 0e                	or     (%rsi),%cl
    3aa4:	08 41 0b             	or     %al,0xb(%rcx)
    3aa7:	00 10                	add    %dl,(%rax)
    3aa9:	00 00                	add    %al,(%rax)
    3aab:	00 8c 03 00 00 16 e4 	add    %cl,-0x1bea0000(%rbx,%rax,1)
    3ab2:	ff                   	(bad)  
    3ab3:	ff 30                	pushq  (%rax)
    3ab5:	00 00                	add    %al,(%rax)
    3ab7:	00 00                	add    %al,(%rax)
    3ab9:	44 0e                	rex.R (bad) 
    3abb:	10 3c 00             	adc    %bh,(%rax,%rax,1)
    3abe:	00 00                	add    %al,(%rax)
    3ac0:	a0 03 00 00 32 e4 ff 	movabs 0xbcffffe432000003,%al
    3ac7:	ff bc 
    3ac9:	00 00                	add    %al,(%rax)
    3acb:	00 00                	add    %al,(%rax)
    3acd:	42 0e                	rex.X (bad) 
    3acf:	10 8e 02 42 0e 18    	adc    %cl,0x180e4202(%rsi)
    3ad5:	8d 03                	lea    (%rbx),%eax
    3ad7:	42 0e                	rex.X (bad) 
    3ad9:	20 8c 04 41 0e 28 86 	and    %cl,-0x79d7f1bf(%rsp,%rax,1)
    3ae0:	05 41 0e 30 83       	add    $0x83300e41,%eax
    3ae5:	06                   	(bad)  
    3ae6:	02 84 0a 0e 28 41 0e 	add    0xe41280e(%rdx,%rcx,1),%al
    3aed:	20 42 0e             	and    %al,0xe(%rdx)
    3af0:	18 42 0e             	sbb    %al,0xe(%rdx)
    3af3:	10 42 0e             	adc    %al,0xe(%rdx)
    3af6:	08 41 0b             	or     %al,0xb(%rcx)
    3af9:	00 00                	add    %al,(%rax)
    3afb:	00 68 00             	add    %ch,0x0(%rax)
    3afe:	00 00                	add    %al,(%rax)
    3b00:	e0 03                	loopne 3b05 <__GNU_EH_FRAME_HDR+0x505>
    3b02:	00 00                	add    %al,(%rax)
    3b04:	ae                   	scas   %es:(%rdi),%al
    3b05:	e4 ff                	in     $0xff,%al
    3b07:	ff 41 08             	incl   0x8(%rcx)
    3b0a:	00 00                	add    %al,(%rax)
    3b0c:	00 42 0e             	add    %al,0xe(%rdx)
    3b0f:	10 8f 02 42 0e 18    	adc    %cl,0x180e4202(%rdi)
    3b15:	8e 03                	mov    (%rbx),%es
    3b17:	42 0e                	rex.X (bad) 
    3b19:	20 8d 04 42 0e 28    	and    %cl,0x280e4204(%rbp)
    3b1f:	8c 05 41 0e 30 86    	mov    %es,-0x79cff1bf(%rip)        # ffffffff86304966 <_end+0xffffffff862febd6>
    3b25:	06                   	(bad)  
    3b26:	41 0e                	rex.B (bad) 
    3b28:	38 83 07 47 0e b0    	cmp    %al,-0x4ff1b8f9(%rbx)
    3b2e:	c1 02 03             	roll   $0x3,(%rdx)
    3b31:	9d                   	popfq  
    3b32:	06                   	(bad)  
    3b33:	0a 0e                	or     (%rsi),%cl
    3b35:	38 41 0e             	cmp    %al,0xe(%rcx)
    3b38:	30 41 0e             	xor    %al,0xe(%rcx)
    3b3b:	28 42 0e             	sub    %al,0xe(%rdx)
    3b3e:	20 42 0e             	and    %al,0xe(%rdx)
    3b41:	18 42 0e             	sbb    %al,0xe(%rdx)
    3b44:	10 42 0e             	adc    %al,0xe(%rdx)
    3b47:	08 41 0b             	or     %al,0xb(%rcx)
    3b4a:	03 0c 01             	add    (%rcx,%rax,1),%ecx
    3b4d:	0e                   	(bad)  
    3b4e:	b8 c1 02 49 0e       	mov    $0xe4902c1,%eax
    3b53:	c0 c1 02             	rol    $0x2,%cl
    3b56:	44 0e                	rex.R (bad) 
    3b58:	c8 c1 02 44          	enterq $0x2c1,$0x44
    3b5c:	0e                   	(bad)  
    3b5d:	d0 c1                	rol    %cl
    3b5f:	02 02                	add    (%rdx),%al
    3b61:	47 0e                	rex.RXB (bad) 
    3b63:	b0 c1                	mov    $0xc1,%al
    3b65:	02 00                	add    (%rax),%al
    3b67:	00 18                	add    %bl,(%rax)
    3b69:	00 00                	add    %al,(%rax)
    3b6b:	00 4c 04 00          	add    %cl,0x0(%rsp,%rax,1)
    3b6f:	00 83 ec ff ff 2b    	add    %al,0x2bffffec(%rbx)
    3b75:	00 00                	add    %al,(%rax)
    3b77:	00 00                	add    %al,(%rax)
    3b79:	45 0e                	rex.RB (bad) 
    3b7b:	10 83 02 63 0e 08    	adc    %al,0x80e6302(%rbx)
    3b81:	41 c3                	rex.B retq 
    3b83:	00 30                	add    %dh,(%rax)
    3b85:	00 00                	add    %al,(%rax)
    3b87:	00 68 04             	add    %ch,0x4(%rax)
    3b8a:	00 00                	add    %al,(%rax)
    3b8c:	92                   	xchg   %eax,%edx
    3b8d:	ec                   	in     (%dx),%al
    3b8e:	ff                   	(bad)  
    3b8f:	ff 09                	decl   (%rcx)
    3b91:	02 00                	add    (%rax),%al
    3b93:	00 00                	add    %al,(%rax)
    3b95:	42 0e                	rex.X (bad) 
    3b97:	10 8c 02 41 0e 18 86 	adc    %cl,-0x79e7f1bf(%rdx,%rax,1)
    3b9e:	03 41 0e             	add    0xe(%rcx),%eax
    3ba1:	20 83 04 44 0e 40    	and    %al,0x400e4404(%rbx)
    3ba7:	02 fa                	add    %dl,%bh
    3ba9:	0a 0e                	or     (%rsi),%cl
    3bab:	20 41 0e             	and    %al,0xe(%rcx)
    3bae:	18 41 0e             	sbb    %al,0xe(%rcx)
    3bb1:	10 42 0e             	adc    %al,0xe(%rdx)
    3bb4:	08 41 0b             	or     %al,0xb(%rcx)
    3bb7:	00 24 00             	add    %ah,(%rax,%rax,1)
    3bba:	00 00                	add    %al,(%rax)
    3bbc:	9c                   	pushfq 
    3bbd:	04 00                	add    $0x0,%al
    3bbf:	00 67 ee             	add    %ah,-0x12(%rdi)
    3bc2:	ff                   	(bad)  
    3bc3:	ff 73 00             	pushq  0x0(%rbx)
    3bc6:	00 00                	add    %al,(%rax)
    3bc8:	00 41 0e             	add    %al,0xe(%rcx)
    3bcb:	10 83 02 5d 0a 0e    	adc    %al,0xe0a5d02(%rbx)
    3bd1:	08 41 0b             	or     %al,0xb(%rcx)
    3bd4:	68 0e 18 41 0e       	pushq  $0xe41180e
    3bd9:	20 69 0e             	and    %ch,0xe(%rcx)
    3bdc:	10 00                	adc    %al,(%rax)
    3bde:	00 00                	add    %al,(%rax)
    3be0:	44 00 00             	add    %r8b,(%rax)
    3be3:	00 c4                	add    %al,%ah
    3be5:	04 00                	add    $0x0,%al
    3be7:	00 b8 ee ff ff 65    	add    %bh,0x65ffffee(%rax)
    3bed:	00 00                	add    %al,(%rax)
    3bef:	00 00                	add    %al,(%rax)
    3bf1:	46 0e                	rex.RX (bad) 
    3bf3:	10 8f 02 49 0e 18    	adc    %cl,0x180e4902(%rdi)
    3bf9:	8e 03                	mov    (%rbx),%es
    3bfb:	45 0e                	rex.RB (bad) 
    3bfd:	20 8d 04 45 0e 28    	and    %cl,0x280e4504(%rbp)
    3c03:	8c 05 44 0e 30 86    	mov    %es,-0x79cff1bc(%rip)        # ffffffff86304a4d <_end+0xffffffff862fecbd>
    3c09:	06                   	(bad)  
    3c0a:	48 0e                	rex.W (bad) 
    3c0c:	38 83 07 47 0e 40    	cmp    %al,0x400e4707(%rbx)
    3c12:	6e                   	outsb  %ds:(%rsi),(%dx)
    3c13:	0e                   	(bad)  
    3c14:	38 41 0e             	cmp    %al,0xe(%rcx)
    3c17:	30 41 0e             	xor    %al,0xe(%rcx)
    3c1a:	28 42 0e             	sub    %al,0xe(%rdx)
    3c1d:	20 42 0e             	and    %al,0xe(%rdx)
    3c20:	18 42 0e             	sbb    %al,0xe(%rdx)
    3c23:	10 42 0e             	adc    %al,0xe(%rdx)
    3c26:	08 00                	or     %al,(%rax)
    3c28:	10 00                	adc    %al,(%rax)
    3c2a:	00 00                	add    %al,(%rax)
    3c2c:	0c 05                	or     $0x5,%al
    3c2e:	00 00                	add    %al,(%rax)
    3c30:	e0 ee                	loopne 3c20 <__GNU_EH_FRAME_HDR+0x620>
    3c32:	ff                   	(bad)  
    3c33:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 3c39 <__GNU_EH_FRAME_HDR+0x639>
    3c39:	00 00                	add    %al,(%rax)
	...

0000000000003c3c <__FRAME_END__>:
    3c3c:	00 00                	add    %al,(%rax)
	...

Desensamblado de la sección .init_array:

0000000000004ce8 <__frame_dummy_init_array_entry>:
    4ce8:	f0 12 00             	lock adc (%rax),%al
    4ceb:	00 00                	add    %al,(%rax)
    4ced:	00 00                	add    %al,(%rax)
	...

Desensamblado de la sección .fini_array:

0000000000004cf0 <__do_global_dtors_aux_fini_array_entry>:
    4cf0:	b0 12                	mov    $0x12,%al
    4cf2:	00 00                	add    %al,(%rax)
    4cf4:	00 00                	add    %al,(%rax)
	...

Desensamblado de la sección .dynamic:

0000000000004cf8 <_DYNAMIC>:
    4cf8:	01 00                	add    %eax,(%rax)
    4cfa:	00 00                	add    %al,(%rax)
    4cfc:	00 00                	add    %al,(%rax)
    4cfe:	00 00                	add    %al,(%rax)
    4d00:	01 00                	add    %eax,(%rax)
    4d02:	00 00                	add    %al,(%rax)
    4d04:	00 00                	add    %al,(%rax)
    4d06:	00 00                	add    %al,(%rax)
    4d08:	0c 00                	or     $0x0,%al
    4d0a:	00 00                	add    %al,(%rax)
    4d0c:	00 00                	add    %al,(%rax)
    4d0e:	00 00                	add    %al,(%rax)
    4d10:	00 10                	add    %dl,(%rax)
    4d12:	00 00                	add    %al,(%rax)
    4d14:	00 00                	add    %al,(%rax)
    4d16:	00 00                	add    %al,(%rax)
    4d18:	0d 00 00 00 00       	or     $0x0,%eax
    4d1d:	00 00                	add    %al,(%rax)
    4d1f:	00 18                	add    %bl,(%rax)
    4d21:	2b 00                	sub    (%rax),%eax
    4d23:	00 00                	add    %al,(%rax)
    4d25:	00 00                	add    %al,(%rax)
    4d27:	00 19                	add    %bl,(%rcx)
    4d29:	00 00                	add    %al,(%rax)
    4d2b:	00 00                	add    %al,(%rax)
    4d2d:	00 00                	add    %al,(%rax)
    4d2f:	00 e8                	add    %ch,%al
    4d31:	4c 00 00             	rex.WR add %r8b,(%rax)
    4d34:	00 00                	add    %al,(%rax)
    4d36:	00 00                	add    %al,(%rax)
    4d38:	1b 00                	sbb    (%rax),%eax
    4d3a:	00 00                	add    %al,(%rax)
    4d3c:	00 00                	add    %al,(%rax)
    4d3e:	00 00                	add    %al,(%rax)
    4d40:	08 00                	or     %al,(%rax)
    4d42:	00 00                	add    %al,(%rax)
    4d44:	00 00                	add    %al,(%rax)
    4d46:	00 00                	add    %al,(%rax)
    4d48:	1a 00                	sbb    (%rax),%al
    4d4a:	00 00                	add    %al,(%rax)
    4d4c:	00 00                	add    %al,(%rax)
    4d4e:	00 00                	add    %al,(%rax)
    4d50:	f0 4c 00 00          	lock rex.WR add %r8b,(%rax)
    4d54:	00 00                	add    %al,(%rax)
    4d56:	00 00                	add    %al,(%rax)
    4d58:	1c 00                	sbb    $0x0,%al
    4d5a:	00 00                	add    %al,(%rax)
    4d5c:	00 00                	add    %al,(%rax)
    4d5e:	00 00                	add    %al,(%rax)
    4d60:	08 00                	or     %al,(%rax)
    4d62:	00 00                	add    %al,(%rax)
    4d64:	00 00                	add    %al,(%rax)
    4d66:	00 00                	add    %al,(%rax)
    4d68:	f5                   	cmc    
    4d69:	fe                   	(bad)  
    4d6a:	ff 6f 00             	ljmp   *0x0(%rdi)
    4d6d:	00 00                	add    %al,(%rax)
    4d6f:	00 08                	add    %cl,(%rax)
    4d71:	03 00                	add    (%rax),%eax
    4d73:	00 00                	add    %al,(%rax)
    4d75:	00 00                	add    %al,(%rax)
    4d77:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 4d7d <_DYNAMIC+0x85>
    4d7d:	00 00                	add    %al,(%rax)
    4d7f:	00 a0 06 00 00 00    	add    %ah,0x6(%rax)
    4d85:	00 00                	add    %al,(%rax)
    4d87:	00 06                	add    %al,(%rsi)
    4d89:	00 00                	add    %al,(%rax)
    4d8b:	00 00                	add    %al,(%rax)
    4d8d:	00 00                	add    %al,(%rax)
    4d8f:	00 40 03             	add    %al,0x3(%rax)
    4d92:	00 00                	add    %al,(%rax)
    4d94:	00 00                	add    %al,(%rax)
    4d96:	00 00                	add    %al,(%rax)
    4d98:	0a 00                	or     (%rax),%al
    4d9a:	00 00                	add    %al,(%rax)
    4d9c:	00 00                	add    %al,(%rax)
    4d9e:	00 00                	add    %al,(%rax)
    4da0:	bc 01 00 00 00       	mov    $0x1,%esp
    4da5:	00 00                	add    %al,(%rax)
    4da7:	00 0b                	add    %cl,(%rbx)
    4da9:	00 00                	add    %al,(%rax)
    4dab:	00 00                	add    %al,(%rax)
    4dad:	00 00                	add    %al,(%rax)
    4daf:	00 18                	add    %bl,(%rax)
    4db1:	00 00                	add    %al,(%rax)
    4db3:	00 00                	add    %al,(%rax)
    4db5:	00 00                	add    %al,(%rax)
    4db7:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 4dbd <_DYNAMIC+0xc5>
	...
    4dc5:	00 00                	add    %al,(%rax)
    4dc7:	00 03                	add    %al,(%rbx)
    4dc9:	00 00                	add    %al,(%rax)
    4dcb:	00 00                	add    %al,(%rax)
    4dcd:	00 00                	add    %al,(%rax)
    4dcf:	00 e8                	add    %ch,%al
    4dd1:	4e 00 00             	rex.WRX add %r8b,(%rax)
    4dd4:	00 00                	add    %al,(%rax)
    4dd6:	00 00                	add    %al,(%rax)
    4dd8:	02 00                	add    (%rax),%al
    4dda:	00 00                	add    %al,(%rax)
    4ddc:	00 00                	add    %al,(%rax)
    4dde:	00 00                	add    %al,(%rax)
    4de0:	88 02                	mov    %al,(%rdx)
    4de2:	00 00                	add    %al,(%rax)
    4de4:	00 00                	add    %al,(%rax)
    4de6:	00 00                	add    %al,(%rax)
    4de8:	14 00                	adc    $0x0,%al
    4dea:	00 00                	add    %al,(%rax)
    4dec:	00 00                	add    %al,(%rax)
    4dee:	00 00                	add    %al,(%rax)
    4df0:	07                   	(bad)  
    4df1:	00 00                	add    %al,(%rax)
    4df3:	00 00                	add    %al,(%rax)
    4df5:	00 00                	add    %al,(%rax)
    4df7:	00 17                	add    %dl,(%rdi)
    4df9:	00 00                	add    %al,(%rax)
    4dfb:	00 00                	add    %al,(%rax)
    4dfd:	00 00                	add    %al,(%rax)
    4dff:	00 d8                	add    %bl,%al
    4e01:	0b 00                	or     (%rax),%eax
    4e03:	00 00                	add    %al,(%rax)
    4e05:	00 00                	add    %al,(%rax)
    4e07:	00 07                	add    %al,(%rdi)
    4e09:	00 00                	add    %al,(%rax)
    4e0b:	00 00                	add    %al,(%rax)
    4e0d:	00 00                	add    %al,(%rax)
    4e0f:	00 08                	add    %cl,(%rax)
    4e11:	09 00                	or     %eax,(%rax)
    4e13:	00 00                	add    %al,(%rax)
    4e15:	00 00                	add    %al,(%rax)
    4e17:	00 08                	add    %cl,(%rax)
    4e19:	00 00                	add    %al,(%rax)
    4e1b:	00 00                	add    %al,(%rax)
    4e1d:	00 00                	add    %al,(%rax)
    4e1f:	00 d0                	add    %dl,%al
    4e21:	02 00                	add    (%rax),%al
    4e23:	00 00                	add    %al,(%rax)
    4e25:	00 00                	add    %al,(%rax)
    4e27:	00 09                	add    %cl,(%rcx)
    4e29:	00 00                	add    %al,(%rax)
    4e2b:	00 00                	add    %al,(%rax)
    4e2d:	00 00                	add    %al,(%rax)
    4e2f:	00 18                	add    %bl,(%rax)
    4e31:	00 00                	add    %al,(%rax)
    4e33:	00 00                	add    %al,(%rax)
    4e35:	00 00                	add    %al,(%rax)
    4e37:	00 1e                	add    %bl,(%rsi)
    4e39:	00 00                	add    %al,(%rax)
    4e3b:	00 00                	add    %al,(%rax)
    4e3d:	00 00                	add    %al,(%rax)
    4e3f:	00 08                	add    %cl,(%rax)
    4e41:	00 00                	add    %al,(%rax)
    4e43:	00 00                	add    %al,(%rax)
    4e45:	00 00                	add    %al,(%rax)
    4e47:	00 fb                	add    %bh,%bl
    4e49:	ff                   	(bad)  
    4e4a:	ff 6f 00             	ljmp   *0x0(%rdi)
    4e4d:	00 00                	add    %al,(%rax)
    4e4f:	00 01                	add    %al,(%rcx)
    4e51:	00 00                	add    %al,(%rax)
    4e53:	08 00                	or     %al,(%rax)
    4e55:	00 00                	add    %al,(%rax)
    4e57:	00 fe                	add    %bh,%dh
    4e59:	ff                   	(bad)  
    4e5a:	ff 6f 00             	ljmp   *0x0(%rdi)
    4e5d:	00 00                	add    %al,(%rax)
    4e5f:	00 a8 08 00 00 00    	add    %ch,0x8(%rax)
    4e65:	00 00                	add    %al,(%rax)
    4e67:	00 ff                	add    %bh,%bh
    4e69:	ff                   	(bad)  
    4e6a:	ff 6f 00             	ljmp   *0x0(%rdi)
    4e6d:	00 00                	add    %al,(%rax)
    4e6f:	00 01                	add    %al,(%rcx)
    4e71:	00 00                	add    %al,(%rax)
    4e73:	00 00                	add    %al,(%rax)
    4e75:	00 00                	add    %al,(%rax)
    4e77:	00 f0                	add    %dh,%al
    4e79:	ff                   	(bad)  
    4e7a:	ff 6f 00             	ljmp   *0x0(%rdi)
    4e7d:	00 00                	add    %al,(%rax)
    4e7f:	00 5c 08 00          	add    %bl,0x0(%rax,%rcx,1)
    4e83:	00 00                	add    %al,(%rax)
    4e85:	00 00                	add    %al,(%rax)
    4e87:	00 f9                	add    %bh,%cl
    4e89:	ff                   	(bad)  
    4e8a:	ff 6f 00             	ljmp   *0x0(%rdi)
    4e8d:	00 00                	add    %al,(%rax)
    4e8f:	00 16                	add    %dl,(%rsi)
	...

Desensamblado de la sección .got:

0000000000004ee8 <_GLOBAL_OFFSET_TABLE_>:
    4ee8:	f8                   	clc    
    4ee9:	4c 00 00             	rex.WR add %r8b,(%rax)
	...
    4f00:	36 10 00             	adc    %al,%ss:(%rax)
    4f03:	00 00                	add    %al,(%rax)
    4f05:	00 00                	add    %al,(%rax)
    4f07:	00 46 10             	add    %al,0x10(%rsi)
    4f0a:	00 00                	add    %al,(%rax)
    4f0c:	00 00                	add    %al,(%rax)
    4f0e:	00 00                	add    %al,(%rax)
    4f10:	56                   	push   %rsi
    4f11:	10 00                	adc    %al,(%rax)
    4f13:	00 00                	add    %al,(%rax)
    4f15:	00 00                	add    %al,(%rax)
    4f17:	00 66 10             	add    %ah,0x10(%rsi)
    4f1a:	00 00                	add    %al,(%rax)
    4f1c:	00 00                	add    %al,(%rax)
    4f1e:	00 00                	add    %al,(%rax)
    4f20:	76 10                	jbe    4f32 <_GLOBAL_OFFSET_TABLE_+0x4a>
    4f22:	00 00                	add    %al,(%rax)
    4f24:	00 00                	add    %al,(%rax)
    4f26:	00 00                	add    %al,(%rax)
    4f28:	86 10                	xchg   %dl,(%rax)
    4f2a:	00 00                	add    %al,(%rax)
    4f2c:	00 00                	add    %al,(%rax)
    4f2e:	00 00                	add    %al,(%rax)
    4f30:	96                   	xchg   %eax,%esi
    4f31:	10 00                	adc    %al,(%rax)
    4f33:	00 00                	add    %al,(%rax)
    4f35:	00 00                	add    %al,(%rax)
    4f37:	00 a6 10 00 00 00    	add    %ah,0x10(%rsi)
    4f3d:	00 00                	add    %al,(%rax)
    4f3f:	00 b6 10 00 00 00    	add    %dh,0x10(%rsi)
    4f45:	00 00                	add    %al,(%rax)
    4f47:	00 c6                	add    %al,%dh
    4f49:	10 00                	adc    %al,(%rax)
    4f4b:	00 00                	add    %al,(%rax)
    4f4d:	00 00                	add    %al,(%rax)
    4f4f:	00 d6                	add    %dl,%dh
    4f51:	10 00                	adc    %al,(%rax)
    4f53:	00 00                	add    %al,(%rax)
    4f55:	00 00                	add    %al,(%rax)
    4f57:	00 e6                	add    %ah,%dh
    4f59:	10 00                	adc    %al,(%rax)
    4f5b:	00 00                	add    %al,(%rax)
    4f5d:	00 00                	add    %al,(%rax)
    4f5f:	00 f6                	add    %dh,%dh
    4f61:	10 00                	adc    %al,(%rax)
    4f63:	00 00                	add    %al,(%rax)
    4f65:	00 00                	add    %al,(%rax)
    4f67:	00 06                	add    %al,(%rsi)
    4f69:	11 00                	adc    %eax,(%rax)
    4f6b:	00 00                	add    %al,(%rax)
    4f6d:	00 00                	add    %al,(%rax)
    4f6f:	00 16                	add    %dl,(%rsi)
    4f71:	11 00                	adc    %eax,(%rax)
    4f73:	00 00                	add    %al,(%rax)
    4f75:	00 00                	add    %al,(%rax)
    4f77:	00 26                	add    %ah,(%rsi)
    4f79:	11 00                	adc    %eax,(%rax)
    4f7b:	00 00                	add    %al,(%rax)
    4f7d:	00 00                	add    %al,(%rax)
    4f7f:	00 36                	add    %dh,(%rsi)
    4f81:	11 00                	adc    %eax,(%rax)
    4f83:	00 00                	add    %al,(%rax)
    4f85:	00 00                	add    %al,(%rax)
    4f87:	00 46 11             	add    %al,0x11(%rsi)
    4f8a:	00 00                	add    %al,(%rax)
    4f8c:	00 00                	add    %al,(%rax)
    4f8e:	00 00                	add    %al,(%rax)
    4f90:	56                   	push   %rsi
    4f91:	11 00                	adc    %eax,(%rax)
    4f93:	00 00                	add    %al,(%rax)
    4f95:	00 00                	add    %al,(%rax)
    4f97:	00 66 11             	add    %ah,0x11(%rsi)
    4f9a:	00 00                	add    %al,(%rax)
    4f9c:	00 00                	add    %al,(%rax)
    4f9e:	00 00                	add    %al,(%rax)
    4fa0:	76 11                	jbe    4fb3 <_GLOBAL_OFFSET_TABLE_+0xcb>
    4fa2:	00 00                	add    %al,(%rax)
    4fa4:	00 00                	add    %al,(%rax)
    4fa6:	00 00                	add    %al,(%rax)
    4fa8:	86 11                	xchg   %dl,(%rcx)
    4faa:	00 00                	add    %al,(%rax)
    4fac:	00 00                	add    %al,(%rax)
    4fae:	00 00                	add    %al,(%rax)
    4fb0:	96                   	xchg   %eax,%esi
    4fb1:	11 00                	adc    %eax,(%rax)
    4fb3:	00 00                	add    %al,(%rax)
    4fb5:	00 00                	add    %al,(%rax)
    4fb7:	00 a6 11 00 00 00    	add    %ah,0x11(%rsi)
    4fbd:	00 00                	add    %al,(%rax)
    4fbf:	00 b6 11 00 00 00    	add    %dh,0x11(%rsi)
    4fc5:	00 00                	add    %al,(%rax)
    4fc7:	00 c6                	add    %al,%dh
    4fc9:	11 00                	adc    %eax,(%rax)
    4fcb:	00 00                	add    %al,(%rax)
    4fcd:	00 00                	add    %al,(%rax)
    4fcf:	00 d6                	add    %dl,%dh
    4fd1:	11 00                	adc    %eax,(%rax)
	...

Desensamblado de la sección .data:

0000000000005000 <__data_start>:
	...

0000000000005008 <__dso_handle>:
    5008:	08 50 00             	or     %dl,0x0(%rax)
    500b:	00 00                	add    %al,(%rax)
    500d:	00 00                	add    %al,(%rax)
	...

0000000000005010 <n45>:
    5010:	28 00                	sub    %al,(%rax)
	...

0000000000005030 <n41>:
    5030:	01 00                	add    %eax,(%rax)
	...

0000000000005050 <n47>:
    5050:	63 00                	movslq (%rax),%eax
	...

0000000000005070 <n44>:
    5070:	23 00                	and    (%rax),%eax
	...

0000000000005090 <n42>:
    5090:	07                   	(bad)  
	...

00000000000050b0 <n43>:
    50b0:	14 00                	adc    $0x0,%al
	...

00000000000050d0 <n46>:
    50d0:	2f                   	(bad)  
	...

00000000000050f0 <n48>:
    50f0:	e9 03 00 00 00       	jmpq   50f8 <n48+0x8>
	...

0000000000005110 <node6>:
    5110:	9c                   	pushfq 
    5111:	03 00                	add    (%rax),%eax
    5113:	00 06                	add    %al,(%rsi)
	...

0000000000005120 <user_password>:
    5120:	42 54                	rex.X push %rsp
    5122:	73 42                	jae    5166 <n1+0x16>
    5124:	68 37 73 53 48       	pushq  $0x48537337
    5129:	64 6f                	outsl  %fs:(%rsi),(%dx)
    512b:	70 72                	jo     519f <n22+0xf>
    512d:	41 58                	pop    %r8
    512f:	4f                   	rex.WRXB
    5130:	65 44 70 63          	gs rex.R jo 5197 <n22+0x7>
    5134:	00 00                	add    %al,(%rax)
	...

0000000000005138 <userid>:
    5138:	61                   	(bad)  
    5139:	67 75 69             	addr32 jne 51a5 <n22+0x15>
    513c:	72 72                	jb     51b0 <n32>
    513e:	65 2d 69 76 61 6e    	gs sub $0x6e617669,%eax
    5144:	00 00                	add    %al,(%rax)
	...

0000000000005148 <bomb_id>:
    5148:	25 00 00 00 00       	and    $0x0,%eax
    514d:	00 00                	add    %al,(%rax)
	...

0000000000005150 <n1>:
    5150:	24 00                	and    $0x0,%al
    5152:	00 00                	add    %al,(%rax)
    5154:	00 00                	add    %al,(%rax)
    5156:	00 00                	add    %al,(%rax)
    5158:	70 51                	jo     51ab <n22+0x1b>
    515a:	00 00                	add    %al,(%rax)
    515c:	00 00                	add    %al,(%rax)
    515e:	00 00                	add    %al,(%rax)
    5160:	90                   	nop
    5161:	51                   	push   %rcx
	...

0000000000005170 <n21>:
    5170:	08 00                	or     %al,(%rax)
    5172:	00 00                	add    %al,(%rax)
    5174:	00 00                	add    %al,(%rax)
    5176:	00 00                	add    %al,(%rax)
    5178:	f0 51                	lock push %rcx
    517a:	00 00                	add    %al,(%rax)
    517c:	00 00                	add    %al,(%rax)
    517e:	00 00                	add    %al,(%rax)
    5180:	b0 51                	mov    $0x51,%al
	...

0000000000005190 <n22>:
    5190:	32 00                	xor    (%rax),%al
    5192:	00 00                	add    %al,(%rax)
    5194:	00 00                	add    %al,(%rax)
    5196:	00 00                	add    %al,(%rax)
    5198:	d0 51 00             	rclb   0x0(%rcx)
    519b:	00 00                	add    %al,(%rax)
    519d:	00 00                	add    %al,(%rax)
    519f:	00 10                	add    %dl,(%rax)
    51a1:	52                   	push   %rdx
	...

00000000000051b0 <n32>:
    51b0:	16                   	(bad)  
    51b1:	00 00                	add    %al,(%rax)
    51b3:	00 00                	add    %al,(%rax)
    51b5:	00 00                	add    %al,(%rax)
    51b7:	00 b0 50 00 00 00    	add    %dh,0x50(%rax)
    51bd:	00 00                	add    %al,(%rax)
    51bf:	00 70 50             	add    %dh,0x50(%rax)
	...

00000000000051d0 <n33>:
    51d0:	2d 00 00 00 00       	sub    $0x0,%eax
    51d5:	00 00                	add    %al,(%rax)
    51d7:	00 10                	add    %dl,(%rax)
    51d9:	50                   	push   %rax
    51da:	00 00                	add    %al,(%rax)
    51dc:	00 00                	add    %al,(%rax)
    51de:	00 00                	add    %al,(%rax)
    51e0:	d0 50 00             	rclb   0x0(%rax)
	...

00000000000051f0 <n31>:
    51f0:	06                   	(bad)  
    51f1:	00 00                	add    %al,(%rax)
    51f3:	00 00                	add    %al,(%rax)
    51f5:	00 00                	add    %al,(%rax)
    51f7:	00 30                	add    %dh,(%rax)
    51f9:	50                   	push   %rax
    51fa:	00 00                	add    %al,(%rax)
    51fc:	00 00                	add    %al,(%rax)
    51fe:	00 00                	add    %al,(%rax)
    5200:	90                   	nop
    5201:	50                   	push   %rax
	...

0000000000005210 <n34>:
    5210:	6b 00 00             	imul   $0x0,(%rax),%eax
    5213:	00 00                	add    %al,(%rax)
    5215:	00 00                	add    %al,(%rax)
    5217:	00 50 50             	add    %dl,0x50(%rax)
    521a:	00 00                	add    %al,(%rax)
    521c:	00 00                	add    %al,(%rax)
    521e:	00 00                	add    %al,(%rax)
    5220:	f0 50                	lock push %rax
	...

0000000000005230 <node1>:
    5230:	a9 03 00 00 01       	test   $0x1000003,%eax
    5235:	00 00                	add    %al,(%rax)
    5237:	00 40 52             	add    %al,0x52(%rax)
    523a:	00 00                	add    %al,(%rax)
    523c:	00 00                	add    %al,(%rax)
	...

0000000000005240 <node2>:
    5240:	67 02 00             	add    (%eax),%al
    5243:	00 02                	add    %al,(%rdx)
    5245:	00 00                	add    %al,(%rax)
    5247:	00 50 52             	add    %dl,0x52(%rax)
    524a:	00 00                	add    %al,(%rax)
    524c:	00 00                	add    %al,(%rax)
	...

0000000000005250 <node3>:
    5250:	cf                   	iret   
    5251:	03 00                	add    (%rax),%eax
    5253:	00 03                	add    %al,(%rbx)
    5255:	00 00                	add    %al,(%rax)
    5257:	00 60 52             	add    %ah,0x52(%rax)
    525a:	00 00                	add    %al,(%rax)
    525c:	00 00                	add    %al,(%rax)
	...

0000000000005260 <node4>:
    5260:	8e 01                	mov    (%rcx),%es
    5262:	00 00                	add    %al,(%rax)
    5264:	04 00                	add    $0x0,%al
    5266:	00 00                	add    %al,(%rax)
    5268:	70 52                	jo     52bc <completed.7658+0x14>
    526a:	00 00                	add    %al,(%rax)
    526c:	00 00                	add    %al,(%rax)
	...

0000000000005270 <node5>:
    5270:	05 02 00 00 05       	add    $0x5000002,%eax
    5275:	00 00                	add    %al,(%rax)
    5277:	00 10                	add    %dl,(%rax)
    5279:	51                   	push   %rcx
    527a:	00 00                	add    %al,(%rax)
    527c:	00 00                	add    %al,(%rax)
	...

Desensamblado de la sección .bss:

0000000000005280 <stdout@@GLIBC_2.2.5>:
	...

0000000000005290 <stdin@@GLIBC_2.2.5>:
	...

00000000000052a0 <stderr@@GLIBC_2.2.5>:
	...

00000000000052a8 <completed.7658>:
	...

00000000000052c0 <num_input_strings>:
	...

00000000000052e0 <host_table>:
	...

00000000000056e0 <infile>:
	...

0000000000005700 <input_strings>:
	...

0000000000005d40 <scratch>:
	...

Desensamblado de la sección .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 55 62             	sub    %dl,0x62(%rbp)
   8:	75 6e                	jne    78 <_init-0xf88>
   a:	74 75                	je     81 <_init-0xf7f>
   c:	20 37                	and    %dh,(%rdi)
   e:	2e 35 2e 30 2d 36    	cs xor $0x362d302e,%eax
  14:	75 62                	jne    78 <_init-0xf88>
  16:	75 6e                	jne    86 <_init-0xf7a>
  18:	74 75                	je     8f <_init-0xf71>
  1a:	32 29                	xor    (%rcx),%ch
  1c:	20 37                	and    %dh,(%rdi)
  1e:	2e                   	cs
  1f:	35                   	.byte 0x35
  20:	2e 30 00             	xor    %al,%cs:(%rax)

Desensamblado de la sección .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	2c 00                	sub    $0x0,%al
   2:	00 00                	add    %al,(%rax)
   4:	02 00                	add    (%rax),%al
   6:	00 00                	add    %al,(%rax)
   8:	00 00                	add    %al,(%rax)
   a:	08 00                	or     %al,(%rax)
   c:	00 00                	add    %al,(%rax)
   e:	00 00                	add    %al,(%rax)
  10:	fa                   	cli    
  11:	12 00                	adc    (%rax),%al
  13:	00 00                	add    %al,(%rax)
  15:	00 00                	add    %al,(%rax)
  17:	00 5a 01             	add    %bl,0x1(%rdx)
	...

Desensamblado de la sección .debug_info:

0000000000000000 <.debug_info>:
   0:	91                   	xchg   %eax,%ecx
   1:	08 00                	or     %al,(%rax)
   3:	00 04 00             	add    %al,(%rax,%rax,1)
   6:	00 00                	add    %al,(%rax)
   8:	00 00                	add    %al,(%rax)
   a:	08 01                	or     %al,(%rcx)
   c:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
   d:	02 00                	add    (%rax),%al
   f:	00 0c 0e             	add    %cl,(%rsi,%rcx,1)
  12:	02 00                	add    (%rax),%al
  14:	00 6e 01             	add    %ch,0x1(%rsi)
  17:	00 00                	add    %al,(%rax)
  19:	fa                   	cli    
  1a:	12 00                	adc    (%rax),%al
  1c:	00 00                	add    %al,(%rax)
  1e:	00 00                	add    %al,(%rax)
  20:	00 5a 01             	add    %bl,0x1(%rdx)
	...
  2b:	00 00                	add    %al,(%rax)
  2d:	02 23                	add    (%rbx),%ah
  2f:	00 00                	add    %al,(%rax)
  31:	00 03                	add    %al,(%rbx)
  33:	d8 38                	fdivrs (%rax)
  35:	00 00                	add    %al,(%rax)
  37:	00 03                	add    %al,(%rbx)
  39:	08 07                	or     %al,(%rdi)
  3b:	46 00 00             	rex.RX add %r8b,(%rax)
  3e:	00 03                	add    %al,(%rbx)
  40:	04 07                	add    $0x7,%al
  42:	4b 00 00             	rex.WXB add %al,(%r8)
  45:	00 04 08             	add    %al,(%rax,%rcx,1)
  48:	03 01                	add    (%rcx),%eax
  4a:	08 d4                	or     %dl,%ah
  4c:	01 00                	add    %eax,(%rax)
  4e:	00 03                	add    %al,(%rbx)
  50:	02 07                	add    (%rdi),%al
  52:	23 01                	and    (%rcx),%eax
  54:	00 00                	add    %al,(%rax)
  56:	03 01                	add    (%rcx),%eax
  58:	06                   	(bad)  
  59:	d6                   	(bad)  
  5a:	01 00                	add    %eax,(%rax)
  5c:	00 03                	add    %al,(%rbx)
  5e:	02 05 e2 01 00 00    	add    0x1e2(%rip),%al        # 246 <_init-0xdba>
  64:	05 04 05 69 6e       	add    $0x6e690504,%eax
  69:	74 00                	je     6b <_init-0xf95>
  6b:	03 08                	add    (%rax),%ecx
  6d:	05 67 00 00 00       	add    $0x67,%eax
  72:	02 07                	add    (%rdi),%al
  74:	00 00                	add    %al,(%rax)
  76:	00 04 98             	add    %al,(%rax,%rbx,4)
  79:	6b 00 00             	imul   $0x0,(%rax),%eax
  7c:	00 02                	add    %al,(%rdx)
  7e:	1b 02                	sbb    (%rdx),%eax
  80:	00 00                	add    %al,(%rax)
  82:	04 99                	add    $0x99,%al
  84:	6b 00 00             	imul   $0x0,(%rax),%eax
  87:	00 06                	add    %al,(%rsi)
  89:	08 8e 00 00 00 03    	or     %cl,0x3000000(%rsi)
  8f:	01 06                	add    %eax,(%rsi)
  91:	dd 01                	fldl   (%rcx)
  93:	00 00                	add    %al,(%rax)
  95:	07                   	(bad)  
  96:	8e 00                	mov    (%rax),%es
  98:	00 00                	add    %al,(%rax)
  9a:	08 a2 01 00 00 d8    	or     %ah,-0x27ffffff(%rdx)
  a0:	05 31 03 02 00       	add    $0x20331,%eax
  a5:	00 09                	add    %cl,(%rcx)
  a7:	93                   	xchg   %eax,%ebx
  a8:	00 00                	add    %al,(%rax)
  aa:	00 05 33 64 00 00    	add    %al,0x6433(%rip)        # 64e3 <_end+0x753>
  b0:	00 00                	add    %al,(%rax)
  b2:	09 0f                	or     %ecx,(%rdi)
  b4:	00 00                	add    %al,(%rax)
  b6:	00 05 36 88 00 00    	add    %al,0x8836(%rip)        # 88f2 <_end+0x2b62>
  bc:	00 08                	add    %cl,(%rax)
  be:	09 86 00 00 00 05    	or     %eax,0x5000000(%rsi)
  c4:	37                   	(bad)  
  c5:	88 00                	mov    %al,(%rax)
  c7:	00 00                	add    %al,(%rax)
  c9:	10 09                	adc    %cl,(%rcx)
  cb:	25 02 00 00 05       	and    $0x5000002,%eax
  d0:	38 88 00 00 00 18    	cmp    %cl,0x18000000(%rax)
  d6:	09 fa                	or     %edi,%edx
  d8:	02 00                	add    (%rax),%al
  da:	00 05 39 88 00 00    	add    %al,0x8839(%rip)        # 8919 <_end+0x2b89>
  e0:	00 20                	add    %ah,(%rax)
  e2:	09 0c 01             	or     %ecx,(%rcx,%rax,1)
  e5:	00 00                	add    %al,(%rax)
  e7:	05 3a 88 00 00       	add    $0x883a,%eax
  ec:	00 28                	add    %ch,(%rax)
  ee:	09 89 01 00 00 05    	or     %ecx,0x5000001(%rcx)
  f4:	3b 88 00 00 00 30    	cmp    0x30000000(%rax),%ecx
  fa:	09 34 00             	or     %esi,(%rax,%rax,1)
  fd:	00 00                	add    %al,(%rax)
  ff:	05 3c 88 00 00       	add    $0x883c,%eax
 104:	00 38                	add    %bh,(%rax)
 106:	09 9a 00 00 00 05    	or     %ebx,0x5000000(%rdx)
 10c:	3d 88 00 00 00       	cmp    $0x88,%eax
 111:	40 09 36             	rex or %esi,(%rsi)
 114:	01 00                	add    %eax,(%rax)
 116:	00 05 40 88 00 00    	add    %al,0x8840(%rip)        # 895c <_end+0x2bcc>
 11c:	00 48 09             	add    %cl,0x9(%rax)
 11f:	92                   	xchg   %eax,%edx
 120:	02 00                	add    (%rax),%al
 122:	00 05 41 88 00 00    	add    %al,0x8841(%rip)        # 8969 <_end+0x2bd9>
 128:	00 50 09             	add    %dl,0x9(%rax)
 12b:	33 02                	xor    (%rdx),%eax
 12d:	00 00                	add    %al,(%rax)
 12f:	05 42 88 00 00       	add    $0x8842,%eax
 134:	00 58 09             	add    %bl,0x9(%rax)
 137:	bd 01 00 00 05       	mov    $0x5000001,%ebp
 13c:	44 1a 02             	sbb    (%rdx),%r8b
 13f:	00 00                	add    %al,(%rax)
 141:	60                   	(bad)  
 142:	09 1c 00             	or     %ebx,(%rax,%rax,1)
 145:	00 00                	add    %al,(%rax)
 147:	05 46 20 02 00       	add    $0x22046,%eax
 14c:	00 68 09             	add    %ch,0x9(%rax)
 14f:	7e 00                	jle    151 <_init-0xeaf>
 151:	00 00                	add    %al,(%rax)
 153:	05 48 64 00 00       	add    $0x6448,%eax
 158:	00 70 09             	add    %dh,0x9(%rax)
 15b:	4a 01 00             	rex.WX add %rax,(%rax)
 15e:	00 05 49 64 00 00    	add    %al,0x6449(%rip)        # 65ad <_end+0x81d>
 164:	00 74 09 cb          	add    %dh,-0x35(%rcx,%rcx,1)
 168:	00 00                	add    %al,(%rax)
 16a:	00 05 4a 72 00 00    	add    %al,0x724a(%rip)        # 73ba <_end+0x162a>
 170:	00 78 09             	add    %bh,0x9(%rax)
 173:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
 174:	00 00                	add    %al,(%rax)
 176:	00 05 4d 4f 00 00    	add    %al,0x4f4d(%rip)        # 50c9 <n43+0x19>
 17c:	00 80 09 fa 01 00    	add    %al,0x1fa09(%rax)
 182:	00 05 4e 56 00 00    	add    %al,0x564e(%rip)        # 57d6 <input_strings+0xd6>
 188:	00 82 09 2a 00 00    	add    %al,0x2a09(%rdx)
 18e:	00 05 4f 26 02 00    	add    %al,0x2264f(%rip)        # 227e3 <_end+0x1ca53>
 194:	00 83 09 44 01 00    	add    %al,0x14409(%rbx)
 19a:	00 05 51 36 02 00    	add    %al,0x23651(%rip)        # 237f1 <_end+0x1da61>
 1a0:	00 88 09 cf 00 00    	add    %cl,0xcf09(%rax)
 1a6:	00 05 59 7d 00 00    	add    %al,0x7d59(%rip)        # 7f05 <_end+0x2175>
 1ac:	00 90 09 b5 00 00    	add    %dl,0xb509(%rax)
 1b2:	00 05 5b 41 02 00    	add    %al,0x2415b(%rip)        # 24313 <_end+0x1e583>
 1b8:	00 98 09 ef 01 00    	add    %bl,0x1ef09(%rax)
 1be:	00 05 5c 4c 02 00    	add    %al,0x24c5c(%rip)        # 24e20 <_end+0x1f090>
 1c4:	00 a0 09 c6 01 00    	add    %ah,0x1c609(%rax)
 1ca:	00 05 5d 20 02 00    	add    %al,0x2205d(%rip)        # 2222d <_end+0x1c49d>
 1d0:	00 a8 09 ff 00 00    	add    %ch,0xff09(%rax)
 1d6:	00 05 5e 46 00 00    	add    %al,0x465e(%rip)        # 483a <__FRAME_END__+0xbfe>
 1dc:	00 b0 09 46 02 00    	add    %dh,0x24609(%rax)
 1e2:	00 05 5f 2d 00 00    	add    %al,0x2d5f(%rip)        # 2f47 <_fini+0x42f>
 1e8:	00 b8 09 52 01 00    	add    %bh,0x15209(%rax)
 1ee:	00 05 60 64 00 00    	add    %al,0x6460(%rip)        # 6654 <_end+0x8c4>
 1f4:	00 c0                	add    %al,%al
 1f6:	09 4d 02             	or     %ecx,0x2(%rbp)
 1f9:	00 00                	add    %al,(%rax)
 1fb:	05 62 52 02 00       	add    $0x25262,%eax
 200:	00 c4                	add    %al,%ah
 202:	00 02                	add    %al,(%rdx)
 204:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
 205:	01 00                	add    %eax,(%rax)
 207:	00 06                	add    %al,(%rsi)
 209:	07                   	(bad)  
 20a:	9a                   	(bad)  
 20b:	00 00                	add    %al,(%rax)
 20d:	00 0a                	add    %cl,(%rdx)
 20f:	97                   	xchg   %eax,%edi
 210:	01 00                	add    %eax,(%rax)
 212:	00 05 2b 0b ee 00    	add    %al,0xee0b2b(%rip)        # ee0d43 <_end+0xedafb3>
 218:	00 00                	add    %al,(%rax)
 21a:	06                   	(bad)  
 21b:	08 15 02 00 00 06    	or     %dl,0x6000002(%rip)        # 6000223 <_end+0x5ffa493>
 221:	08 9a 00 00 00 0c    	or     %bl,0xc000000(%rdx)
 227:	8e 00                	mov    (%rax),%es
 229:	00 00                	add    %al,(%rax)
 22b:	36 02 00             	add    %ss:(%rax),%al
 22e:	00 0d 38 00 00 00    	add    %cl,0x38(%rip)        # 26c <_init-0xd94>
 234:	00 00                	add    %al,(%rax)
 236:	06                   	(bad)  
 237:	08 0e                	or     %cl,(%rsi)
 239:	02 00                	add    (%rax),%al
 23b:	00 0b                	add    %cl,(%rbx)
 23d:	b2 00                	mov    $0x0,%dl
 23f:	00 00                	add    %al,(%rax)
 241:	06                   	(bad)  
 242:	08 3c 02             	or     %bh,(%rdx,%rax,1)
 245:	00 00                	add    %al,(%rax)
 247:	0b ec                	or     %esp,%ebp
 249:	01 00                	add    %eax,(%rax)
 24b:	00 06                	add    %al,(%rsi)
 24d:	08 47 02             	or     %al,0x2(%rdi)
 250:	00 00                	add    %al,(%rax)
 252:	0c 8e                	or     $0x8e,%al
 254:	00 00                	add    %al,(%rax)
 256:	00 62 02             	add    %ah,0x2(%rdx)
 259:	00 00                	add    %al,(%rax)
 25b:	0d 38 00 00 00       	or     $0x38,%eax
 260:	13 00                	adc    (%rax),%eax
 262:	0e                   	(bad)  
 263:	f9                   	stc    
 264:	00 00                	add    %al,(%rax)
 266:	00 07                	add    %al,(%rdi)
 268:	89 6d 02             	mov    %ebp,0x2(%rbp)
 26b:	00 00                	add    %al,(%rax)
 26d:	06                   	(bad)  
 26e:	08 03                	or     %al,(%rbx)
 270:	02 00                	add    (%rax),%al
 272:	00 0e                	add    %cl,(%rsi)
 274:	67 01 00             	add    %eax,(%eax)
 277:	00 07                	add    %al,(%rdi)
 279:	8a 6d 02             	mov    0x2(%rbp),%ch
 27c:	00 00                	add    %al,(%rax)
 27e:	0e                   	(bad)  
 27f:	56                   	push   %rsi
 280:	02 00                	add    (%rax),%al
 282:	00 07                	add    %al,(%rdi)
 284:	8b 6d 02             	mov    0x2(%rbp),%ebp
 287:	00 00                	add    %al,(%rax)
 289:	0e                   	(bad)  
 28a:	1a 01                	sbb    (%rcx),%al
 28c:	00 00                	add    %al,(%rax)
 28e:	08 1a                	or     %bl,(%rdx)
 290:	64 00 00             	add    %al,%fs:(%rax)
 293:	00 0c aa             	add    %cl,(%rdx,%rbp,4)
 296:	02 00                	add    (%rax),%al
 298:	00 9f 02 00 00 0f    	add    %bl,0xf000002(%rdi)
 29e:	00 07                	add    %al,(%rdi)
 2a0:	94                   	xchg   %eax,%esp
 2a1:	02 00                	add    (%rax),%al
 2a3:	00 06                	add    %al,(%rsi)
 2a5:	08 95 00 00 00 07    	or     %dl,0x7000000(%rbp)
 2ab:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
 2ac:	02 00                	add    (%rax),%al
 2ae:	00 10                	add    %dl,(%rax)
 2b0:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
 2b1:	02 00                	add    (%rax),%al
 2b3:	00 0e                	add    %cl,(%rsi)
 2b5:	b1 01                	mov    $0x1,%cl
 2b7:	00 00                	add    %al,(%rax)
 2b9:	08 1b                	or     %bl,(%rbx)
 2bb:	9f                   	lahf   
 2bc:	02 00                	add    (%rax),%al
 2be:	00 03                	add    %al,(%rbx)
 2c0:	08 05 62 00 00 00    	or     %al,0x62(%rip)        # 328 <_init-0xcd8>
 2c6:	03 08                	add    (%rax),%ecx
 2c8:	07                   	(bad)  
 2c9:	41 00 00             	add    %al,(%r8)
 2cc:	00 11                	add    %dl,(%rcx)
 2ce:	d7                   	xlat   %ds:(%rbx)
 2cf:	00 00                	add    %al,(%rax)
 2d1:	00 01                	add    %al,(%rcx)
 2d3:	22 6d 02             	and    0x2(%rbp),%ch
 2d6:	00 00                	add    %al,(%rax)
 2d8:	09 03                	or     %eax,(%rbx)
 2da:	e0 56                	loopne 332 <_init-0xcce>
 2dc:	00 00                	add    %al,(%rax)
 2de:	00 00                	add    %al,(%rax)
 2e0:	00 00                	add    %al,(%rax)
 2e2:	12 f5                	adc    %ch,%dh
 2e4:	02 00                	add    (%rax),%al
 2e6:	00 01                	add    %al,(%rcx)
 2e8:	24 64                	and    $0x64,%al
 2ea:	00 00                	add    %al,(%rax)
 2ec:	00 fa                	add    %bh,%dl
 2ee:	12 00                	adc    (%rax),%al
 2f0:	00 00                	add    %al,(%rax)
 2f2:	00 00                	add    %al,(%rax)
 2f4:	00 5a 01             	add    %bl,0x1(%rdx)
 2f7:	00 00                	add    %al,(%rax)
 2f9:	00 00                	add    %al,(%rax)
 2fb:	00 00                	add    %al,(%rax)
 2fd:	01 9c bb 06 00 00 13 	add    %ebx,0x13000006(%rbx,%rdi,4)
 304:	a2 02 00 00 01 24 64 	movabs %al,0x642401000002
 30b:	00 00 
 30d:	00 00                	add    %al,(%rax)
 30f:	00 00                	add    %al,(%rax)
 311:	00 13                	add    %dl,(%rbx)
 313:	5d                   	pop    %rbp
 314:	02 00                	add    (%rax),%al
 316:	00 01                	add    %al,(%rcx)
 318:	24 bb                	and    $0xbb,%al
 31a:	06                   	(bad)  
 31b:	00 00                	add    %al,(%rax)
 31d:	8b 00                	mov    (%rax),%eax
 31f:	00 00                	add    %al,(%rax)
 321:	14 15                	adc    $0x15,%al
 323:	02 00                	add    (%rax),%al
 325:	00 01                	add    %al,(%rcx)
 327:	26 88 00             	mov    %al,%es:(%rax)
 32a:	00 00                	add    %al,(%rax)
 32c:	fd                   	std    
 32d:	00 00                	add    %al,(%rax)
 32f:	00 15 c1 06 00 00    	add    %dl,0x6c1(%rip)        # 9f6 <_init-0x60a>
 335:	35 13 00 00 00       	xor    $0x13,%eax
 33a:	00 00                	add    %al,(%rax)
 33c:	00 0c 00             	add    %cl,(%rax,%rax,1)
 33f:	00 00                	add    %al,(%rax)
 341:	00 00                	add    %al,(%rax)
 343:	00 00                	add    %al,(%rax)
 345:	01 45 70             	add    %eax,0x70(%rbp)
 348:	03 00                	add    (%rax),%eax
 34a:	00 16                	add    %dl,(%rsi)
 34c:	d1 06                	roll   (%rsi)
 34e:	00 00                	add    %al,(%rax)
 350:	7f 01                	jg     353 <_init-0xcad>
 352:	00 00                	add    %al,(%rax)
 354:	17                   	(bad)  
 355:	41 13 00             	adc    (%r8),%eax
 358:	00 00                	add    %al,(%rax)
 35a:	00 00                	add    %al,(%rax)
 35c:	00 1e                	add    %bl,(%rsi)
 35e:	07                   	(bad)  
 35f:	00 00                	add    %al,(%rax)
 361:	18 01                	sbb    %al,(%rcx)
 363:	55                   	push   %rbp
 364:	09 03                	or     %eax,(%rbx)
 366:	88 30                	mov    %dh,(%rax)
	...
 370:	15 c1 06 00 00       	adc    $0x6c1,%eax
 375:	41 13 00             	adc    (%r8),%eax
 378:	00 00                	add    %al,(%rax)
 37a:	00 00                	add    %al,(%rax)
 37c:	00 0c 00             	add    %cl,(%rax,%rax,1)
 37f:	00 00                	add    %al,(%rax)
 381:	00 00                	add    %al,(%rax)
 383:	00 00                	add    %al,(%rax)
 385:	01 46 b0             	add    %eax,-0x50(%rsi)
 388:	03 00                	add    (%rax),%eax
 38a:	00 16                	add    %dl,(%rsi)
 38c:	d1 06                	roll   (%rsi)
 38e:	00 00                	add    %al,(%rax)
 390:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
 391:	01 00                	add    %eax,(%rax)
 393:	00 17                	add    %dl,(%rdi)
 395:	4d 13 00             	adc    (%r8),%r8
 398:	00 00                	add    %al,(%rax)
 39a:	00 00                	add    %al,(%rax)
 39c:	00 1e                	add    %bl,(%rsi)
 39e:	07                   	(bad)  
 39f:	00 00                	add    %al,(%rax)
 3a1:	18 01                	sbb    %al,(%rcx)
 3a3:	55                   	push   %rbp
 3a4:	09 03                	or     %eax,(%rbx)
 3a6:	c8 30 00 00          	enterq $0x30,$0x0
 3aa:	00 00                	add    %al,(%rax)
 3ac:	00 00                	add    %al,(%rax)
 3ae:	00 00                	add    %al,(%rax)
 3b0:	15 c1 06 00 00       	adc    $0x6c1,%eax
 3b5:	5f                   	pop    %rdi
 3b6:	13 00                	adc    (%rax),%eax
 3b8:	00 00                	add    %al,(%rax)
 3ba:	00 00                	add    %al,(%rax)
 3bc:	00 0c 00             	add    %cl,(%rax,%rax,1)
 3bf:	00 00                	add    %al,(%rax)
 3c1:	00 00                	add    %al,(%rax)
 3c3:	00 00                	add    %al,(%rax)
 3c5:	01 4d f0             	add    %ecx,-0x10(%rbp)
 3c8:	03 00                	add    (%rax),%eax
 3ca:	00 16                	add    %dl,(%rsi)
 3cc:	d1 06                	roll   (%rsi)
 3ce:	00 00                	add    %al,(%rax)
 3d0:	cf                   	iret   
 3d1:	01 00                	add    %eax,(%rax)
 3d3:	00 17                	add    %dl,(%rdi)
 3d5:	6b 13 00             	imul   $0x0,(%rbx),%edx
 3d8:	00 00                	add    %al,(%rax)
 3da:	00 00                	add    %al,(%rax)
 3dc:	00 1e                	add    %bl,(%rsi)
 3de:	07                   	(bad)  
 3df:	00 00                	add    %al,(%rax)
 3e1:	18 01                	sbb    %al,(%rcx)
 3e3:	55                   	push   %rbp
 3e4:	09 03                	or     %eax,(%rbx)
 3e6:	f8                   	clc    
 3e7:	30 00                	xor    %al,(%rax)
 3e9:	00 00                	add    %al,(%rax)
 3eb:	00 00                	add    %al,(%rax)
 3ed:	00 00                	add    %al,(%rax)
 3ef:	00 15 c1 06 00 00    	add    %dl,0x6c1(%rip)        # ab6 <_init-0x54a>
 3f5:	7d 13                	jge    40a <_init-0xbf6>
 3f7:	00 00                	add    %al,(%rax)
 3f9:	00 00                	add    %al,(%rax)
 3fb:	00 00                	add    %al,(%rax)
 3fd:	0c 00                	or     $0x0,%al
 3ff:	00 00                	add    %al,(%rax)
 401:	00 00                	add    %al,(%rax)
 403:	00 00                	add    %al,(%rax)
 405:	01 54 30 04          	add    %edx,0x4(%rax,%rsi,1)
 409:	00 00                	add    %al,(%rax)
 40b:	16                   	(bad)  
 40c:	d1 06                	roll   (%rsi)
 40e:	00 00                	add    %al,(%rax)
 410:	f7 01 00 00 17 89    	testl  $0x89170000,(%rcx)
 416:	13 00                	adc    (%rax),%eax
 418:	00 00                	add    %al,(%rax)
 41a:	00 00                	add    %al,(%rax)
 41c:	00 1e                	add    %bl,(%rsi)
 41e:	07                   	(bad)  
 41f:	00 00                	add    %al,(%rax)
 421:	18 01                	sbb    %al,(%rcx)
 423:	55                   	push   %rbp
 424:	09 03                	or     %eax,(%rbx)
 426:	3b 30                	cmp    (%rax),%esi
	...
 430:	15 c1 06 00 00       	adc    $0x6c1,%eax
 435:	9b                   	fwait
 436:	13 00                	adc    (%rax),%eax
 438:	00 00                	add    %al,(%rax)
 43a:	00 00                	add    %al,(%rax)
 43c:	00 0c 00             	add    %cl,(%rax,%rax,1)
 43f:	00 00                	add    %al,(%rax)
 441:	00 00                	add    %al,(%rax)
 443:	00 00                	add    %al,(%rax)
 445:	01 5b 70             	add    %ebx,0x70(%rbx)
 448:	04 00                	add    $0x0,%al
 44a:	00 16                	add    %dl,(%rsi)
 44c:	d1 06                	roll   (%rsi)
 44e:	00 00                	add    %al,(%rax)
 450:	1f                   	(bad)  
 451:	02 00                	add    (%rax),%al
 453:	00 17                	add    %dl,(%rdi)
 455:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
 456:	13 00                	adc    (%rax),%eax
 458:	00 00                	add    %al,(%rax)
 45a:	00 00                	add    %al,(%rax)
 45c:	00 1e                	add    %bl,(%rsi)
 45e:	07                   	(bad)  
 45f:	00 00                	add    %al,(%rax)
 461:	18 01                	sbb    %al,(%rcx)
 463:	55                   	push   %rbp
 464:	09 03                	or     %eax,(%rbx)
 466:	59                   	pop    %rcx
 467:	30 00                	xor    %al,(%rax)
 469:	00 00                	add    %al,(%rax)
 46b:	00 00                	add    %al,(%rax)
 46d:	00 00                	add    %al,(%rax)
 46f:	00 15 c1 06 00 00    	add    %dl,0x6c1(%rip)        # b36 <_init-0x4ca>
 475:	b9 13 00 00 00       	mov    $0x13,%ecx
 47a:	00 00                	add    %al,(%rax)
 47c:	00 0c 00             	add    %cl,(%rax,%rax,1)
 47f:	00 00                	add    %al,(%rax)
 481:	00 00                	add    %al,(%rax)
 483:	00 00                	add    %al,(%rax)
 485:	01 61 b0             	add    %esp,-0x50(%rcx)
 488:	04 00                	add    $0x0,%al
 48a:	00 16                	add    %dl,(%rsi)
 48c:	d1 06                	roll   (%rsi)
 48e:	00 00                	add    %al,(%rax)
 490:	47 02 00             	rex.RXB add (%r8),%r8b
 493:	00 17                	add    %dl,(%rdi)
 495:	c5 13 00             	(bad)
 498:	00 00                	add    %al,(%rax)
 49a:	00 00                	add    %al,(%rax)
 49c:	00 1e                	add    %bl,(%rsi)
 49e:	07                   	(bad)  
 49f:	00 00                	add    %al,(%rax)
 4a1:	18 01                	sbb    %al,(%rcx)
 4a3:	55                   	push   %rbp
 4a4:	09 03                	or     %eax,(%rbx)
 4a6:	28 31                	sub    %dh,(%rcx)
	...
 4b0:	15 c1 06 00 00       	adc    $0x6c1,%eax
 4b5:	d7                   	xlat   %ds:(%rbx)
 4b6:	13 00                	adc    (%rax),%eax
 4b8:	00 00                	add    %al,(%rax)
 4ba:	00 00                	add    %al,(%rax)
 4bc:	00 0c 00             	add    %cl,(%rax,%rax,1)
 4bf:	00 00                	add    %al,(%rax)
 4c1:	00 00                	add    %al,(%rax)
 4c3:	00 00                	add    %al,(%rax)
 4c5:	01 67 f0             	add    %esp,-0x10(%rdi)
 4c8:	04 00                	add    $0x0,%al
 4ca:	00 16                	add    %dl,(%rsi)
 4cc:	d1 06                	roll   (%rsi)
 4ce:	00 00                	add    %al,(%rax)
 4d0:	6f                   	outsl  %ds:(%rsi),(%dx)
 4d1:	02 00                	add    (%rax),%al
 4d3:	00 17                	add    %dl,(%rdi)
 4d5:	e3 13                	jrcxz  4ea <_init-0xb16>
 4d7:	00 00                	add    %al,(%rax)
 4d9:	00 00                	add    %al,(%rax)
 4db:	00 00                	add    %al,(%rax)
 4dd:	1e                   	(bad)  
 4de:	07                   	(bad)  
 4df:	00 00                	add    %al,(%rax)
 4e1:	18 01                	sbb    %al,(%rcx)
 4e3:	55                   	push   %rbp
 4e4:	09 03                	or     %eax,(%rbx)
 4e6:	68 30 00 00 00       	pushq  $0x30
 4eb:	00 00                	add    %al,(%rax)
 4ed:	00 00                	add    %al,(%rax)
 4ef:	00 15 c1 06 00 00    	add    %dl,0x6c1(%rip)        # bb6 <_init-0x44a>
 4f5:	0f 14 00             	unpcklps (%rax),%xmm0
 4f8:	00 00                	add    %al,(%rax)
 4fa:	00 00                	add    %al,(%rax)
 4fc:	00 18                	add    %bl,(%rax)
 4fe:	00 00                	add    %al,(%rax)
 500:	00 00                	add    %al,(%rax)
 502:	00 00                	add    %al,(%rax)
 504:	00 01                	add    %al,(%rcx)
 506:	37                   	(bad)  
 507:	35 05 00 00 16       	xor    $0x16000005,%eax
 50c:	d1 06                	roll   (%rsi)
 50e:	00 00                	add    %al,(%rax)
 510:	97                   	xchg   %eax,%edi
 511:	02 00                	add    (%rax),%al
 513:	00 17                	add    %dl,(%rdi)
 515:	27                   	(bad)  
 516:	14 00                	adc    $0x0,%al
 518:	00 00                	add    %al,(%rax)
 51a:	00 00                	add    %al,(%rax)
 51c:	00 0f                	add    %cl,(%rdi)
 51e:	08 00                	or     %al,(%rax)
 520:	00 18                	add    %bl,(%rax)
 522:	01 55 01             	add    %edx,0x1(%rbp)
 525:	31 18                	xor    %ebx,(%rax)
 527:	01 54 09 03          	add    %edx,0x3(%rcx,%rcx,1)
 52b:	04 30                	add    $0x30,%al
	...
 535:	15 c1 06 00 00       	adc    $0x6c1,%eax
 53a:	31 14 00             	xor    %edx,(%rax,%rax,1)
 53d:	00 00                	add    %al,(%rax)
 53f:	00 00                	add    %al,(%rax)
 541:	00 19                	add    %bl,(%rcx)
 543:	00 00                	add    %al,(%rax)
 545:	00 00                	add    %al,(%rax)
 547:	00 00                	add    %al,(%rax)
 549:	00 01                	add    %al,(%rcx)
 54b:	3e 7a 05             	jp,pt  553 <_init-0xaad>
 54e:	00 00                	add    %al,(%rax)
 550:	16                   	(bad)  
 551:	d1 06                	roll   (%rsi)
 553:	00 00                	add    %al,(%rax)
 555:	c3                   	retq   
 556:	02 00                	add    (%rax),%al
 558:	00 17                	add    %dl,(%rdi)
 55a:	4a 14 00             	rex.WX adc $0x0,%al
 55d:	00 00                	add    %al,(%rax)
 55f:	00 00                	add    %al,(%rax)
 561:	00 0f                	add    %cl,(%rdi)
 563:	08 00                	or     %al,(%rax)
 565:	00 18                	add    %bl,(%rax)
 567:	01 55 01             	add    %edx,0x1(%rbp)
 56a:	31 18                	xor    %ebx,(%rax)
 56c:	01 54 09 03          	add    %edx,0x3(%rcx,%rcx,1)
 570:	21 30                	and    %esi,(%rax)
	...
 57a:	19 20                	sbb    %esp,(%rax)
 57c:	13 00                	adc    (%rax),%eax
 57e:	00 00                	add    %al,(%rax)
 580:	00 00                	add    %al,(%rax)
 582:	00 1a                	add    %bl,(%rdx)
 584:	08 00                	or     %al,(%rax)
 586:	00 99 05 00 00 18    	add    %bl,0x18000005(%rcx)
 58c:	01 54 09 03          	add    %edx,0x3(%rcx,%rcx,1)
 590:	db 35 00 00 00 00    	(bad)  0x0(%rip)        # 596 <_init-0xa6a>
 596:	00 00                	add    %al,(%rax)
 598:	00 1a                	add    %bl,(%rdx)
 59a:	35 13 00 00 00       	xor    $0x13,%eax
 59f:	00 00                	add    %al,(%rax)
 5a1:	00 25 08 00 00 1a    	add    %ah,0x1a000008(%rip)        # 1a0005af <_end+0x19ffa81f>
 5a7:	52                   	push   %rdx
 5a8:	13 00                	adc    (%rax),%eax
 5aa:	00 00                	add    %al,(%rax)
 5ac:	00 00                	add    %al,(%rax)
 5ae:	00 30                	add    %dh,(%rax)
 5b0:	08 00                	or     %al,(%rax)
 5b2:	00 1a                	add    %bl,(%rdx)
 5b4:	5a                   	pop    %rdx
 5b5:	13 00                	adc    (%rax),%eax
 5b7:	00 00                	add    %al,(%rax)
 5b9:	00 00                	add    %al,(%rax)
 5bb:	00 3b                	add    %bh,(%rbx)
 5bd:	08 00                	or     %al,(%rax)
 5bf:	00 1a                	add    %bl,(%rdx)
 5c1:	5f                   	pop    %rdi
 5c2:	13 00                	adc    (%rax),%eax
 5c4:	00 00                	add    %al,(%rax)
 5c6:	00 00                	add    %al,(%rax)
 5c8:	00 46 08             	add    %al,0x8(%rsi)
 5cb:	00 00                	add    %al,(%rax)
 5cd:	1a 70 13             	sbb    0x13(%rax),%dh
 5d0:	00 00                	add    %al,(%rax)
 5d2:	00 00                	add    %al,(%rax)
 5d4:	00 00                	add    %al,(%rax)
 5d6:	30 08                	xor    %cl,(%rax)
 5d8:	00 00                	add    %al,(%rax)
 5da:	1a 78 13             	sbb    0x13(%rax),%bh
 5dd:	00 00                	add    %al,(%rax)
 5df:	00 00                	add    %al,(%rax)
 5e1:	00 00                	add    %al,(%rax)
 5e3:	51                   	push   %rcx
 5e4:	08 00                	or     %al,(%rax)
 5e6:	00 1a                	add    %bl,(%rdx)
 5e8:	7d 13                	jge    5fd <_init-0xa03>
 5ea:	00 00                	add    %al,(%rax)
 5ec:	00 00                	add    %al,(%rax)
 5ee:	00 00                	add    %al,(%rax)
 5f0:	46 08 00             	rex.RX or %r8b,(%rax)
 5f3:	00 1a                	add    %bl,(%rdx)
 5f5:	8e 13                	mov    (%rbx),%ss
 5f7:	00 00                	add    %al,(%rax)
 5f9:	00 00                	add    %al,(%rax)
 5fb:	00 00                	add    %al,(%rax)
 5fd:	30 08                	xor    %cl,(%rax)
 5ff:	00 00                	add    %al,(%rax)
 601:	1a 96 13 00 00 00    	sbb    0x13(%rsi),%dl
 607:	00 00                	add    %al,(%rax)
 609:	00 5c 08 00          	add    %bl,0x0(%rax,%rcx,1)
 60d:	00 1a                	add    %bl,(%rdx)
 60f:	9b                   	fwait
 610:	13 00                	adc    (%rax),%eax
 612:	00 00                	add    %al,(%rax)
 614:	00 00                	add    %al,(%rax)
 616:	00 46 08             	add    %al,0x8(%rsi)
 619:	00 00                	add    %al,(%rax)
 61b:	1a ac 13 00 00 00 00 	sbb    0x0(%rbx,%rdx,1),%ch
 622:	00 00                	add    %al,(%rax)
 624:	30 08                	xor    %cl,(%rax)
 626:	00 00                	add    %al,(%rax)
 628:	1a b4 13 00 00 00 00 	sbb    0x0(%rbx,%rdx,1),%dh
 62f:	00 00                	add    %al,(%rax)
 631:	67 08 00             	or     %al,(%eax)
 634:	00 1a                	add    %bl,(%rdx)
 636:	b9 13 00 00 00       	mov    $0x13,%ecx
 63b:	00 00                	add    %al,(%rax)
 63d:	00 46 08             	add    %al,0x8(%rsi)
 640:	00 00                	add    %al,(%rax)
 642:	1a ca                	sbb    %dl,%cl
 644:	13 00                	adc    (%rax),%eax
 646:	00 00                	add    %al,(%rax)
 648:	00 00                	add    %al,(%rax)
 64a:	00 30                	add    %dh,(%rax)
 64c:	08 00                	or     %al,(%rax)
 64e:	00 1a                	add    %bl,(%rdx)
 650:	d2 13                	rclb   %cl,(%rbx)
 652:	00 00                	add    %al,(%rax)
 654:	00 00                	add    %al,(%rax)
 656:	00 00                	add    %al,(%rax)
 658:	72 08                	jb     662 <_init-0x99e>
 65a:	00 00                	add    %al,(%rax)
 65c:	1a d7                	sbb    %bh,%dl
 65e:	13 00                	adc    (%rax),%eax
 660:	00 00                	add    %al,(%rax)
 662:	00 00                	add    %al,(%rax)
 664:	00 46 08             	add    %al,0x8(%rsi)
 667:	00 00                	add    %al,(%rax)
 669:	1a e8                	sbb    %al,%ch
 66b:	13 00                	adc    (%rax),%eax
 66d:	00 00                	add    %al,(%rax)
 66f:	00 00                	add    %al,(%rax)
 671:	00 30                	add    %dh,(%rax)
 673:	08 00                	or     %al,(%rax)
 675:	00 1a                	add    %bl,(%rdx)
 677:	f0 13 00             	lock adc (%rax),%eax
 67a:	00 00                	add    %al,(%rax)
 67c:	00 00                	add    %al,(%rax)
 67e:	00 7d 08             	add    %bh,0x8(%rbp)
 681:	00 00                	add    %al,(%rax)
 683:	1a f5                	sbb    %ch,%dh
 685:	13 00                	adc    (%rax),%eax
 687:	00 00                	add    %al,(%rax)
 689:	00 00                	add    %al,(%rax)
 68b:	00 46 08             	add    %al,0x8(%rsi)
 68e:	00 00                	add    %al,(%rax)
 690:	19 31                	sbb    %esi,(%rcx)
 692:	14 00                	adc    $0x0,%al
 694:	00 00                	add    %al,(%rax)
 696:	00 00                	add    %al,(%rax)
 698:	00 88 08 00 00 a7    	add    %cl,-0x58fffff8(%rax)
 69e:	06                   	(bad)  
 69f:	00 00                	add    %al,(%rax)
 6a1:	18 01                	sbb    %al,(%rcx)
 6a3:	55                   	push   %rbp
 6a4:	01 38                	add    %edi,(%rax)
 6a6:	00 17                	add    %dl,(%rdi)
 6a8:	54                   	push   %rsp
 6a9:	14 00                	adc    $0x0,%al
 6ab:	00 00                	add    %al,(%rax)
 6ad:	00 00                	add    %al,(%rax)
 6af:	00 88 08 00 00 18    	add    %cl,0x18000008(%rax)
 6b5:	01 55 01             	add    %edx,0x1(%rbp)
 6b8:	38 00                	cmp    %al,(%rax)
 6ba:	00 06                	add    %al,(%rsi)
 6bc:	08 88 00 00 00 1b    	or     %cl,0x1b000000(%rax)
 6c2:	00 00                	add    %al,(%rax)
 6c4:	00 00                	add    %al,(%rax)
 6c6:	02 69 64             	add    0x64(%rcx),%ch
 6c9:	00 00                	add    %al,(%rax)
 6cb:	00 03                	add    %al,(%rbx)
 6cd:	de 06                	fiadds (%rsi)
 6cf:	00 00                	add    %al,(%rax)
 6d1:	1c 40                	sbb    $0x40,%al
 6d3:	02 00                	add    (%rax),%al
 6d5:	00 02                	add    %al,(%rdx)
 6d7:	69 af 02 00 00 1d 00 	imul   $0x9e3e1e00,0x1d000002(%rdi),%ebp
 6de:	1e 3e 9e 
 6e1:	3c 57                	cmp    $0x57,%al
 6e3:	65 6c                	gs insb (%dx),%es:(%rdi)
 6e5:	63 6f 6d             	movslq 0x6d(%rdi),%ebp
 6e8:	65 20 74 6f 20       	and    %dh,%gs:0x20(%rdi,%rbp,2)
 6ed:	6d                   	insl   (%dx),%es:(%rdi)
 6ee:	79 20                	jns    710 <_init-0x8f0>
 6f0:	66 69 65 6e 64 69    	imul   $0x6964,0x6e(%rbp),%sp
 6f6:	73 68                	jae    760 <_init-0x8a0>
 6f8:	20 6c 69 74          	and    %ch,0x74(%rcx,%rbp,2)
 6fc:	74 6c                	je     76a <_init-0x896>
 6fe:	65 20 62 6f          	and    %ah,%gs:0x6f(%rdx)
 702:	6d                   	insl   (%dx),%es:(%rdi)
 703:	62                   	(bad)  
 704:	2e 20 59 6f          	and    %bl,%cs:0x6f(%rcx)
 708:	75 20                	jne    72a <_init-0x8d6>
 70a:	68 61 76 65 20       	pushq  $0x20657661
 70f:	36 20 70 68          	and    %dh,%ss:0x68(%rax)
 713:	61                   	(bad)  
 714:	73 65                	jae    77b <_init-0x885>
 716:	73 20                	jae    738 <_init-0x8c8>
 718:	77 69                	ja     783 <_init-0x87d>
 71a:	74 68                	je     784 <_init-0x87c>
 71c:	0a 00                	or     (%rax),%al
 71e:	1f                   	(bad)  
 71f:	62 01                	(bad)  
 721:	00 00                	add    %al,(%rax)
 723:	58                   	pop    %rax
 724:	01 00                	add    %eax,(%rax)
 726:	00 0c 00             	add    %cl,(%rax,%rax,1)
 729:	62 01                	(bad)  
 72b:	00 00                	add    %al,(%rax)
 72d:	1e                   	(bad)  
 72e:	2f                   	(bad)  
 72f:	9e                   	sahf   
 730:	2d 77 68 69 63       	sub    $0x63696877,%eax
 735:	68 20 74 6f 20       	pushq  $0x206f7420
 73a:	62                   	(bad)  
 73b:	6c                   	insb   (%dx),%es:(%rdi)
 73c:	6f                   	outsl  %ds:(%rsi),(%dx)
 73d:	77 20                	ja     75f <_init-0x8a1>
 73f:	79 6f                	jns    7b0 <_init-0x850>
 741:	75 72                	jne    7b5 <_init-0x84b>
 743:	73 65                	jae    7aa <_init-0x856>
 745:	6c                   	insb   (%dx),%es:(%rdi)
 746:	66 20 75 70          	data16 and %dh,0x70(%rbp)
 74a:	2e 20 48 61          	and    %cl,%cs:0x61(%rax)
 74e:	76 65                	jbe    7b5 <_init-0x84b>
 750:	20 61 20             	and    %ah,0x20(%rcx)
 753:	6e                   	outsb  %ds:(%rsi),(%dx)
 754:	69 63 65 20 64 61 79 	imul   $0x79616420,0x65(%rbx),%esp
 75b:	21 0a                	and    %ecx,(%rdx)
 75d:	00 1e                	add    %bl,(%rsi)
 75f:	2c 9e                	sub    $0x9e,%al
 761:	2a 50 68             	sub    0x68(%rax),%dl
 764:	61                   	(bad)  
 765:	73 65                	jae    7cc <_init-0x834>
 767:	20 31                	and    %dh,(%rcx)
 769:	20 64 65 66          	and    %ah,0x66(%rbp,%riz,2)
 76d:	75 73                	jne    7e2 <_init-0x81e>
 76f:	65 64 2e 20 48 6f    	gs fs and %cl,%cs:0x6f(%rax)
 775:	77 20                	ja     797 <_init-0x869>
 777:	61                   	(bad)  
 778:	62                   	(bad)  
 779:	6f                   	outsl  %ds:(%rsi),(%dx)
 77a:	75 74                	jne    7f0 <_init-0x810>
 77c:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
 780:	20 6e 65             	and    %ch,0x65(%rsi)
 783:	78 74                	js     7f9 <_init-0x807>
 785:	20 6f 6e             	and    %ch,0x6e(%rdi)
 788:	65 3f                	gs (bad) 
 78a:	0a 00                	or     (%rax),%al
 78c:	1e                   	(bad)  
 78d:	21 9e 1f 54 68 61    	and    %ebx,0x6168541f(%rsi)
 793:	74 27                	je     7bc <_init-0x844>
 795:	73 20                	jae    7b7 <_init-0x849>
 797:	6e                   	outsb  %ds:(%rsi),(%dx)
 798:	75 6d                	jne    807 <_init-0x7f9>
 79a:	62                   	(bad)  
 79b:	65 72 20             	gs jb  7be <_init-0x842>
 79e:	32 2e                	xor    (%rsi),%ch
 7a0:	20 20                	and    %ah,(%rax)
 7a2:	4b                   	rex.WXB
 7a3:	65 65 70 20          	gs gs jo 7c7 <_init-0x839>
 7a7:	67 6f                	outsl  %ds:(%esi),(%dx)
 7a9:	69 6e 67 21 0a 00 1e 	imul   $0x1e000a21,0x67(%rsi),%ebp
 7b0:	12 9e 10 48 61 6c    	adc    0x6c614810(%rsi),%bl
 7b6:	66 77 61             	data16 ja 81a <_init-0x7e6>
 7b9:	79 20                	jns    7db <_init-0x825>
 7bb:	74 68                	je     825 <_init-0x7db>
 7bd:	65 72 65             	gs jb  825 <_init-0x7db>
 7c0:	21 0a                	and    %ecx,(%rdx)
 7c2:	00 1e                	add    %bl,(%rsi)
 7c4:	27                   	(bad)  
 7c5:	9e                   	sahf   
 7c6:	25 53 6f 20 79       	and    $0x79206f53,%eax
 7cb:	6f                   	outsl  %ds:(%rsi),(%dx)
 7cc:	75 20                	jne    7ee <_init-0x812>
 7ce:	67 6f                	outsl  %ds:(%esi),(%dx)
 7d0:	74 20                	je     7f2 <_init-0x80e>
 7d2:	74 68                	je     83c <_init-0x7c4>
 7d4:	61                   	(bad)  
 7d5:	74 20                	je     7f7 <_init-0x809>
 7d7:	6f                   	outsl  %ds:(%rsi),(%dx)
 7d8:	6e                   	outsb  %ds:(%rsi),(%dx)
 7d9:	65 2e 20 20          	gs and %ah,%cs:(%rax)
 7dd:	54                   	push   %rsp
 7de:	72 79                	jb     859 <_init-0x7a7>
 7e0:	20 74 68 69          	and    %dh,0x69(%rax,%rbp,2)
 7e4:	73 20                	jae    806 <_init-0x7fa>
 7e6:	6f                   	outsl  %ds:(%rsi),(%dx)
 7e7:	6e                   	outsb  %ds:(%rsi),(%dx)
 7e8:	65 2e 0a 00          	gs or  %cs:(%rax),%al
 7ec:	1e                   	(bad)  
 7ed:	21 9e 1f 47 6f 6f    	and    %ebx,0x6f6f471f(%rsi)
 7f3:	64 20 77 6f          	and    %dh,%fs:0x6f(%rdi)
 7f7:	72 6b                	jb     864 <_init-0x79c>
 7f9:	21 20                	and    %esp,(%rax)
 7fb:	20 4f 6e             	and    %cl,0x6e(%rdi)
 7fe:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
 802:	74 68                	je     86c <_init-0x794>
 804:	65 20 6e 65          	and    %ch,%gs:0x65(%rsi)
 808:	78 74                	js     87e <_init-0x782>
 80a:	2e 2e 2e 0a 00       	cs cs or %cs:(%rax),%al
 80f:	20 be 00 00 00 be    	and    %bh,-0x42000000(%rsi)
 815:	00 00                	add    %al,(%rax)
 817:	00 02                	add    %al,(%rdx)
 819:	5a                   	pop    %rdx
 81a:	20 ab 01 00 00 ab    	and    %ch,-0x54ffffff(%rbx)
 820:	01 00                	add    %eax,(%rax)
 822:	00 07                	add    %al,(%rdi)
 824:	f6 20                	mulb   (%rax)
 826:	de 00                	fiadds (%rax)
 828:	00 00                	add    %al,(%rax)
 82a:	de 00                	fiadds (%rax)
 82c:	00 00                	add    %al,(%rax)
 82e:	09 09                	or     %ecx,(%rcx)
 830:	20 58 00             	and    %bl,0x0(%rax)
 833:	00 00                	add    %al,(%rax)
 835:	58                   	pop    %rax
 836:	00 00                	add    %al,(%rax)
 838:	00 09                	add    %cl,(%rcx)
 83a:	08 20                	or     %ah,(%rax)
 83c:	62 02                	(bad)  
 83e:	00 00                	add    %al,(%rax)
 840:	62 02                	(bad)  
 842:	00 00                	add    %al,(%rax)
 844:	0a 04 20             	or     (%rax,%riz,1),%al
 847:	70 00                	jo     849 <_init-0x7b7>
 849:	00 00                	add    %al,(%rax)
 84b:	70 00                	jo     84d <_init-0x7b3>
 84d:	00 00                	add    %al,(%rax)
 84f:	09 0c 20             	or     %ecx,(%rax,%riz,1)
 852:	6a 02                	pushq  $0x2
 854:	00 00                	add    %al,(%rax)
 856:	6a 02                	pushq  $0x2
 858:	00 00                	add    %al,(%rax)
 85a:	0a 05 20 72 02 00    	or     0x27220(%rip),%al        # 27a80 <_end+0x21cf0>
 860:	00 72 02             	add    %dh,0x2(%rdx)
 863:	00 00                	add    %al,(%rax)
 865:	0a 06                	or     (%rsi),%al
 867:	20 7a 02             	and    %bh,0x2(%rdx)
 86a:	00 00                	add    %al,(%rax)
 86c:	7a 02                	jp     870 <_init-0x790>
 86e:	00 00                	add    %al,(%rax)
 870:	0a 07                	or     (%rdi),%al
 872:	20 82 02 00 00 82    	and    %al,-0x7dfffffe(%rdx)
 878:	02 00                	add    (%rax),%al
 87a:	00 0a                	add    %cl,(%rdx)
 87c:	08 20                	or     %ah,(%rax)
 87e:	8a 02                	mov    (%rdx),%al
 880:	00 00                	add    %al,(%rax)
 882:	8a 02                	mov    (%rdx),%al
 884:	00 00                	add    %al,(%rax)
 886:	0a 09                	or     (%rcx),%cl
 888:	21 09                	and    %ecx,(%rcx)
 88a:	02 00                	add    (%rax),%al
 88c:	00 09                	add    %cl,(%rcx)
 88e:	02 00                	add    (%rax),%al
 890:	00 0b                	add    %cl,(%rbx)
 892:	69                   	.byte 0x69
 893:	02 00                	add    (%rax),%al

Desensamblado de la sección .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%rcx)
   2:	01 25 0e 13 0b 03    	add    %esp,0x30b130e(%rip)        # 30b1316 <_end+0x30ab586>
   8:	0e                   	(bad)  
   9:	1b 0e                	sbb    (%rsi),%ecx
   b:	11 01                	adc    %eax,(%rcx)
   d:	12 07                	adc    (%rdi),%al
   f:	10 17                	adc    %dl,(%rdi)
  11:	00 00                	add    %al,(%rax)
  13:	02 16                	add    (%rsi),%dl
  15:	00 03                	add    %al,(%rbx)
  17:	0e                   	(bad)  
  18:	3a 0b                	cmp    (%rbx),%cl
  1a:	3b 0b                	cmp    (%rbx),%ecx
  1c:	49 13 00             	adc    (%r8),%rax
  1f:	00 03                	add    %al,(%rbx)
  21:	24 00                	and    $0x0,%al
  23:	0b 0b                	or     (%rbx),%ecx
  25:	3e 0b 03             	or     %ds:(%rbx),%eax
  28:	0e                   	(bad)  
  29:	00 00                	add    %al,(%rax)
  2b:	04 0f                	add    $0xf,%al
  2d:	00 0b                	add    %cl,(%rbx)
  2f:	0b 00                	or     (%rax),%eax
  31:	00 05 24 00 0b 0b    	add    %al,0xb0b0024(%rip)        # b0b005b <_end+0xb0aa2cb>
  37:	3e 0b 03             	or     %ds:(%rbx),%eax
  3a:	08 00                	or     %al,(%rax)
  3c:	00 06                	add    %al,(%rsi)
  3e:	0f 00 0b             	str    (%rbx)
  41:	0b 49 13             	or     0x13(%rcx),%ecx
  44:	00 00                	add    %al,(%rax)
  46:	07                   	(bad)  
  47:	26 00 49 13          	add    %cl,%es:0x13(%rcx)
  4b:	00 00                	add    %al,(%rax)
  4d:	08 13                	or     %dl,(%rbx)
  4f:	01 03                	add    %eax,(%rbx)
  51:	0e                   	(bad)  
  52:	0b 0b                	or     (%rbx),%ecx
  54:	3a 0b                	cmp    (%rbx),%cl
  56:	3b 0b                	cmp    (%rbx),%ecx
  58:	01 13                	add    %edx,(%rbx)
  5a:	00 00                	add    %al,(%rax)
  5c:	09 0d 00 03 0e 3a    	or     %ecx,0x3a0e0300(%rip)        # 3a0e0362 <_end+0x3a0da5d2>
  62:	0b 3b                	or     (%rbx),%edi
  64:	0b 49 13             	or     0x13(%rcx),%ecx
  67:	38 0b                	cmp    %cl,(%rbx)
  69:	00 00                	add    %al,(%rax)
  6b:	0a 16                	or     (%rsi),%dl
  6d:	00 03                	add    %al,(%rbx)
  6f:	0e                   	(bad)  
  70:	3a 0b                	cmp    (%rbx),%cl
  72:	3b 0b                	cmp    (%rbx),%ecx
  74:	00 00                	add    %al,(%rax)
  76:	0b 13                	or     (%rbx),%edx
  78:	00 03                	add    %al,(%rbx)
  7a:	0e                   	(bad)  
  7b:	3c 19                	cmp    $0x19,%al
  7d:	00 00                	add    %al,(%rax)
  7f:	0c 01                	or     $0x1,%al
  81:	01 49 13             	add    %ecx,0x13(%rcx)
  84:	01 13                	add    %edx,(%rbx)
  86:	00 00                	add    %al,(%rax)
  88:	0d 21 00 49 13       	or     $0x13490021,%eax
  8d:	2f                   	(bad)  
  8e:	0b 00                	or     (%rax),%eax
  90:	00 0e                	add    %cl,(%rsi)
  92:	34 00                	xor    $0x0,%al
  94:	03 0e                	add    (%rsi),%ecx
  96:	3a 0b                	cmp    (%rbx),%cl
  98:	3b 0b                	cmp    (%rbx),%ecx
  9a:	49 13 3f             	adc    (%r15),%rdi
  9d:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
  a0:	00 00                	add    %al,(%rax)
  a2:	0f 21 00             	mov    %db0,%rax
  a5:	00 00                	add    %al,(%rax)
  a7:	10 37                	adc    %dh,(%rdi)
  a9:	00 49 13             	add    %cl,0x13(%rcx)
  ac:	00 00                	add    %al,(%rax)
  ae:	11 34 00             	adc    %esi,(%rax,%rax,1)
  b1:	03 0e                	add    (%rsi),%ecx
  b3:	3a 0b                	cmp    (%rbx),%cl
  b5:	3b 0b                	cmp    (%rbx),%ecx
  b7:	49 13 3f             	adc    (%r15),%rdi
  ba:	19 02                	sbb    %eax,(%rdx)
  bc:	18 00                	sbb    %al,(%rax)
  be:	00 12                	add    %dl,(%rdx)
  c0:	2e 01 3f             	add    %edi,%cs:(%rdi)
  c3:	19 03                	sbb    %eax,(%rbx)
  c5:	0e                   	(bad)  
  c6:	3a 0b                	cmp    (%rbx),%cl
  c8:	3b 0b                	cmp    (%rbx),%ecx
  ca:	27                   	(bad)  
  cb:	19 49 13             	sbb    %ecx,0x13(%rcx)
  ce:	11 01                	adc    %eax,(%rcx)
  d0:	12 07                	adc    (%rdi),%al
  d2:	40 18 97 42 19 01 13 	sbb    %dl,0x13011942(%rdi)
  d9:	00 00                	add    %al,(%rax)
  db:	13 05 00 03 0e 3a    	adc    0x3a0e0300(%rip),%eax        # 3a0e03e1 <_end+0x3a0da651>
  e1:	0b 3b                	or     (%rbx),%edi
  e3:	0b 49 13             	or     0x13(%rcx),%ecx
  e6:	02 17                	add    (%rdi),%dl
  e8:	00 00                	add    %al,(%rax)
  ea:	14 34                	adc    $0x34,%al
  ec:	00 03                	add    %al,(%rbx)
  ee:	0e                   	(bad)  
  ef:	3a 0b                	cmp    (%rbx),%cl
  f1:	3b 0b                	cmp    (%rbx),%ecx
  f3:	49 13 02             	adc    (%r10),%rax
  f6:	17                   	(bad)  
  f7:	00 00                	add    %al,(%rax)
  f9:	15 1d 01 31 13       	adc    $0x1331011d,%eax
  fe:	11 01                	adc    %eax,(%rcx)
 100:	12 07                	adc    (%rdi),%al
 102:	58                   	pop    %rax
 103:	0b 59 0b             	or     0xb(%rcx),%ebx
 106:	01 13                	add    %edx,(%rbx)
 108:	00 00                	add    %al,(%rax)
 10a:	16                   	(bad)  
 10b:	05 00 31 13 02       	add    $0x2133100,%eax
 110:	17                   	(bad)  
 111:	00 00                	add    %al,(%rax)
 113:	17                   	(bad)  
 114:	89 82 01 01 11 01    	mov    %eax,0x1110101(%rdx)
 11a:	31 13                	xor    %edx,(%rbx)
 11c:	00 00                	add    %al,(%rax)
 11e:	18 8a 82 01 00 02    	sbb    %cl,0x2000182(%rdx)
 124:	18 91 42 18 00 00    	sbb    %dl,0x1842(%rcx)
 12a:	19 89 82 01 01 11    	sbb    %ecx,0x11010182(%rcx)
 130:	01 31                	add    %esi,(%rcx)
 132:	13 01                	adc    (%rcx),%eax
 134:	13 00                	adc    (%rax),%eax
 136:	00 1a                	add    %bl,(%rdx)
 138:	89 82 01 00 11 01    	mov    %eax,0x1110001(%rdx)
 13e:	31 13                	xor    %edx,(%rbx)
 140:	00 00                	add    %al,(%rax)
 142:	1b 2e                	sbb    (%rsi),%ebp
 144:	01 3f                	add    %edi,(%rdi)
 146:	19 03                	sbb    %eax,(%rbx)
 148:	0e                   	(bad)  
 149:	3a 0b                	cmp    (%rbx),%cl
 14b:	3b 0b                	cmp    (%rbx),%ecx
 14d:	27                   	(bad)  
 14e:	19 49 13             	sbb    %ecx,0x13(%rcx)
 151:	20 0b                	and    %cl,(%rbx)
 153:	34 19                	xor    $0x19,%al
 155:	01 13                	add    %edx,(%rbx)
 157:	00 00                	add    %al,(%rax)
 159:	1c 05                	sbb    $0x5,%al
 15b:	00 03                	add    %al,(%rbx)
 15d:	0e                   	(bad)  
 15e:	3a 0b                	cmp    (%rbx),%cl
 160:	3b 0b                	cmp    (%rbx),%ecx
 162:	49 13 00             	adc    (%r8),%rax
 165:	00 1d 18 00 00 00    	add    %bl,0x18(%rip)        # 183 <_init-0xe7d>
 16b:	1e                   	(bad)  
 16c:	36 00 02             	add    %al,%ss:(%rdx)
 16f:	18 00                	sbb    %al,(%rax)
 171:	00 1f                	add    %bl,(%rdi)
 173:	2e 00 3f             	add    %bh,%cs:(%rdi)
 176:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 179:	6e                   	outsb  %ds:(%rsi),(%dx)
 17a:	0e                   	(bad)  
 17b:	03 0e                	add    (%rsi),%ecx
 17d:	3a 0b                	cmp    (%rbx),%cl
 17f:	3b 0b                	cmp    (%rbx),%ecx
 181:	6e                   	outsb  %ds:(%rsi),(%dx)
 182:	0e                   	(bad)  
 183:	00 00                	add    %al,(%rax)
 185:	20 2e                	and    %ch,(%rsi)
 187:	00 3f                	add    %bh,(%rdi)
 189:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 18c:	6e                   	outsb  %ds:(%rsi),(%dx)
 18d:	0e                   	(bad)  
 18e:	03 0e                	add    (%rsi),%ecx
 190:	3a 0b                	cmp    (%rbx),%cl
 192:	3b 0b                	cmp    (%rbx),%ecx
 194:	00 00                	add    %al,(%rax)
 196:	21 2e                	and    %ebp,(%rsi)
 198:	00 3f                	add    %bh,(%rdi)
 19a:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 19d:	6e                   	outsb  %ds:(%rsi),(%dx)
 19e:	0e                   	(bad)  
 19f:	03 0e                	add    (%rsi),%ecx
 1a1:	3a 0b                	cmp    (%rbx),%cl
 1a3:	3b                   	.byte 0x3b
 1a4:	05                   	.byte 0x5
 1a5:	00 00                	add    %al,(%rax)
	...

Desensamblado de la sección .debug_line:

0000000000000000 <.debug_line>:
   0:	ac                   	lods   %ds:(%rsi),%al
   1:	01 00                	add    %eax,(%rax)
   3:	00 03                	add    %al,(%rbx)
   5:	00 2b                	add    %ch,(%rbx)
   7:	01 00                	add    %eax,(%rax)
   9:	00 01                	add    %al,(%rcx)
   b:	01 fb                	add    %edi,%ebx
   d:	0e                   	(bad)  
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%rax)
  15:	00 00                	add    %al,(%rax)
  17:	01 00                	add    %eax,(%rax)
  19:	00 01                	add    %al,(%rcx)
  1b:	2f                   	(bad)  
  1c:	75 73                	jne    91 <_init-0xf6f>
  1e:	72 2f                	jb     4f <_init-0xfb1>
  20:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  27:	2f                   	(bad)  
  28:	78 38                	js     62 <_init-0xf9e>
  2a:	36 5f                	ss pop %rdi
  2c:	36 34 2d             	ss xor $0x2d,%al
  2f:	6c                   	insb   (%dx),%es:(%rdi)
  30:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  37:	75 2f                	jne    68 <_init-0xf98>
  39:	62                   	(bad)  
  3a:	69 74 73 00 2f 75 73 	imul   $0x7273752f,0x0(%rbx,%rsi,2),%esi
  41:	72 
  42:	2f                   	(bad)  
  43:	6c                   	insb   (%dx),%es:(%rdi)
  44:	69 62 2f 67 63 63 2f 	imul   $0x2f636367,0x2f(%rdx),%esp
  4b:	78 38                	js     85 <_init-0xf7b>
  4d:	36 5f                	ss pop %rdi
  4f:	36 34 2d             	ss xor $0x2d,%al
  52:	6c                   	insb   (%dx),%es:(%rdi)
  53:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  5a:	75 2f                	jne    8b <_init-0xf75>
  5c:	37                   	(bad)  
  5d:	2f                   	(bad)  
  5e:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  65:	00 2f                	add    %ch,(%rdi)
  67:	75 73                	jne    dc <_init-0xf24>
  69:	72 2f                	jb     9a <_init-0xf66>
  6b:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  72:	2f                   	(bad)  
  73:	78 38                	js     ad <_init-0xf53>
  75:	36 5f                	ss pop %rdi
  77:	36 34 2d             	ss xor $0x2d,%al
  7a:	6c                   	insb   (%dx),%es:(%rdi)
  7b:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  82:	75 2f                	jne    b3 <_init-0xf4d>
  84:	62                   	(bad)  
  85:	69 74 73 2f 74 79 70 	imul   $0x65707974,0x2f(%rbx,%rsi,2),%esi
  8c:	65 
  8d:	73 00                	jae    8f <_init-0xf71>
  8f:	2f                   	(bad)  
  90:	75 73                	jne    105 <_init-0xefb>
  92:	72 2f                	jb     c3 <_init-0xf3d>
  94:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  9b:	00 00                	add    %al,(%rax)
  9d:	62                   	(bad)  
  9e:	6f                   	outsl  %ds:(%rsi),(%dx)
  9f:	6d                   	insl   (%dx),%es:(%rdi)
  a0:	62                   	(bad)  
  a1:	2e 63 00             	movslq %cs:(%rax),%eax
  a4:	00 00                	add    %al,(%rax)
  a6:	00 73 74             	add    %dh,0x74(%rbx)
  a9:	64 69 6f 32 2e 68 00 	imul   $0x100682e,%fs:0x32(%rdi),%ebp
  b0:	01 
  b1:	00 00                	add    %al,(%rax)
  b3:	73 74                	jae    129 <_init-0xed7>
  b5:	64 64 65 66 2e 68 00 	fs fs gs cs pushw $0x200
  bc:	02 
  bd:	00 00                	add    %al,(%rax)
  bf:	74 79                	je     13a <_init-0xec6>
  c1:	70 65                	jo     128 <_init-0xed8>
  c3:	73 2e                	jae    f3 <_init-0xf0d>
  c5:	68 00 01 00 00       	pushq  $0x100
  ca:	73 74                	jae    140 <_init-0xec0>
  cc:	72 75                	jb     143 <_init-0xebd>
  ce:	63 74 5f 46          	movslq 0x46(%rdi,%rbx,2),%esi
  d2:	49                   	rex.WB
  d3:	4c                   	rex.WR
  d4:	45                   	rex.RB
  d5:	2e 68 00 03 00 00    	cs pushq $0x300
  db:	46                   	rex.RX
  dc:	49                   	rex.WB
  dd:	4c                   	rex.WR
  de:	45                   	rex.RB
  df:	2e 68 00 03 00 00    	cs pushq $0x300
  e5:	73 74                	jae    15b <_init-0xea5>
  e7:	64 69 6f 2e 68 00 04 	imul   $0x40068,%fs:0x2e(%rdi),%ebp
  ee:	00 
  ef:	00 73 79             	add    %dh,0x79(%rbx)
  f2:	73 5f                	jae    153 <_init-0xead>
  f4:	65 72 72             	gs jb  169 <_init-0xe97>
  f7:	6c                   	insb   (%dx),%es:(%rdi)
  f8:	69 73 74 2e 68 00 01 	imul   $0x100682e,0x74(%rbx),%esi
  ff:	00 00                	add    %al,(%rax)
 101:	73 75                	jae    178 <_init-0xe88>
 103:	70 70                	jo     175 <_init-0xe8b>
 105:	6f                   	outsl  %ds:(%rsi),(%dx)
 106:	72 74                	jb     17c <_init-0xe84>
 108:	2e 68 00 00 00 00    	cs pushq $0x0
 10e:	70 68                	jo     178 <_init-0xe88>
 110:	61                   	(bad)  
 111:	73 65                	jae    178 <_init-0xe88>
 113:	73 2e                	jae    143 <_init-0xebd>
 115:	68 00 00 00 00       	pushq  $0x0
 11a:	73 74                	jae    190 <_init-0xe70>
 11c:	64 6c                	fs insb (%dx),%es:(%rdi)
 11e:	69 62 2e 68 00 04 00 	imul   $0x40068,0x2e(%rdx),%esp
 125:	00 3c 62             	add    %bh,(%rdx,%riz,2)
 128:	75 69                	jne    193 <_init-0xe6d>
 12a:	6c                   	insb   (%dx),%es:(%rdi)
 12b:	74 2d                	je     15a <_init-0xea6>
 12d:	69 6e 3e 00 00 00 00 	imul   $0x0,0x3e(%rsi),%ebp
 134:	00 00                	add    %al,(%rax)
 136:	09 02                	or     %eax,(%rdx)
 138:	fa                   	cli    
 139:	12 00                	adc    (%rax),%al
 13b:	00 00                	add    %al,(%rax)
 13d:	00 00                	add    %al,(%rax)
 13f:	00 03                	add    %al,(%rbx)
 141:	24 01                	and    $0x1,%al
 143:	28 c2                	sub    %al,%dl
 145:	91                   	xchg   %eax,%ecx
 146:	03 0d 08 e4 04 02    	add    0x204e408(%rip),%ecx        # 204e554 <_end+0x20487c4>
 14c:	03 28                	add    (%rax),%ebp
 14e:	58                   	pop    %rax
 14f:	04 01                	add    $0x1,%al
 151:	03 5e 08             	add    0x8(%rsi),%ebx
 154:	74 59                	je     1af <_init-0xe51>
 156:	83 04 02 03          	addl   $0x3,(%rdx,%rax,1)
 15a:	20 58 04             	and    %bl,0x4(%rax)
 15d:	01 03                	add    %eax,(%rbx)
 15f:	66 ba 59 83          	mov    $0x8359,%dx
 163:	04 02                	add    $0x2,%al
 165:	03 18                	add    (%rax),%ebx
 167:	58                   	pop    %rax
 168:	04 01                	add    $0x1,%al
 16a:	03 6d ba             	add    -0x46(%rbp),%ebp
 16d:	59                   	pop    %rcx
 16e:	83 04 02 03          	addl   $0x3,(%rdx,%rax,1)
 172:	11 58 04             	adc    %ebx,0x4(%rax)
 175:	01 03                	add    %eax,(%rbx)
 177:	73 ba                	jae    133 <_init-0xecd>
 179:	59                   	pop    %rcx
 17a:	83 04 02 03          	addl   $0x3,(%rdx,%rax,1)
 17e:	0b 58 04             	or     0x4(%rax),%ebx
 181:	01 03                	add    %eax,(%rbx)
 183:	79 ba                	jns    13f <_init-0xec1>
 185:	59                   	pop    %rcx
 186:	83 04 02 5d          	addl   $0x5d,(%rdx,%rax,1)
 18a:	04 01                	add    $0x1,%al
 18c:	ba 59 83 5e 03       	mov    $0x35e8359,%edx
 191:	bb 7f 74 04 02       	mov    $0x204747f,%ebx
 196:	03 3d 08 2e 04 01    	add    0x1042e08(%rip),%edi        # 1042fa4 <_end+0x103d214>
 19c:	03 4d 08             	add    0x8(%rbp),%ecx
 19f:	74 04                	je     1a5 <_init-0xe5b>
 1a1:	02 03                	add    (%rbx),%al
 1a3:	33 9e 04 01 03 54    	xor    0x54030104(%rsi),%ebx
 1a9:	08 82 02 0a 00 01    	or     %al,0x1000a02(%rdx)
 1af:	01                   	.byte 0x1

Desensamblado de la sección .debug_str:

0000000000000000 <.debug_str>:
   0:	70 72                	jo     74 <_init-0xf8c>
   2:	69 6e 74 66 00 5f 5f 	imul   $0x5f5f0066,0x74(%rsi),%ebp
   9:	6f                   	outsl  %ds:(%rsi),(%dx)
   a:	66 66 5f             	data16 pop %di
   d:	74 00                	je     f <_init-0xff1>
   f:	5f                   	pop    %rdi
  10:	49                   	rex.WB
  11:	4f 5f                	rex.WRXB pop %r15
  13:	72 65                	jb     7a <_init-0xf86>
  15:	61                   	(bad)  
  16:	64 5f                	fs pop %rdi
  18:	70 74                	jo     8e <_init-0xf72>
  1a:	72 00                	jb     1c <_init-0xfe4>
  1c:	5f                   	pop    %rdi
  1d:	63 68 61             	movslq 0x61(%rax),%ebp
  20:	69 6e 00 73 69 7a 65 	imul   $0x657a6973,0x0(%rsi),%ebp
  27:	5f                   	pop    %rdi
  28:	74 00                	je     2a <_init-0xfd6>
  2a:	5f                   	pop    %rdi
  2b:	73 68                	jae    95 <_init-0xf6b>
  2d:	6f                   	outsl  %ds:(%rsi),(%dx)
  2e:	72 74                	jb     a4 <_init-0xf5c>
  30:	62                   	(bad)  
  31:	75 66                	jne    99 <_init-0xf67>
  33:	00 5f 49             	add    %bl,0x49(%rdi)
  36:	4f 5f                	rex.WRXB pop %r15
  38:	62                   	(bad)  
  39:	75 66                	jne    a1 <_init-0xf5f>
  3b:	5f                   	pop    %rdi
  3c:	62 61                	(bad)  
  3e:	73 65                	jae    a5 <_init-0xf5b>
  40:	00 6c 6f 6e          	add    %ch,0x6e(%rdi,%rbp,2)
  44:	67 20 6c 6f 6e       	and    %ch,0x6e(%edi,%ebp,2)
  49:	67 20 75 6e          	and    %dh,0x6e(%ebp)
  4d:	73 69                	jae    b8 <_init-0xf48>
  4f:	67 6e                	outsb  %ds:(%esi),(%dx)
  51:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%rcx)
  56:	74 00                	je     58 <_init-0xfa8>
  58:	72 65                	jb     bf <_init-0xf41>
  5a:	61                   	(bad)  
  5b:	64 5f                	fs pop %rdi
  5d:	6c                   	insb   (%dx),%es:(%rdi)
  5e:	69 6e 65 00 6c 6f 6e 	imul   $0x6e6f6c00,0x65(%rsi),%ebp
  65:	67 20 6c 6f 6e       	and    %ch,0x6e(%edi,%ebp,2)
  6a:	67 20 69 6e          	and    %ch,0x6e(%ecx)
  6e:	74 00                	je     70 <_init-0xf90>
  70:	70 68                	jo     da <_init-0xf26>
  72:	61                   	(bad)  
  73:	73 65                	jae    da <_init-0xf26>
  75:	5f                   	pop    %rdi
  76:	64 65 66 75 73       	fs gs data16 jne ee <_init-0xf12>
  7b:	65 64 00 5f 66       	gs add %bl,%fs:0x66(%rdi)
  80:	69 6c 65 6e 6f 00 5f 	imul   $0x495f006f,0x6e(%rbp,%riz,2),%ebp
  87:	49 
  88:	4f 5f                	rex.WRXB pop %r15
  8a:	72 65                	jb     f1 <_init-0xf0f>
  8c:	61                   	(bad)  
  8d:	64 5f                	fs pop %rdi
  8f:	65 6e                	outsb  %gs:(%rsi),(%dx)
  91:	64 00 5f 66          	add    %bl,%fs:0x66(%rdi)
  95:	6c                   	insb   (%dx),%es:(%rdi)
  96:	61                   	(bad)  
  97:	67 73 00             	addr32 jae 9a <_init-0xf66>
  9a:	5f                   	pop    %rdi
  9b:	49                   	rex.WB
  9c:	4f 5f                	rex.WRXB pop %r15
  9e:	62                   	(bad)  
  9f:	75 66                	jne    107 <_init-0xef9>
  a1:	5f                   	pop    %rdi
  a2:	65 6e                	outsb  %gs:(%rsi),(%dx)
  a4:	64 00 5f 63          	add    %bl,%fs:0x63(%rdi)
  a8:	75 72                	jne    11c <_init-0xee4>
  aa:	5f                   	pop    %rdi
  ab:	63 6f 6c             	movslq 0x6c(%rdi),%ebp
  ae:	75 6d                	jne    11d <_init-0xee3>
  b0:	6e                   	outsb  %ds:(%rsi),(%dx)
  b1:	00 5f 49             	add    %bl,0x49(%rdi)
  b4:	4f 5f                	rex.WRXB pop %r15
  b6:	63 6f 64             	movslq 0x64(%rdi),%ebp
  b9:	65 63 76 74          	movslq %gs:0x74(%rsi),%esi
  bd:	00 5f 5f             	add    %bl,0x5f(%rdi)
  c0:	70 72                	jo     134 <_init-0xecc>
  c2:	69 6e 74 66 5f 63 68 	imul   $0x68635f66,0x74(%rsi),%ebp
  c9:	6b 00 5f             	imul   $0x5f,(%rax),%eax
  cc:	6f                   	outsl  %ds:(%rsi),(%dx)
  cd:	6c                   	insb   (%dx),%es:(%rdi)
  ce:	64 5f                	fs pop %rdi
  d0:	6f                   	outsl  %ds:(%rsi),(%dx)
  d1:	66 66 73 65          	data16 data16 jae 13a <_init-0xec6>
  d5:	74 00                	je     d7 <_init-0xf29>
  d7:	69 6e 66 69 6c 65 00 	imul   $0x656c69,0x66(%rsi),%ebp
  de:	69 6e 69 74 69 61 6c 	imul   $0x6c616974,0x69(%rsi),%ebp
  e5:	69 7a 65 5f 62 6f 6d 	imul   $0x6d6f625f,0x65(%rdx),%edi
  ec:	62                   	(bad)  
  ed:	00 5f 49             	add    %bl,0x49(%rdi)
  f0:	4f 5f                	rex.WRXB pop %r15
  f2:	6d                   	insl   (%dx),%es:(%rdi)
  f3:	61                   	(bad)  
  f4:	72 6b                	jb     161 <_init-0xe9f>
  f6:	65 72 00             	gs jb  f9 <_init-0xf07>
  f9:	73 74                	jae    16f <_init-0xe91>
  fb:	64 69 6e 00 5f 66 72 	imul   $0x6572665f,%fs:0x0(%rsi),%ebp
 102:	65 
 103:	65 72 65             	gs jb  16b <_init-0xe95>
 106:	73 5f                	jae    167 <_init-0xe99>
 108:	62                   	(bad)  
 109:	75 66                	jne    171 <_init-0xe8f>
 10b:	00 5f 49             	add    %bl,0x49(%rdi)
 10e:	4f 5f                	rex.WRXB pop %r15
 110:	77 72                	ja     184 <_init-0xe7c>
 112:	69 74 65 5f 70 74 72 	imul   $0x727470,0x5f(%rbp,%riz,2),%esi
 119:	00 
 11a:	73 79                	jae    195 <_init-0xe6b>
 11c:	73 5f                	jae    17d <_init-0xe83>
 11e:	6e                   	outsb  %ds:(%rsi),(%dx)
 11f:	65 72 72             	gs jb  194 <_init-0xe6c>
 122:	00 73 68             	add    %dh,0x68(%rbx)
 125:	6f                   	outsl  %ds:(%rsi),(%dx)
 126:	72 74                	jb     19c <_init-0xe64>
 128:	20 75 6e             	and    %dh,0x6e(%rbp)
 12b:	73 69                	jae    196 <_init-0xe6a>
 12d:	67 6e                	outsb  %ds:(%esi),(%dx)
 12f:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%rcx)
 134:	74 00                	je     136 <_init-0xeca>
 136:	5f                   	pop    %rdi
 137:	49                   	rex.WB
 138:	4f 5f                	rex.WRXB pop %r15
 13a:	73 61                	jae    19d <_init-0xe63>
 13c:	76 65                	jbe    1a3 <_init-0xe5d>
 13e:	5f                   	pop    %rdi
 13f:	62 61                	(bad)  
 141:	73 65                	jae    1a8 <_init-0xe58>
 143:	00 5f 6c             	add    %bl,0x6c(%rdi)
 146:	6f                   	outsl  %ds:(%rsi),(%dx)
 147:	63 6b 00             	movslq 0x0(%rbx),%ebp
 14a:	5f                   	pop    %rdi
 14b:	66 6c                	data16 insb (%dx),%es:(%rdi)
 14d:	61                   	(bad)  
 14e:	67 73 32             	addr32 jae 183 <_init-0xe7d>
 151:	00 5f 6d             	add    %bl,0x6d(%rdi)
 154:	6f                   	outsl  %ds:(%rsi),(%dx)
 155:	64 65 00 5f 5f       	fs add %bl,%gs:0x5f(%rdi)
 15a:	62                   	(bad)  
 15b:	75 69                	jne    1c6 <_init-0xe3a>
 15d:	6c                   	insb   (%dx),%es:(%rdi)
 15e:	74 69                	je     1c9 <_init-0xe37>
 160:	6e                   	outsb  %ds:(%rsi),(%dx)
 161:	5f                   	pop    %rdi
 162:	70 75                	jo     1d9 <_init-0xe27>
 164:	74 73                	je     1d9 <_init-0xe27>
 166:	00 73 74             	add    %dh,0x74(%rbx)
 169:	64 6f                	outsl  %fs:(%rsi),(%dx)
 16b:	75 74                	jne    1e1 <_init-0xe1f>
 16d:	00 2f                	add    %ch,(%rdi)
 16f:	73 72                	jae    1e3 <_init-0xe1d>
 171:	76 2f                	jbe    1a2 <_init-0xe5e>
 173:	6f                   	outsl  %ds:(%rsi),(%dx)
 174:	72 67                	jb     1dd <_init-0xe23>
 176:	61                   	(bad)  
 177:	2f                   	(bad)  
 178:	6c                   	insb   (%dx),%es:(%rdi)
 179:	69 76 65 2f 62 6f 6d 	imul   $0x6d6f622f,0x65(%rsi),%esi
 180:	62                   	(bad)  
 181:	6c                   	insb   (%dx),%es:(%rdi)
 182:	61                   	(bad)  
 183:	62                   	(bad)  
 184:	2f                   	(bad)  
 185:	73 72                	jae    1f9 <_init-0xe07>
 187:	63 00                	movslq (%rax),%eax
 189:	5f                   	pop    %rdi
 18a:	49                   	rex.WB
 18b:	4f 5f                	rex.WRXB pop %r15
 18d:	77 72                	ja     201 <_init-0xdff>
 18f:	69 74 65 5f 65 6e 64 	imul   $0x646e65,0x5f(%rbp,%riz,2),%esi
 196:	00 
 197:	5f                   	pop    %rdi
 198:	49                   	rex.WB
 199:	4f 5f                	rex.WRXB pop %r15
 19b:	6c                   	insb   (%dx),%es:(%rdi)
 19c:	6f                   	outsl  %ds:(%rsi),(%dx)
 19d:	63 6b 5f             	movslq 0x5f(%rbx),%ebp
 1a0:	74 00                	je     1a2 <_init-0xe5e>
 1a2:	5f                   	pop    %rdi
 1a3:	49                   	rex.WB
 1a4:	4f 5f                	rex.WRXB pop %r15
 1a6:	46                   	rex.RX
 1a7:	49                   	rex.WB
 1a8:	4c                   	rex.WR
 1a9:	45 00 66 6f          	add    %r12b,0x6f(%r14)
 1ad:	70 65                	jo     214 <_init-0xdec>
 1af:	6e                   	outsb  %ds:(%rsi),(%dx)
 1b0:	00 73 79             	add    %dh,0x79(%rbx)
 1b3:	73 5f                	jae    214 <_init-0xdec>
 1b5:	65 72 72             	gs jb  22a <_init-0xdd6>
 1b8:	6c                   	insb   (%dx),%es:(%rdi)
 1b9:	69 73 74 00 5f 6d 61 	imul   $0x616d5f00,0x74(%rbx),%esi
 1c0:	72 6b                	jb     22d <_init-0xdd3>
 1c2:	65 72 73             	gs jb  238 <_init-0xdc8>
 1c5:	00 5f 66             	add    %bl,0x66(%rdi)
 1c8:	72 65                	jb     22f <_init-0xdd1>
 1ca:	65 72 65             	gs jb  232 <_init-0xdce>
 1cd:	73 5f                	jae    22e <_init-0xdd2>
 1cf:	6c                   	insb   (%dx),%es:(%rdi)
 1d0:	69 73 74 00 75 6e 73 	imul   $0x736e7500,0x74(%rbx),%esi
 1d7:	69 67 6e 65 64 20 63 	imul   $0x63206465,0x6e(%rdi),%esp
 1de:	68 61 72 00 73       	pushq  $0x73007261
 1e3:	68 6f 72 74 20       	pushq  $0x2074726f
 1e8:	69 6e 74 00 5f 49 4f 	imul   $0x4f495f00,0x74(%rsi),%ebp
 1ef:	5f                   	pop    %rdi
 1f0:	77 69                	ja     25b <_init-0xda5>
 1f2:	64 65 5f             	fs gs pop %rdi
 1f5:	64 61                	fs (bad) 
 1f7:	74 61                	je     25a <_init-0xda6>
 1f9:	00 5f 76             	add    %bl,0x76(%rdi)
 1fc:	74 61                	je     25f <_init-0xda1>
 1fe:	62                   	(bad)  
 1ff:	6c                   	insb   (%dx),%es:(%rdi)
 200:	65 5f                	gs pop %rdi
 202:	6f                   	outsl  %ds:(%rsi),(%dx)
 203:	66 66 73 65          	data16 data16 jae 26c <_init-0xd94>
 207:	74 00                	je     209 <_init-0xdf7>
 209:	65 78 69             	gs js  275 <_init-0xd8b>
 20c:	74 00                	je     20e <_init-0xdf2>
 20e:	62                   	(bad)  
 20f:	6f                   	outsl  %ds:(%rsi),(%dx)
 210:	6d                   	insl   (%dx),%es:(%rdi)
 211:	62                   	(bad)  
 212:	2e 63 00             	movslq %cs:(%rax),%eax
 215:	69 6e 70 75 74 00 5f 	imul   $0x5f007475,0x70(%rsi),%ebp
 21c:	5f                   	pop    %rdi
 21d:	6f                   	outsl  %ds:(%rsi),(%dx)
 21e:	66 66 36 34 5f       	data16 data16 ss xor $0x5f,%al
 223:	74 00                	je     225 <_init-0xddb>
 225:	5f                   	pop    %rdi
 226:	49                   	rex.WB
 227:	4f 5f                	rex.WRXB pop %r15
 229:	72 65                	jb     290 <_init-0xd70>
 22b:	61                   	(bad)  
 22c:	64 5f                	fs pop %rdi
 22e:	62 61                	(bad)  
 230:	73 65                	jae    297 <_init-0xd69>
 232:	00 5f 49             	add    %bl,0x49(%rdi)
 235:	4f 5f                	rex.WRXB pop %r15
 237:	73 61                	jae    29a <_init-0xd66>
 239:	76 65                	jbe    2a0 <_init-0xd60>
 23b:	5f                   	pop    %rdi
 23c:	65 6e                	outsb  %gs:(%rsi),(%dx)
 23e:	64 00 5f 5f          	add    %bl,%fs:0x5f(%rdi)
 242:	66 6d                	insw   (%dx),%es:(%rdi)
 244:	74 00                	je     246 <_init-0xdba>
 246:	5f                   	pop    %rdi
 247:	5f                   	pop    %rdi
 248:	70 61                	jo     2ab <_init-0xd55>
 24a:	64 35 00 5f 75 6e    	fs xor $0x6e755f00,%eax
 250:	75 73                	jne    2c5 <_init-0xd3b>
 252:	65 64 32 00          	gs xor %fs:(%rax),%al
 256:	73 74                	jae    2cc <_init-0xd34>
 258:	64 65 72 72          	fs gs jb 2ce <_init-0xd32>
 25c:	00 61 72             	add    %ah,0x72(%rcx)
 25f:	67 76 00             	addr32 jbe 262 <_init-0xd9e>
 262:	70 68                	jo     2cc <_init-0xd34>
 264:	61                   	(bad)  
 265:	73 65                	jae    2cc <_init-0xd34>
 267:	5f                   	pop    %rdi
 268:	31 00                	xor    %eax,(%rax)
 26a:	70 68                	jo     2d4 <_init-0xd2c>
 26c:	61                   	(bad)  
 26d:	73 65                	jae    2d4 <_init-0xd2c>
 26f:	5f                   	pop    %rdi
 270:	32 00                	xor    (%rax),%al
 272:	70 68                	jo     2dc <_init-0xd24>
 274:	61                   	(bad)  
 275:	73 65                	jae    2dc <_init-0xd24>
 277:	5f                   	pop    %rdi
 278:	33 00                	xor    (%rax),%eax
 27a:	70 68                	jo     2e4 <_init-0xd1c>
 27c:	61                   	(bad)  
 27d:	73 65                	jae    2e4 <_init-0xd1c>
 27f:	5f                   	pop    %rdi
 280:	34 00                	xor    $0x0,%al
 282:	70 68                	jo     2ec <_init-0xd14>
 284:	61                   	(bad)  
 285:	73 65                	jae    2ec <_init-0xd14>
 287:	5f                   	pop    %rdi
 288:	35 00 70 68 61       	xor    $0x61687000,%eax
 28d:	73 65                	jae    2f4 <_init-0xd0c>
 28f:	5f                   	pop    %rdi
 290:	36 00 5f 49          	add    %bl,%ss:0x49(%rdi)
 294:	4f 5f                	rex.WRXB pop %r15
 296:	62 61                	(bad)  
 298:	63 6b 75             	movslq 0x75(%rbx),%ebp
 29b:	70 5f                	jo     2fc <_init-0xd04>
 29d:	62 61                	(bad)  
 29f:	73 65                	jae    306 <_init-0xcfa>
 2a1:	00 61 72             	add    %ah,0x72(%rcx)
 2a4:	67 63 00             	movslq (%eax),%eax
 2a7:	47                   	rex.RXB
 2a8:	4e 55                	rex.WRX push %rbp
 2aa:	20 43 31             	and    %al,0x31(%rbx)
 2ad:	31 20                	xor    %esp,(%rax)
 2af:	37                   	(bad)  
 2b0:	2e 35 2e 30 20 2d    	cs xor $0x2d20302e,%eax
 2b6:	6d                   	insl   (%dx),%es:(%rdi)
 2b7:	74 75                	je     32e <_init-0xcd2>
 2b9:	6e                   	outsb  %ds:(%rsi),(%dx)
 2ba:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
 2c0:	72 69                	jb     32b <_init-0xcd5>
 2c2:	63 20                	movslq (%rax),%esp
 2c4:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
 2c9:	68 3d 78 38 36       	pushq  $0x3638783d
 2ce:	2d 36 34 20 2d       	sub    $0x2d203436,%eax
 2d3:	67 67 64 62          	addr32 addr32 fs (bad) 
 2d7:	20 2d 4f 31 20 2d    	and    %ch,0x2d20314f(%rip)        # 2d20342c <_end+0x2d1fd69c>
 2dd:	66 73 74             	data16 jae 354 <_init-0xcac>
 2e0:	61                   	(bad)  
 2e1:	63 6b 2d             	movslq 0x2d(%rbx),%ebp
 2e4:	70 72                	jo     358 <_init-0xca8>
 2e6:	6f                   	outsl  %ds:(%rsi),(%dx)
 2e7:	74 65                	je     34e <_init-0xcb2>
 2e9:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
 2ed:	2d 73 74 72 6f       	sub    $0x6f727473,%eax
 2f2:	6e                   	outsb  %ds:(%rsi),(%dx)
 2f3:	67 00 6d 61          	add    %ch,0x61(%ebp)
 2f7:	69 6e 00 5f 49 4f 5f 	imul   $0x5f4f495f,0x0(%rsi),%ebp
 2fe:	77 72                	ja     372 <_init-0xc8e>
 300:	69 74 65 5f 62 61 73 	imul   $0x65736162,0x5f(%rbp,%riz,2),%esi
 307:	65 
	...

Desensamblado de la sección .debug_loc:

0000000000000000 <.debug_loc>:
	...
   8:	1a 00                	sbb    (%rax),%al
   a:	00 00                	add    %al,(%rax)
   c:	00 00                	add    %al,(%rax)
   e:	00 00                	add    %al,(%rax)
  10:	01 00                	add    %eax,(%rax)
  12:	55                   	push   %rbp
  13:	1a 00                	sbb    (%rax),%al
  15:	00 00                	add    %al,(%rax)
  17:	00 00                	add    %al,(%rax)
  19:	00 00                	add    %al,(%rax)
  1b:	02 01                	add    (%rcx),%al
  1d:	00 00                	add    %al,(%rax)
  1f:	00 00                	add    %al,(%rax)
  21:	00 00                	add    %al,(%rax)
  23:	04 00                	add    $0x0,%al
  25:	f3 01 55 9f          	repz add %edx,-0x61(%rbp)
  29:	02 01                	add    (%rcx),%al
  2b:	00 00                	add    %al,(%rax)
  2d:	00 00                	add    %al,(%rax)
  2f:	00 00                	add    %al,(%rax)
  31:	15 01 00 00 00       	adc    $0x1,%eax
  36:	00 00                	add    %al,(%rax)
  38:	00 01                	add    %al,(%rcx)
  3a:	00 55 15             	add    %dl,0x15(%rbp)
  3d:	01 00                	add    %eax,(%rax)
  3f:	00 00                	add    %al,(%rax)
  41:	00 00                	add    %al,(%rax)
  43:	00 37                	add    %dh,(%rdi)
  45:	01 00                	add    %eax,(%rax)
  47:	00 00                	add    %al,(%rax)
  49:	00 00                	add    %al,(%rax)
  4b:	00 04 00             	add    %al,(%rax,%rax,1)
  4e:	f3 01 55 9f          	repz add %edx,-0x61(%rbp)
  52:	37                   	(bad)  
  53:	01 00                	add    %eax,(%rax)
  55:	00 00                	add    %al,(%rax)
  57:	00 00                	add    %al,(%rax)
  59:	00 46 01             	add    %al,0x1(%rsi)
  5c:	00 00                	add    %al,(%rax)
  5e:	00 00                	add    %al,(%rax)
  60:	00 00                	add    %al,(%rax)
  62:	01 00                	add    %eax,(%rax)
  64:	55                   	push   %rbp
  65:	46 01 00             	rex.RX add %r8d,(%rax)
  68:	00 00                	add    %al,(%rax)
  6a:	00 00                	add    %al,(%rax)
  6c:	00 5a 01             	add    %bl,0x1(%rdx)
  6f:	00 00                	add    %al,(%rax)
  71:	00 00                	add    %al,(%rax)
  73:	00 00                	add    %al,(%rax)
  75:	04 00                	add    $0x0,%al
  77:	f3 01 55 9f          	repz add %edx,-0x61(%rbp)
	...
  93:	21 00                	and    %eax,(%rax)
  95:	00 00                	add    %al,(%rax)
  97:	00 00                	add    %al,(%rax)
  99:	00 00                	add    %al,(%rax)
  9b:	01 00                	add    %eax,(%rax)
  9d:	54                   	push   %rsp
  9e:	21 00                	and    %eax,(%rax)
  a0:	00 00                	add    %al,(%rax)
  a2:	00 00                	add    %al,(%rax)
  a4:	00 00                	add    %al,(%rax)
  a6:	36 00 00             	add    %al,%ss:(%rax)
  a9:	00 00                	add    %al,(%rax)
  ab:	00 00                	add    %al,(%rax)
  ad:	00 01                	add    %al,(%rcx)
  af:	00 53 36             	add    %dl,0x36(%rbx)
  b2:	00 00                	add    %al,(%rax)
  b4:	00 00                	add    %al,(%rax)
  b6:	00 00                	add    %al,(%rax)
  b8:	00 02                	add    %al,(%rdx)
  ba:	01 00                	add    %eax,(%rax)
  bc:	00 00                	add    %al,(%rax)
  be:	00 00                	add    %al,(%rax)
  c0:	00 04 00             	add    %al,(%rax,%rax,1)
  c3:	f3 01 54 9f 02       	repz add %edx,0x2(%rdi,%rbx,4)
  c8:	01 00                	add    %eax,(%rax)
  ca:	00 00                	add    %al,(%rax)
  cc:	00 00                	add    %al,(%rax)
  ce:	00 15 01 00 00 00    	add    %dl,0x1(%rip)        # d5 <_init-0xf2b>
  d4:	00 00                	add    %al,(%rax)
  d6:	00 01                	add    %al,(%rcx)
  d8:	00 54 15 01          	add    %dl,0x1(%rbp,%rdx,1)
  dc:	00 00                	add    %al,(%rax)
  de:	00 00                	add    %al,(%rax)
  e0:	00 00                	add    %al,(%rax)
  e2:	5a                   	pop    %rdx
  e3:	01 00                	add    %eax,(%rax)
  e5:	00 00                	add    %al,(%rax)
  e7:	00 00                	add    %al,(%rax)
  e9:	00 01                	add    %al,(%rcx)
  eb:	00 53 00             	add    %dl,0x0(%rbx)
	...
  fa:	00 00                	add    %al,(%rax)
  fc:	00 58 00             	add    %bl,0x0(%rax)
  ff:	00 00                	add    %al,(%rax)
 101:	00 00                	add    %al,(%rax)
 103:	00 00                	add    %al,(%rax)
 105:	5f                   	pop    %rdi
 106:	00 00                	add    %al,(%rax)
 108:	00 00                	add    %al,(%rax)
 10a:	00 00                	add    %al,(%rax)
 10c:	00 01                	add    %al,(%rcx)
 10e:	00 50 76             	add    %dl,0x76(%rax)
 111:	00 00                	add    %al,(%rax)
 113:	00 00                	add    %al,(%rax)
 115:	00 00                	add    %al,(%rax)
 117:	00 7d 00             	add    %bh,0x0(%rbp)
 11a:	00 00                	add    %al,(%rax)
 11c:	00 00                	add    %al,(%rax)
 11e:	00 00                	add    %al,(%rax)
 120:	01 00                	add    %eax,(%rax)
 122:	50                   	push   %rax
 123:	94                   	xchg   %eax,%esp
 124:	00 00                	add    %al,(%rax)
 126:	00 00                	add    %al,(%rax)
 128:	00 00                	add    %al,(%rax)
 12a:	00 9b 00 00 00 00    	add    %bl,0x0(%rbx)
 130:	00 00                	add    %al,(%rax)
 132:	00 01                	add    %al,(%rcx)
 134:	00 50 b2             	add    %dl,-0x4e(%rax)
 137:	00 00                	add    %al,(%rax)
 139:	00 00                	add    %al,(%rax)
 13b:	00 00                	add    %al,(%rax)
 13d:	00 b9 00 00 00 00    	add    %bh,0x0(%rcx)
 143:	00 00                	add    %al,(%rax)
 145:	00 01                	add    %al,(%rcx)
 147:	00 50 d0             	add    %dl,-0x30(%rax)
 14a:	00 00                	add    %al,(%rax)
 14c:	00 00                	add    %al,(%rax)
 14e:	00 00                	add    %al,(%rax)
 150:	00 d7                	add    %dl,%bh
 152:	00 00                	add    %al,(%rax)
 154:	00 00                	add    %al,(%rax)
 156:	00 00                	add    %al,(%rax)
 158:	00 01                	add    %al,(%rcx)
 15a:	00 50 ee             	add    %dl,-0x12(%rax)
 15d:	00 00                	add    %al,(%rax)
 15f:	00 00                	add    %al,(%rax)
 161:	00 00                	add    %al,(%rax)
 163:	00 f5                	add    %dh,%ch
 165:	00 00                	add    %al,(%rax)
 167:	00 00                	add    %al,(%rax)
 169:	00 00                	add    %al,(%rax)
 16b:	00 01                	add    %al,(%rcx)
 16d:	00 50 00             	add    %dl,0x0(%rax)
	...
 17c:	00 00                	add    %al,(%rax)
 17e:	00 3b                	add    %bh,(%rbx)
 180:	00 00                	add    %al,(%rax)
 182:	00 00                	add    %al,(%rax)
 184:	00 00                	add    %al,(%rax)
 186:	00 47 00             	add    %al,0x0(%rdi)
 189:	00 00                	add    %al,(%rax)
 18b:	00 00                	add    %al,(%rax)
 18d:	00 00                	add    %al,(%rax)
 18f:	06                   	(bad)  
 190:	00 f2                	add    %dh,%dl
 192:	de 06                	fiadds (%rsi)
	...
 1a4:	00 00                	add    %al,(%rax)
 1a6:	00 47 00             	add    %al,0x0(%rdi)
 1a9:	00 00                	add    %al,(%rax)
 1ab:	00 00                	add    %al,(%rax)
 1ad:	00 00                	add    %al,(%rax)
 1af:	53                   	push   %rbx
 1b0:	00 00                	add    %al,(%rax)
 1b2:	00 00                	add    %al,(%rax)
 1b4:	00 00                	add    %al,(%rax)
 1b6:	00 06                	add    %al,(%rsi)
 1b8:	00 f2                	add    %dh,%dl
 1ba:	2d 07 00 00 00       	sub    $0x7,%eax
	...
 1cf:	65 00 00             	add    %al,%gs:(%rax)
 1d2:	00 00                	add    %al,(%rax)
 1d4:	00 00                	add    %al,(%rax)
 1d6:	00 71 00             	add    %dh,0x0(%rcx)
 1d9:	00 00                	add    %al,(%rax)
 1db:	00 00                	add    %al,(%rax)
 1dd:	00 00                	add    %al,(%rax)
 1df:	06                   	(bad)  
 1e0:	00 f2                	add    %dh,%dl
 1e2:	5e                   	pop    %rsi
 1e3:	07                   	(bad)  
	...
 1f4:	00 00                	add    %al,(%rax)
 1f6:	00 83 00 00 00 00    	add    %al,0x0(%rbx)
 1fc:	00 00                	add    %al,(%rax)
 1fe:	00 8f 00 00 00 00    	add    %cl,0x0(%rdi)
 204:	00 00                	add    %al,(%rax)
 206:	00 06                	add    %al,(%rsi)
 208:	00 f2                	add    %dh,%dl
 20a:	8c 07                	mov    %es,(%rdi)
	...
 21c:	00 00                	add    %al,(%rax)
 21e:	00 a1 00 00 00 00    	add    %ah,0x0(%rcx)
 224:	00 00                	add    %al,(%rax)
 226:	00 ad 00 00 00 00    	add    %ch,0x0(%rbp)
 22c:	00 00                	add    %al,(%rax)
 22e:	00 06                	add    %al,(%rsi)
 230:	00 f2                	add    %dh,%dl
 232:	af                   	scas   %es:(%rdi),%eax
 233:	07                   	(bad)  
	...
 244:	00 00                	add    %al,(%rax)
 246:	00 bf 00 00 00 00    	add    %bh,0x0(%rdi)
 24c:	00 00                	add    %al,(%rax)
 24e:	00 cb                	add    %cl,%bl
 250:	00 00                	add    %al,(%rax)
 252:	00 00                	add    %al,(%rax)
 254:	00 00                	add    %al,(%rax)
 256:	00 06                	add    %al,(%rsi)
 258:	00 f2                	add    %dh,%dl
 25a:	c3                   	retq   
 25b:	07                   	(bad)  
	...
 26c:	00 00                	add    %al,(%rax)
 26e:	00 dd                	add    %bl,%ch
 270:	00 00                	add    %al,(%rax)
 272:	00 00                	add    %al,(%rax)
 274:	00 00                	add    %al,(%rax)
 276:	00 e9                	add    %ch,%cl
 278:	00 00                	add    %al,(%rax)
 27a:	00 00                	add    %al,(%rax)
 27c:	00 00                	add    %al,(%rax)
 27e:	00 06                	add    %al,(%rsi)
 280:	00 f2                	add    %dh,%dl
 282:	ec                   	in     (%dx),%al
 283:	07                   	(bad)  
	...
 294:	00 00                	add    %al,(%rax)
 296:	00 15 01 00 00 00    	add    %dl,0x1(%rip)        # 29d <_init-0xd63>
 29c:	00 00                	add    %al,(%rax)
 29e:	00 2d 01 00 00 00    	add    %ch,0x1(%rip)        # 2a5 <_init-0xd5b>
 2a4:	00 00                	add    %al,(%rax)
 2a6:	00 0a                	add    %cl,(%rdx)
 2a8:	00 03                	add    %al,(%rbx)
 2aa:	04 30                	add    $0x30,%al
 2ac:	00 00                	add    %al,(%rax)
 2ae:	00 00                	add    %al,(%rax)
 2b0:	00 00                	add    %al,(%rax)
 2b2:	9f                   	lahf   
	...
 2c3:	37                   	(bad)  
 2c4:	01 00                	add    %eax,(%rax)
 2c6:	00 00                	add    %al,(%rax)
 2c8:	00 00                	add    %al,(%rax)
 2ca:	00 50 01             	add    %dl,0x1(%rax)
 2cd:	00 00                	add    %al,(%rax)
 2cf:	00 00                	add    %al,(%rax)
 2d1:	00 00                	add    %al,(%rax)
 2d3:	0a 00                	or     (%rax),%al
 2d5:	03 21                	add    (%rcx),%esp
 2d7:	30 00                	xor    %al,(%rax)
 2d9:	00 00                	add    %al,(%rax)
 2db:	00 00                	add    %al,(%rax)
 2dd:	00 9f 00 00 00 00    	add    %bl,0x0(%rdi)
	...
