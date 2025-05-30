# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [./hardware-configuration.nix];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.auto-optimise-store = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  networking.hostName = "neutron";

  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;

  time.timeZone = "America/Toronto";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_CA.UTF-8";

  # nix.gc = {
  #   automatic = true;
  #   dates = "daily";
  #   options = "--delete-older-than 7d";
  # };

  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
    videoDrivers = ["nvidia"];
  };

  services.udev.extraHwdb = ''
    mouse:usb:v1532p00b7:name:Razer Razer DeathAdder V3 Pro:
      MOUSE_DPI=800@1000
  '';

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  services.tailscale.enable = true;

  users.extraGroups.plugdev = {};
  users.users.paul = {
    isNormalUser = true;
    description = "Paul Olteanu";
    extraGroups = ["networkmanager" "wheel" "plugdev" "dialout" "wireshark"];
  };

  services.udev.packages = [pkgs.openocd];
  programs.wireshark.enable = true;
  programs.wireshark.package = pkgs.wireshark;
  programs.wireshark.dumpcap.enable = true;
  # services.udev = {
  #   extraRules = ''
  #     SUBSYSTEM=="usbmon", GROUP="wireshark", MODE="0640"
  #   '';
  # };
  programs.sniffnet.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    helix
    wget
    git
    htop
    gcc
    usbutils

    firefox

    linuxPackages_latest.perf

    docker-compose
  ];

  fonts = {
    fontconfig = {
      antialias = true;
      hinting.enable = true;
    };
  };

  programs.command-not-found.enable = false;

  programs.dconf.enable = true;

  programs.hyprland.enable = true;

  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;
  services.xserver.displayManager.gdm.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_12;
  boot.kernelParams = ["nvidia_drm.fbdev=1"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    # package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  # TODO: Can we put these elsewhere
  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    NIXOS_OZONE_WL = "1";
  };

  virtualisation.containers.enable = true;
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;
  virtualisation.podman.defaultNetwork.settings.dns_enabled = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
