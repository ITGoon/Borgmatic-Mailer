#!/bin/bash

# Set the path to the directory holding the Borgmatic Mailer scripts
operdir="/Path/To/BorgmaticMailerFolder"
cd $operdir

# Clear the message.txt file or it will be appended to 
> message.txt

# Grab the backup result
subject=$(./errorcheck.sh)

email="EMAIL TO SEND NOTIFS TO"

# This should be your SMTP account (Gmail, etc.)
fromaddr="FROM ADDRESS"

# Name of the machine you are backing up
servname="SERVER NAME"

# Create the message content and append the entire backup log 
echo "To: $email"
echo "From: $fromaddr"
echo "Subject: Backup $servname is Complete - $subject"
echo "Hello, Backups for $servname have run and the result was $subject"
echo ""
echo "Log file:"
echo ""
cat /var/log/borgmatic.log
