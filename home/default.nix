{ lib, home-manager, ... }:
let
  vals = (import ../cfg.nix {});
in
{
  imports = [
    home-manager.nixosModules.default
    ./terminal.nix
    ./zsh.nix
    ./sway.nix
    ./direnv.nix
    ./waybar.nix
    ./swaylock.nix
    ./alacritty.nix
    ./firefox.nix
    ./git.nix
    ./rofi.nix
    ./vscode.nix
    ./nonfree.nix
    ./desktop.nix
  ];

  home-manager.backupFileExtension = "backup";
  
  home-manager.useUserPackages = true;

  home-manager.users.${vals.user.username} = {pkgs, ...} @ inputs: {
     home.stateVersion = "${vals.system.hm-version}";
     home.homeDirectory = lib.mkForce "${vals.user.homedir}";

     home.file.".hm-graphical-session".text = pkgs.lib.concatStringsSep "\n" [
       "export MOZ_ENABLE_WAYLAND=1"
       "export NIXOS_OZONE_WL=1" # Electron
     ];

     home.packages = with pkgs; [
       mpd
       playerctl
     ];
  };

}
