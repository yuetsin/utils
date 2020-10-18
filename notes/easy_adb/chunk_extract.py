#!/usr/bin/env python3

from scapy import *
from scapy.all import *
import io
import struct
import sys


rawpcap = rdpcap(sys.argv[1])

# rawpcap.show()

print(len(rawpcap))


with open('extract', 'wb') as b:
    for p in rawpcap:
        data = p[Raw].load
        if b'WRTE' in data:
            data = data[data.index(b'WRTE'):]
        else:
            continue

        print("parsed", data)
        b.write(data[26:])
