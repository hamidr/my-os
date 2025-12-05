{ pkgs, sys-cnf, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home-manager.users.${sys-cnf.username}.home.packages = with pkgs; [
    telegram-desktop
    signal-desktop
    discord
    protonvpn-gui
  ];
}
