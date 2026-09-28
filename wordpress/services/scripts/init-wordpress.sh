#!/usr/bin/env bash

CACHE_DIR="$PWD/services/cache"
SOCKET_DIR="$CACHE_DIR/run/mysqld.sock"

if [ ! -f "$SOCKET_DIR" ]; then
  until mariadb-admin --socket="$SOCKET_DIR" ping &>/dev/null; do
    sleep 1
  done

  mariadb --socket="$SOCKET_DIR" -u root <<EOF
CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER IF NOT EXISTS 'wordpress'@'localhost';

ALTER USER 'wordpress'@'localhost'
IDENTIFIED BY 'wordpress';

GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';

FLUSH PRIVILEGES;
EOF
fi
