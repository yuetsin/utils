#!/usr/bin/env python3


min_range = 1023
max_range = -1

existed_values = set()


def rec_byte(b: bytes):
    global min_range, max_range, existed_values

    min_range = min(min_range, b)
    max_range = max(max_range, b)
    existed_values.add(b)
    # print("parsed byte", b, ". now bytes range between",
    #   min_range, "and", max_range)


byte_counter = 0

# parsed_bytes = []

f = open('./RF.raw', 'rb')

for raw_byte in f.read():
    # if raw_byte & 0x1:
    #     parsed_bytes.append(0xff)
    # else:
    #     parsed_bytes.append(0)
    rec_byte(raw_byte)

print('read done')
print("existed chars: ", existed_values)
