#!/bin/bash

for domain in `cat domains.txt`
do
    domainresult=$(whois $domain | grep -i 'expiry date:')
    curl -s -X POST --data "payload={\"channel\": \"<CHANNEL>\", \"username\": \"Domain Expiry Bot\", \"text\": \"${domain} ${domainresult} \n \"}" https://hooks.slack.com/services/
    sleep 1;
done
