#!/bin/bash

GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

DB="../database/monitor.db"
WEBSITE_FILE="../data/websites.txt"
LOG_FILE="../logs/monitor.log"

echo "===== Website Availability Check : $(date) =====" >> $LOG_FILE

while read website
do

timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# DNS Check
host $website > /dev/null 2>&1
if [ $? -eq 0 ]
then
    dns_status="OK"
else
    dns_status="FAIL"
fi

# Ping Check
ping -c 1 $website > /dev/null 2>&1
if [ $? -eq 0 ]
then
    ping_status="OK"
else
    ping_status="FAIL"
fi

# HTTP Status
http_status=$(curl -o /dev/null -s -w "%{http_code}" https://$website)

# Response Time
response_time=$(curl -o /dev/null -s -w "%{time_total}" https://$website)

# ALERT
if [[ "$http_status" == "000" || "$http_status" =~ ^[45][0-9]{2}$ ]]; then
    bash alert.sh "🚨 Website DOWN: $website (HTTP $http_status)"
fi

# STATUS TEXT
if [[ "$http_status" == "200" || "$http_status" == "301" || "$http_status" == "302" ]]
then
    status="UP"
    echo -e "$timestamp | $website | UP | ${response_time}s" | tee -a $LOG_FILE
else
    status="DOWN"
    echo -e "$timestamp | $website | DOWN | HTTP $http_status" | tee -a $LOG_FILE
fi

# INSERT INTO DATABASE
sqlite3 $DB <<EOF
INSERT INTO monitor (website,timestamp,dns,ping,http_status,response_time)
VALUES ('$website','$timestamp','$dns_status','$ping_status','$http_status','$response_time');
EOF

done < $WEBSITE_FILE
