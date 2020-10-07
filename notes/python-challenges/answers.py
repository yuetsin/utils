results = {
    1: 'Life is short. I use Python.',
    # Agree.

    2: [({666},), {77.7: '888'}],
    # 注意 tuple 的构造。

    3: [{6}, {6: 6}],
    # 简单。Iterable，但不是 Sequence 存储的串

    4: ['6', b'6'],
    # ['6', '\u0036'] 是不行的，他们是相同的表示。
    # 要找两个不同的 str，但是 ord 之后相等。
    # 用 bytes 就好了。

    5: [b'', [], set(), {}, (), '', None],
    # 七种不同的、等价于 False 的「东西」，还不能是数字。
    # 排除掉了 0、0.0，还有 False。（False 也是数字！）

    6: '+4e+5',
    # 不允许做加减法，那么 + 只能作为数字前缀出现了。
    # 最後要得到一个数字，那只能用「指数」了。

    7: ['6', ('6',), ['6'], {0: '6'}],
    # 要 4 个不同的容器，每一个的 [0] 都是 '6'。
    # 顺序存储的就是 list、str、tuple。还有一个把 0 当作索引的 dict。

    8: [b'\x06', (6,), [6], {0: 6}],
    # 和 7 的不同之处就是…没办法用 str 了。
    # 还好我们有 bytes。拿出来就是 int 啦。

    9: [False, set(), {}, 0],
    # 和自己 | 结果是 False（假）的…
    # 无序存储的 set 和 dict 也可以做 ｜ 运算，相当于 union()。

    10: '[None, True, False, ..., 1e1000, 1e1000j]',
    # repr 成字符形式之後，
    # 不能有数字、+、-、[]、()、{}。不能有额外的引号。
    # https://docs.python.org/3/library/constants.html 这里有大量的常数字符串（笑）
    # 但是，这个沙雕程序用的是 ast.literal_eval parse 输入。
    # 多亏了他，NotImplemented、float('nan'), float('inf') 都被他挡掉了。
    # 当然，还有 site 的那一堆，license、copyright、__name__ 之类的。
    # 实际上，所有需要运算、寻址的全部都被挡了。
    #
    # 想了半天，最後结果是，加入复数得到 infj……
    # 真·INFJ（不是

    11: "我爱你",
    # 要给出一个合法的 identifier，不包含数字、字母、下划线。
    # 随便输入非英语字符就好了。

    12: "????????",
    # assert(x != x)
    # 太诡异了。我要跑了。

    13: "3_4",
    # 不能放在字符串里的合法 _，当然就是用来作为「数字分隔符」了。
    # 沙雕特性

    14: "{1:3,2:4,3:666,3:555}",
    # 构造一个 dict，能被 ast.literal_eval 识别，
    # 其中要有连续的三个数字 6.
    # 但是 key 和 value 都不能是 6.
    # 只能用 , { } 0 ~ 9. 不能用 13 题那一招了。
    # 另一个花招：後出现的同 key 值会把先出现的覆盖。

    15: "[True, False, None, 1e2, 1j, 0xabcdef, 0b10, 0o10, set()]",
    # 不能用字符串，要在一个合法的 ast.literal_eval 表达式中，塞入 15 个不同的字母。
    # True, False, None，排除大小写，这才 10 个。
    # Ellipsis 入不了 literal_eval 的法眼；... 又不能凑字母数。
    # 1e100，可 e 已经有了。
    #
    # 虚数 j，算一个。11 个。
    # inf 没用，因为那是 eval 之后才变成的字母。
    # 字符串的前缀 b、u、r 很遗憾都用不了，因为引号被禁止了。
    # 十六进制前缀可以加一个 x。二进制前缀 b。八进制前缀 o。
    # 十六进制还会代入 abcdef。
    # 特别的，允许创建 set() 对象。而且只有 set，其他类型的都不行。

    16: "'awe' 'some'",
    # 让 eval 拼凑 awesome…
    # 但是，直接 + 是不行的；会触发一次 String 重分配内存，安全 eval 不允许
    # 直接拆开就好了。Python 和 C 一样，遇到连续的字符串，仅用空格分割，就会直接连读。

    17: "\x0b\x0c",
    # 只能输入 whitespace 符号，让这个解析式失败。
    # 空白符号有 ' \t\n\r\x0b\x0c'
    # 其中後两个会影响 parsing。

    18: "?????????????",
    # 要求可打印字符，但不能有 '。
    # 要让 "x = r'%{answer}%'" 格式化出来的东西
    # 通不过 ast.parse。
    # 如果给出口胡的 Unicode，那么连第一步都过不去。
    # 但是格式化时带上了 r，所以也不能做转义。

    19: "???????????????",
    # 我讨厌字符串…

    20: ('01', 'inf', '+ 0j', '0x8')
    # 要输入四个东西。
    # 其中，x 的每一位都要是数字。
    # 且 x 要 parse 错误。
    # # 这个简单，0 开头。
    #
    # float(y) 要大于 0，
    # 同时 literal eval 要 error。
    # # 这个我会啊，float("inf") fail 了好 多次了
    #
    # z1、z2 的类型不能一样。
    # z1、z2 都得满足：
    # 长度 <= 5。
    # zz eval 之后都得是 numbers。
    # 而且，type(zz)(z) 失败，就是说不能直接做这种转换。
    # z 可以是复数，2+4j 可以被 ast eval，但是也可以被 complex 构造。不合题意。
    # 复数好像可以、bool 好像可以，但是最後都落在一个问题：
    # type(zz)(z) 不会失败。
    # Complex 的问题：在加号两边有空格的时候，ast 成功，complex() 构造函数失败。
    # bool 呢？传入任何 str 作为构造函数都会成功。为 "" 就返回 False，否则 True。
    # 也就是说， bool("False") == True。
    # 最後，利用 int() 需要手动指定进制的功能，套一个 16 进制的数字进去就好了。

    21: b"3yughvjbkiou8yiughjvbknlo;",
    # 随手揉了一下键盘就过了……
    # 真的……
    # （向出题人谢罪

    22: ("baba", 'rot13', b"abab", 'base64'),
    # 要求一个四元组。分别是 str、str、byte、str。
    # a.encode(b) 要出错，c.encode(d) 要出错。
    # 但是，却可以用 codecs.encode 做这种编解码。
    # 他们看起来非常类似…那么区别在哪里呢？
    # LookupError: 'base64' is not a text encoding; use codecs.encode() to handle arbitrary codecs
    # str.encode 已经说出来了。
    # base64 可以作为「d」，但是不能是「b」；因为 codecs.encode 在编码 base64 时，要求的是 bytes。
    # 最後，尝试出来 rot13 符合要求。那么结束了。
    # https://docs.python.org/2.4/lib/standard-encodings.html
    # 这个 Python 2.4 的老页面对我帮助很大。感谢。

    23: '("love and peace",)',
    # '%s' 打印出来的，和 str(s) 的，居然不一样？
    # 因为，按照第一种方式，会优先作为 format list 解读；
    # 而 str()，则是直接调用整体。
    # 传入一个单元素元组，就好了。

    24: ,
    # 要求一个字符串。
    # 用 ascii 编码前後、居然 splitlines 的结果不同。
    # 这怎么可能呢？难道，ascii encode 改变了 \n、\r？
}
