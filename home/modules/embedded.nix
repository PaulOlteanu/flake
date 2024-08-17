{pkgs, ...}: {
  home.packages = [
    pkgs.gdb
    pkgs.openocd
  ];
}
