{ ... }:
let
  vals = import ../cfg.nix {};
  username = vals.user.username;
  theme = vals.style;
  mainBar = {
    layer = "bottom";
    position = "top";
    height = 24;
    spacing = 0;
    output = [
      "DP-2"
    ];
    modules-left = [
      "sway/workspaces"
      "sway/mode"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "memory"
      "cpu"
      "pulseaudio"
      "bluetooth"
      "tray"
    ];
    "keyboard-state" = {
      numlock = false;
      capslock = true;
      format = "{name} {icon}";
      format-icons = {
        locked = "";
        unlocked = "";
      };
    };
    "sway/mode" = {
      format = "<span style=\"italic\">{}</span>";
    };
    "sway/workspaces" = {
      on-click = "activate";
      sort-by-number = true;
      format = "{value}";
      format-icons = {
        "1" = "";
        "2" = "";
        "3" = "";
        "4" = "";
        "5" = "";
        "6" = "";
        "7" = "";
        "8" = "";
        "9" = "";
        "10" = "";
      };
    };
    "sway/window" = {
      max-length = 30;
    };
    "bluetooth" = {
      format = "{status} ";
      format-disabled = "";
      format-connected = "{num_connections} pair ";
      tooltip-format = "{controller_alias}\t{controller_address}";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
    };
    "mpd" = {
      format = "{stateIcon} ({elapsedTime:%M:%S}/{totalTime:%M:%S})";
      format-disconnected = "off ";
      format-stopped = "{randomIcon} pause ";
      unknown-tag = "n/a";
      interval = 2;
      consume-icons = {
        "on" = " ";
      };
      random-icons = {
        off = "<span color=\"#f53c3c\"></span> ";
        on = " ";
      };
      repeat-icons = {
        on = "";
      };
      single-icons = {
        on = " ";
      };
      state-icons = {
        paused = "X";
        playing = "P";
      };
      tooltip-format = "mpd (connected)";
      tooltip-format-disconnected = "mpd (disconnected)";
    };
    "tray" = {
      icon-size = 13;
      spacing = 8;
    };
    "clock" = {
      interval = 60;
      tooltip = false;
      format = "{:%R | %a, %d/%m/%y}";
    };
    "cpu" = {
      format = "{usage}% ";
      tooltip =false;
    };
    "memory" = {
      format = "{}% ";
    };
    "temperature" = {
      # thermal-zone" = 2;
      # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
      critical-threshold = 80;
      format-critical = "{temperatureC}°C {icon}";
      format = "{temperatureC}°C {icon}";
      format-icons = [
        ""
        ""
        ""
        ""
      ];
    };
    "network" = {
      # "interface" = "wlp2*"; # (Optional) To force the use of this interface
      format-wifi = "{bandwidthDownBytes}   {bandwidthUpBytes}   {signalStrength}% ";
      format-ethernet = "{bandwidthDownBytes}   {bandwidthUpBytes}   {ipaddr}/{cidr} ";
      # format-wifi = "{bandwidthDownBytes}  {bandwidthUpBytes}  {signalStrength}% ";
      # format-ethernet = "{bandwidthDownBytes}  {bandwidthUpBytes}  {ipaddr}/{cidr} ";
      tooltip-format = "{ifname} via {gwaddr} ";
      format-linked = "{ifname} (no ip) ";
      format-disconnected = "off ";
      format-alt = "{ifname} = {ipaddr}/{cidr} ";
      interval = 2;
    };
    "pulseaudio" = {
      # "scroll-step" = 1; # %; can be a float
      format = "{volume}% {icon} {format_source}";
      format-bluetooth = "{volume}% {icon}  {format_source}";
      format-bluetooth-muted = " {icon}  {format_source}";
      format-muted = "{volume}%  {format_source}";
      format-source = "{volume}% ";
      format-source-muted = "{volume}% ";
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = [
          "" "" ""
        ];
      };
    };
  };
  styleCfg = ''

  '';

in {
  home-manager.users.${username}.programs.waybar = {
    enable = true;
    style = styleCfg;
    settings.mainBar = mainBar;
  };
}
