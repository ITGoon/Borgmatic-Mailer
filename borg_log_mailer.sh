#!/bin/bash
email="EMAIL TO SEND NOTIFS TO"

# Generate our mail message
bash mailmaker.sh > message.txt

# This can probably be removed... I was worried the above would hang
sleep 1

# Send our mail message based on the content of message.txt 
cat message.txt | msmtp -a default $email
