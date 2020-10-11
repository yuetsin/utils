import os
import base64
flag = input("flag >>> ")

digest = os.popen('./base64 %s' % flag).read()

print("  my base64:", digest)
print("real base64:", base64.b64encode(flag.encode()).decode())
