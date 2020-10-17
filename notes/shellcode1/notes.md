# Shellcode 1

构造一个 Shellcode Payload，同时对 32 位和 64 位机器都工作。

```c
v3 = (void (__fastcall *)(_QWORD, void *))mmap(0LL, 0x1000uLL, 7, 33, 0, 0LL);
```

这段代码是关键的内存映射代码。翻译成人话就是：

```python
v3: ptr[void] = mmap(addr=NULL, length=0x1000, prot=7, flags=33, fd=0, offset=0)
```

`prot == 7` 就是 `PROT_READ | PROT_WRITE | PROT_EXEC`。

`flags == 33` 就是 `MAP_ANONYMOUS | MAP_SHARED`。

开了一块极具恶意的内存空间，可以执行我们想要的一切。

这一段：

```c
void (__fastcall *buf)(_QWORD, void *);

void *map_ptr = do_mmap();

// fill in the buffer
read(0, map_ptr, 0x1000);

// implicit pointer cast
buf = map_ptr;

// execute it as a function
buf(0, buf);
```

就是直接把输进去的内容当作机器码执行了。

32 位的情况也大同小异；但问题是需要找到一个对两者均有效的 Shellcode。

这篇[文章](https://modexp.wordpress.com/2017/02/20/shellcode-linux-x84/)讲到了如何构造 x86 & amd64 共通的 Shellcode。

> 原作者赐名 x84。

他给出的 Example 跑不过…但是那也不重要。

关键的一点就是：`amd64` 下，`40 75 <offset>` 会被解读成 `rex jne <somewhere>`。

> `rex` 是个无关紧要的前缀。

然而 `i386` 下则会被解读成两条指令：`inc %eax` + `jne <somewhere>`。

这就给我们了操作空间——可以区分 Architecture 的方法。

```assembly
# i386 assembly mode
	xor     eax, eax
    test    eax, eax
    inc     eax
    jnz     x32
    <x64_exploit_codes>
x32:
    <x32_exploit_codes>
```

```assembly
# amd64 assembly mode
	xor     eax, eax
    test    eax, eax
    rex jne x32
    <x64_exploit_codes>
x32:
    <x32_exploit_codes>
```

简单的 Prototype 可以写成这样。

> 在拉拉杂杂写了半天 Intel 风汇编（以及遭遇一堆 Gas 错误）之后，发现这里有个现成的：
>
> > http://irfantoor.com/exploits/show/?id=39338
>

