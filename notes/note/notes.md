# note

旧学院派的 Heap…

```c
int main(int argc, const char **argv, const char **envp)
{
  signed int v3; // eax

  setbuf(stdout, 0LL);
  puts("Start our heap journey from old-school style!");
  puts("How many ways can you exploit this?");
  while ( 1 )
  {
    while ( 1 )
    {
      puts("1. Add");
      puts("2. Delete");
      puts("3. Edit");
      puts("4. Show");
      puts("Choice:");
      v3 = read_int("Choice:", 0LL);
      if ( v3 != 2 )
        break;
      delete();
    }
    if ( v3 > 2 )
    {
      if ( v3 == 3 )
      {
        edit();
      }
      else if ( v3 == 4 )
      {
        show();
      }
      else
      {
LABEL_13:
        puts("Invalid");
      }
    }
    else
    {
      if ( v3 != 1 )
        goto LABEL_13;
      add();
    }
  }
}
```

这里看起来我们能干预的就一个 `read_int`。实现也是相当人畜无害：

```c
int read_int()
{
    char buf[0x20]; // [rsp+0h] [rbp-20h]
    read(0, &buf, 0x10uLL);
    return atoi(buf);
}
```

`atoi` 好像没听说过什么任意写的漏洞。咱们往下看。

通过维护一个全局固定大小的 `char *` 数组：

```c
char *ptrs[16];
```

实现了增删改查：

```c
char* add()
{
    puts("Index:");
    int index = read_int();
    puts("Size:");
    int size = read_int();
    char *buf = (char *)malloc(size);
    result = index;
    ptrs[index] = buf;
    return result;
}
```

```c
void delete()
{
    puts("Index:");
    int index = read_int();
    free(ptrs[index]);
}
```

```c
size_t edit()
{
    puts("Index:");
    int index = read_int();
    puts("Len:");
    int len = read_int();
    puts("Input:");
    return read(0, ptrs[index], len);
}
```

```c
int show()
{
    puts("Index:");
    int index = read_int();
    return puts(ptrs[index]);
}
```

所有**对于条目**的读写增改都由指向的字符串实现，并且所有的输入都做好了「长度限制」。

然而，`edit` 却没有对 `index` 的范围、有效性做任何检查。我可以随意输入一个超大的数字来在任何位置读取。

题目顺带给出了使用的 `libc`。这样，只要任意泄露出一个符号的地址，就可以改写 GOT，实现任意跳转。

这里提前构造一个内容为 `/bin/sh;` 的 Note Entry，把 `free` 的 GOT 改写为 `system` 的，然后随意调一次 `delete()` 就解决了。

