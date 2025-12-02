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

in {
  inherit system;
  inherit user;
  inherit style;
}
