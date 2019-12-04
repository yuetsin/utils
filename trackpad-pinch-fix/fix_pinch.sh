#!/usr/bin/env bash 

count=1
while [ $count -le 5 ]; do
    sudo cp ./com.apple.AppleMultitouchTrackpad_PINCH_OFF.plist ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist
    echo "Copied pinch off config once"
    sleep 0.1
    sudo cp ./com.apple.AppleMultitouchTrackpad_PINCH_ON.plist ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist
    echo "Copied pinch on config once"
    sleep 0.1
    count=$((count + 1))
done
echo "Finished."