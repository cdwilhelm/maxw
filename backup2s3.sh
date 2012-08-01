#!/bin/sh

date=`date '+%Y%m%d%H%M%S'`
backup_dir="/backup"
dirs="/etc/postfix /etc/httpd /etc/fail2ban /etc/vsftpd /etc/shadow /etc/passwd /etc/group /home/cwilhelm /root /rails/*/shared /mysql-backup /rails/rxcard /www" 
exclude="*.log*"
tar --exclude=$exclude -zcpf ${backup_dir}/maxw-backup-${date}.tgz ${dirs}

find $backup_dir  -name "*.tgz"  -mtime +10 -exec rm {} \;
s3sync --delete  ${backup_dir}/  maxw-backup:
