{ pkgs, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user} = {
    home.packages = with pkgs; [ dconf ];

    dconf = {
      enable = true;
      settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
  };
}
