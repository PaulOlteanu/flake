{pkgs, ...}: {
  home.username = "paul";
  home.homeDirectory = "/home/paul";

  imports = [
    ./modules/desktop
    ./modules/k9s

    ./modules/cli.nix

    ./modules/wezterm.nix
    ./modules/helix.nix
    ./modules/vscode.nix
  ];

  modules.desktop.enable = true;

  # TODO: Configure through home manager
  programs.neovim.enable = true;

  programs.ruff.enable = true;
  programs.ruff.settings = {};

  home.packages = with pkgs; [
    cachix

    awscli2 # TODO: Configure through home manager
    oci-cli
    kubernetes

    flyctl

    rustup
    pyright
    nodePackages.typescript-language-server
    nodePackages.prettier
    black
    nil
    alejandra
    taplo

    zed-editor

    grim
    slurp
    playerctl

    spotify
    discord
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
