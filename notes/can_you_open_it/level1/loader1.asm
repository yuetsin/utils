
loader1:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <.init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <exit@plt+0x2ed8>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <__cxa_finalize@plt-0x8a>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 6a 2f 00 00    	pushq  0x2f6a(%rip)        # 3f90 <exit@plt+0x2e80>
    1026:	f2 ff 25 6b 2f 00 00 	bnd jmpq *0x2f6b(%rip)        # 3f98 <exit@plt+0x2e88>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0x80>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0x80>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0x80>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	pushq  $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0x80>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	pushq  $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0x80>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	pushq  $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0x80>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	pushq  $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0x80>
    109f:	90                   	nop

Disassembly of section .plt.got:

00000000000010a0 <__cxa_finalize@plt>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	f2 ff 25 4d 2f 00 00 	bnd jmpq *0x2f4d(%rip)        # 3ff8 <exit@plt+0x2ee8>
    10ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

00000000000010b0 <__stack_chk_fail@plt>:
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	f2 ff 25 e5 2e 00 00 	bnd jmpq *0x2ee5(%rip)        # 3fa0 <exit@plt+0x2e90>
    10bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010c0 <setresgid@plt>:
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	f2 ff 25 dd 2e 00 00 	bnd jmpq *0x2edd(%rip)        # 3fa8 <exit@plt+0x2e98>
    10cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010d0 <prctl@plt>:
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	f2 ff 25 d5 2e 00 00 	bnd jmpq *0x2ed5(%rip)        # 3fb0 <exit@plt+0x2ea0>
    10db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010e0 <getegid@plt>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	f2 ff 25 cd 2e 00 00 	bnd jmpq *0x2ecd(%rip)        # 3fb8 <exit@plt+0x2ea8>
    10eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010f0 <perror@plt>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	f2 ff 25 c5 2e 00 00 	bnd jmpq *0x2ec5(%rip)        # 3fc0 <exit@plt+0x2eb0>
    10fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001100 <execvp@plt>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	f2 ff 25 bd 2e 00 00 	bnd jmpq *0x2ebd(%rip)        # 3fc8 <exit@plt+0x2eb8>
    110b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001110 <exit@plt>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	f2 ff 25 b5 2e 00 00 	bnd jmpq *0x2eb5(%rip)        # 3fd0 <exit@plt+0x2ec0>
    111b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001120 <.text>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	31 ed                	xor    %ebp,%ebp
    1126:	49 89 d1             	mov    %rdx,%r9
    1129:	5e                   	pop    %rsi
    112a:	48 89 e2             	mov    %rsp,%rdx
    112d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1131:	50                   	push   %rax
    1132:	54                   	push   %rsp
    1133:	4c 8d 05 56 02 00 00 	lea    0x256(%rip),%r8        # 1390 <exit@plt+0x280>
    113a:	48 8d 0d df 01 00 00 	lea    0x1df(%rip),%rcx        # 1320 <exit@plt+0x210>
    1141:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 1209 <exit@plt+0xf9>
    1148:	ff 15 92 2e 00 00    	callq  *0x2e92(%rip)        # 3fe0 <exit@plt+0x2ed0>
    114e:	f4                   	hlt    
    114f:	90                   	nop
    1150:	48 8d 3d 01 2f 00 00 	lea    0x2f01(%rip),%rdi        # 4058 <exit@plt+0x2f48>
    1157:	48 8d 05 fa 2e 00 00 	lea    0x2efa(%rip),%rax        # 4058 <exit@plt+0x2f48>
    115e:	48 39 f8             	cmp    %rdi,%rax
    1161:	74 15                	je     1178 <exit@plt+0x68>
    1163:	48 8b 05 6e 2e 00 00 	mov    0x2e6e(%rip),%rax        # 3fd8 <exit@plt+0x2ec8>
    116a:	48 85 c0             	test   %rax,%rax
    116d:	74 09                	je     1178 <exit@plt+0x68>
    116f:	ff e0                	jmpq   *%rax
    1171:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1178:	c3                   	retq   
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1180:	48 8d 3d d1 2e 00 00 	lea    0x2ed1(%rip),%rdi        # 4058 <exit@plt+0x2f48>
    1187:	48 8d 35 ca 2e 00 00 	lea    0x2eca(%rip),%rsi        # 4058 <exit@plt+0x2f48>
    118e:	48 29 fe             	sub    %rdi,%rsi
    1191:	48 89 f0             	mov    %rsi,%rax
    1194:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1198:	48 c1 f8 03          	sar    $0x3,%rax
    119c:	48 01 c6             	add    %rax,%rsi
    119f:	48 d1 fe             	sar    %rsi
    11a2:	74 14                	je     11b8 <exit@plt+0xa8>
    11a4:	48 8b 05 45 2e 00 00 	mov    0x2e45(%rip),%rax        # 3ff0 <exit@plt+0x2ee0>
    11ab:	48 85 c0             	test   %rax,%rax
    11ae:	74 08                	je     11b8 <exit@plt+0xa8>
    11b0:	ff e0                	jmpq   *%rax
    11b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    11b8:	c3                   	retq   
    11b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	80 3d 8d 2e 00 00 00 	cmpb   $0x0,0x2e8d(%rip)        # 4058 <exit@plt+0x2f48>
    11cb:	75 2b                	jne    11f8 <exit@plt+0xe8>
    11cd:	55                   	push   %rbp
    11ce:	48 83 3d 22 2e 00 00 	cmpq   $0x0,0x2e22(%rip)        # 3ff8 <exit@plt+0x2ee8>
    11d5:	00 
    11d6:	48 89 e5             	mov    %rsp,%rbp
    11d9:	74 0c                	je     11e7 <exit@plt+0xd7>
    11db:	48 8b 3d 26 2e 00 00 	mov    0x2e26(%rip),%rdi        # 4008 <exit@plt+0x2ef8>
    11e2:	e8 b9 fe ff ff       	callq  10a0 <__cxa_finalize@plt>
    11e7:	e8 64 ff ff ff       	callq  1150 <exit@plt+0x40>
    11ec:	c6 05 65 2e 00 00 01 	movb   $0x1,0x2e65(%rip)        # 4058 <exit@plt+0x2f48>
    11f3:	5d                   	pop    %rbp
    11f4:	c3                   	retq   
    11f5:	0f 1f 00             	nopl   (%rax)
    11f8:	c3                   	retq   
    11f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1200:	f3 0f 1e fa          	endbr64 
    1204:	e9 77 ff ff ff       	jmpq   1180 <exit@plt+0x70>
    1209:	f3 0f 1e fa          	endbr64 
    120d:	55                   	push   %rbp
    120e:	48 89 e5             	mov    %rsp,%rbp
    1211:	48 83 ec 20          	sub    $0x20,%rsp
    1215:	89 7d ec             	mov    %edi,-0x14(%rbp)
    1218:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    121c:	e8 bf fe ff ff       	callq  10e0 <getegid@plt>
    1221:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1224:	8b 55 fc             	mov    -0x4(%rbp),%edx
    1227:	8b 4d fc             	mov    -0x4(%rbp),%ecx
    122a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    122d:	89 ce                	mov    %ecx,%esi
    122f:	89 c7                	mov    %eax,%edi
    1231:	e8 8a fe ff ff       	callq  10c0 <setresgid@plt>
    1236:	e8 25 00 00 00       	callq  1260 <exit@plt+0x150>
    123b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    123f:	48 8d 50 08          	lea    0x8(%rax),%rdx
    1243:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1247:	48 83 c0 08          	add    $0x8,%rax
    124b:	48 8b 00             	mov    (%rax),%rax
    124e:	48 89 d6             	mov    %rdx,%rsi
    1251:	48 89 c7             	mov    %rax,%rdi
    1254:	e8 a7 fe ff ff       	callq  1100 <execvp@plt>
    1259:	b8 00 00 00 00       	mov    $0x0,%eax
    125e:	c9                   	leaveq 
    125f:	c3                   	retq   
    1260:	f3 0f 1e fa          	endbr64 
    1264:	55                   	push   %rbp
    1265:	48 89 e5             	mov    %rsp,%rbp
    1268:	48 83 ec 20          	sub    $0x20,%rsp
    126c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1273:	00 00 
    1275:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1279:	31 c0                	xor    %eax,%eax
    127b:	66 c7 45 e0 07 00    	movw   $0x7,-0x20(%rbp)
    1281:	48 8d 05 98 2d 00 00 	lea    0x2d98(%rip),%rax        # 4020 <exit@plt+0x2f10>
    1288:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    128c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    1292:	b9 00 00 00 00       	mov    $0x0,%ecx
    1297:	ba 00 00 00 00       	mov    $0x0,%edx
    129c:	be 01 00 00 00       	mov    $0x1,%esi
    12a1:	bf 26 00 00 00       	mov    $0x26,%edi
    12a6:	b8 00 00 00 00       	mov    $0x0,%eax
    12ab:	e8 20 fe ff ff       	callq  10d0 <prctl@plt>
    12b0:	85 c0                	test   %eax,%eax
    12b2:	79 16                	jns    12ca <exit@plt+0x1ba>
    12b4:	48 8d 3d 49 0d 00 00 	lea    0xd49(%rip),%rdi        # 2004 <exit@plt+0xef4>
    12bb:	e8 30 fe ff ff       	callq  10f0 <perror@plt>
    12c0:	bf 02 00 00 00       	mov    $0x2,%edi
    12c5:	e8 46 fe ff ff       	callq  1110 <exit@plt>
    12ca:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
    12ce:	48 89 c2             	mov    %rax,%rdx
    12d1:	be 02 00 00 00       	mov    $0x2,%esi
    12d6:	bf 16 00 00 00       	mov    $0x16,%edi
    12db:	b8 00 00 00 00       	mov    $0x0,%eax
    12e0:	e8 eb fd ff ff       	callq  10d0 <prctl@plt>
    12e5:	85 c0                	test   %eax,%eax
    12e7:	79 16                	jns    12ff <exit@plt+0x1ef>
    12e9:	48 8d 3d 2f 0d 00 00 	lea    0xd2f(%rip),%rdi        # 201f <exit@plt+0xf0f>
    12f0:	e8 fb fd ff ff       	callq  10f0 <perror@plt>
    12f5:	bf 02 00 00 00       	mov    $0x2,%edi
    12fa:	e8 11 fe ff ff       	callq  1110 <exit@plt>
    12ff:	90                   	nop
    1300:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1304:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    130b:	00 00 
    130d:	74 05                	je     1314 <exit@plt+0x204>
    130f:	e8 9c fd ff ff       	callq  10b0 <__stack_chk_fail@plt>
    1314:	c9                   	leaveq 
    1315:	c3                   	retq   
    1316:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    131d:	00 00 00 
    1320:	f3 0f 1e fa          	endbr64 
    1324:	41 57                	push   %r15
    1326:	4c 8d 3d 5b 2a 00 00 	lea    0x2a5b(%rip),%r15        # 3d88 <exit@plt+0x2c78>
    132d:	41 56                	push   %r14
    132f:	49 89 d6             	mov    %rdx,%r14
    1332:	41 55                	push   %r13
    1334:	49 89 f5             	mov    %rsi,%r13
    1337:	41 54                	push   %r12
    1339:	41 89 fc             	mov    %edi,%r12d
    133c:	55                   	push   %rbp
    133d:	48 8d 2d 4c 2a 00 00 	lea    0x2a4c(%rip),%rbp        # 3d90 <exit@plt+0x2c80>
    1344:	53                   	push   %rbx
    1345:	4c 29 fd             	sub    %r15,%rbp
    1348:	48 83 ec 08          	sub    $0x8,%rsp
    134c:	e8 af fc ff ff       	callq  1000 <__cxa_finalize@plt-0xa0>
    1351:	48 c1 fd 03          	sar    $0x3,%rbp
    1355:	74 1f                	je     1376 <exit@plt+0x266>
    1357:	31 db                	xor    %ebx,%ebx
    1359:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1360:	4c 89 f2             	mov    %r14,%rdx
    1363:	4c 89 ee             	mov    %r13,%rsi
    1366:	44 89 e7             	mov    %r12d,%edi
    1369:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    136d:	48 83 c3 01          	add    $0x1,%rbx
    1371:	48 39 dd             	cmp    %rbx,%rbp
    1374:	75 ea                	jne    1360 <exit@plt+0x250>
    1376:	48 83 c4 08          	add    $0x8,%rsp
    137a:	5b                   	pop    %rbx
    137b:	5d                   	pop    %rbp
    137c:	41 5c                	pop    %r12
    137e:	41 5d                	pop    %r13
    1380:	41 5e                	pop    %r14
    1382:	41 5f                	pop    %r15
    1384:	c3                   	retq   
    1385:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    138c:	00 00 00 00 
    1390:	f3 0f 1e fa          	endbr64 
    1394:	c3                   	retq   

Disassembly of section .fini:

0000000000001398 <.fini>:
    1398:	f3 0f 1e fa          	endbr64 
    139c:	48 83 ec 08          	sub    $0x8,%rsp
    13a0:	48 83 c4 08          	add    $0x8,%rsp
    13a4:	c3                   	retq   
