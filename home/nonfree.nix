{ pkgs, ... }:
with pkgs;
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  nixpkgs.config.allowUnfree = true;

  home-manager.users.${user}.home.packages = [
    jetbrains.clion
    telegram-desktop
    signal-desktop
    discord
    brave
    protonvpn-cli
  ];
}
