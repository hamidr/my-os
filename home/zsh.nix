{ ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user}.programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ta = "tmux attach || tmux";
      update = "git add /backup/nixos && git commit -m \"$(date)\" && sudo nixos-rebuild switch --flake /backup/nixos";
      svim = "sudo vim";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "sudo"
        "git"
        "terraform"
        "systemadmin"
        "vi-mode"
        "fzf"
      ];
    };
  };
}
