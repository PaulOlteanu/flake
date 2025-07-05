{
  config,
  pkgs,
  ...
}: {
  # programs.waybar.enable = true;

  xdg.configFile."waybar/config.jsonc".source =
    config.lib.file.mkOutOfStoreSymlink "/home/paul/flake/home/modules/waybar/config.jsonc";

  xdg.configFile."waybar/style.css".source =
    config.lib.file.mkOutOfStoreSymlink "/home/paul/flake/home/modules/waybar/style.css";
}
