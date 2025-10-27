{ pkgs, ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  imports = [
    ./zsh.nix
    ./direnv.nix
    ./git.nix
    ./nonfree.nix
  ];

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
