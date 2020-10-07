skipped = [18, 19, 24, 26, 27, 32, 33, 37]

results = {
    1: "'Life is short. I use Python.'",
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

    6: "'+4e+5'",
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

    11: "'我爱你'",
    # 要给出一个合法的 identifier，不包含数字、字母、下划线。
    # 随便输入非英语字符就好了。

    12: "'NaN'",
    # assert(x != x)
    # 满足这个条件的就只有 nan 了。
    # 也就是，要搞出一个 NaN…
    # 注意大小写。

    13: "'3_4'",
    # 不能放在字符串里的合法 _，当然就是用来作为「数字分隔符」了。
    # 沙雕特性

    14: "'{1:3,2:4,3:666,3:555}'",
    # 构造一个 dict，能被 ast.literal_eval 识别，
    # 其中要有连续的三个数字 6.
    # 但是 key 和 value 都不能是 6.
    # 只能用 , { } 0 ~ 9. 不能用 13 题那一招了。
    # 另一个花招：後出现的同 key 值会把先出现的覆盖。

    15: "'[True, False, None, 1e2, 1j, 0xabcdef, 0b10, 0o10, set()]'",
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

    16: "\"'awe' 'some'\"",
    # 让 eval 拼凑 awesome…
    # 但是，直接 + 是不行的；会触发一次 String 重分配内存，安全 eval 不允许
    # 直接拆开就好了。Python 和 C 一样，遇到连续的字符串，仅用空格分割，就会直接连读。

    17: "'\x0b\x0c'",
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

    20: ('01', 'inf', '+ 0j', '0x8'),
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
    # 因为，按照第一种方式，会优先作为 format tuple 解读；
    # 而 str()，则总是会将其作为整体对待。
    # 传入一个单元素元组，就好了。

    24: "??????????????",
    # 要求一个字符串。
    # 用 ascii 编码前後、居然 splitlines 的结果不同。
    # 这怎么可能呢？难道，ascii encode 改变了 \n、\r？

    25: "'ß'",
    # swapcase 两次，最後结果居然不一样？
    # 德语字母 ß 只在小写体出现。大写就成了 SS。
    # 参见 https://en.wikipedia.org/wiki/Letter_case 的 Exceptional letters and digraphs 一节。
    # 应该还有很多其他语言可以这么操作。

    26: "???????????????????",
    # 不允许有任何的 ()、. Ee（这就是在针对 tuple、nan 和 inf）。要让 json load dump 之後，跟原来的不一样。
    # nan inf 都能很好 dump。complex 直接拒绝 dump。
    # ellipsis 不能 dump…
    # JSON 是不能表示 tuple 的。所以给一个 tuple 就满足要求了。吗？
    # 但是，要求 repr 出来不能有 e 和括号！tuple 是一定会出来括号的，哪怕只有一个元素。
    # 要了命了。

    # 就算输入 "4," 来凑 tuple 也无济于事；他检查的是 repr(answer)。
    # 这，只能先等等了…

    27: "??????????????????",
    # 算了，我对字符编码一窍不通。

    28: r"'hello\r\ni love you\r\nhope you enjoy your holiday\r\n', '\r'",
    # 输入一个元组。读入 s 和 newline，以 newline 为分界读取 lines。
    # 然後，把 lines join 起来，要让他跟原来的 s 不等。

    29: '"%s"' % r"'hello\r\ni love you\r\nhope you enjoy your holiday\r\n', '\r'",
    # 我是打错题号了，但是为什么 28 的答案能通过 29？？？
    # 算了…

    30: r"'awesome\n'",
    # 加一换行就行了

    31: "'{\\\\\}'",
    # 试出来的。
    # 估摸着斜杠一多就得出问题。啊果然。

    32: "???????????????",
    # 若干个数字组成。
    # 第一个 char 不是 '0'，
    # int() 要是 0？
    # 这可能吗？？？

    33: "???????????????",
    # len(set(ans1 + ans2)) == len(ans1 + ans2)
    # 也就是说，ans1 + ans2 里头没有重的东西。
    # 况且，都要满足两个条件：
    # 1. 单独解析（parse）都报错。
    # 2. 加上一堆括号就正确。
    # 里面还不能有特殊符号 ()[]{}''""\_#……。
    # 这我一个都找不出来，你让我找两个（还得不重复）？
    # 我是垃圾，走了

    34: "import math as x",
    # 只有 0 ～ 9，空格、字母、下划线。
    # 要让 y = x 跑起来。但是又不可能用赋值操作符给予 x 初始值。
    # return 也不行，这不在函数里。
    # throw 就更不用说了——那直接退出去，没有分数了。
    # 只能出此下策了…

    35: "'bool', 'type(__debug__)'",
    # 要给出两个 identifier，使得 ID(ID) 是真。
    # bool(bool) 是 True，因为它的构造函数只要有参数就是真。
    # 很遗憾, type(type) 会返回一个 Type，但是 class <type> != True.
    # help(help) 好像可以打开关于 help 的帮助页面…但是不能返回 True。
    # 在交互式页面里，_ 会被设定为上条语句的返回值。但是这没什么用。
    # 服务器中两条语句不是连续执行的。
    # type(True) 可以得到 bool 类型，但是带有括号 () 不能成为合法的 identifier。
    # BOOL

    36: 'type',
    # type(type) is type. 顺口溜？

    37: "'help', 'print'",
    # 两个标识符号。
    # x(y) is y(x)。
    # 真有意思，这两位。
    # repr(print) 和 print(repr) 很相近了，但很可惜 print 不返回值。
    # print(help) 和 help(print) 都不返回的，很好。
    # 可惜服务器不会自己按 q，停不下来…
    # 这里实际上要求两组数据…

    38: "'set'",
    # 要合法地執行 ID[ID]。
    # 剛剛很多是因為有 built-in functions。
    # 但是可以 [] 的就很少了。
    # 甚至，遵循 [] 常規語義就很難寫。
    # 奇怪的是，存在 set[set] 合法！
    # 类型是 <class 'types.GenericAlias'>。
    # 这是 Python 用来做类型检查用的，代表（这个 set 里面只能放 set）。
    # 当然，也存在 list[list]。
    # 例如，可以这么限定一个类型：list[int]
    # 代表只能放 int 的 list 类型。

    39: "'type', 'object'",
    # 类型是自己的，我只记得一个 type。
    # 这里要求两个，还要求他们互为 instance。
    # https://docs.python.org/3/library/stdtypes.html
    # 这里列出了所有的内置类型。
    # 还有一个就是万物的基类 object。
}
