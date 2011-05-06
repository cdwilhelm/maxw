#!/bin/sh

mysql --defaults-file=/root/.my.cnf  hpdl_production -e'delete from sessions where updated_at < date_sub(now(), interval 8  hour)'

