#!/usr/bin/env bash 

export http_proxy;
export https_proxy;

git config --global --unset http.proxy
git config --global --unset https.proxy