
./bomb:     formato del fichero elf64-x86-64


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
