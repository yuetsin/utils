#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
import re
from flask import Flask, request, make_response
import requests

app = Flask(__name__)


def check(url):
    if not re.match(r"^https?://play\.0ops\.sjtu\.cn", url):
        return False

    if not url.endswith(".png"):
        return False

    pattern = re.compile('#|\?|@', re.I)
    if pattern.findall(url):
        return False

    return True


@app.route('/', methods=["GET"])
def index():
    html = """<!DOCTYPE html>
<html>
<head>
    <title>babySSRF</title>
</head>
<body>
<h1>Hello, ctfer!</h1>
<h4>Good Luck & Hack Fun</h4>
<form action="/getImage" method="GET">
<p><input type="text" name="imageUrl" value="https://play.0ops.sjtu.cn/assets/img/0ctf/0ops.png" style="width:300px;">
<input type="submit" value="Go!"/></p>
</form>
<!-- source code is in /source -->
<!-- 
It is said that
'''
vim flag.php
php -S 0:8888
'''
appears in ~/.bash_history
-->
</body>
</html>
"""
    return html


@app.route('/getImage', methods=["GET"])
def getImage():
    url = request.args.get("imageUrl")
    if check(url):
        print(url)
        r = requests.get(url, timeout=2, allow_redirects=False)
        response = make_response(r.content)
        response.headers["Content-Type"] = "image/png"
        return response
    else:
        return "Don't hack me. QwQ"


@app.route('/source', methods=["GET"])
def source():
    return open(__file__, "r").read()


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=37777)
