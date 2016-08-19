#!/bin/sh
# check if any changes detected?
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts > temp_hosts # fetch new file
mkdir -p ~/Documents/hosts-backup
filename="~/Documents/hosts-backup/hosts-$(date +%Y%m%d-%H%M%S)"
sudo cp /private/etc/hosts ~/Documents/hosts-backup/hosts-`date +%Y%m%d-%H%M%S` # back-up the old hosts file with a timestamp
sudo cp temp_hosts /private/etc/hosts # overwrite old hosts file with the downloaded one
rm temp_hosts
dscacheutil -flushcache;sudo killall -HUP mDNSResponder # flush dns catche + restart DNS service
