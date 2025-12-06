{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    telegram-desktop
    signal-desktop
    discord
    protonvpn-gui
  ];
}
