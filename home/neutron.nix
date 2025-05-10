{pkgs, ...}: {
  home.username = "paul";
  home.homeDirectory = "/home/paul";

  imports = [
    ./modules/desktop
    ./modules/k9s

    ./modules/cli.nix
    ./modules/git.nix

    ./modules/embedded.nix

    ./modules/alacritty.nix
    ./modules/wezterm.nix
    ./modules/ghostty.nix

    ./modules/helix.nix
    ./modules/vscode.nix
  ];

  modules.git.enable = true;
  modules.git.email = "p.a.olteanu@gmail.com";

  modules.desktop.enable = true;

  # TODO: Configure through home manager
  programs.neovim.enable = true;

  programs.ruff.enable = true;
  programs.ruff.settings = {};

  programs.command-not-found.enable = false;
  # programs.nix-index = {
  #   enable = true;
  #   enableFishIntegration = true;
  # };

  home.packages = with pkgs; [
    nixos-generators
    deploy-rs

    bpftrace
    tcpdump
    sniffnet
    oha

    # awscli2 # TODO: Configure through home manager
    oci-cli
    kubectl
    flyctl
    pulumi-bin
    dive

    inetutils

    # Rust dev stuff
    rustup
    taplo

    # Python dev stuff
    pyright
    black

    # JS dev stuff
    nodePackages.typescript-language-server
    nodePackages.prettier

    # Nix dev stuff
    nil
    alejandra

    pkg-config
    openssl

    # Desktop env stuff
    grim
    slurp
    playerctl
    hyprshot

    spotify
    discord
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
