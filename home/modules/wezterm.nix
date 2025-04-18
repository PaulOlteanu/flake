{
  inputs,
  config,
  pkgs,
  ...
}: {
  programs.wezterm.enable = true;
  programs.wezterm.package = inputs.wezterm.packages.${pkgs.system}.default;

  programs.wezterm.extraConfig = ''
    local wezterm = require 'wezterm'
    local act = wezterm.action
    return {
      enable_wayland = true,

      -- enable_wayland = false,
      font_size = 12.0,

      default_prog = { 'fish' },

      color_scheme = 'OneDark (base16)',
      font = wezterm.font 'JetbrainsMonoNL Nerd Font',
      -- font_size = 12.0,

      tiling_desktop_environments = {
        'X11 wlroots wm',
        'X11 Hyprland :D',
        'X11 Hyprland',
        'Niri',
      },
      adjust_window_size_when_changing_font_size = false,

      enable_scroll_bar = true,
      window_padding = {
        right = 16,
      },

      keys = {
        {key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard'},
        {key = '1', mods = 'CTRL', action = act.ActivateTab(0)},
        {key = '2', mods = 'CTRL', action = act.ActivateTab(1)},
        {key = '3', mods = 'CTRL', action = act.ActivateTab(2)},
        {key = '4', mods = 'CTRL', action = act.ActivateTab(3)},
        {key = '5', mods = 'CTRL', action = act.ActivateTab(4)},
        {key = '6', mods = 'CTRL', action = act.ActivateTab(5)},
        {key = '7', mods = 'CTRL', action = act.ActivateTab(6)},
        {key = '8', mods = 'CTRL', action = act.ActivateTab(7)},
        {key = '9', mods = 'CTRL', action = act.ActivateTab(-1)},
      },
    }
  '';
}
