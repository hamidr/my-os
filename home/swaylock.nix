{ pkgs, ... }:
with pkgs;
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user} = {
    home.packages = [
      swayidle
    ];

    programs.swaylock = {
      enable = true;
      settings = { color = "808080"; };
    };
  };
}
