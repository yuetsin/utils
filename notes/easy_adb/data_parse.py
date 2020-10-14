#!/usr/bin/env python3

import binascii

with open('usb.dat', 'r') as rf:
    lines = rf.readlines()

dat = []
for line in lines:
    if line.strip() == '':
        continue

    content = line.strip()

    dat.append(binascii.unhexlify(content))


with open('bin', 'wb') as wf:
    for chunk in dat:
        wf.write(chunk)


h = open('usb.dat', 'r').read().strip()

write = b'WRTE'.hex()
a = h.split(write)[1:]


# counter = 0
for idx, i in enumerate(a):
    b = bytes.fromhex(i)
    data = b[5*4 + (8 if idx == 0 else 0):]
    if idx == 16:
        data = data.replace(b'DATA\xe9\x90\x00\x00', b'')
    # print(data.hex(), end='')
    # with open('chunk%d' % counter, 'wb') as wf:
        # wf.write(data)
    # print(data)
    # counter += 1
