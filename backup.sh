#!/bin/bash
# Script de backup de la base de données GToken
if [[ $(date +%H) -ge 00 && $(date +%H) -lt 01 ]];then
	mysqldump --defaults-file=/home/gtokenbackup/.backup.cnf -u admin_gtkuser admin-gtokenbdd > /opt/backup/backup-$(date +%D).sql
	for file in /opt/backup
	do
		date_backup=$(ls | awk -F '_' {'print $2'})
		if [ $date_backup == $(date +%F -d "14 day ago") ];then
			rm $file
		fi
	done
fi
