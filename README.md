# DevShells

A collection of Nix flake templates providing reproducible development
environments.

## Requirements

- [Nix](https://nixos.org/download.html) with flake support enabled
- **Windows:** Use [WSL](https://docs.microsoft.com/en-us/windows/wsl/) with
  [Nix](https://nixos.org/download.html) installed inside the Linux distribution

## Templates

| Template    | Description                                                                                |
| ----------- | ------------------------------------------------------------------------------------------ |
| `empty`     | Minimal development environment template                                                   |
| `lemp`      | LEMP stack (Nginx, MariaDB, PHP) with process-compose                                      |
| `mssql`     | Microsoft SQL Server development environment with process-compose                          |
| `wordpress` | WordPress local development environment (Nginx, PHP-FPM, and MariaDB) with process-compose |

### Usage

```bash
nix flake init -t github:src-06/devshells#{template name}
```

To check package availability, visit
[NixOS Search](https://search.nixos.org/packages).

## Supported Systems (for most templates)

| OS    | Architecture |
| ----- | ------------ |
| Linux | x86_64       |
| macOS | x86_64       |

## License

MIT
