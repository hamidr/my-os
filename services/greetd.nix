{ pkgs, ... }:
let
  user = (import ../cfg.nix {}).user.username;
in
{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "${user}";
      };
      default_session = initial_session;
    };
  };
}
