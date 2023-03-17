#!/bin/bash

# This script will monitor the masternodes and restart them if they are not running
# This script should be run as a cron job every 5 minutes

url='https://discord.com/api/webhooks/1085939028223856681/2lbE756pO8lDmKvpJ5we7W83YMIDgslcdCaaY0If2BU3to_y8TEFpulm_N7LjcOKxB0T'
export pivx_version="5.5.0"
export mn_start_ix=MN_START_INDEX
export pivx_node1=".pivx"
export pivx_node2=".pivx2"
export pivx_node3=".pivx3"
export pivx_node4=".pivx4"
export vps=" $(hostname -s)  "

export exec_command="/root/pivx-$pivx_version/bin/pivxd -datadir=/root/$pivx_node1"

if ps aux | grep -v grep | grep -w "$exec_command"  > /dev/null
then
    echo Daemon running
else
                        mynode=$(($mn_start_ix + 0))
                        myip="$(curl -s http://whatismyip.akamai.com/)"
                        message="<@370624208541319178>  `date`: PIVX $mynode restarted $vps $myip"
                        msg_content=\"$message\"
                        curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
                        eval "$exec_command &"
fi
export exec_command="/root/pivx-$pivx_version/bin/pivxd -datadir=/root/$pivx_node2"

if ps aux | grep -v grep | grep -w "$exec_command"  > /dev/null
then
    echo Daemon running
else
                        mynode=$(($mn_start_ix + 1))
                        myip="$(curl -s http://whatismyip.akamai.com/)"
                        message="<@370624208541319178>  `date`: PIVX $mynode restarted $vps $myip"
                        msg_content=\"$message\"
                        curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
                        eval "$exec_command &"
fi
export exec_command="/root/pivx-$pivx_version/bin/pivxd -datadir=/root/$pivx_node3"

if ps aux | grep -v grep | grep -w "$exec_command"  > /dev/null
then
    echo Daemon running
else
                        mynode=$(($mn_start_ix + 2))
                        myip="$(curl -s http://whatismyip.akamai.com/)"
                        message="<@370624208541319178>  `date`: PIVX $mynode  restarted $vps $myip"
                        msg_content=\"$message\"
                        curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
                        eval "$exec_command &"
fi
export exec_command="/root/pivx-$pivx_version/bin/pivxd -datadir=/root/$pivx_node4"

if ps aux | grep -v grep | grep -w "$exec_command"  > /dev/null
then
    echo Daemon running
else
                        mynode=$(($mn_start_ix + 3))
                        myip="$(curl -s http://whatismyip.akamai.com/)"
                        message="<@370624208541319178>  `date`: PIVX $mynode restarted $vps $myip"
                        msg_content=\"$message\"
                        curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
                        eval "$exec_command &"
fi
