{ pkgs, sys-cnf, ... }:
{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "${sys-cnf.username}";
      };
      default_session = initial_session;
    };
  };
}
