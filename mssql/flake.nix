{
  description = "Microsoft SQL Server Development Environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    supportedSystems = [
      "x86_64-linux"
      "x86_64-darwin"
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
            sqlcmd
          ];

          shellHook = ''
            mkdir .mssql
            chmod 777 .mssql

            echo "Run \"process-compose up\" to start MSSQL server"
          '';
        };
      }
    );
  };
}
