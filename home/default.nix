{ lib, home-manager, sys-cnf, ... }:
{
  imports = [
    home-manager.nixosModules.default
  ];

  home-manager.backupFileExtension = "backup";
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit sys-cnf; };

  home-manager.users.${sys-cnf.username} = {pkgs, ...} @ inputs: {
   imports = [
      ./terminal
      ./swaywm
      ./desktop
      ./nonfree.nix
      ./devel.nix
    ];

     home.stateVersion = "${sys-cnf.system.hm-version}";
     home.homeDirectory = lib.mkForce "${sys-cnf.user.homedir}";

     home.file.".hm-graphical-session".text = pkgs.lib.concatStringsSep "\n" [
       "export MOZ_ENABLE_WAYLAND=1"
       "export NIXOS_OZONE_WL=1" # Electron
     ];
  };
}
