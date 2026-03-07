# DevShells

A collection of Nix flake templates providing reproducible development environments with database support.

## Templates

| Template | Description |
|----------|-------------|
| `empty` | Minimal development environment template |
| `postgresql` | PostgreSQL development environment with helper scripts |
| `mariadb` | MariaDB development environment with helper scripts |
| `prisma` | Prisma development environment with prisma-engines |

## Usage

### Default (Empty) Template

```bash
nix flake init --template github:src-06/devshells
```

### PostgreSQL Template

```bash
nix flake init --template github:src-06/devshells#postgresql
```

### MariaDB Template

```bash
nix flake init --template github:src-06/devshells#mariadb
```

### Prisma Template

```bash
nix flake init --template github:src-06/devshells#prisma
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

## Supported Systems

- x86_64-linux
- aarch64-linux
- x86_64-darwin
- aarch64-darwin

## Getting Started

1. Initialize a template in your project:
   ```bash
   nix flake init --template github:src-06/devshells#postgresql
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
