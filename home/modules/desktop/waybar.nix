{
  config,
  pkgs,
  ...
}: {
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "bottom";

      modules-left = [
        "hyprland/workspaces"
        "custom/right-arrow-dark"
      ];

      modules-center = [
        "custom/left-arrow-dark"
        "clock#1"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "clock#2"
        "custom/right-arrow-dark"
        "custom/right-arrow-light"
        "clock#3"
        "custom/right-arrow-dark"
      ];

      modules-right = [
        "custom/left-arrow-dark"
        "pulseaudio"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "tray"
      ];

      "custom/left-arrow-dark" = {
        format = "";
        tooltip = false;
      };

      "custom/left-arrow-light" = {
        format = "";
        tooltip = false;
      };

      "custom/right-arrow-dark" = {
        format = "";
        tooltip = false;
      };

      "custom/right-arrow-light" = {
        format = "";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        disable-scroll = true;
        format = "{name}";
      };

      "clock#1" = {
        format = "{:%a}";
        tooltip = true;
      };

      "clock#2" = {
        format = "{:%H:%M}";
        calendar = {
          mode = "month";
          on-scroll = 1;
          on-click-right = "mode";
          "format" = {
            "months" = "<span color='#ffead3'><b>{}</b></span>";
            "days" = "<span color='#ecc6d9'><b>{}</b></span>";
            "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
            "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
            "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
        tooltip = true;
        tooltip-format = "<tt><small>{calendar}</small></tt>";
      };

      "clock#3" = {
        format = "{:%m-%d}";
        tooltip = true;
      };

      pulseaudio = {
        format = "{icon} {volume:2}%";
        format-muted = "MUTE";
        format-icons = {
          default = ["" ""];
        };
        scroll-step = 5;
        on-click = "pavucontrol";
      };

      tray = {
        "icon-size" = 20;
      };
    };
  };
}
