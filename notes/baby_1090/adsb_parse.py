#!/usr/bin/env python3

import pyModeS as pms
import binascii
import csv

with open('./RF.raw', 'rb') as f:
    raw_bytes = f.read()

print(len(raw_bytes))
print(type(raw_bytes))

raw_str = binascii.hexlify(raw_bytes).decode().upper()

# raw_str = '8D40058B58C901375147EFD09357'

# print(raw_str[:28])

possible_headers = {'88', '89', '8A', '8B', '8C', '8D',
                    '8E', '8F', '90', '91', '92', '93', '94', '95', '96', '97'}

timestamp = 0

sample_rate = 2400000

history_addr = {

}

necessary_heights = {1325, 13800, 14500, 5100, 7200, 12650}

valid_tuples = []

for i in range(len(raw_str) - 27):
    timestamp += 1
    print("%d/%d, current time: %.2f" %
          (i, len(raw_str), timestamp / sample_rate), end='\r')
    msg = raw_str[i:i+28]
    # print(msg)

    # if not msg[:2] in possible_headers:
    #     continue

    df = pms.adsb.df(msg)
    if df != 17:
        continue
    # if pms.crc(msg) != 0:
    #     continue

    icao = pms.adsb.icao(msg)

    typecode = pms.adsb.typecode(msg)

    try:
        callsign = pms.adsb.callsign(msg)
    except:
        callsign = 'N/A'

    try:
        altitude = pms.adsb.altitude(msg)
    except:
        altitude = 'N/A'

    if icao in history_addr:
        last_ts, last_code = history_addr[icao]
        if timestamp // sample_rate == last_ts:
            position = ('N/A', 'N/A')
        else:
            history_addr[icao] = (timestamp // sample_rate, msg)
            try:
                position = pms.adsb.position(
                    msg,
                    last_code,
                    timestamp // sample_rate,
                    last_ts,
                )
            except:
                position = ('N/A', 'N/A')

            if not position:
                position = ('N/A', 'N/A')
    else:
        history_addr.update({icao: (timestamp // sample_rate, msg)})
        position = ('N/A', 'N/A')

    # input()

    if altitude != 'N/A':
        valid_tuples.append((icao, altitude, position[0], position[1]))
        # input()
    if altitude in necessary_heights:
        print("\ntry to parse", msg, " with icao ", icao,
              ", altitude:", altitude, "position:", position)
    else:
        print("                                           icao ", icao,
              ", altitude:", altitude, "position:", position, end='                                 \r')
    # input()

print("dumping data to csv")
with open('resp.csv', 'w', newline='') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=',',
                            quotechar='|', quoting=csv.QUOTE_MINIMAL)

    spamwriter.writerow(('ICAO', 'Altitude', 'PosX', 'PosY'))

    for line in valid_tuples:
        spamwriter.writerow(line)
