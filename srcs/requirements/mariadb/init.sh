#!/bin/bash

# I need & so it will not block and I can proceed to run cmds
mariadbd-safe &

until mysqladmin ping --silent; do
    echo "⏳ Waiting for MariaDB to be ready..."
    sleep 1
done

mysql_secure_installation <<EOF

n
n
Y
Y
Y
Y
EOF

#stop mariadb deamon so that I can launch it in foreground
mysqladmin -u root shutdown

exec mariadbd-safe

# echo "& n n y y y y" | mysql_secure_installation
