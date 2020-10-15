# mdx

`main` 函数惊人简单。

```c
int main(int a1, char **a2, char **a3)
{
    char s[64];

    alarm(60);
    memset(s, 0, 50);
    puts("Your flag:");
    read(0, s, 19);

    if ( strlen(s) == 19 && !sub_4009A3(s) )
        puts("Right!");
    else
        puts("Wrong~");
    return 0LL;
}
```

只要输入一个 19 位长度的字符串，并且通过 `sub_4009A3(s, s)` 返回 `False` 即可。

除去 `0ops{` 和 `}`，其实可变的就只有 13 个而已。

> 注意我们并没有很多时间。60 秒过去，程序会自杀。

那我们来看看 `sub_4009A3` 吧？简单期间，给它起个好听点的名字：就叫 `judge` 吧。

`judge` 把传入的 `str` 给拷贝了一份，并且将其扩展为了 64 Bytes 的一块数组，并将其作为 `int[]` 解读。

> 换言之，就是把她拆成了包含 16 个 32 位整数的数组啦。

随后，按照

```python
    for m in range(64):
        if m > 47:
            v13 = v11 ^ (v10 | ~v12)
            v14 = 7 * m & 0xF
        elif m > 31:
            v13 = v12 ^ v11 ^ v10
            v14 = (3 * m + 5) & 0xF
        elif m > 15:
            v13 = v12 & v10 | v11 & ~v12
            v14 = (5 * m + 1) & 0xF
        else:
            v13 = v11 & v10 | v12 & ~v10
            v14 = m

        v1 = v12
        v12 = v11
        v11 = v10
        v10 += (v9 + v13 + keybox_1[m] + nums[v14]) << keybox_2[m]
        v9 = v1
```

这个逻辑产生出我们需要的 `v9` 到 `v12`。

要求他们分别是

```
2797562180
402160470
2271994447
903396000
```

亦即

```
0xA6BF6944
0x17F87B56
0x876BE24F
0x35D8BAA0
```

初始状态下他们被设定为

```python
v9 = 0x67452301
v10 = 0xEFCDAB89
v11 = 0x98BADCFE
v12 = 0x10325476
```

实际上，考虑一下这段逻辑：

```
    tmp = v12
    v12 = v11
    v11 = v10
    v10 += (v9 + v13 + keybox_1[m] + nums[v14]) << keybox_2[m]
    v9 = tmp
```

因此最后我们得到的 `(v9, v10, v11, v12)` 四个数字，将上一次循环中得到的一组数记为 `(u9, u10, u11, u12)`。

那么，`(v9, v10, v11, v12) = (u12, f(u9, u10, u11, u12, m), u10, u11)`。

每一次的迭代都和上一次的所有数据紧密相关。

…溜了