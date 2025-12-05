{ pkgs, sys-cnf, ... }:
let
  user = sys-cnf.user;
in
{
  users.users.${sys-cnf.username} = {
    isNormalUser = true;
    description = "${user.fullname}";
    home = "${user.homedir}";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = pkgs.zsh;
  };
}
