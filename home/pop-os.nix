{pkgs, ...}: {
  nixpkgs.overlays = [ (self: super: { utillinux = super.util-linux; })];

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
    fish_add_path /home/paul/.yarn/bin

    mise activate fish | source
  '';

  # TODO: Configure through home manager
  programs.neovim.enable = true;

  programs.ruff.enable = true;
  programs.ruff.settings = {};

  programs.git.lfs.enable = true;

  home.packages = with pkgs; [
    oci-cli

    pyright
    nodePackages.typescript-language-server
    nodePackages.prettier
    black
    nil
    alejandra
    taplo
    ktlint
    uv
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
