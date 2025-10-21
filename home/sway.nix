{ 
  lib,
  pkgs,
  ...
}:
with lib;
with pkgs;
let 
  cfg = import ../cfg.nix {};
  user = (import ../cfg.nix {}).user.username;
  theme = cfg.style;

  mod = "Mod4";
  
  # Navigation
  left = "h";
  down = "j";
  up = "k";
  right = "l";

  fonts = {
    names = ["${theme.font}"];
    size = toString theme.font-size;
  }; 
  
  startup = [
    {command = "firefox";}
    {command = "alacritty";}
  ];

  bars = [
    {command = "${waybar}/bin/waybar";}
  ];
  
  input = {
    "*" = {
      xkb_layout = "us,ir";
      xkb_options = "grp:win_space_toggle";
    };
  };
  
  keybindings = mkOptionDefault {
    # Rofi: menu
    "${mod}+r" = "exec ${rofi}/bin/rofi -show drun";
    # Rofi: bluetooth
    "${mod}+y" = "exec ${rofi-bluetooth}/bin/rofi-bluetooth";
    # Rofi: power menu
    "${mod}+x" = "exec ${rofi}/bin/rofi -show menu -modi 'menu:${rofi-power-menu}/bin/rofi-power-menu --no-symbols'";
    # Rofi: filebrowser
    "${mod}+g" = "exec ${rofi}/bin/rofi -show filebrowser";

    # Rofi: clipboard manager
    "${mod}+c" = "exec ${cliphist}/bin/cliphist list | ${rofi}/bin/rofi -dmenu | ${cliphist}/bin/cliphist decode | ${wl-clipboard}/bin/wl-copy";
    # Rofi: password store
    "${mod}+e" = "exec ${rofi-pass-wayland}/bin/rofi-pass";

    "${mod}+q" = "kill";

    # Terminal
    "${mod}+Return" = "exec ${alacritty}/bin/alacritty";

    # Modes
    "${mod}+p" = "mode randr";
    "${mod}+z" = "mode resize";
    "${mod}+u" = "mode audio";
    "Print" = "mode printscreen";
    "Shift+Print" = "mode recording";

    "${mod}+1" = "workspace number 1";
    "${mod}+2" = "workspace number 2";
    "${mod}+3" = "workspace number 3";
    "${mod}+4" = "workspace number 4";
    "${mod}+5" = "workspace number 5";
    "${mod}+6" = "workspace number 6";
    "${mod}+7" = "workspace number 7";
    "${mod}+8" = "workspace number 8";
    "${mod}+9" = "workspace number 9";

    "${mod}+Shift+period" = "move container to workspace next; workspace next";
    "${mod}+Shift+comma" = "move container to workspace prev; workspace prev";

    "${mod}+Shift+1" = "move container to workspace number 1";
    "${mod}+Shift+2" = "move container to workspace number 2";
    "${mod}+Shift+3" = "move container to workspace number 3";
    "${mod}+Shift+4" = "move container to workspace number 4";
    "${mod}+Shift+5" = "move container to workspace number 5";
    "${mod}+Shift+6" = "move container to workspace number 6";
    "${mod}+Shift+7" = "move container to workspace number 7";
    "${mod}+Shift+8" = "move container to workspace number 8";
    "${mod}+Shift+9" = "move container to workspace number 9";

    "${mod}+${left}" = "focus left";
    "${mod}+${down}" = "focus down";
    "${mod}+${up}" = "focus up";
    "${mod}+${right}" = "focus right";

    "${mod}+Ctrl+${left}" = "move workspace to output left";
    "${mod}+Ctrl+${down}" = "move workspace to output down";
    "${mod}+Ctrl+${up}" = "move workspace to output up";
    "${mod}+Ctrl+${right}" = "move workspace to output right";

    "${mod}+Shift+${left}" = "move left";
    "${mod}+Shift+${down}" = "move down";
    "${mod}+Shift+${up}" = "move up";
    "${mod}+Shift+${right}" = "move right";

    # Audio control
    "XF86AudioRaiseVolume" = "exec ${wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+";
    "XF86AudioLowerVolume" = "exec ${wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-";
    "XF86AudioMute" = "exec ${wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

    # Mic control
    "${mod}+XF86AudioRaiseVolume" = "exec ${wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%+";
    "${mod}+XF86AudioLowerVolume" = "exec ${wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%-";
    "${mod}+XF86AudioMute" = "exec ${wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

    # Player control
    "XF86AudioPlay" = "exec ${playerctl}/bin/playerctl play-pause --player=%any,mpv,mpd";
    "XF86AudioPrev" = "exec ${playerctl}/bin/playerctl previous --player=%any,mpv,mpd";
    "XF86AudioNext" = "exec ${playerctl}/bin/playerctl next --player=%any,mpv,mpd";
    "XF86AudioStop" = "exec ${playerctl}/bin/playerctl play-pause --player=%any,mpv,mpd";

    # Brightness
    "XF86MonBrightnessUp" = "exec ${light}/bin/light -A 2";
    "XF86MonBrightnessDown" = "exec ${light}/bin/light -U 2";
  }; 

in
{
  home-manager.users.${user}.wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = {
      focus.followMouse = false;
      modifier = "${mod}";
      terminal = "alacritty"; 
      inherit input;
      inherit fonts;
      inherit startup;
      inherit bars;
      inherit keybindings;
    };
  };
}
