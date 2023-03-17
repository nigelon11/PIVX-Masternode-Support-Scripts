#!/bin/bash

export vps=" $(hostname -s)  "

read -p "Please enter the first PIVX Masternode # for this VPS ($vps).  The script assumes contiguos numbering " mn_number
echo $mn_number

# update script to reflect the masternode number
cp monitorAndRestartMasternodes.sh ~/monitorAndRestartMasternodes.sh
sed -i "s/MN_START_INDEX/$mn_number/g" ~/monitorAndRestartMasternodes.sh


# Add cron job
(crontab -l ; echo "*/10 * * * * ~/monitorAndRestartMasternodes.sh") | crontab -

# Make sure the script is executable
chmod +x ~/monitorAndRestartMasternodes.sh