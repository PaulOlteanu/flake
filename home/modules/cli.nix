{pkgs, ...}: {
  imports = [
    ./starship.nix
    ./git.nix
    ./jj.nix
    ./helix.nix
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # TODO: Figure out theming
  programs.fish.enable = true;

  programs.bat.enable = true;
  programs.bat.config.theme = "TwoDark"; 

  programs.eza.enable = true;
  programs.fd.enable = true;
  programs.ripgrep.enable = true;
  programs.jq.enable = true;
  programs.zoxide.enable = true;

  programs.tealdeer.enable = true;
  programs.bottom.enable = true;

  programs.yazi.enable = true;

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

    pkgs.procs
    pkgs.dust
  ];
}
