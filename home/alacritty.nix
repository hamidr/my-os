{ ... }:
let 
  cfg = (import ../cfg.nix {});
  user = cfg.user.username;
  theme = cfg.style;
in
{
  home-manager.users.${user}.programs.alacritty = {
    enable = true;
    settings = {
#      terminal.shell = "tmux attach || tmux";
      font = {
        size = theme.font-mono-size;
        normal = {
          family = "${theme.font-mono}";
          style = "Regular";
        };
      };
      window = {
        padding = {
          x = 5;
          y = 5;
        };
      };
    };
  };
}
