#!/bin/bash

URL="https://google.com"
LOGFILE="website_monitor.log"

while true; do
	echo "Checking $URL ..."
	if curl -s --head --request GET "$URL" | grep "200 OK" > /dev/null; then
		echo "$(date): $URL is UP" | tee -a "$LOGFILE"
	else 
		echo "$(date): $URL is DOWN" | tee -a "$LOGFILE"
	fi
	echo "Waiting 5 minutes before next check..."
	sleep 300
done
