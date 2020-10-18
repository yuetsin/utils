#!/usr/bin/env python3

flag = input("flag >>> ").strip('\n')

if len(flag) != 0x40:
    print("length error")
    exit(-1)

if not (flag.startswith('0ops{') and flag.endswith('}')):
    print("format error")
    exit(-2)

buffer = [0] * 100
for i in range(100):
    buffer[i] = chr(i)

srand(0x30323032)


for i in range(0x55):
    v4 = rand() & 0x800000ff
    v5 = rand() & 0x800000ff
