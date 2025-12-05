{ pkgs, sys-cnf, ... }:
with pkgs;
{

  home-manager.users.${sys-cnf.username} = {
    home.packages = [
      swayidle
    ];

    programs.swaylock = {
      enable = true;
      settings = { color = "808080"; };
    };
  };
}
