{ sys-cnf, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
#      terminal.shell = "tmux attach || tmux";
      font = {
        size = sys-cnf.style.font-mono-size;
        normal = {
          family = "${sys-cnf.style.font-mono}";
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
