
./loader0:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <.init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <execvp@plt+0x2f58>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <__cxa_finalize@plt-0x4a>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 8a 2f 00 00    	pushq  0x2f8a(%rip)        # 3fb0 <execvp@plt+0x2f20>
    1026:	f2 ff 25 8b 2f 00 00 	bnd jmpq *0x2f8b(%rip)        # 3fb8 <execvp@plt+0x2f28>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0x40>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0x40>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0x40>
    105f:	90                   	nop

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 8d 2f 00 00 	bnd jmpq *0x2f8d(%rip)        # 3ff8 <execvp@plt+0x2f68>
    106b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001070 <setresgid@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 45 2f 00 00 	bnd jmpq *0x2f45(%rip)        # 3fc0 <execvp@plt+0x2f30>
    107b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001080 <getegid@plt>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	f2 ff 25 3d 2f 00 00 	bnd jmpq *0x2f3d(%rip)        # 3fc8 <execvp@plt+0x2f38>
    108b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001090 <execvp@plt>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	f2 ff 25 35 2f 00 00 	bnd jmpq *0x2f35(%rip)        # 3fd0 <execvp@plt+0x2f40>
    109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000010a0 <.text>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	31 ed                	xor    %ebp,%ebp
    10a6:	49 89 d1             	mov    %rdx,%r9
    10a9:	5e                   	pop    %rsi
    10aa:	48 89 e2             	mov    %rsp,%rdx
    10ad:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10b1:	50                   	push   %rax
    10b2:	54                   	push   %rsp
    10b3:	4c 8d 05 a6 01 00 00 	lea    0x1a6(%rip),%r8        # 1260 <execvp@plt+0x1d0>
    10ba:	48 8d 0d 2f 01 00 00 	lea    0x12f(%rip),%rcx        # 11f0 <execvp@plt+0x160>
    10c1:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 1189 <execvp@plt+0xf9>
    10c8:	ff 15 12 2f 00 00    	callq  *0x2f12(%rip)        # 3fe0 <execvp@plt+0x2f50>
    10ce:	f4                   	hlt    
    10cf:	90                   	nop
    10d0:	48 8d 3d 39 2f 00 00 	lea    0x2f39(%rip),%rdi        # 4010 <execvp@plt+0x2f80>
    10d7:	48 8d 05 32 2f 00 00 	lea    0x2f32(%rip),%rax        # 4010 <execvp@plt+0x2f80>
    10de:	48 39 f8             	cmp    %rdi,%rax
    10e1:	74 15                	je     10f8 <execvp@plt+0x68>
    10e3:	48 8b 05 ee 2e 00 00 	mov    0x2eee(%rip),%rax        # 3fd8 <execvp@plt+0x2f48>
    10ea:	48 85 c0             	test   %rax,%rax
    10ed:	74 09                	je     10f8 <execvp@plt+0x68>
    10ef:	ff e0                	jmpq   *%rax
    10f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10f8:	c3                   	retq   
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1100:	48 8d 3d 09 2f 00 00 	lea    0x2f09(%rip),%rdi        # 4010 <execvp@plt+0x2f80>
    1107:	48 8d 35 02 2f 00 00 	lea    0x2f02(%rip),%rsi        # 4010 <execvp@plt+0x2f80>
    110e:	48 29 fe             	sub    %rdi,%rsi
    1111:	48 89 f0             	mov    %rsi,%rax
    1114:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1118:	48 c1 f8 03          	sar    $0x3,%rax
    111c:	48 01 c6             	add    %rax,%rsi
    111f:	48 d1 fe             	sar    %rsi
    1122:	74 14                	je     1138 <execvp@plt+0xa8>
    1124:	48 8b 05 c5 2e 00 00 	mov    0x2ec5(%rip),%rax        # 3ff0 <execvp@plt+0x2f60>
    112b:	48 85 c0             	test   %rax,%rax
    112e:	74 08                	je     1138 <execvp@plt+0xa8>
    1130:	ff e0                	jmpq   *%rax
    1132:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1138:	c3                   	retq   
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1140:	f3 0f 1e fa          	endbr64 
    1144:	80 3d c5 2e 00 00 00 	cmpb   $0x0,0x2ec5(%rip)        # 4010 <execvp@plt+0x2f80>
    114b:	75 2b                	jne    1178 <execvp@plt+0xe8>
    114d:	55                   	push   %rbp
    114e:	48 83 3d a2 2e 00 00 	cmpq   $0x0,0x2ea2(%rip)        # 3ff8 <execvp@plt+0x2f68>
    1155:	00 
    1156:	48 89 e5             	mov    %rsp,%rbp
    1159:	74 0c                	je     1167 <execvp@plt+0xd7>
    115b:	48 8b 3d a6 2e 00 00 	mov    0x2ea6(%rip),%rdi        # 4008 <execvp@plt+0x2f78>
    1162:	e8 f9 fe ff ff       	callq  1060 <__cxa_finalize@plt>
    1167:	e8 64 ff ff ff       	callq  10d0 <execvp@plt+0x40>
    116c:	c6 05 9d 2e 00 00 01 	movb   $0x1,0x2e9d(%rip)        # 4010 <execvp@plt+0x2f80>
    1173:	5d                   	pop    %rbp
    1174:	c3                   	retq   
    1175:	0f 1f 00             	nopl   (%rax)
    1178:	c3                   	retq   
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1180:	f3 0f 1e fa          	endbr64 
    1184:	e9 77 ff ff ff       	jmpq   1100 <execvp@plt+0x70>
    1189:	f3 0f 1e fa          	endbr64 
    118d:	55                   	push   %rbp
    118e:	48 89 e5             	mov    %rsp,%rbp
    1191:	48 83 ec 20          	sub    $0x20,%rsp
    1195:	89 7d ec             	mov    %edi,-0x14(%rbp)
    1198:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    119c:	e8 df fe ff ff       	callq  1080 <getegid@plt>
    11a1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    11a4:	8b 55 fc             	mov    -0x4(%rbp),%edx
    11a7:	8b 4d fc             	mov    -0x4(%rbp),%ecx
    11aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
    11ad:	89 ce                	mov    %ecx,%esi
    11af:	89 c7                	mov    %eax,%edi
    11b1:	e8 ba fe ff ff       	callq  1070 <setresgid@plt>
    11b6:	e8 25 00 00 00       	callq  11e0 <execvp@plt+0x150>
    11bb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    11bf:	48 8d 50 08          	lea    0x8(%rax),%rdx
    11c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    11c7:	48 83 c0 08          	add    $0x8,%rax
    11cb:	48 8b 00             	mov    (%rax),%rax
    11ce:	48 89 d6             	mov    %rdx,%rsi
    11d1:	48 89 c7             	mov    %rax,%rdi
    11d4:	e8 b7 fe ff ff       	callq  1090 <execvp@plt>
    11d9:	b8 00 00 00 00       	mov    $0x0,%eax
    11de:	c9                   	leaveq 
    11df:	c3                   	retq   
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	55                   	push   %rbp
    11e5:	48 89 e5             	mov    %rsp,%rbp
    11e8:	90                   	nop
    11e9:	5d                   	pop    %rbp
    11ea:	c3                   	retq   
    11eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	41 57                	push   %r15
    11f6:	4c 8d 3d ab 2b 00 00 	lea    0x2bab(%rip),%r15        # 3da8 <execvp@plt+0x2d18>
    11fd:	41 56                	push   %r14
    11ff:	49 89 d6             	mov    %rdx,%r14
    1202:	41 55                	push   %r13
    1204:	49 89 f5             	mov    %rsi,%r13
    1207:	41 54                	push   %r12
    1209:	41 89 fc             	mov    %edi,%r12d
    120c:	55                   	push   %rbp
    120d:	48 8d 2d 9c 2b 00 00 	lea    0x2b9c(%rip),%rbp        # 3db0 <execvp@plt+0x2d20>
    1214:	53                   	push   %rbx
    1215:	4c 29 fd             	sub    %r15,%rbp
    1218:	48 83 ec 08          	sub    $0x8,%rsp
    121c:	e8 df fd ff ff       	callq  1000 <__cxa_finalize@plt-0x60>
    1221:	48 c1 fd 03          	sar    $0x3,%rbp
    1225:	74 1f                	je     1246 <execvp@plt+0x1b6>
    1227:	31 db                	xor    %ebx,%ebx
    1229:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1230:	4c 89 f2             	mov    %r14,%rdx
    1233:	4c 89 ee             	mov    %r13,%rsi
    1236:	44 89 e7             	mov    %r12d,%edi
    1239:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    123d:	48 83 c3 01          	add    $0x1,%rbx
    1241:	48 39 dd             	cmp    %rbx,%rbp
    1244:	75 ea                	jne    1230 <execvp@plt+0x1a0>
    1246:	48 83 c4 08          	add    $0x8,%rsp
    124a:	5b                   	pop    %rbx
    124b:	5d                   	pop    %rbp
    124c:	41 5c                	pop    %r12
    124e:	41 5d                	pop    %r13
    1250:	41 5e                	pop    %r14
    1252:	41 5f                	pop    %r15
    1254:	c3                   	retq   
    1255:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    125c:	00 00 00 00 
    1260:	f3 0f 1e fa          	endbr64 
    1264:	c3                   	retq   

Disassembly of section .fini:

0000000000001268 <.fini>:
    1268:	f3 0f 1e fa          	endbr64 
    126c:	48 83 ec 08          	sub    $0x8,%rsp
    1270:	48 83 c4 08          	add    $0x8,%rsp
    1274:	c3                   	retq   
