{
  description = "Microsoft SQL Server Development Environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    supportedSystems = [
      "x86_64-linux"
    ];
    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems (
        system:
          f {
            pkgs = import nixpkgs {inherit system;};
          }
      );
  in {
    devShells = forEachSupportedSystem (
      {pkgs}: {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            podman
            podman-compose
            process-compose
            (writeShellScript "sqlcmd" "podman exec -it mssqlsrv-dev /opt/mssql-tools/bin/sqlcmd")
          ];

          shellHook = ''
            echo "Run \"process-compose up\" to start MSSQL server"
          '';
        };
      }
    );
  };
}
