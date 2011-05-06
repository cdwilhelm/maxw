#!/bin/sh

services="postfix vsftpd"

for service in $services 
do
	x=`/sbin/service $service status 2>&1 | grep running`
	if [ "$x" = "" ]; then
          echo "It's down!! Attempting to restart."
          /sbin/service $service stop
          /sbin/service $service start
	fi
done
