#!/bin/bash

TEST=$(speedtest)

DOWN=$(echo $TEST | awk -F 'Download:' '{print $2}' | awk -F 'Mbit/s' '{print $1}' | awk -F '.' '{print $1}' | tr -s " " | xargs)
UP=$(echo $TEST | awk -F 'Upload:' '{print $2}' | awk -F 'Mbit/s' '{print $1}' | awk -F '.' '{print $1}' | tr -s " " | xargs)
DATE=$(date +%F)
TIME=$(date +%T)

echo "$DOWN, $UP, $DATE, $TIME" > /srv/http/log/speedtest.last
echo "$DOWN, $UP, $DATE, $TIME" >> /srv/http/log/speedtest.log
