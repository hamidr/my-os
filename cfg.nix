{...}:
let
  system = {
    hostname = "nixos";
    os-version = "25.05";
    hm-version = "25.11";
  };

  user = {
    username = "hamid";
    fullname = "Hamid";
    homedir = "/home/${user.username}";
  };

  style = {
    theme = "Breeze-Dark";
    icon = "Papirus-Dark";

    cursor = "breeze_cursors";
    cursor-size = 24;

    font = "Ubuntu";
    font-size = 12;

    panel-font = "Ubuntu";
    panel-font-size = 16;


    font-mono = "Ubuntu Mono";
    font-mono-size = 17;
  };

  colors = {
    black = "26292D";
    red = "ED1515";
    green = "11D116";
    yellow = "F67400";
    blue = "1E92FF";
    purple = "9B59B6";
    cyan = "1ABC9C";
    white = "EFF0F1";
    bright_black = "4F5255";
    bright_red = "C0392B";
    bright_green = "1CDC9A";
    bright_yellow = "FDBC4B";
    bright_blue = "3DAEE9";
    bright_purple = "8E44AD";
    bright_cyan = "16A085";
    bright_white = "FCFCFC";
    background = "31363B";
    foreground = "EFF0F1";
  };

in {
  inherit system;
  inherit user;
  inherit style;
  inherit colors;
}
