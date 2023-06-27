#!/bin/bash

sudo cp cronjob.sh ~/backup_cronjob.sh

(crontab -l 2>/dev/null; echo "0 0 * * * ~/backup_cronjob.sh") | crontab -