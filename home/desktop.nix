{ pkgs, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user}.home.packages = with pkgs; [
    vlc 
    vlc-bittorrent
    thunderbird
    evince
    emacs

    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman

    ubuntu_font_family
    liberation_ttf
    # Persian Font
    vazir-fonts
  ];
}
