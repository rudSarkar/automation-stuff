#!/bin/bash

# Usages: nmapBot.sh domains.txt

filename=$1
date=$(date +%Y-%m-%d-%H-%M-%S)

if [ "$*" == "" ]; then
    echo "$0 domainList.txt"
    exit 1
fi

slackNotification() {
	curl -F file=@$line-$date -F "initial_comment=Nmap scan finished for $line $date" -F channels=#<channel-id> -H "Authorization: Bearer xxxx-xxxx-xxxx-xxxx" https://slack.com/api/files.upload
}

nmap() {
	while IFS= read -r line || [ -n "$line" ]; do
  		nmap -sV -A -p1- $line -o $line-$date
  		slackNotification
	done < $filename
}
