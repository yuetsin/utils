#!/usr/bin/env python3

from math import perm
from random import shuffle

allowed_bytes = []

for i in range(16):
    for j in range(8):
        allowed_bytes.append((i << 4) + (j + 8))

shuffle(allowed_bytes)
allowed_bytes = bytes(allowed_bytes)

print(f"{len(allowed_bytes) = }")

with open('valid_bin', 'wb') as f:
    f.write(allowed_bytes)
