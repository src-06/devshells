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

        mariadb = {
          path = ./mariadb;
          description = "MariaDB Development Environment";
        };

        postgresql = {
          path = ./postgresql;
          description = "PostgreSQL Development Environment";
        };

        prisma = {
          path = ./prisma;
          description = "Prisma Development Environment";
        };
      };
    };
}
