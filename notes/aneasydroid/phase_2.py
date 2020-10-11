import base64
import math

keybox = list(range(0x41, 0x5b)) + list(range(0x61, 0x7b)) + \
    list(range(0x30, 0x3a)) + [0x2b, 0x2f]


def my_base64(s: str) -> str:
    raw_str = list(s)

    extract_str = [ord('=')] * int(math.ceil(len(raw_str) * 4 / 3) + 1)

    v11, v13, v15 = 0, 0, 0

    i = 0
    while i < len(s):
        cur_char = ord(raw_str[i])

        if v15 == 1:
            v15 = 2
            v4 = v13
            v13 += 1
            extract_str[v4] = keybox[(
                cur_char >> 4) & 0xf | 16 * (v11 & 3)]
        elif v15 == 2:
            v15 = 0
            extract_str[v13] = keybox[(
                cur_char >> 6) & 3 | 4 * (v11 & 0xf)]
            v5 = v13 + 1
            v13 += 2
            extract_str[v5] = keybox[cur_char & 0x3f]
        else:
            v15 = 1
            v3 = v13
            v13 += 1
            extract_str[v3] = keybox[(cur_char >> 2) & 0x3f]
        i += 1

    if v15 == 1:
        extract_str[v13] = keybox[16 * (v11 & 3)]
        extract_str[v13 + 1] = 61
        extract_str[v13 + 2] = 61

    elif v15 == 2:
        extract_str[v13] = keybox[4 * (v11 & 0xf)]
        extract_str[v13 + 1] = 61

    return ''.join([chr(v) for v in extract_str])

# BASE64 变种


flag = input('give me flags[13:]!!! >>>')

digest = my_base64(flag)

print("  my base64:", digest)
print("real base64:", base64.b64encode(flag.encode()).decode())

if digest == "CGQGVM1cCMzSqpNxqI0WVwuMoM3rq9V8VKoco9qXC9C=":
    print("good flag")
else:
    print("bad flag")

# key: custom
# value: real
replace_pair = {
}

"""
这就是个正常的 Base64.
但是他对 keybox 做了手脚。


void sub_F950()
{
  int v0; // ST08_4
  int v1; // eax
  signed int i; // [rsp+Ch] [rbp-4h]

  srand(0);
  for ( i = 0; i < 100; ++i )
  {
    v0 = rand() % 64;
    v1 = rand() % 64;
    keybox[v0] += keybox[v1];
    keybox[v1] = keybox[v0] - keybox[v1];
    keybox[v0] -= keybox[v1];
  }
}

好在，这个 srand 是个垃圾的伪随机。


"""

normal_keybox = [65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102,
                 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47]
__macos__obfs_keybox = [109, 48, 90, 68, 56, 87, 47, 49, 73, 117, 82, 69, 52, 78, 106, 101, 77, 66, 120, 114, 104, 121, 72, 67, 89, 102, 86, 57, 119, 54,
                        99, 71, 70, 107, 53, 75, 80, 76, 116, 110, 103, 55, 81, 112, 97, 43, 108, 85, 74, 88, 100, 50, 118, 79, 113, 105, 98, 111, 84, 122, 83, 51, 115, 65]

__linux__obfs_keybox = [71, 57, 117, 70, 69, 79, 51, 99, 73, 48, 76, 114, 77, 88, 56, 86, 50, 81, 83, 84, 0, 53, 109, 43, 49, 105, 85, 100, 104, 108, 55,
                        74, 103, 90, 98, 82, 0, 113, 101, 67, 52, 80, 87, 89, 118, 116, 110, 47, 119, 102, 78, 106, 66, 107, 97, 65, 68, 112, 115, 75, 122, 120, 111, 72]

obfs_keybox = [122, 84, 115, 73, 48, 49, 104, 116, 78, 85, 70, 47, 86, 111, 69, 52, 117, 81, 110, 112, 121, 65, 57, 98, 67, 113, 68, 53, 51, 102, 103,
               105, 0, 100, 54, 71, 88, 99, 75, 72, 76, 106, 74, 118, 55, 80, 109, 50, 114, 83, 107, 77, 108, 120, 119, 87, 56, 79, 101, 82, 90, 97, 43, 89]

# 不同的编译条件，产生的 keybox 也不一样…服了。
# 只能开一个 C++ 项目写了
# 而且，这种 swap 写法在产生的 v1、v2 一样的时候就把某一位置为 0 啦！
# 实际上确实有那么几位是 0…
# 这个 shuffle 算法写得太搞笑了…

obfs_key = "CGQGVM1cCMzSqpNxqI0WVwuMoM3rq9V8VKoco9qXC9C="

results = []
for ch in obfs_key:
    code = ord(ch)
    if code in obfs_keybox:
        results.append(normal_keybox[obfs_keybox.index(code)])
    else:
        results.append(code)

print(''.join(chr(v) for v in results))

decoded_phase_2 = b'b4c31ec01e25d173d3770ec82ce5fdaf'
