# LEMP Stack Development Environment

A local LEMP stack (Linux, Nginx, MariaDB, PHP) development environment using Nix and process-compose.

## Services

| Service | URL | Port |
|---------|-----|------|
| Nginx | https://localhost:8888 | 8888 |
| phpMyAdmin | https://localhost:8888/admin | 8888 |
| PHP-FPM | - | - |
| MariaDB | 127.0.0.1 | 3306 |

## Quick Start

1. Enter the development shell:
   ```bash
   nix develop
   ```

2. Start all services:
   ```bash
   process-compose up
   ```

3. Access the web server at https://localhost:8888

## Database

- **Host:** 127.0.0.1
- **Port:** 3306
- **User:** root
- **Password:** (no password)
- **Socket:** services/cache/run/mysqld.sock

## Files Structure

```
lemp/
├── www/                    # Web root
│   └── index.php           # PHP info page
├── services/
│   ├── scripts/            # Initialization scripts
│   │   ├── init.sh
│   │   └── setup.sh
│   └── config/             # Service configurations
│       ├── fpm/            # PHP-FPM config
│       └── nginx/          # Nginx config
├── process-compose.yaml    # Service definitions
└── flake.nix               # Nix flake
```

## Managing Services

- Start all services: `process-compose up`
- Stop services:`F10` to stop the process

## Customization

- Web root: Edit `www/index.php` or add your PHP files
- PHP config: Edit `services/config/fpm/php-fpm.conf`
- Nginx config: Edit `services/config/nginx/nginx.conf`
