{ pkgs, sys-cnf, ... }:
{
  imports = [
    ./zsh.nix
    ./direnv.nix
    ./git.nix
#    ./neovim.nix
  ];

  home-manager.users.${sys-cnf.username}.home.packages = with pkgs; [
    killall
    eza
    yt-dlp
    bat
    fzf
    jq
    wget
    tig
  ];
}
