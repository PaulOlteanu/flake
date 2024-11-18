{pkgs, ...}: {
  # nixpkgs.overlays = [ (self: super: { utillinux = super.util-linux; })];

  home.username = "paul";
  home.homeDirectory = "/Users/paul";

  imports = [
    ./modules/k9s
    ./modules/cli.nix
    ./modules/helix.nix
  ];

  # programs.neovim.enable = true;

  # programs.ruff.enable = true;
  # programs.ruff.settings = {};

  # programs.git.lfs.enable = true;

  home.packages = with pkgs; [
    # oci-cli

    # pyright
    # nodePackages.typescript-language-server
    # nodePackages.prettier
    # black
    # nil
    # alejandra
    # taplo
    # ktlint
    # uv
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
