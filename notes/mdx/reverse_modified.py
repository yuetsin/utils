#!/usr/bin/env python3
import numpy as np
from binascii import hexlify
from pwnlib.util.packing import u64, p64, u32, p32

target_bytes = b'\x44\x69\xbf\xa6\x56\x7b\xf8\x17\x4f\xe2\x6b\x87\xa0\xba\xd8\x35'

f = open('./bin/mdx', 'rb')

file_bin = f.read()

secret_table = file_bin[0x20a0:]


keybox = [64069177, 58943652, 62397350, 50166518, 60802224, 66014582,
          65365647, 48136251, 73357411, 53676909, 64693042, 58333587, 61975758, 59644759,
          67666929, 61861443, 72375056, 59237827, 59396077]

# for key in keybox:
#     print(hex(key)[2:].ljust(8, '0'), end='')

# flag = "0ops{i_do_love_you}".encode()
v31 = [0] * 19

matrix = []
for j in range(19):
    numbers = []
    items = []
    for k in range(19):
        idx = k + j * 19
        # v31[j] += flag[k] * u32(secret_table[idx * 4: idx * 4 + 4])
        numbers.append(u32(secret_table[idx * 4: idx * 4 + 4]))
        items.append("a%d * %d" % (k, u32(secret_table[idx * 4: idx * 4 + 4])))

    matrix.append(numbers)
    print("%s = %d" % (' + '.join(items), keybox[j]))

# print(matrix)
# print(keybox)
a = np.array(matrix)
b = np.array(keybox)

x = np.linalg.solve(a, b)
print(x)

for ch in x:
    print(chr(int(round(ch))), end='')
