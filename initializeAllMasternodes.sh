#!/bin/bash
# This script assumes four masternodes are being started for the first time.
# The masternode data directories are .pivx, .pivx2i, .pivx3 and .pivx4 respectively
# pivx.conf configuration files exist in each of these data directories. 

# make sure nothing is running yet
SERVICE="pivxd"
if pgrep -x "$SERVICE" >/dev/null
then
    echo "pivxd is running.  Shut all instances down before starting this script. "
    exit 0
else
    echo "starting pivx mansternode initialization process"
fi

echo " starting the first masternode.  We will use this to pull the blockchain, the copy it to the other three masternodes once it's synced"

cd ~/pivx-5.4.0/bin
./pivxd


exit

#cd ~/pivx-5.4.0/bin
#./pivxd $1
#./pivxd -datadir=/root/.pivx2 $1
#./pivxd -datadir=/root/.pivx3 $1
#./pivxd -datadir=/root/.pivx4 $1
#exit
