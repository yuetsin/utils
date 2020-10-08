skipped = [24, 27, 32, 33, 35, 37, 41, 42, 48, 49, 50]

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

    18: r'"\\"',
    # 要求可打印字符，但不能有 '。
    # 要让 "x = r'%{answer}%'" 格式化出来的东西
    # 通不过 ast.parse。
    # 如果给出口胡的 Unicode，那么连第一步都过不去。
    # 但是格式化时带上了 r，所以也不能做转义。
    # 在里面放一个 literal \\，把最後一个 ' 转义掉，就好了。

    19: r'"\\"',
    # 我讨厌字符串…
    # 答案和 18 一样。
    # 也是往里丢转义字符。

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

    21: "b'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'",
    # 随手揉了一下键盘就过了……
    # 果然是因为写漏了 = 的匹配（笑死
    # 可现在 bug 已经被修了，淦
    # 实际上，BASE64 的标准是每 76 个字符中出一个换行符。
    # 而这里用的是 rstrip。所以输入一个超长字符串即可。哈哈哈哈。
    # 注意，这个垃圾检测程序有个 GLOBAL_MAX_LENGTH 限制 100。
    # 还好我们只需要 76 个就够了。

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

    26: r"{'1': {4: 8, 3: 6}, '5': 2, '3': 4}",
    # 不允许有任何的 ()、. Ee（这就是在针对 tuple、nan 和 inf）。要让 json load dump 之後，跟原来的不一样。
    # nan inf 都能很好 dump。complex 直接拒绝 dump。
    # ellipsis 不能 dump…
    # JSON 是不能表示 tuple 的。所以给一个 tuple 就满足要求了。吗？
    # 但是，要求 repr 出来不能有 e 和括号！tuple 是一定会出来括号的，哪怕只有一个元素。
    # 要了命了。
    # 一件事：JSON 不允许 int 作为 key，所以 hash 完会变成 str。

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

    32: "零000000",
    # 若干个数字组成。
    # 第一个字符不是 '0'，
    # int() 要是 0？
    # 这可能吗？？？

    33: "???????????????",
    # len(set(ans1 + ans2)) == len(ans1 + ans2)
    # 也就是说，ans1 + ans2 里头没有重复。
    # 况且，都要满足两个条件：
    # 1. 单独解析（parse）都报错。
    # 2. 加上一对括号就正确。
    # 里面还不能有特殊符号 ()[]{}''""\_#……。
    # 这我一个都找不出来，你让我找两个（还得不重复）？
    # 我是垃圾，走了

    34: "'import math as x'",
    # 只有 0 ～ 9，空格、字母、下划线。
    # 要让 y = x 跑起来。但是又不可能用赋值操作符给予 x 初始值。
    # return 也不行，这不在函数里。
    # throw 就更不用说了——那直接退出去，没有分数了。
    # 只能出此下策了…

    35: "'bool', 'type(__debug__)'",
    # 要给出两个 identifier，使得 ID(ID) 是真。
    # bool(bool) 是 True，因为它的构造函数只要有参数就是真。
    # 很遗憾, type(type) 会返回一个 Type，但是 class <type> not is True.
    # help(help) 好像可以打开关于 help 的帮助页面…但是不能返回 True。
    # 在交互式页面里，_ 会被设定为上条语句的返回值。但是这没什么用。
    # 服务器中两条语句不是连续执行的。
    # type(True) 可以得到 bool 类型，但是带有括号 () 不能成为合法的 identifier。
    # BOOL

    36: "'type'",
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

    40: "'list', 'object', 'Hashable'",
    # x 是 y 的基类
    # y 是 z 的基类
    # x 不是 z 的基类

    # complex: Complex 继承 Number
    # real: Real 继承 Complex
    # rational: Rational 继承 Real
    # int: Integral 继承 Rational
    # 然后 bool 继承 int。
    # 完美的继承关系啊。
    # 定义 Number 时用到了 meta class 技术，但是这也不能改变什么。
    # ABCMeta 和 ABC 两个类都和他们不合作。完全不存在继承关系，
    #
    # 但我们来看看下面的代码：
    # https://hk4fun.github.io/2018/11/23/Python中子类关系的传递性/
    # from collections import Hashable
    # issubclass(list, object)
    # >>> True
    # issubclass(object, Hashable)
    # >>> True
    # issubclass(list, Hashable)
    # >>> False
    # 很明显，list 是不可哈希的

    # 上面的代码貌似说明了子类关系并不一定具有传递性

    # 但仔细观察会发现一个很不对劲的地方：issubclass(object, Hashable) 的结果为 True。
    # __subclasshook__ 被 Hook 了。这就是问题之所在。

    41: r"'\n\r\t'",
    # 只能用「数字」、「,」、「空白格」。
    # 要造出一个 eval 成功，但是 exec 失败的东西。
    # 可以很容易混用 \t 和 ‘ ’ 来弄出一个 IndentationError。
    # 但是题目要求 SyntaxError。况且，他也帮我们 dedent 了。
    #
    # 我发现如果给一个超长的 \n 列，那么 eval 会失败，而 exec 会成功。
    # ……可惜这里的要求是相反的…

    42: "'**kwargs:bytearra', ''",
    # 要让下面的代码正常执行：
    # def foo(x, {ans1}y):
    #     pass
    # foo(1, y=2)
    # with CheckRaises(TypeError):
    #     foo(1, 2)
    # def bar(x, {ans2}y):
    #     pass
    # bar(1, y=2)
    # with CheckRaises(TypeError):
    #     bar(x=1, y=2)

    # 这里特殊符号没有 ban 「:」 、 「=」、「*」和 「,」 那就相当于都没 ban。
    # 但是，加一个参数进去好像又不行；因为这个参数不能有默认值；有默认值的参数必须在後头。
    # 但是，如果没有默认值，那么 foo(1, y=2) 就肯定失败了。
    # foo 可能有更多个参数吗？
    # 回答：可能，但是那样的更多参数就一定得有默认值。否则 foo(1, y=2) 会失败。
    # 但这样，foo(1, 2) 就不会失败；因为他会默认地从左向右匹配。
    # 写出 def foo(x, a:str='',y=bytearray):
    # 希望是好的；让 Foo(1,y=2) 使用 a 的默认值，而 foo(1,2) 则使用 y 的默认值。
    # 很遗憾，即便传入一个 a:str = 2，也不会爆出 TypeError。因为 Python 不对 annotations 做类型检查。
    # 想要提前闭合括号也是不行的；因为 )( 是违禁词。
    # 把第二个参数设定为 **kwargs 是可行的；这样 y=2 会被作为 dict 的一部分解读，而单单传入一个 2 就会失败。
    # 但是，如何才能最後让他以 y 结尾呢？
    # 加一个没用的类型 annotations 就可以了。感谢 bytearray。
    # 其实不一定要叫做 kwargs…直接用 **y 也可以…
    # 另外，foo(x, *, y) 也可以强制 y 用 tag 形式传递。

    # 下一个，bar(1, y=2) 成立但是 bar(x=1,y=2) 不成立。
    # 因为第一个参数的名字就叫做 x，
    # 所以 x=1 会被直接解读成第一个参数填入。怎么办！
    #

    43: '"*x,*y", "**x,**y"',
    # 特殊字符不要。
    # 只能出现 x、y 两个字母。不能出现数字、下划线。（不能用强拼的）
    # 那么，z = x + y 就是了。
    # 下一个呢，z = x | y.
    # ……
    # 如果有这么简单就好了。
    # 但是，他这里要求，外面必须套一层 [] 和 {}。
    # 「有病吧」.png
    # 写成 [i for i in [x + y]] 当然可以，但这样就用了更多的字母。
    # Python >= 3.5 alternative: [*l1, *l2]，用来配合可变长参数的。
    # 那马上就能想到对应 dict 的 **x, **y 了吧。
    # 注意这家伙连空格都不要的。

    44: "'except Exception as x'",
    # with CheckRaises(NameError):
    #     x = 666
    #     try:
    #         1 / 0
    #     {answer}:
    #         pass
    #     z = 777
    #     y = x
    # check(z == 777)

    # 简单说，要把这个除零异常挡下来，
    # 代码需要运行到 z = 777 处。
    # 同时，还得抛出一个 NameError。
    # NameError 要在 z = 777 後面抛。
    # 那就只有 except Exception as x
    # 把 x 名字覆盖掉了。

    45: '["1", "3+0j", "4, 2"]',
    # 要三个不同答案。注意这里使用 ast.literal_eval 获取的具体对象，
    # 不能给出不靠谱的东西。
    # 让他们运行 <>.__class__ 报错的。
    # 首先，任给一个 int 是可以的。因为单独的字面值不能提取 __class__。
    # ....__class__ 也不会报错。
    # 等价于 Ellipsis.__class__。
    # 3+0j 也可以；因为虽然可以 parse，但是 parse 的结果是 3+0j.__class__。
    # 右边结合了。
    # 再给一个不带括号的 tuple  4, 2。parse 成功，但是
    # 4, 2.__class__ 是不可能成功的。得了。

    46: ['secret,', 'secret,:', 'secret=', "secret,=", "secret,=:"],
    # 要给出五个不同的答案，都要满足：
    # 1. 没有特殊符号（当然很多特殊符号并没有被 ban）
    # 2. 只有 secret 这一段文字
    # 3. 下面这段代码要成功：
    # secret = 'my_super_secret'
    # check("'" in f'{{{ans}}}')
    # 即，小心地写入 f'{？？？}，使得结果中有 ' 单引号。
    # 本来可以随便找一个类型名字输进去，但是这里规定只能有 secret 这一个 \w。
    # 字母、数字、下划线全部都没了。
    # 加一个 ,，可以作为元组输出，有 ' 了。
    # ... 本来也可以作为符号加入。但是她 Ban 掉了 「.」。
    # 淦
    # 可以加一个意义不明的 : 在 , 後面。凑个数。
    # Python 3.8 加了一个 format 格式
    # = 可以生成 (expr = repr) 这样的字符串…
    # http://zetcode.com/python/fstring/
    # 我 TM…
    # 开发 Python 的人脑子里在想什么？

    47: repr('f"""1e1000"""'),
    # 要给出一个纯由字母、数字、引号组成的 str。
    # 包含 6 个 "，
    # 包含 2 个 """。
    # answer 总长度超过 12。即，str 内容不能太短。
    # 把他代入 foo。
    # 要让下面的代码正确执行：
    # def foo():
    #     {answer}
    #     check(isinstance({answer}, str))
    # check(not foo.__doc__)
    # foo()
    # 那可以想见，应该是一个 """""" 格式的东西。
    # 但是，在函数定义之下的那个多行 str 会被当作 __doc__ 对待。
    # 但是，题目不想拥有这个 __doc__。
    # 这咋办嘛！
    # 容易想到，可以在字符串前後加缀字符。
    # 或者，用 f 前缀，并在其中加控制字符。
    # 似乎，只要是 f 出来的生成性字符串，就不会被当作 __doc__ 了。
    # 神奇……

    48: '?????????????????',
    # 首先，不能是关键字，还要是一个合法的标识符。
    # 然後，让这样的代码报 SyntaxError：
    # class A:
    #     pass
    # A.{answer} = 666
    # '__class__' 的确可以引发异常，但是那是 TypeError（类型不配）
    # 而不是 SyntaxError。
    # 放关键字当然容易得可以，但是题目已经考虑到了这种情况，
    # ['False', 'None', 'True', '__peg_parser__', 'and',
    # 'as', 'assert', 'async', 'await', 'break', 'class',
    # 'continue', 'def', 'del', 'elif', 'else', 'except',
    # 'finally', 'for', 'from', 'global', 'if', 'import',
    # 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass',
    # 'raise', 'return', 'try', 'while', 'with', 'yield']
    # 都是不允许的。
    # '__base__' 也引发异常（那是只读的），但 AttributeError 也并非 SyntaxError。
    # '__name__' 的赋值类似，也是异常号不对。
    # 为什么……为什么……

    49: "?????????????????",
    # 这一题，也是要求两个不同的 identifier。
    #
    # class A:
    #     {x} = 666
    #     check({y} == 666)
    # check(A.__dict__.get({x!r}) is None)
    # class A:
    #     def foo({x}):
    #         return {y}
    #     check(foo(777) == 777)
    # 要正确结果。
    # x 和 y 要微妙地不同；
    # x != y，而且在 A 体内可以混用，作为参数列表也可以混用。
    # 最特别的是，x 在被赋值之后，居然在 __dict__ 之中找不到！有这样的 ID 吗？
    # 我想不出来

    50: [("", "or"), ('raise ', "+"), ("", ",lambda x:")],
    # 要求，给出一组 前缀 和 op，使得
    # 这段代码不会爆炸：
    # {prefix}
    # def bomb():
    #     1 / 0  # bomb triggered
    # x = 666
    # x {op} bomb()
    # 并且，前面一大段笨拙的参数检查，实际上是保证了下面这几件事：
    # 1. 三个不同的答案。每个答案是 prefix + op 的 tuple
    # 2. 其中，第一、第二个解的 op 长度要短于等于 2。
    # 3. 并且，第一、第三个解不能用 prefix。
    # 简单说，就是要一个 op < 2 的解、
    # 另一个 op < 2 + annotations 的解
    # 以及另一个 op 长度不限 + annotations 的解。
    #
    # 很容易想出来，{op} 可以是 'or'。用短路求值原理。
    # 第三个不限制长度的，自然也可以多加几个短路 or。
    # 甚至，写成一个 lambda 表达式也好。反正不要真的调用 bomb。
    #
    # 这就作为第一个解和第三个解好了。

    # 这里拒绝了 decorator 的 @，所以装饰器就别想了。
    # 就是要写一条语句来让 bomb 的语义改变。有这种办法吗？
    # 删掉 ZeroDivisionError？那样会抛出另一个 NameError。别想了。
    # SystemExit 也被 ban 掉了…
    # 好绝望啊。

}
