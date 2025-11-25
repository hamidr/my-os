{ pkgs, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user} = {
    home.packages = with pkgs; [
      gcc
      gcc-g++
    ];

    programs.go = {
      enable = true;
    };
  };
}
