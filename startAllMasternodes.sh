#!/bin/bash
cd ~/pivx-5.4.0/bin
./pivxd $1
./pivxd -datadir=/root/.pivx2 $1
./pivxd -datadir=/root/.pivx3 $1
./pivxd -datadir=/root/.pivx4 $1
exit
