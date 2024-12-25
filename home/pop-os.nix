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
    fish_add_path /usr/local/cuda-12.6/bin/

    mise activate fish | source
  '';

  # TODO: Configure through home manager
  programs.neovim.enable = true;

  programs.ruff.enable = true;
  programs.ruff.settings = {};

  programs.direnv.enable = true;
  programs.direnv.config = {
    global.load_dotenv = true;
  };

  programs.git.lfs.enable = true;

  home.packages = with pkgs; [
    oci-cli
    kubectl

    uv
    pyright
    ruff-lsp

    nodePackages.typescript-language-server
    nodePackages.prettier

    nil
    alejandra

    taplo

    ktlint

    protobuf_27
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
