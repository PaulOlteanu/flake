{pkgs, ...}: {
  nixpkgs.overlays = [(self: super: {utillinux = super.util-linux;})];

  home.username = "polteanu";
  home.homeDirectory = "/home/polteanu";

  imports = [
    ./modules/k9s
    ./modules/git.nix
    ./modules/cli.nix
    ./modules/helix.nix
  ];

  modules.git.enable = true;
  modules.git.email = "polteanu@cloudflare.com";

  modules.jj.enable = true;
  modules.jj.email = "polteanu@cloudflare.com";

  programs.fish.shellInit = ''
    bind alt-backspace backward-kill-word
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

  home.packages = with pkgs; [
    # kubectl
    # kubectx

    # uv
    # pyright
    # ruff-lsp

    # nodePackages.typescript-language-server
    # nodePackages.prettier

    nil
    alejandra

    taplo

    # ktlint

    # protobuf_25
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
