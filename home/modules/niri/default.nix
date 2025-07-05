{
  config,
  pkgs,
  ...
}: {
  # programs.niri.enable = true;
  # programs.niri.package = pkgs.niri;

  # home.packages = with pkgs; [
  #   swaybg
  #   xwayland-satellite
  # ];

  xdg.configFile."niri/config.kdl".source =
    # config.lib.file.mkOutOfStoreSymlink ./config.kdl;
    config.lib.file.mkOutOfStoreSymlink "/home/paul/flake/home/modules/niri/config.kdl";
}
