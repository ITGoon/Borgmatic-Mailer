# Borgmatic Mailer
This is a set of scripts to notify you via email if your Borgmatic-run Borg backups failed or not. It will also send the log so you can see the size of your backup and other details. 
<br><br>
This could probably all be in one bash script but I was writing it quickly cause I am super not cool with no notifications for my backups.
<br><br>
Written entirely in bash
<br>

## Requirements
msmtp package<br>
A working borgmatic job<br>
An SMTP server (I use gmail)<br>

## Credits
https://hostpresto.com/community/tutorials/how-to-send-email-from-the-command-line-with-msmtp-and-mutt/<br>
https://guides.codechewing.com/bash/conditionally-assign-value-to-variable-bash<br>
https://github.com/witten/borgmatic<br>
https://www.borgbackup.org/<br>
https://wiki.debian.org/msmtp<br><br>

## Setup
First we assume you have a some sort of cron entry for borgmatic and also are generating a log file similar to the below:<br>
<br>
0 3 * * * root PATH=$PATH:/usr/local/bin /root/.local/bin/borgmatic -v 2 > /var/log/borgmatic.log 2>&1<br><br>
This cron entry runs borgmatic at 3 AM nightly and copies the output to a log file at /var/log/borgmatic.log (I have it in /etc/cron.d/borgmatic)<br>
If your log is going to be elsewhere edit my Borgmatic Mailer scripts to reflect the location.<br><br>
1) Install msmtp (For Debian: apt-get install msmtp)<br>
2) Configure your .msmtprc file (This is your msmtp configuration file), I've included an example for Gmail.<br>
3) Test ability to send an email with: echo "This is a test message" | msmtp -a default YourEmail@email.com<br>
4) Configure the variables in mailmaker.sh and borg_log_mailer.sh
5) Edit your borgmatic config.yaml to execute the Borgmatic Mailer main script (These options are under the hooks section, remember to change the paths):<br>
    after_backup:<br>
         - bash /Path/To/borg_log_mailer.sh<br>
    on_error:<br>
         - bash /Path/To/borg_log_mailer.sh<br>

6) Test run your backup job with: borgmatic -v 2 > /var/log/borgmatic.log 2>&1

