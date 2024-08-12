{pkgs, ...}: {
  home.username = "paul";
  home.homeDirectory = "/home/paul";

  imports = [
    ./modules/k9s
    ./modules/cli.nix
    ./modules/helix.nix
  ];

  programs.fish.shellInit = ''
    fish_add_path /home/paul/bin
    fish_add_path /home/paul/.cargo/bin
    fish_add_path /home/paul/.local/bin
    fish_add_path /home/paul/.local/share/coursier/bin
    fish_add_path /home/paul/.krew/bin
    fish_add_path /home/paul/go/bin

    mise activate fish | source
  '';

  # TODO: Configure through home manager
  programs.neovim.enable = true;

  programs.ruff.enable = true;
  programs.ruff.settings = {};

  home.packages = with pkgs; [
    oci-cli

    pyright
    nodePackages.typescript-language-server
    nodePackages.prettier
    black
    nil
    alejandra
    taplo
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
