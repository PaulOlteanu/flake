{ config, pkgs, ... }:
{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    font.size = 12;
    font.normal.family = "JetbrainsMonoNL Nerd Font";

    colors.primary = {
      background = "#282c34";
      foreground = "#abb2bf";
    };

    colors.normal = {
      black   = "#1e2127";
      red     = "#e06c75";
      green   = "#98c379";
      yellow  = "#d19a66";
      blue    = "#61afef";
      magenta = "#c678dd";
      cyan    = "#56b6c2";
      white   = "#abb2bf";
    };

    colors.bright = {
      black   = "#5c6370";
      red     = "#e06c75";
      green   = "#98c379";
      yellow  = "#d19a66";
      blue    = "#61afef";
      magenta = "#c678dd";
      cyan    = "#56b6c2";
      white   = "#ffffff";
    };
  };
}
