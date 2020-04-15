#!/bin/bash
source /etc/profile
time=`date +%F`

tables=(
Brand
BrandR
Category
CategoryR
IgnoredEntitySource
Mall
RelevanceSession
SkuGood
SpuGood
LowestSku
HightestSku
GoodsLanguage
BrandLanguag
)

for table in `echo ${tables[@]}`
do
#gzip -d /data/backup/mysql/${time}/jesscard/${table}.[0-9]*.gz
#mv /data/backup/mysql/${time}/jesscard/${table}.[0-9]*.sql /data/backup/mysql/${time}/jesscard/${table}.sql
echo "==========${table} restore started at `date +%F\ %H:%M:%S`=========="  >> /data/scripts/restore.log
gunzip < /data/backup/mysql/${time}/jesscard/${table}.sql.gz |mysql -uroot -ptest1234 -h39.116.231.18 --default-character-set=utf8 --max-allowed-packet=512M -f jescard_data 
echo "==========${table} restore ended at `date +%F\ %H:%M:%S`==========" >> /data/scripts/restore.log
#gzip /data/backup/mysql/${time}/jesscard/${table}.sql
done

