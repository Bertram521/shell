#!/bin/bash
source /etc/profile
DATE=`date +%Y-%m-%d`
DATE_NOW=`date +%Y%m%d.%H%M`
old_day=$(date +%Y-%m-%d --date='5 days ago')
SERVER=`hostname`

MYSQL_DATA=/data/mysql
BACKUP_DIR=/data/backup/mysql/
DB_USER=backup
DB_PASSWD=backup123456


if [ -d $BACKUP_DIR ];
then
     mkdir -p $BACKUP_DIR/$DATE/jesscard
     cd $BACKUP_DIR/$DATE
for table in $(mysql -u${DB_USER} -p${DB_PASSWD} -h'10.112.28.124'  -e "show tables from jescard_data;" | egrep -w '(BrandR|Brand|Category|CategoryR|IgnoredEntitySource|Mall|RelevanceSession|SkuGood|SpuGood|LowestSku|HightestSku|GoodsLanguage|BrandLanguage)')
do
     mysqldump  -u${DB_USER} -p${DB_PASSWD} -h'10.112.28.124' --opt --lock-tables=false --routines --triggers --events --single-transaction --default-character-set=utf8 -f jescard_data $table | gzip >  $BACKUP_DIR/$DATE/jesscard/${table}.sql.gz
done   
    
    if [ -d $BACKUP_DIR ];
    then
        rm -rf ${BACKUP_DIR}/${old_day}
    else
        echo "$SERVER mysqldump error!"> /tmp/dump.txt
    fi	
else
	echo "data is not exist"
fi
