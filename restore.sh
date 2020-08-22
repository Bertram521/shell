#!/bin/bash
source /etc/profile
time=`date +%F`

tables=(
Brand
BrandR
BrandLanguag
)

for table in `echo ${tables[@]}`
do
#gzip -d /data/backup/mysql/${time}/jesscard/${table}.[0-9]*.gz
#mv /data/backup/mysql/${time}/jesscard/${table}.[0-9]*.sql /data/backup/mysql/${time}/jesscard/${table}.sql
echo "==========${table} restore started at `date +%F\ %H:%M:%S`=========="  >> /data/scripts/restore.log
gunzip < /data/backup/mysql/${time}/${table}.sql.gz |mysql -uroot -ptest1234 -h10.196.85.18 --default-character-set=utf8 --max-allowed-packet=512M -f bertram_data 
echo "==========${table} restore ended at `date +%F\ %H:%M:%S`==========" >> /data/scripts/restore.log
#gzip /data/backup/mysql/${time}/jesscard/${table}.sql
done

