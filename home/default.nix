{ lib, ... }:
let
  vals = (import ../cfg.nix {});
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-${vals.system.os-version}.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
    ./zsh.nix
    ./sway.nix
    ./direnv.nix
    ./firefox.nix
    ./waybar.nix
    ./swaylock.nix
    ./alacritty.nix
    ./nonfree.nix
  ];

  home-manager.backupFileExtension = "backup";
  
  home-manager.useUserPackages = true;

  home-manager.users.${vals.user.username} = {pkgs, ...} @ inputs: {
     home.stateVersion = "${vals.system.os-version}";
     home.homeDirectory = lib.mkForce "${vals.user.homedir}";

     home.file.".hm-graphical-session".text = pkgs.lib.concatStringsSep "\n" [
       "export MOZ_ENABLE_WAYLAND=1"
       "export NIXOS_OZONE_WL=1" # Electron
     ];


     home.packages = with pkgs; [
       git
       dconf
       fzf
       jq
       wget
       tig
       vlc
       vlc-bittorrent

       grim # screenshot functionality
       slurp # screenshot functionality
       mako # notification system developed by swaywm maintainer
       wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
       rofi
       mpd
       playerctl
       cliphist
       rofi-bluetooth

       xfce.thunar
       xfce.thunar-archive-plugin
       xfce.thunar-volman
       
       ubuntu_font_family
       liberation_ttf
       # Persian Font
       vazir-fonts
     ];


     fonts.fontconfig = {
       enable = true;
       defaultFonts = {
         serif = [  "Liberation Serif" "Vazirmatn" ];
         sansSerif = [ "Ubuntu" "Vazirmatn" ];
         monospace = [ "Ubuntu Mono" ];
       };
     };

  };

}
