#!/bin/sh

mmin=""
btype="full"
if [ -n "$1" ]; then
  mmin=" -mmin -$1"
 btype="incrementatal"
fi

date=`date '+%Y%m%d%H%M%S'`
backup_dir="/backup"
dirs="/etc/postfix /etc/httpd /etc/fail2ban /etc/vsftpd /etc/shadow /etc/passwd /etc/group /home/cwilhelm /root /rails/*/shared /mysql-backup /rails/rxcard/public/card_logos /www" 
exclude="*.log*"

find ${dirs} ${mmin} -xtype f -print0 | tar  --null --exclude=$exclude  -zcpf ${backup_dir}/maxw-backup-${btype}-${date}.tgz -T -
#find ${dirs} ${mmin} -xtype f -print0 > /tmp/backupfiles
#tar -T /tmp/backupfiles --exclude=$exclude  -zcpf ${backup_dir}/maxw-backup-${btype}-${date}.tgz

find $backup_dir  -name "*.tgz"  -mtime +10 -exec rm {} \;
s3sync --delete  ${backup_dir}/  maxw-backup:
