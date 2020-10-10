#!/usr/bin/env python3

maps = [
    (0, 2),
    (3, 6),
    (7, 3),
    (10, 7),
    (15, 8),
    (21, 1),
    (28, 5),
    (31, 7),
    (32, 4),
    (37, 8),
    (38, 3),
    (52, 2),
    (58, 8),
    (60, 4),
    (62, 7),
    (63, 1),
    (72, 6)
]

_str = input('Input flag:')
if len(_str) != 70:
    print('Length Error. should be 70, but get', len(_str))
    exit(-3)

if not _str.startswith('0ops{'):
    print('Format Error. should starts with `0ops{`')
    exit(-1)


for ch in _str[5: -1]:
    # 这里如果正确地过滤到 < 49（Sudoku 里面是不能填 0 的），那就太明显了
    # 就不会有人上当了（笑）
    if ord(ch) < 48 or ord(ch) > 57:
        print('Char Validation Error. flag[1:-1] should be all digit numbers')
        exit(-2)

tips = [' '] * 64

_vec = [ord(ch) - 48 for ch in _str[5: -1]]

for pos, val in maps:
    _vec.insert(pos, val)
    tips.insert(pos, '^')

print('after inserting with maps, _vec is')
print(''.join(str(v) for v in _vec))
print(''.join(tips))

# 现在这是 81 个数。
# 要求他们各自不一样。
# 这不就是数独吗？
# 刚好，给出 17 个位置，这就是一个有唯一解的数独。
# 这也说得通了：练习 C++ 编程写数独。
# # 李显龙再世（不

for j in range(0, 9):

    _set_a = set(_vec[9 * j: 9 * j + 9])

    _set_b = set([_vec[j + 9 * k] for k in range(0, 9)])

    _idx = 3 * (j % 3) + 27 * (j // 3)

    _set_c = set([_vec[_idx + i] for i in [0, 1, 2, 9, 10, 11, 18, 19, 20]])

    if len(_set_a) != 9:
        print("Size Error. expect _set_a to be 9, but get", len(_set_a))

    if len(_set_b) != 9:
        print("Size Error. expect _set_b to be 9, but get", len(_set_b))

    if len(_set_c) != 9:
        print("Size Error. expect _set_c to be 9, but get", len(_set_c))


print("i'm pretty sure it's a right flag:\n%s" % _str[:-1] + '}')
