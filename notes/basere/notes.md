# basere

MIPS 平台下的逆向…

遗憾的是这里用到了 `srand()` 的伪随机数 Trick。

从 anEASYdroid 题里我们了解到，这是跟平台相关的。不同平台的 C 会编译出不同的结果。

得去写个 MIPS 程序拿到结果！

> 但是，已经来不及了…