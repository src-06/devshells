{
  description = "Reusable Template devShells";

  outputs =
    { ... }:
    {
      templates = rec {
        default = empty;

        empty = {
          path = ./empty;
          description = "Empty Development Environment";
        };

        lemp = {
          path = ./lemp;
          description = "LEMP Stack Development Environment";
        };

        wordpress = {
          path = ./wordpress;
          description = "WordPress Development Environment";
        };
      };
    };
}