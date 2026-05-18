# DevShells

A collection of Nix flake templates providing reproducible development environments.

## Requirements

- [Nix](https://nixos.org/download.html) with flake support enabled
- **Windows:** Use [WSL](https://docs.microsoft.com/en-us/windows/wsl/) with [Nix](https://nixos.org/download.html) installed inside the Linux distribution

## Customization

You can customize which packages you want to use in the generated `flake.nix`:

```nix
packages = with pkgs; [
   ...
];
```

To check package availability, visit [NixOS Search](https://search.nixos.org/packages).

## Templates

| Template | Description |
|----------|-------------|
| `empty` | Minimal development environment template |
| `postgresql` | PostgreSQL development environment with helper scripts |
| `mariadb` | MariaDB development environment with helper scripts |
| `prisma` | Prisma development environment with prisma-engines |
| `lemp` | LEMP stack (Nginx, MariaDB, PHP) with process-compose |
| `wordpress` | WordPress local development environment with Nginx, PHP-FPM, and MariaDB |

## Usage

### Default (Empty) Template

```bash
nix flake init -t github:src-06/devshells
```

### PostgreSQL Template

```bash
nix flake init -t github:src-06/devshells#postgresql
```

### MariaDB Template

```bash
nix flake init -t github:src-06/devshells#mariadb
```

### Prisma Template

```bash
nix flake init -t github:src-06/devshells#prisma
```

### LEMP Template

```bash
nix flake init -t github:src-06/devshells#lemp
```

### WordPress Template

```bash
nix flake init -t github:src-06/devshells#wordpress
```

## Database Templates

Both PostgreSQL and MariaDB templates include a `db` helper command:

```bash
db up      # Initialize and start the database
db down    # Stop the database
db status  # Check database status
```

### PostgreSQL

- **Host:** `127.0.0.1` (or use socket at `.postgres/socket/`)
- **Port:** `5432`
- **User:** `$USER` (your user login)
- **Database:** `postgres`

### MariaDB

- **Host:** `127.0.0.1`
- **Port:** `3306`
- **User:** `root`
- **Database:** `mariadb`

## Prisma Template

The Prisma template provides a development environment for working with Prisma ORM:

- **Includes:** `prisma-engines` (v7 by default, compatible with Prisma 5+)
- **Includes:** OpenSSL dev libraries for native database connectors

## LEMP Template

The LEMP template provides a local LEMP stack using process-compose:

- **Includes:** Nginx, MariaDB, and PHP
- **Management:** Use `process-compose up` to start all services
- **phpMyAdmin:** Included for database management (accessible via configured port)

### Services:
- **Nginx:** [https://localhost:8888](https://localhost:8888) or [https://127.0.0.1:8888](https://127.0.0.1:8888)
- **phpMyAdmin:** [https://localhost:8888/admin](https://localhost:8888/admin) or [https://127.0.0.1:8888/admin]
- **PHP-FPM:** Runs via process-compose
- **MariaDB:** Runs via process-compose

## WordPress Template

The WordPress template provides a local WordPress development environment with Nginx, PHP-FPM, and MariaDB using process-compose.

- **Management:** Use `process-compose up` to start all services
- **phpMyAdmin:** Included for database management

### Services:
- **WordPress:** [https://localhost:8888](https://localhost:8888) or [https://127.0.0.1:8888](https://127.0.0.1:8888)
- **phpMyAdmin:** [https://localhost:8888/admin](https://localhost:8888/admin) or [https://127.0.0.1:8888/admin](https://127.0.0.1:8888/admin)
- **PHP-FPM:** Runs via process-compose
- **MariaDB:** Runs via process-compose

## Supported Systems

| OS | Architecture |
|----|--------------|
| Linux | x86_64, aarch64 |
| macOS | x86_64, aarch64 (Apple Silicon) |

## Getting Started

1. Initialize a template in your project:
   ```bash
   nix flake init -t github:src-06/devshells#postgresql
   ```

2. Enter the development shell:
   ```bash
   nix develop
   ```

3. Start the database (for database templates):
   ```bash
   db up
   ```

## License

MIT
