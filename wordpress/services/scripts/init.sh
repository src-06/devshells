#!/usr/bin/env bash

{
CACHE_DIR="$PWD/services/cache"
DATA_DIR="$CACHE_DIR/data"
SOCKET_DIR="$CACHE_DIR/run/mysqld.sock"

if [ ! -d "$DATA_DIR/mysql" ]; then
  mkdir -p "$DATA_DIR" "$CACHE_DIR/run" "$CACHE_DIR/logs"
  mariadb-install-db \
    --datadir="$DATA_DIR" \
    --auth-root-authentication-method=normal \
    > /dev/null

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
} >/dev/null 2>&1
echo "<==========[ WORDPRESS ]==========>"
echo "  WordPress:"
echo "    - https://127.0.0.1:8888"
echo "    - https://localhost:8888"
echo ""
echo "  phpMyAdmin:"
echo "    - https://127.0.0.1:8888/admin"
echo "    - https://localhost:8888/admin"
echo ""
echo "  MariaDB:"
echo "    - Host: 127.0.0.1"
echo "    - Port: 3306"
echo "    - User: wordpress"
echo "    - Pswd: wordpress"
echo "    - DBName: wordpress"
echo ""
echo "  Stop WordPress: Press [ F10 ]"
echo "<==========[ WORDPRESS ]==========>"
