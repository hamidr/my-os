{ pkgs, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user} = {
    home.packages = with pkgs; [
      gcc
      pgcli
      gnumake
      cmake
      qtcreator
    ];

    programs = {
      go.enable = true;
      java = {
        enable = true;
        package = pkgs.oraclejre22;
      };
    };
  };
}
