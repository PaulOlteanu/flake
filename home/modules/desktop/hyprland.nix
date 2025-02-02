{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    hyprpolkitagent
  ];

  xdg.portal.enable = true;
  xdg.portal.xdgOpenUsePortal = true;
  xdg.portal.configPackages = [
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gtk
  ];
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gtk
  ];

  programs.fuzzel.enable = true;

  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    preload = "/home/paul/Pictures/Penguin.png";
    wallpaper = ",/home/paul/Pictures/Penguin.png";
    splash = false;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    env = [
      "LIBVA_DRIVER_NAME, nvidia"
      "XDG_SESSION_TYPE, wayland"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "LIBVA_DRIVER_NAME,nvidia"
      "XCURSOR_SIZE,24"
      # "GBM_BACKEND, nvidia-drm"
      # "GDK_SCALE,2"
      # "XDG_DATA_DIRS, ${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/gsettings-desktop-schemas-45.0:$XDG_DATA_DIRS"
    ];
    monitor = [
      "DP-3,3840x2160@144,0x0,auto"
      "HDMI-A-1,1920x1080@144,auto-left,auto"
      "DP-2,preferred,auto-right,auto"
      ",preferred,auto,auto"
    ];
    exec = [
      "systemctl --user import-environment PATH && systemctl --user restart xdg-desktop-portal.service"
    ];
    exec-once = [
      "waybar"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    ];

    input = {
      kb_layout = "us";
      repeat_delay = 400;
      repeat_rate = 35;
      follow_mouse = 2;
      touchpad.natural_scroll = false;
      sensitivity = -0.5;
      accel_profile = "flat";
    };

    cursor = {
      no_hardware_cursors = true;
    };

    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      layout = "dwindle";

      allow_tearing = false;
    };

    decoration = {
      rounding = false;
      blur.enabled = false;
    };

    animations = {
      enabled = true;
      animation = [
        "global,1,3,default"
        "workspaces,0,3,default"
      ];
    };

    dwindle = {
      pseudotile = true;
      force_split = 2;
      preserve_split = true;
    };

    # master.new_is_master = true;

    gestures.workspace_swipe = false;

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = 0;
    };

    xwayland.force_zero_scaling = true;

    binds.scroll_event_delay = 0;

    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, N, exec, wezterm"

      "$mainMod, SPACE, exec, fuzzel"
      "$mainMod, Q, killactive,"
      "$mainMod, M, exec, hyprctl dispatch exit"
      "$mainMod, E, exec, nemo"
      "$mainMod, F, togglefloating"
      "$mainMod, P, pseudo,"
      "$mainMod, COMMA, togglesplit,"

      ''SUPER SHIFT, S, exec, grim -g "$(slurp -d)" - | wl-copy''

      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, j, movefocus, d"
      "$mainMod, k, movefocus, u"

      "ALT SHIFT, H, resizeactive, -32 0"
      "ALT SHIFT, L, resizeactive, 32 0"
      "ALT SHIFT, J, resizeactive, 0 32"
      "ALT SHIFT, K, resizeactive, 0 -32"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    bindl = [
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPrev, exec, playerctl previous"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };

  # TODO: Include this file here
  # wayland.windowManager.hyprland.extraConfig = ''
  #   source = /home/paul/.config/hypr/windows.conf
  # '';
}
