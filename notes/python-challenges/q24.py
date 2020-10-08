#!/usr/bin/env python3

from random import randint
toks = []

answer = ''.join(toks)

answer_bytes = answer.encode('ascii')
# print(answer)
# print(answer_bytes)
print(answer.splitlines())

print([x.decode('ascii')
       for x in answer_bytes.splitlines()])
