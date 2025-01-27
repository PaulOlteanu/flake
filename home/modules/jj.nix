{
  config,
  pkgs,
  ...
}: {
  programs.jujutsu.enable = true;
  programs.jujutsu.settings = {
    user.name = "Paul Olteanu";
    user.email = "p.a.olteanu@gmail.com";
    ui.pager = "less -FRX";
  };
}
