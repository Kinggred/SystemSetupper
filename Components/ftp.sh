#!/bin/bash

sudo apt-get install -y vsftpd

sudo systemctl enable vsftpd
sudo systemctl start vsftpd
