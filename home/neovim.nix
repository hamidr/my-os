{ pkgs, lazyvim, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user}.programs.lazyvim = {
  imports = [ lazyvim.homeManagerModules.default ];
    enable = true;
  };

}
