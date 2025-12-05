{ pkgs, sys-cnf, ... }:
{
  home-manager.users.${sys-cnf.username} = {
    home.packages = with pkgs; [
      cliphist
      rofi-bluetooth
    ];

    programs.rofi = {
      enable = true;
    };
  };
}
