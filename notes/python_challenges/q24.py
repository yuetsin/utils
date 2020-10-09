#!/usr/bin/env python3

from random import randint

answer = '1\n2\r\n3\r'

answer_bytes = answer.encode('ascii')
# print(answer)
# print(answer_bytes)
print(answer.splitlines())

print([x.decode('ascii')
       for x in answer_bytes.splitlines()])
