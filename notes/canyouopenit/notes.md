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

本来做的事情就是用稍高一点的优先级把「所有的参数」`execve` 一下而已。

结果反汇编之後，连 `libc_main` 都没有，断点都打不下去。

以及里面充满了 `and    $0xfffffffffffffff0,%rsp` 和 `hlt nop` 之类的奇妙汇编，搞了半天…

实际上就是

```shell
./loader0 "cat" "secret0.txt"
```

而已。

```
level1
password_level1_BUVud0b4rGtFIhFWib8tnp36UnHqaesB
```

## Level 1

