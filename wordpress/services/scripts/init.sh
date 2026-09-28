#!/usr/bin/env bash

{
  CACHE_DIR="$PWD/services/cache"
  DATA_DIR="$CACHE_DIR/data"

  if [ ! -d "$DATA_DIR/mysql" ]; then
    mkdir -p "$DATA_DIR" "$CACHE_DIR/run" "$CACHE_DIR/logs"

    MYSQL_BASEDIR="$(dirname "$(dirname "$(readlink -f "$(which mariadb-install-db)")")")"

    mariadb-install-db \
      --basedir="$MYSQL_BASEDIR" \
      --datadir="$DATA_DIR" \
      --auth-root-authentication-method=normal \
      >/dev/null
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
