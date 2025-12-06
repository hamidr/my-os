{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cliphist
    rofi-bluetooth
  ];

  programs.rofi = {
    enable = true;
  };
}
