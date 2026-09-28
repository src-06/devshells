# MSSQL Development Environment

A Nix flake template for running Microsoft SQL Server locally using process-compose and podman.

## Requirements

- [Nix](https://nixos.org/download.html) with flake support enabled
- Podman (installed automatically via Nix)

## Quick Start

```bash
nix flake init -t github:src-06/devshells#mssql
nix develop
process-compose up
```

## Services

| Service | Host | Port | User | Password |
|---------|------|------|------|----------|
| MSSQL Server | localhost | 1433 | sa | P@ssw0r6 |

## Packages Included

- **podman** - Container engine
- **podman-compose** - Compose for podman
- **process-compose** - Process manager
- **sqlcmd** - Command-line query tool for MSSQL

## Usage

### Connect with sqlcmd

```bash
sqlcmd -S localhost -U sa -P 'P@ssw0r6' -C
```

### Run a Query

```bash
sqlcmd -S localhost -U sa -P 'P@ssw0r6' -C -Q "SELECT @@VERSION"
```

### Stop Server

Press `F10` in process-compose to stop the server.

## Files

| File | Description |
|------|-------------|
| `docker-compose.yml` | MSSQL Server container configuration |
| `flake.nix` | Nix flake for development environment |
| `process-compose.yaml` | Process manager configuration |
| `.mssql/` | Data directory (gitignored) |

## Supported Systems

| OS | Architecture |
|----|--------------|
| Linux | x86_64 |
| macOS | x86_64 |
