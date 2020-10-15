#!/usr/bin/env python3

from pwnlib.util.packing import u64, p64, u32, p32

target_bytes = b'\x44\x69\xbf\xa6\x56\x7b\xf8\x17\x4f\xe2\x6b\x87\xa0\xba\xd8\x35'

keybox_1 = [0x0D76AA478, 0x0E8C7B756, 0x242070DB, 0x0C1BDCEEE, 0x0F57C0FAF,
            0x4787C62A, 0x0A8304613, 0x0FD469501, 0x698098D8, 0x8B44F7AF,
            0x0FFFF5BB1, 0x895CD7BE, 0x6B901122, 0x0FD987193, 0x0A679438E,
            0x49B40821, 0x0F61E2562, 0x0C040B340, 0x265E5A51, 0x0E9B6C7AA,
            0x0D62F105D, 0x2441453, 0x0D8A1E681, 0x0E7D3FBC8, 0x21E1CDE6,
            0x0C33707D6, 0x0F4D50D87, 0x455A14ED, 0x0A9E3E905, 0x0FCEFA3F8,
            0x676F02D9, 0x8D2A4C8A, 0x0FFFA3942, 0x8771F681, 0x6D9D6122,
            0x0FDE5380C, 0x0A4BEEA44, 0x4BDECFA9, 0x0F6BB4B60, 0x0BEBFBC70,
            0x289B7EC6, 0x0EAA127FA, 0x0D4EF3085, 0x4881D05, 0x0D9D4D039,
            0x0E6DB99E5, 0x1FA27CF8, 0x0C4AC5665, 0x0F4292244, 0x432AFF97,
            0x0AB9423A7, 0x0FC93A039, 0x655B59C3, 0x8F0CCC92, 0x0FFEFF47D,
            0x85845DD1, 0x6FA87E4F, 0x0FE2CE6E0, 0x0A3014314, 0x4E0811A1,
            0x0F7537E82, 0x0BD3AF235, 0x2AD7D2BB, 0x0EB86D391]

keybox_2 = [0x7, 0xC, 0x11, 0x16, 0x7, 0xC, 0x11, 0x16, 0x7, 0xC, 0x11, 0x16,
            0x7, 0xC, 0x11, 0x16, 0x5, 0x9, 0xE, 0x14, 0x5, 0x9, 0xE, 0x14, 0x5,
            0x9, 0xE, 0x14, 0x5, 0x9, 0xE, 0x14, 0x4, 0xB, 0x10, 0x17, 0x4, 0xB,
            0x10, 0x17, 0x4, 0xB, 0x10, 0x17, 4, 0xB, 0x10, 0x17, 0x6, 0xA,
            0xF, 0x15, 0x6, 0xA, 0xF, 0x15, 0x6, 0xA, 0xF, 0x15, 0x6, 0xA,
            0xF, 0x15]


def judge(s: str) -> bool:
    bts = s.encode().ljust(56, b'\0') + bytes([0x98] + [0x0] * 7)

    nums = []
    for i in range(0, 64, 4):
        nums.append(bts[i] | (bts[i + 1] << 8) |
                    (bts[i + 2] << 16) | (bts[i + 3] << 24))

    print("build nums", nums)
    v9 = 0x67452301
    v10 = 0xEFCDAB89
    v11 = 0x98BADCFE
    v12 = 0x10325476

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

    # simulates C-int overflow
    v9 %= 2**32
    v10 %= 2**32
    v11 %= 2**32
    v12 %= 2**32

    print(v9, v10, v11, v12)
    current_bytes = v9.to_bytes(4, byteorder='little') + v10.to_bytes(4, byteorder='little') + \
        v11.to_bytes(4, byteorder='little') + \
        v12.to_bytes(4, byteorder='little')

    print(current_bytes)
    print(target_bytes)
    if target_bytes == current_bytes:
        return False
    else:
        return True


flag = input("Your flag: ")

assert(len(flag) == 19)

if not judge(flag):
    print("I'm pretty sure it's the flag!")
else:
    print("Sorry, something went wrong")
    exit(-1)
