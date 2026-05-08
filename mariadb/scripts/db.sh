#!/usr/bin/env bash
set -e

CMD="$1"
BASE_DIR="$PWD/.mariadb"
DATA_DIR="$BASE_DIR/data"
SOCKET="$BASE_DIR/run/mysql.sock"
PID_FILE="$BASE_DIR/run/mysql.pid"
LOG_FILE="$BASE_DIR/logs/mysql.log"

export DBHOST=127.0.0.1
export DBPORT=3306

mkdir -p "$BASE_DIR"

case "$CMD" in
  up)
    if [ ! -d "$DATA_DIR/mysql" ]; then
      echo "Init mariadb"
      mariadb-install-db \
        --datadir="$DATA_DIR" \
        --auth-root-authentication-method=normal \
        > /dev/null
    fi

    echo "Starting mariadb"
    mariadbd \
      --datadir="$DATA_DIR" \
      --socket="$SOCKET" \
      --port="$DBPORT" \
      --bind-address="$DBHOST" \
      --pid-file="$PID_FILE" \
      --log-error="$LOG_FILE" &

    echo "Waiting for mariadb to be ready..."
    for _ in $(seq 1 30); do
      if mariadb-admin --socket="$SOCKET" ping &>/dev/null; then
        break
      fi
      sleep 1
    done

    echo "Creating database 'mariadb'..."
    mariadb --socket="$SOCKET" -u root -e "CREATE DATABASE IF NOT EXISTS mariadb;"

    clear

    echo ""
    echo "========================================"
    echo "  Host: $DBHOST"
    echo "  Port: $DBPORT"
    echo "  User: root"
    echo "  Password: (no password)"
    echo "  Database: mariadb"
    echo "========================================"
    echo ""
  ;;

  down)
    echo "Stopping mariadb"
    if [ -f "$PID_FILE" ]; then
      kill "$(cat "$PID_FILE")" || true
    fi
  ;;

  status)
    [ -f "$PID_FILE" ] && echo "MariaDB running" || echo "MariaDB stopped"
  ;;

  *)
    echo "Usage: db {up|down|status}"
    exit 1
  ;;
esac
