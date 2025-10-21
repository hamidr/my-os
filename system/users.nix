{ pkgs, ... }:
let
  user = (import ../cfg.nix {}).user;
in
{
  users.users.${user.username} = {
    isNormalUser = true;
    description = "${user.fullname}";
    home = "${user.homedir}";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = pkgs.zsh;
  };
}
