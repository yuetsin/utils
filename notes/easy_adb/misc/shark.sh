#!/usr/bin/env bash 

Tshark -r easy_adb.pcap -T fields -e usb.capdata