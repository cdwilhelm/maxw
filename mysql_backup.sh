#!/bin/sh

dir='/mysql-backup'
mydate=`date '+%Y%m%d%H%M%S'`
mysqldump --defaults-file=/root/.my.cnf  hpdl_production > ${dir}/hpdl_production.sql.${mydate}
mysqldump --defaults-file=/root/.my.cnf  mtbcoach_wp > ${dir}/mtbcoach.sql.${mydate}
mysqldump --defaults-file=/root/.my.cnf  trekstore_wp > ${dir}/trekstore.sql.${mydate}
mysqldump --defaults-file=/root/.my.cnf rxcard_production > ${dir}/rxcard.sql.${mydate}
mysqldump --defaults-file=/root/.my.cnf rxsupport_production > ${dir}/rxsupport.sql.${mydate}
mysqldump --defaults-file=/root/.my.cnf pha0913506120138  > ${dir}/pharma.sql.${mydate}
mysqldump  --defaults-file=/root/.my.cnf race_production  > ${dir}/race.sql.${mydate}
mysqldump  --defaults-file=/root/.my.cnf livehard  > ${dir}/livehard.sql.${mydate}

find $dir  -name "*.sql.*"  -mtime +15 -exec rm {} \;
mysqlcheck --defaults-file=/root/.my.cnf -oAc | grep -V OK

