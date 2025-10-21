{ lib, home-manager, ... }:
let
  vals = (import ../cfg.nix {});
in
{
  imports = [
    home-manager.nixosModules.default
    ./zsh.nix
    ./sway.nix
    ./direnv.nix
    ./waybar.nix
    ./swaylock.nix
    ./alacritty.nix
    ./firefox.nix
    ./git.nix
    ./rofi.nix
#    ./neovim.nix
    ./nonfree.nix
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
       killall
       dconf
       fzf
       jq
       wget
       tig
       vlc
       vlc-bittorrent
       thunderbird
       evince
       duckdb
       yt-dlp
       bat

       grim # screenshot functionality
       slurp # screenshot functionality
       mako # notification system developed by swaywm maintainer
       wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
       swayidle
       mpd
       playerctl

       xfce.thunar
       xfce.thunar-archive-plugin
       xfce.thunar-volman
       
       ubuntu_font_family
       liberation_ttf
       # Persian Font
       vazir-fonts
     ];
  };

}
