#!/usr/bin/env python3

from PIL import Image, ImageDraw
from prettytable import PrettyTable

# touch screen lies in /dev/input/event2

magic_header = b'/dev/input/event2: '

sample_body = b'0003 0039 000041a9\n'

type_codes = {
    0x0: '同步事件',
    0x1: '相对坐标',
    0x3: '绝对坐标',
}

event_codes = {
    0x39: 'ABS_MT_TRACKING_ID',
    0x14a: 'BTN_TOUCH',
    0x145: 'BTN_TOOL_FINGER',
    0x35: 'ABS_MT_POSITION_X',
    0x36: 'ABS_MT_POSITION_Y',
    0x30: 'ABS_MT_TOUCH_MAJOR',
    0x31: 'ABS_MT_TOUCH_MINOR',
    0x3a: 'ABS_MT_PRESSURE',
    0x0: 'SYN_REPORT',
    0x2f: 'ABS_MT_SLOT',
}


bodies = []
with open('./unhex', 'rb') as f:
    raw_bytes = f.read()
    for i in range(len(raw_bytes)):
        if raw_bytes[i:i + 19] == magic_header:
            payload = raw_bytes[i + 19: i + 37]
            try:
                # print(payload.decode())
                tokens = payload.decode().split(' ')
                bodies.append((int(tokens[0], base=16), int(
                    tokens[1], base=16), int(tokens[2], base=16)))
            except:
                pass


width = 1439
height = 2959
im = Image.new('RGB', (width, height), 'white')

draw = ImageDraw.Draw(im)

last_point = None

counter = 1
for typ, evt, dat in bodies:
    if event_codes[evt] == 'ABS_MT_POSITION_X':
        x_pos = dat
    elif event_codes[evt] == 'ABS_MT_POSITION_Y':
        y_pos = dat
    elif event_codes[evt] == 'SYN_REPORT' and x_pos and y_pos:
        # im.putpixel((x_pos, y_pos), (0, 0, 0))
        if last_point:
            if abs(last_point[1] - y_pos) < 100 and abs(last_point[0] - x_pos) < 100:
                draw.line(last_point + (x_pos, y_pos),
                          fill=(0, 0, 0), width=20)
        last_point = (x_pos, y_pos)
        x_pos = None
        y_pos = None

    if counter % 1000 == 0:
        im.show()
        input()

    counter += 1
# print(len(bodies))
