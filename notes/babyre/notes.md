```assembly
.data:0000000000004020 unk_4020        db  3Dh ; =             ; DATA XREF: main+B2↑o
.data:0000000000004021                 db  7Ch ; |
.data:0000000000004022                 db  7Dh ; }
.data:0000000000004023                 db  80h
.data:0000000000004024                 db  88h
.data:0000000000004025                 db  81h
.data:0000000000004026                 db  75h ; u
.data:0000000000004027                 db  76h ; v
.data:0000000000004028                 db  80h
.data:0000000000004029                 db  6Ch ; l
.data:000000000000402A                 db  76h ; v
.data:000000000000402B                 db  80h
.data:000000000000402C                 db  6Ch ; l
.data:000000000000402D                 db  6Eh ; n
.data:000000000000402E                 db  6Ch ; l
.data:000000000000402F                 db  7Bh ; {
.data:0000000000004030                 db  7Ch ; |
.data:0000000000004031                 db  7Fh ; 
.data:0000000000004032                 db  7Ah ; z
.data:0000000000004033                 db  6Eh ; n
.data:0000000000004034                 db  79h ; y
.data:0000000000004035                 db  6Ch ; l
.data:0000000000004036                 db  7Fh ; 
.data:0000000000004037                 db  72h ; r
.data:0000000000004038                 db  6Ch ; l
.data:0000000000004039                 db  8Bh
.data:000000000000403A                 db  8Bh
.data:000000000000403B                 db  8Bh
.data:000000000000403C                 db  8Bh
.data:000000000000403D                 db  8Bh
.data:000000000000403E                 db  8Bh
.data:000000000000403F                 db  8Ah

so, our target bytes should be:

bytes([0x3d, 0x7c, 0x7d, 0x80, 0x88, 0x81, 0x75, 0x76, 
       0x80, 0x6C, 0x76, 0x80, 0x6C, 0x6E, 0x6C, 0x7B, 
       0x7C, 0x7F, 0x7A, 0x6E, 0x79, 0x6C, 0x7F, 0x72, 
       0x6C, 0x8B, 0x8B, 0x8B, 0x8B, 0x8B, 0x8B, 0x8A])
```

简单的移位密码。