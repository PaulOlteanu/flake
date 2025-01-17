{
  lib,
  config,
  pkgs,
  stylix-theme,
  ...
}:
with lib; let
  cfg = config.modules.desktop;
in {
  imports = [
    ./hyprland.nix
    ./niri.nix
    ./waybar.nix
  ];

  options = {
    modules.desktop.enable = mkEnableOption "desktop environment";
  };

  config = mkIf cfg.enable {
    # TODO: Move this to config folder
    stylix.image = /home/paul/Pictures/Penguin.png;
    stylix.polarity = "dark";
    stylix.base16Scheme = stylix-theme;
    stylix.fonts.monospace.name = "JetbrainsMonoNL Nerd Font";
    stylix.fonts.monospace.package = pkgs.nerd-fonts.jetbrains-mono;

    stylix.targets.fish.enable = false;
    stylix.targets.helix.enable = false;
    stylix.targets.waybar.enable = false;
    stylix.targets.zellij.enable = true;

    stylix.targets.k9s.enable = false;

    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      size = 24;
    };

    gtk = {
      enable = true;

      cursorTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-button-images = 1;
        gtk-menu-images = 1;
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
        gtk-xft-rgba = "rgb";
      };
    };

    fonts.fontconfig.enable = true;

    services.playerctld.enable = true;
    services.udiskie.enable = true;
    services.swaync.enable = true;

    programs.fuzzel.enable = true;
    home.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      public-sans
      nerd-fonts.jetbrains-mono

      # Other ====================================================================
      nemo-with-extensions
      nemo-fileroller
      file-roller
      dconf-editor
      pavucontrol
      helvum
      wl-clipboard

      adwaita-icon-theme
      papirus-icon-theme
      xdg-desktop-portal-gtk
      glib
      gsettings-desktop-schemas
      xdg-utils
    ];
  };
}
