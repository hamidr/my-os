{ pkgs, lazyvim, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  imports = [ lazyvim.homeManagerModules.default ];
  home-manager.users.${user}.programs.lazyvim = {
    enable = true;
  };

}
