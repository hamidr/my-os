{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./direnv.nix
    ./git.nix
#    ./neovim.nix
  ];

  home.packages = with pkgs; [
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
