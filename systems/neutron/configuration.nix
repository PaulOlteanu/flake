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

  time.timeZone = "America/Toronto";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_CA.UTF-8";

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
    videoDrivers = ["nvidia"];
  };

  services.udev.extraHwdb = ''
    mouse:usb:v1532p00b7:name:Razer Razer DeathAdder V3 Pro:
      MOUSE_DPI=1600@1000
  '';

  security.polkit.enable = true;

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
    extraGroups = ["networkmanager" "wheel" "plugdev" "dialout"];
  };

  services.udev.packages = [pkgs.openocd];

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
  ];

  fonts = {
    fontconfig = {
      antialias = true;
      hinting.enable = true;
    };
  };

  # Needs to be enabled
  programs.dconf.enable = true;

  # services.gnome.gnome-keyring.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  # programs.niri.enable = true;
  #
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = ["nvidia_drm.fbdev=1"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    NIXOS_OZONE_WL = "1";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
