{ lib, home-manager, ... }:
let
  vals = (import ../cfg.nix {});
in
{
  imports = [
    home-manager.nixosModules.default
    ./terminal.nix
    #./sway.nix
    ./desktop.nix
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
       mpd
       playerctl
     ];
  };

}
