{
  description = "WordPress Local Development Environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
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
              php84
              mariadb
              nginx
              process-compose

              # Optional tools setup (After setup complete you can remove this packages)
              wget
              gnutar
              unzip
              openssl
            ];
            shellHook = ''
              bash services/scripts/setup.sh
              echo "To start LEMP Stack run command \`process-compose up\`!!!"
            '';
          };
        }
      );
    };
}
