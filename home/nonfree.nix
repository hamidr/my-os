{ pkgs, sys-cnf, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home-manager.users.${sys-cnf.username}.home.packages = with pkgs; [
    jetbrains.clion
    telegram-desktop
    signal-desktop
    discord
    brave
    protonvpn-gui
  ];
}
