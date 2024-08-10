{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    difftastic.enable = true;
    userEmail = "p.a.olteanu@gmail.com";
    userName = "Paul Olteanu";
    aliases = rec {
      ll = "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative";
      lg = ll;
      lg2 = "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all -n 15";
      "difft" = "difftool";
    };
    extraConfig = {
      init.defaultBranch = "main";
      pull.ff = "only";
      merge.conflictstyle = "zdiff3";
      branch.sort = "-committerdate";

      diff.algorithm = "histogram";
      diff.tool = "difftastic";
      difftool.prompt = false;
      difftool.difftastic = {
        cmd = ''difft "$LOCAL" "$REMOTE"'';
      };
      pager.difftool = true;
      pager.branch = false;

      rerere = {
        enabled = true;
        autoUpdate = true;
      };
    };
  };
}
