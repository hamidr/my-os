{ pkgs, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user} = {
    home.packages = with pkgs; [
      gcc
      pgcli
      nushell
    ];

    programs.go = {
      enable = true;
    };

    programs.nushell = {
      enable = true;
    };

  };
}
