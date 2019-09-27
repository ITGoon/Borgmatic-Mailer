#!/bin/bash

# Search the log for an error
grep -q "Error" /var/log/borgmatic.log; [ $? -eq 0 ] && subject="Error" || subject="Success"

# Return whether the backup had an error or not
echo $subject
