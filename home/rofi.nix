{ pkgs, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user} = {
    home.packages = with pkgs; [
      cliphist
      rofi-bluetooth
    ];

    programs.rofi = {
      enable = true;
    };
  };
}
