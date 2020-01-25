#!/bin/bash

TEST=$(speedtest)

DOWN=$(echo $TEST | awk -F 'Download:' '{print $2}' | awk -F 'Mbit/s' '{print $1}' | awk -F '.' '{print $1}')
UP=$(echo $TEST | awk -F 'Upload:' '{print $2}' | awk -F 'Mbit/s' '{print $1}' | awk -F '.' '{print $1}')
DATE=$(date +%F)
TIME=$(date +%T)

echo "$DOWN, $UP, $DATE, $TIME" >> speedtest.log
