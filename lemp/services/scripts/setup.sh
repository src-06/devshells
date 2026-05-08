#!/usr/bin/env bash

BASE_DIR="$PWD/services"
CACHE_DIR="$BASE_DIR/cache"

mkdir -p "$CACHE_DIR"

ADMIN_DIR="$BASE_DIR/phpMyAdmin"

if [ ! -d "$ADMIN_DIR" ]; then
  echo "<==============[ Setup Starting ]==============>"
  echo ""
  echo ""
  echo "<===========[ Download phpMyAdmin ]============>"
  echo ""

  NAME="phpMyAdmin"
  VER="5.2.3"
  FULL_NAME="$NAME-$VER-all-languages"
  ARCHIVE="$FULL_NAME.tar.xz"

  if [ ! -f "$CACHE_DIR/$ARCHIVE" ]; then
    wget "https://files.phpmyadmin.net/$NAME/$VER/$ARCHIVE" -P "$CACHE_DIR"
  fi

  tar -xvJf "$CACHE_DIR/$ARCHIVE" -C "$CACHE_DIR"
  mv "$CACHE_DIR/$FULL_NAME" "$ADMIN_DIR"
  rm "$CACHE_DIR/$ARCHIVE"

  echo ""
  echo "<===========[ phpMyAdmin Complete ]============>"
  echo ""
  echo ""
fi

THEMES_DIR="$ADMIN_DIR/themes/darkwolf"

if [ ! -d "$THEMES_DIR" ]; then
  echo ""
  echo ""
  echo "<========[ Download phpMyAdmin Theme ]=========>"
  echo ""

  NAME="darkwolf"
  VER="5.2"
  ARCHIVE="$NAME-$VER.zip"

  if [ ! -f "$CACHE_DIR/$ARCHIVE" ]; then
    wget "https://files.phpmyadmin.net/themes/$NAME/$VER/$ARCHIVE" -P "$CACHE_DIR"
  fi

  unzip "$CACHE_DIR/$ARCHIVE" -d "$CACHE_DIR"
  mv "$CACHE_DIR/$NAME" "$THEMES_DIR"
  rm "$CACHE_DIR/$ARCHIVE"

  echo ""
  echo "<========[ phpMyAdmin Theme Complete ]=========>"
  echo ""
  echo ""
fi

CONFIG_FILE="$ADMIN_DIR/config.inc.php"

if [ ! -f "$CONFIG_FILE" ]; then
  echo ""
  echo ""
  echo "<=========[ Generate config.inc.php ]==========>"
  echo ""

  BLOWFISH_SECRET=$(openssl rand -base64 22)
  cat > "$CONFIG_FILE" <<EOF
<?php

declare(strict_types=1);

\$i = 1;

\$cfg['blowfish_secret'] = '$BLOWFISH_SECRET';

\$cfg['Servers'][\$i]['auth_type'] = 'cookie';
\$cfg['Servers'][\$i]['host'] = '127.0.0.1';
\$cfg['Servers'][\$i]['port'] = '3306';
\$cfg['Servers'][\$i]['AllowNoPassword'] = true;

\$cfg['DefaultLang'] = 'en';
\$cfg['ThemeDefault'] = 'darkwolf';
EOF

  cat "$CONFIG_FILE"

  echo ""
  echo "<=====[ Generate config.inc.php Complete ]=====>"
  echo ""
  echo ""
fi

SSL_DIR="$BASE_DIR/config/nginx/ssl"

mkdir -p "$SSL_DIR"

KEY_FILE="$SSL_DIR/localhost.key"
CRT_FILE="$SSL_DIR/localhost.crt"

if [ ! -f "$KEY_FILE" ] || [ ! -f "$CRT_FILE" ]; then
  echo ""
  echo ""
  echo "<========[ Generate SSL certificate ]==========>"
  echo ""

  openssl req \
    -x509 -nodes \
    -days 36000 \
    -newkey rsa:2048 \
    -keyout "$KEY_FILE" \
    -out "$CRT_FILE" \
    -subj "/CN=localhost"

  echo ""
  echo "<====[ Generate SSL certificate Complete ]=====>"
  echo ""
  echo ""
  echo "<==============[ Setup Complete ]==============>"
  echo ""
fi
