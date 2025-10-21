{ ... }:
let
  vals = import ../cfg.nix {};
  username = vals.user.username;
  theme = vals.style;
in {
  home-manager.users.${username}.programs.waybar = {
    enable = true;
  };
}
