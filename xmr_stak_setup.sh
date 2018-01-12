#!/bin/bash
sudo su
apt-get --assume-yes update
apt-get --assume-yes install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev screen git nano
git clone https://github.com/fireice-uk/xmr-stak.git
cd xmr-stak/
echo -e "#pragma once\nconstexpr double fDevDonationLevel = 0;" > xmrstak/donate-level.hpp
cmake . -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF
make install
cd bin/
curl https://raw.githubusercontent.com/JonathanGawrych/cryptonight-mining-setup/master/cpu.txt > cpu.txt
sysctl -w vm.nr_hugepages=128
