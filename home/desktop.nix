{ pkgs, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  imports = [
    ./dconf.nix
    ./alacritty.nix
    ./firefox.nix
    ./git.nix
    ./vscode.nix
  ];

  home-manager.users.${user}.home.packages = with pkgs; [
    vlc 
    vlc-bittorrent
    thunderbird
    evince
    emacs
    nautilus

    ubuntu-classic
    liberation_ttf
    # Persian Font
    vazir-fonts
    gnome.adwaita-icon-theme
  ];
}
