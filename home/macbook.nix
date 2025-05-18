{pkgs, ...}: {
  home.username = "paul";
  home.homeDirectory = "/Users/paul";

  imports = [
    ./modules/k9s

    ./modules/cli.nix
    ./modules/git.nix

    ./modules/wezterm.nix

    ./modules/helix.nix
  ];

  modules.git.enable = true;
  modules.git.email = "p.a.olteanu@gmail.com";

  modules.wezterm.enable = true;
  modules.wezterm.default_prog = "/Users/paul/.nix-profile/bin/fish";

  home.packages = with pkgs; [
    nil
    alejandra
    taplo
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
