#!/bin/bash

# I need & so it will not block and I can proceed to run cmds
mariadbd-safe &

until mysqladmin ping --silent; do
    echo "⏳ Waiting for MariaDB to be ready..."
    sleep 1
done

#Enter current password for root (enter for none): enter
#Switch to unix_socket authentication [Y/n] n
#Change the root password? [Y/n] n
#Remove anonymous users? [Y/n] y
#Disallow root login remotely? [Y/n] y
#Remove test database and access to it? [Y/n] y
#Reload privilege tables now? [Y/n] y
mysql_secure_installation <<EOF

n
n
y
y
y
y
EOF

#stop mariadb deamon so that I can launch it in foreground
mysqladmin -u root shutdown

exec mariadbd

# echo "& n n y y y y" | mysql_secure_installation
