{ pkgs, sys-cnf, ... }:
{
  imports = [
    ./dconf.nix
    ./alacritty.nix
    ./firefox.nix
    ./librewolf.nix
    ./vscode.nix
  ];

  home-manager.users.${sys-cnf.username}.home.packages = with pkgs; [
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
    adwaita-icon-theme
  ];
}
