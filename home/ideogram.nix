{pkgs, ...}: {
  home.username = "paul";
  home.homeDirectory = "/Users/paul";

  imports = [
    ./modules/cli.nix
    ./modules/git.nix
    ./modules/helix.nix
  ];

  modules.git.enable = true;
  modules.git.email = "p.a.olteanu@gmail.com";

  programs.neovim.enable = true;

  # programs.git.lfs.enable = true;

  home.packages = with pkgs; [
    # cachix

    # heaptrack
    # oci-cli

    pyright
    # nodePackages.typescript-language-server
    # nodePackages.prettier
    # black

    nil
    alejandra
    taplo
    # uv
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
