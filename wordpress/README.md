# WordPress Development Environment

A local WordPress development environment using Nix, Nginx, PHP-FPM, and MariaDB.

## Services

| Service | URL | Port |
|---------|-----|------|
| WordPress | https://localhost:8888 | 8888 |
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

3. Complete the WordPress setup wizard at https://localhost:8888

## Database Configuration

When setting up WordPress, use the following credentials:

| Field | Value |
|-------|-------|
| Database Name | wordpress |
| Username | wordpress |
| Password | wordpress |
| Database Host | 127.0.0.1 |
| Table Prefix | wp_ |

> **Important:** Use `127.0.0.1` instead of `localhost` for the database host.

## Files Structure

```
wordpress/
├── wordpress/              # Web root (WordPress files)
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
- Stop services: `F10` to stop the process

## Customization

- WordPress files: Edit files in `wordpress/` directory
- PHP config: Edit `services/config/fpm/php.ini` or `php-fpm.conf`
- Nginx config: Edit `services/config/nginx/nginx.conf`
