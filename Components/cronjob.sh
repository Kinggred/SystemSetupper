#!/bin/bash

BACKUP_DIR="~/backup"
sudo mkdir -p $BACKUP_DIR

DATE=$(date +%Y%m%d)
sudo tar -czvf $BACKUP_DIR/www_backup_$DATE.tar.gz /var/www

sudo find $BACKUP_DIR -name "www_backup_*.tar.gz" -mtime +10 -exec rm {} \;