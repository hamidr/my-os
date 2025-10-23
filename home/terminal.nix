{ pkgs, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user}.home.packages = with pkgs; [
    killall
    eza
    yt-dlp
    bat
    fzf
    jq
    wget
    tig
    dconf 
  ];
}
