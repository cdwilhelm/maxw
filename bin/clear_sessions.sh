#!/bin/sh

dbs="hpdl_production"
for db in $dbs 
do
mysql --defaults-file=/root/.my.cnf  $db -e'delete from sessions where updated_at < date_sub(now(), interval 8  hour)'
done
