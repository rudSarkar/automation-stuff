#!/bin/bash

# Usages: nmapBot.sh domains.txt

filename=$1
date=$(date +%Y-%m-%d-%H-%M-%S)

if [ "$*" == "" ]; then
    echo "$0 domainList.txt"
    exit 1
fi

slackNotification() {
	curl -F file=@$line-$date -F "initial_comment=:white_check_mark: Nmap scan finished for $line" -F channels=#<channel-id> -H "Authorization: Bearer xxxx-xxxx-xxxx-xxxx" https://slack.com/api/files.upload
}

while IFS= read -r line || [ -n "$line" ]; do
	nmap -sV -A -p1- $line > $line-$date
	slackNotification
done < $filename
