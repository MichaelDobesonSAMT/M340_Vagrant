#!/bin/bash

#sudo apt update
sudo apt install -y mysql-server

sudo tee -a /etc/mysql/mysql.conf.d/mysqld.cnf <<EOF
  [mysqld]
  bind-address = 10.10.20.11
EOF


sudo mysql -e "CREATE DATABASE IF NOT EXISTS test_db; \
USE test_db; \
CREATE TABLE IF NOT EXISTS test(
    user VARCHAR(45) PRIMARY KEY, 
    pass VARCHAR(45)
); \
INSERT INTO test VALUES ('username', 'password'); \
CREATE USER 'test_user'@'10.10.20.10' IDENTIFIED BY 'test'; \
GRANT ALL PRIVILEGES ON test_db.* TO 'test_user'@'10.10.20.10'; \
FLUSH PRIVILEGES;"

sudo systemctl restart mysql