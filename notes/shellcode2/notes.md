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
        if not <something> & 8:
            print("I'm such an idiot, so I don't recognize this genius shellcode")
            exit(-1)
    
    # just execute it fine
    execute(buf)
```

这里，`<something> & 8` 这块，Ida 没搞清楚。直接来读汇编：

```assembly
call	__ctype_b_loc
mov     rax, [rax]
mov     edx, [rbp+var_10]
movsxd  rcx, edx
mov     rdx, [rbp+buf]
add     rdx, rcx
movzx   edx, byte ptr [rdx]
movsx   rdx, dl
add     rdx, rdx
add     rax, rdx
movzx   eax, word ptr [rax]
movzx   eax, ax
and     eax, 8
test    eax, eax
jnz     short check_failure
```

实际上，`__ctype_b_loc` 就是 C 标准库定义的 ASCII 字母表而已。这段代码的意义就是判断输入字符是否在 `[A-Za-z0-9]` 里面。

Google 搜索「Alphanumeric，Shellcode，x86_64」，一大堆讲这个的。

> 梦幻般的纯 ASCII 编码

注意 `\n` 也会被拒绝。不要滥用 `sendline()`。

运行一下，就发现了问题：SIGSEGV。

因为这类代码都是利用栈指针乱指的手段，来动态改写自己的内存。不存在一个普遍的 Shellcode 来执行，因为需要「自己目前的位置」这一信息。

这里，直接用了 `veritas501/ae64`的 Python 库 AE64。

只要传递你要编码的汇编，加上「指向自己的寄存器」（这里是 `%rdx`），就足够了。

> 光灭掉了