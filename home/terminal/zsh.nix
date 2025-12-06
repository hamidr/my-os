{ ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ta = "tmux attach || tmux";
      gc_collect = ''
        nix store gc;
        sudo nix-collect-garbage -d;
      '';
      rebuild = "sudo nixos-rebuild switch --flake .";
      upgrade = ''cd /backup/nixos; \
        git add . ; \
        nix flake update && \
        sudo nixos-rebuild switch --flake . && \
        git commit -m "$(date)" 
      '';
      update = ''cd /backup/nixos; \
        git add . ; \
        sudo nixos-rebuild switch --flake . && \
        git commit -m "$(date)" 
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
