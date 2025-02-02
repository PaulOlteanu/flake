{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # kdePackages.polkit-kde-agent-1
    swaybg
  ];

  # xdg.portal.enable = true;
  # xdg.portal.xdgOpenUsePortal = true;
  # xdg.portal.configPackages = [
  #   pkgs.xdg-desktop-portal-gtk
  #   pkgs.xdg-desktop-portal-gnome
  # ];
  # xdg.portal.extraPortals = [
  #   pkgs.xdg-desktop-portal-gtk
  #   pkgs.xdg-desktop-portal-gnome
  # ];
}
