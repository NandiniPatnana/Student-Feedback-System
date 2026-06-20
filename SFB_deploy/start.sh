#!/bin/bash
set -e

# Start MySQL
service mysql start

# Wait for MySQL to be ready
until mysqladmin ping --silent; do
  sleep 1
done

# Run init script (creates DB, table, sets root password)
mysql -u root < /init.sql

# Start Tomcat in foreground (keeps container alive)
/usr/local/tomcat/bin/catalina.sh run
