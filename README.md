# DevShells

A collection of Nix flake templates providing reproducible development environments.

## Requirements

- [Nix](https://nixos.org/download.html) with flake support enabled
- **Windows:** Use [WSL](https://docs.microsoft.com/en-us/windows/wsl/) with [Nix](https://nixos.org/download.html) installed inside the Linux distribution

## Templates

| Template | Description |
|----------|-------------|
| `empty` | Minimal development environment template |
| `lemp` | LEMP stack (Nginx, MariaDB, PHP) with process-compose |
| `wordpress` | WordPress local development environment (Nginx, PHP-FPM, and MariaDB) with process-compose |

## Usage

### Default (Empty) Template

```bash
nix flake init -t github:src-06/devshells
```

### LEMP Template

```bash
nix flake init -t github:src-06/devshells#lemp
```

### WordPress Template

```bash
nix flake init -t github:src-06/devshells#wordpress
```

## LEMP Template

The LEMP template provides a local LEMP stack using process-compose:

- **Includes:** Nginx, MariaDB, and PHP
- **Management:** Use `process-compose up` to start all services
- **phpMyAdmin:** Included for database management

### Services

- **Nginx:** [https://localhost:8888](https://localhost:8888) or [https://127.0.0.1:8888](https://127.0.0.1:8888)
- **phpMyAdmin:** [https://localhost:8888/admin](https://localhost:8888/admin) or [https://127.0.0.1:8888/admin](https://127.0.0.1:8888/admin)
- **PHP-FPM:** Runs via process-compose
- **MariaDB:** Runs via process-compose

### MariaDB Configuration

- **Host:** `127.0.0.1`
- **Port:** `3306`
- **User:** `root`
- **Password:** `(no password)`

## WordPress Template

The WordPress template provides a local WordPress development environment with Nginx, PHP-FPM, and MariaDB using process-compose.

- **Management:** Use `process-compose up` to start all services
- **phpMyAdmin:** Included for database management

### Services

- **WordPress:** [https://localhost:8888](https://localhost:8888) or [https://127.0.0.1:8888](https://127.0.0.1:8888)
- **phpMyAdmin:** [https://localhost:8888/admin](https://localhost:8888/admin) or [https://127.0.0.1:8888/admin](https://127.0.0.1:8888/admin)
- **PHP-FPM:** Runs via process-compose
- **MariaDB:** Runs via process-compose

### MariaDB Configuration

- **Host:** `127.0.0.1`
- **Port:** `3306`
- **User:** `wordpress`
- **Password:** `wordpress`
- **Database:** `wordpress`

> **Important:** Use `127.0.0.1` instead of `localhost` for the database host in wordpress setup wizard.

## Customization

You can customize which packages you want to use in the generated `flake.nix`:

```nix
packages = with pkgs; [
   ...
];
```

To check package availability, visit [NixOS Search](https://search.nixos.org/packages).

## Supported Systems

| OS | Architecture |
|----|--------------|
| Linux | x86_64 |
| macOS | x86_64 |

## License

MIT