{ pkgs, ... }:
{
  home.packages = with pkgs; [
    swayidle
  ];

  programs.swaylock = {
    enable = true;
    settings = { color = "808080"; };
  };
}
