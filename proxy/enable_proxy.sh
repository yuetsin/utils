#!/usr/bin/env bash 

export http_proxy=http://127.0.0.1:1087
export https_proxy=http://127.0.0.1:1087

git config --global http.proxy $http_proxy
git config --global https.proxy $https_proxy