# Can You Open It?

## Dump Binary

Dump 文件的方式，这里用的是 `od <file> -x --endian=big -v -An`。

`-x` 指明用十六进制。

`--endian=big` 指明用大端法。看一下 ELF 头就知道了。

`-v` 指明不要用 `*` 省略连续的空行。

`-An` 指明不要打印地址。

这样弄出来的就可以直接粘贴进 Hex Fiend 了。

## Level 0

> Warming up 做了半天……
>
> > 丢人

本来做的事情就是用稍高一点的优先级把「所有的参数」`execve` 一下而已。实际上

```shell
./loader0 "cat" "secret0.txt"
```

就可以了。

```
level1
password_level1_BUVud0b4rGtFIhFWib8tnp36UnHqaesB
```

## Level 1

和 Level 0 完全一致

> 或许这是个伏笔

```
level2
password_level2_3EbXXPpaVcaOLvjuFZdTjzaIWkXK5Wt7
```

## Level 2

按照上面的方法，Shell 报错 “Bad system call”。

看起来是被沙箱拦住了。

`strace` 看一下做的系统调用有哪些？

```shell
bash$ strace ./loader2 "cat"
execve("./loader2", ["./loader2", "cat"], 0x7ffc1b8fc548 /* 55 vars */) = 0
brk(NULL)                               = 0x5604cf1f8000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=69905, ...}) = 0
mmap(NULL, 69905, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f9f1ce22000
close(3)                                = 0
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200l\2\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=2000480, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f9f1ce20000
mmap(NULL, 2008696, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f9f1cc35000
mmap(0x7f9f1cc5a000, 1519616, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x25000) = 0x7f9f1cc5a000
mmap(0x7f9f1cdcd000, 299008, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x198000) = 0x7f9f1cdcd000
mmap(0x7f9f1ce16000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e0000) = 0x7f9f1ce16000
mmap(0x7f9f1ce1c000, 13944, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f9f1ce1c000
close(3)                                = 0
arch_prctl(ARCH_SET_FS, 0x7f9f1ce21500) = 0
mprotect(0x7f9f1ce16000, 12288, PROT_READ) = 0
mprotect(0x5604cd598000, 4096, PROT_READ) = 0
mprotect(0x7f9f1ce5e000, 4096, PROT_READ) = 0
munmap(0x7f9f1ce22000, 69905)           = 0
getegid()                               = 1000
setresgid(1000, 1000, 1000)             = 0
prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0)  = 0
prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, {len=8, filter=0x5604cd599020}) = 0
execve("/home/yue/.local/bin/cat", ["cat"], 0x7fffe85447c0 /* 55 vars */) = -1 ENOENT (No such file or directory)
execve("/usr/local/sbin/cat", ["cat"], 0x7fffe85447c0 /* 55 vars */) = -1 ENOENT (No such file or directory)
execve("/usr/local/bin/cat", ["cat"], 0x7fffe85447c0 /* 55 vars */) = -1 ENOENT (No such file or directory)
execve("/usr/sbin/cat", ["cat"], 0x7fffe85447c0 /* 55 vars */) = -1 ENOENT (No such file or directory)
execve("/usr/bin/cat", ["cat"], 0x7fffe85447c0 /* 55 vars */) = 0
brk(NULL)                               = 0x556be8058000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = ?
+++ killed by SIGSYS (core dumped) +++
Bad system call (core dumped)
```

看得出来，cat 被拦住了。

参照 w0lfzhang/seccomp 的说法，在 `prctl` 处打断点。

```
┌──Register group: general───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│rax            0x0                 0                                      rbx            0x0                 0                                      │
│rcx            0x0                 0                                      rdx            0x0                 0                                      │
│rsi            0x1                 1                                      rdi            0x26                38                                     │
│rbp            0x7fffffffdea0      0x7fffffffdea0                         rsp            0x7fffffffde78      0x7fffffffde78                         │
│r8             0x0                 0                                      r9             0x7ffff7fb5a40      140737353833024                        │
│r10            0x1                 1                                      r11            0x246               582                                    │
│r12            0x555555555120      93824992235808                         r13            0x7fffffffdfb0      140737488347056                        │
│r14            0x0                 0                                      r15            0x0                 0                                      │
│rip            0x7ffff7eed6f0      0x7ffff7eed6f0 <prctl>                 eflags         0x246               [ PF ZF IF ]                           │
│cs             0x33                51                                     ss             0x2b                43                                     │
│ds             0x0                 0                                      es             0x0                 0                                      │
│fs             0x0                 0                                      gs             0x0                 0                                      │
│                                                                                                                                                    │
└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
B+>│0x7ffff7eed6f0 <prctl>          mov    %rcx,%r10                                                                                                 │
   │0x7ffff7eed6f3 <prctl+3>        mov    $0x9d,%eax                                                                                                │
   │0x7ffff7eed6f8 <prctl+8>        syscall                                                                                                          │
   │0x7ffff7eed6fa <prctl+10>       cmp    $0xfffffffffffff001,%rax                                                                                  │
   │0x7ffff7eed700 <prctl+16>       jae    0x7ffff7eed703 <prctl+19>                                                                                 │
   │0x7ffff7eed702 <prctl+18>       retq                                                                                                             │
   │0x7ffff7eed703 <prctl+19>       mov    0xc5766(%rip),%rcx        # 0x7ffff7fb2e70                                                                │
   │0x7ffff7eed70a <prctl+26>       neg    %eax                                                                                                      │
   │0x7ffff7eed70c <prctl+28>       mov    %eax,%fs:(%rcx)                                                                                           │
   │0x7ffff7eed70f <prctl+31>       or     $0xffffffffffffffff,%rax                                                                                  │
   │0x7ffff7eed713 <prctl+35>       retq                                                                                                             │
   │0x7ffff7eed714                  nopw   %cs:0x0(%rax,%rax,1)                                                                                      │
   │0x7ffff7eed71e                  xchg   %ax,%ax                                                                                                   │
   └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

容易看出其调用方式为

````c
prctl(0x26, 1); // 後面的 0 不写了
````

翻译一下，`option`（`0x26`）就是 `PR_SET_TSC`，而 1 在这里代表 `PR_TSC_ENABLE`。

所以这句话所做的事情就是 `prctl(PR_SET_TSC, PR_TSC_ENABLE)`。启用了 TSC。

第二次调用，

```c
prctl(0x22, 2, 0x7fffffffde80);
```

翻译成

```c
prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &fprog)
```

这里，第二个参数的取值有

```c
define SECCOMP_MODE_STRICT		1
define SECCOMP_MODE_FILTER		2
```

设置成 `SECCOMP_MODE_STRICT` 的话，就只允许 `read`、`write`、`_exit` 和 `sigreturn` 这几个。那我们就没有办法了。

幸好，他这里用的是 `SECCOMP_MODE_FILTER`；代表用第三个 `struct sock_fprog *` 来限定允许的范围。

这个指针可以在 `gdb` 里看到。打印出来 `len`，可以看到

```shell
gdb$ p /s *0x7fffffffde80
8
```

因为对齐规则的关系，虽然 `unsigned short` 的内存只及 `0x7fffffffde82`，但下一个指针类型的变量必须排到 `0x7fffffffde88`。

```shell

```



顺带一提，对应的数据结构是这样的：

```c
struct sock_filter {    /* Filter block */
       __u16    code;   /* Actual filter code */
       __u8     jt;     /* Jump true */
       __u8     jf;     /* Jump false */
       __u32    k;      /* Generic multiuse field */
};

struct sock_fprog {     /* Required for SO_ATTACH_FILTER. */
       unsigned short      len;    /* Number of filter blocks */
       struct sock_filter *filter;
};
```

