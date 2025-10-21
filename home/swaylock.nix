{ ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user}.programs.swaylock = {
    enable = true;
    settings = { color = "808080"; };
  };
}
