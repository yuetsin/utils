#!/usr/bin/env python3
# coding=utf-8
import subprocess 
import os 
import sys

def checkflag(bin,shellcode):
    p=subprocess.Popen(bin,stdin=subprocess.PIPE,stdout=subprocess.PIPE)
    p.stdin.write(shellcode)
    p.stdin.flush()
    try:
        p.wait(10)
        p_out=p.stdout.read(0x1000)
        #print(p_out)
        return p_out
    except:
        p.kill()

def main():
    with open("./flag",'rb') as f:
        flag=f.read()

    print("Welcome to 0ops shellcode trilogy.")
    print("This is shellcode I: Into the dust")
    print("Input your shellcode:")

    shellcode=os.read(sys.stdin.fileno(),0x1000)

    p1_out=checkflag("./sc1_32",shellcode)
    p2_out=checkflag("./sc1_64",shellcode)

    if flag in p1_out and flag in p2_out:
        print("Congratz your flag is: %s"%flag)
    else:
        print("You failed.")

if __name__=='__main__':
    main()
