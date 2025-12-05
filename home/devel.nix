{ pkgs, sys-cnf, ... }:
{
  home-manager.users.${sys-cnf.username} = {
    home.packages = with pkgs; [
      pgcli
      qtcreator
    ];
  };
}
