{ pkgs, sys-cnf, ... }:
{
  home-manager.users.${sys-cnf.username} = {
    home.packages = with pkgs; [ dconf ];

    dconf = {
      enable = true;
      settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
  };
}
