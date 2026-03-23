{pkgs, ...}: {
  nixpkgs.overlays = [ (self: super: { utillinux = super.util-linux; })];

  home.username = "paul";
  home.homeDirectory = "/home/paul";

  imports = [
    ./modules/k9s
    ./modules/git.nix
    ./modules/cli.nix
    ./modules/helix.nix
    ./modules/niri
    ./modules/waybar
  ];

  modules.git.enable = true;
  modules.git.email = "p.a.olteanu@gmail.com";

  modules.jj.enable = true;
  modules.jj.email = "p.a.olteanu@gmail.com";

  programs.mise.enable = true;
  programs.mise.enableFishIntegration = true;

  programs.fish.shellInit = ''
  #   fish_add_path /home/paul/bin
  #   fish_add_path /home/paul/.cargo/bin
  #   fish_add_path /home/paul/.local/bin
  #   fish_add_path /home/paul/.local/share/coursier/bin
  #   fish_add_path /home/paul/.krew/bin
  #   fish_add_path /home/paul/go/bin
  #   fish_add_path /home/paul/.yarn/bin
  #   fish_add_path /usr/local/cuda-12.6/bin/

    mise activate fish | source
  '';

  # TODO: Configure through home manager
  programs.neovim.enable = true;
  programs.neovim.withRuby = false;
  programs.neovim.withPython3 = false;

  programs.direnv.enable = true;
  programs.direnv.config = {
    global.load_dotenv = true;
  };

  home.packages = with pkgs; [
    # oci-cli
    kubectl
    postgresql
    pgcli

    nil
    alejandra

    taplo

    nodePackages.prettier
    typescript-language-server
    svelte-language-server
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
