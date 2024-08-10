{pkgs, ...}: {
  imports = [
    ./starship.nix
    ./git.nix
    ./helix.nix
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # TODO: Figure out theming
  programs.fish.enable = true;

  programs.eza.enable = true;
  programs.fd.enable = true;
  programs.ripgrep.enable = true;
  programs.jq.enable = true;
  programs.zoxide.enable = true;
  programs.tealdeer.enable = true;
  programs.lazygit.enable = true;
  programs.bottom.enable = true;

  programs.fzf = {
    enable = true;
    enableFishIntegration = false;
    enableBashIntegration = false;
    enableZshIntegration = false;
  };

  programs.atuin = {
    enable = true;
    flags = ["--disable-up-arrow"];
    settings = {
      enter_accept = false;
    };
  };

  home.packages = [
    (pkgs.python3Packages.callPackage ../../packages/shyaml.nix {})
    (pkgs.callPackage ../../packages/flamegraph.nix {})
  ];
}
