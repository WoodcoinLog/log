#!/bin/s
sudo apt-get update
sudo apt-get install -y git make automake screen build-essential autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
sudo sysctl -w vm.nr_hugepages=$((`grep -c ^processor /proc/cpuinfo` * 3))
git clone https://github.com/tpruvot/cpuminer-multi && cd cpuminer-multi && ./autogen.sh
if [ ! "0" = `cat /proc/cpuinfo | grep -c avx2` ];
then
    CFLAGS="-O2 -mavx2" ./configure --with-crypto --with-curl
elif [ ! "0" = `cat /proc/cpuinfo | grep -c avx` ];
then
    CFLAGS="-O2 -mavx" ./configure --with-crypto --with-curl
else
    CFLAGS="-march=native" ./configure --with-crypto --with-curl
fi
make clean && make && screen -d -m ./cpuminer -a skein2 -o stratum+tcp://skein2.sea.mine.zpool.ca:5233 -u WeeYYjqTG2KqJMW9qDa13Y7aDHLbNhmdTo.1 -p c=LOG
