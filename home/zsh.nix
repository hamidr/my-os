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
      upgrade = ''cd /backup/nixos; \
        git add . ; \
        nix flake update && \
        git commit -m "$(date)" && \
        sudo nixos-rebuild switch --flake .
      '';
      update = ''cd /backup/nixos; \
        git add . ; \
        git commit -m "$(date)" && \
        sudo nixos-rebuild switch --flake .
      '';

      cdnix = "cd /backup/nixos";
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
