#!/usr/bin/env bash 

export http_proxy=http://127.0.0.1:1087
export https_proxy=http://127.0.0.1:1087

git config --global http.proxy 127.0.0.1:8087
# git config --global https.proxy 127.0.0.1:1087