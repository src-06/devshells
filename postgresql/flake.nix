{
  description = "PostgreSQL Development Environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              (writeShellApplication {
                name = "db";
                text = builtins.readFile ./scripts/db.sh;
              })
              postgresql

              # For NixOS user if can't use prisma cli
              # openssl
              # prisma-engines_7 # or prisma-engines_6
            ];
            shellHook = ''
              # export OPENSSL_DIR=${pkgs.openssl.dev}
              # export OPENSSL_LIB_DIR=${pkgs.openssl.out}/lib
            '';
          };
        }
      );
    };
}
