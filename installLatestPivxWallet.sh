#!/bin/bash
echo "This script will setup four PIVX wallets using four cores.  It makes several assumptions currently"
echo ""
echo ""

read -p "Please enter node username (same value will be used for all four nodes) " uname
echo $uname
read -p "Please enter node password (same value will be used for all four nodes) " upasswd 
echo $upasswd
read -p "Please enter IPv4 IP address <xxx.xxx.xxx.xxx> " ipv4addr
echo $ipv4addr
read -p "Please enter IPv6 IP address <xxxx.xxxx.xxxx.xxxx::x> " ipv6addrIn
echo $ipv6addrIn
ipv6addr="[" 
ipv6addr+=$ipv6addrIn
ipv6addr+="]"
echo $ipv6addr

cp conf.template ~/pivx.conf
sed -i s/"<username>"/$uname/g ~/pivx.conf
sed -i s/"<password>"/$upasswd/g ~/pivx.conf
sed -i s/"<vpsip>"/$ipv4addr/g ~/pivx.conf

cp conf.template ~/pivx2.conf
sed -i s/"<username>"/$uname/g ~/pivx2.conf
sed -i s/"<password>"/$upasswd/g ~/pivx2.conf
sed -i s/"<vpsip>"/$ipv6addr/g ~/pivx2.conf
sed -i s/12345/12346/g ~/pivx2.conf
sed -i s/"rpcallowip=127.0.0.1"/"rpcallowip=::1"/g ~/pivx2.conf


cp conf.template ~/pivx3.conf
sed -i s/"<username>"/$uname/g ~/pivx3.conf
sed -i s/"<password>"/$upasswd/g ~/pivx3.conf
sed -i s/"12345"/"12347"/g ~/pivx3.conf
sed -i s/"rpcallowip=127.0.0.1"/"rpcallowip=::1"/g ~/pivx3.conf
ipv6addr2=$(echo $ipv6addr | sed 's/\(.*\)[0-9])*/\12/')
echo $ipv6addr2 
sed -i s/"<vpsip>"/$ipv6addr2/g ~/pivx3.conf


cp conf.template ~/pivx4.conf
sed -i s/"<username>"/$uname/g ~/pivx4.conf
sed -i s/"<password>"/$upasswd/g ~/pivx4.conf
sed -i s/"12345"/"12348"/g ~/pivx4.conf
sed -i s/"rpcallowip=127.0.0.1"/"rpcallowip=::1"/g ~/pivx4.conf
ipv6addr3=$(echo $ipv6addr | sed 's/\(.*\)[0-9])*/\13/')
echo $ipv6addr3 
sed -i s/"<vpsip>"/$ipv6addr3/g ~/pivx4.conf

# just a test
#exit 0
# end just a test
echo "download and install PIVX wallet"
echo "sudo apt-get update && sudo apt-get -y upgrade"
sudo apt-get update && sudo apt-get -y upgrade
echo "enable_ipv6"
enable_ipv6
echo "cd ~ && wget https://github.com/PIVX-Project/PIVX/releases/download/v5.4.0/pivx-5.4.0-x86_64-linux-gnu.tar.gz"
cd ~ && wget https://github.com/PIVX-Project/PIVX/releases/download/v5.4.0/pivx-5.4.0-x86_64-linux-gnu.tar.gz
echo "tar -zxvf pivx-5.4.0-x86_64-linux-gnu.tar.gz"
tar -zxvf pivx-5.4.0-x86_64-linux-gnu.tar.gz
echo "cd ~/pivx-5.4.0/ && ./install-params.sh"
cd ~/pivx-5.4.0/ && ./install-params.sh
echo "mkdir ~/.pivx"
mkdir ~/.pivx 
echo "mkdir ~/.pivx2"
mkdir ~/.pivx2
echo "mkdir ~/.pivx3"
mkdir ~/.pivx3
echo "mkdir ~/.pivx4"
mkdir ~/.pivx4


# the rest is TBD experimental code for now
# just a test
exit 0
# end just a test
echo "configure network to support two additional ipv6 addresses"


echo "Configuration files created. Currently these still need Masternode private keys that can be created using the Secure PIVX Masternode Tool (SPMT)"



echo "mv ~/pivx.conf ~/.pivx/pivx.conf" 
mv ~/pivx.conf ~/.pivx/pivx.conf
echo "mv ~/pivx2.conf ~/.pivx2/pivx.conf" 
mv ~/pivx2.conf ~/.pivx2/pivx.conf
echo "mv ~/pivx3.conf ~/.pivx3/pivx.conf" 
mv ~/pivx3.conf ~/.pivx3/pivx.conf
echo "mv ~/pivx4.conf ~/.pivx4/pivx.conf" 
mv ~/pivx4.conf ~/.pivx4/pivx.conf



# download the latest blockchain snapshot
mkdir ~/snapshot
cd ~/snapshot
wget https://snapshot.deansparrow.com/PIVXsnapshotLatest.zip


# copy into each of the four wallet data directories
cp -r blocks/ ~/.pivx
cp -r sporks/ ~/.pivx
cp -r zerocoin/ ~/.pivx
cp -r chainstate/ ~/.pivx

cp -r blocks/ ~/.pivx2
cp -r sporks/ ~/.pivx2
cp -r zerocoin/ ~/.pivx2
cp -r chainstate/ ~/.pivx2

cp -r blocks/ ~/.pivx3
cp -r sporks/ ~/.pivx3
cp -r zerocoin/ ~/.pivx3
cp -r chainstate/ ~/.pivx3

cp -r blocks/ ~/.pivx4
cp -r sporks/ ~/.pivx4
cp -r zerocoin/ ~/.pivx4
cp -r chainstate/ ~/.pivx4
