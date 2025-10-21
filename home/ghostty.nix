{ ... }:
let 
  user = (import ../cfg.nix {}).user.username;
in
{
  home-manager.users.${user}.programs.ghostty = {
    settings = {
      theme = "catppuccin-mocha";
      font-size = 10;
      font-family = "Ubuntu Mono";
      keybind = [
        "ctrl+h=goto_split:left"
        "ctrl+l=goto_split:right"
      ];
    };
  };
}
