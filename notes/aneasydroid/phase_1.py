#!/usr/bin/env python3

import hashlib

kkkk = b'0ops'


def checkflag1(content: str) -> bool:
    ideal_bytes = [0] * 20

    array_of_bytes = content.encode()

    b1 = getSHA256StrPython(9)
    b2 = array_of_bytes[3]
    ideal_bytes[3] = b1

    b1 = 1 if b1 == b2 else 0

    tmp_dig = getSHA256StrPython(3)
    b2 = 1 if tmp_dig == array_of_bytes[5] else 0
    ideal_bytes[5] = tmp_dig
    getSHA256StrPython(9)

    tmp_dig = getSHA256StrPython(11)
    bool1 = tmp_dig == array_of_bytes[6]
    ideal_bytes[6] = tmp_dig
    getSHA256StrPython(9)

    tmp_dig = getSHA256StrPython(5)
    bool2 = tmp_dig == array_of_bytes[8]
    ideal_bytes[8] = tmp_dig
    getSHA256StrPython(9)

    tmp_dig = getSHA256StrPython(12)
    bool3 = tmp_dig == array_of_bytes[7]
    ideal_bytes[7] = tmp_dig

    tmp_dig = getSHA256StrPython(23)
    bool4 = tmp_dig == array_of_bytes[2]
    ideal_bytes[2] = tmp_dig
    getSHA256StrPython(9)
    getSHA256StrPython(9)

    tmp_dig = getSHA256StrPython(6)
    bool5 = tmp_dig == array_of_bytes[11]
    ideal_bytes[11] = tmp_dig

    tmp_dig = getSHA256StrPython(3)
    bool6 = tmp_dig == array_of_bytes[4]
    ideal_bytes[4] = tmp_dig

    getSHA256StrPython(9)
    getSHA256StrPython(9)
    getSHA256StrPython(9)
    getSHA256StrPython(9)
    getSHA256StrPython(9)

    tmp_dig = getSHA256StrPython(8)
    bool7 = tmp_dig == array_of_bytes[10]
    ideal_bytes[10] = tmp_dig

    getSHA256StrPython(9)
    getSHA256StrPython(9)

    tmp_dig = getSHA256StrPython(15)
    bool8 = tmp_dig == array_of_bytes[0]
    ideal_bytes[0] = tmp_dig

    getSHA256StrPython(9)
    getSHA256StrPython(9)
    getSHA256StrPython(9)
    getSHA256StrPython(9)
    getSHA256StrPython(9)

    tmp_dig = getSHA256StrPython(7)
    bool9 = tmp_dig == array_of_bytes[9]
    ideal_bytes[9] = tmp_dig

    tmp_dig = getSHA256StrPython(0)
    bool10 = tmp_dig == array_of_bytes[1]
    ideal_bytes[1] = tmp_dig

    getSHA256StrPython(9)

    bool11 = array_of_bytes[12] == 126
    ideal_bytes[12] = 126

    print("ideal bytes list:", ideal_bytes)

    return 0x1 and b1 and b2 and bool1 and bool2 and bool3 and bool4 and bool5 and bool6 and bool7 and bool8 and bool9 and bool10 and bool11


def checkflag2(content: str) -> bool:
    pass


def getSHA256StrPython(param: int) -> int:
    global kkkk
    m = hashlib.sha256()
    m.update(kkkk)
    digest = m.digest()
    kkkk = digest
    return digest[param]


flag = input("Input Flag: ")

if not(len(flag) == 51 and flag.startswith('0ops{') and flag.endswith('}')):
    print(r'bad flag. format: 0ops{<45 chars>}')
    exit(-1)

content = flag[5:50]

if checkflag1(content) and checkflag2(content):
    print("I'm pretty sure that's the flag")
    print(flag)
else:
    print("something went wrong")
    exit(-2)
