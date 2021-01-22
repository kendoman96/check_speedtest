
#######################################################
## Used on Nagios server with cron job every 10 mins ##
#######################################################
#!/bin/bash

main ()
        {

# Remove old logs
        rm speedtest.last

# Pull logs
        wget server/log/speedtest.last

        CURRENT=$(cat speedtest.last)
        LAST=$(tail -1 /var/www/html/logs/speedtest.log)

        if [[ $LAST == $CURRENT ]]; then
                exit;
        else
# Copies and re-organizes pulled logs to http log file
                cat speedtest.last >> /var/www/html/logs/speedtest.log
                cat speedtest.last  >> /var/www/html/logs/speedtest.xls
        fi

        }

test ()
        {

        FILE=speedtest.last
        if [[ -f "$FILE" ]]; then
                echo "File Exists"
                main;
        else
                echo "File DNE"
                echo "#DOWN     UP     DATE   TIME" > /var/www/html/logs/speedtest.log
                main;
        fi

        }

test;
