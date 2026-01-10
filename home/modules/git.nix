{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.modules.git;
in {
  options.modules.git = {
    enable = lib.mkEnableOption "git module";
    email = lib.mkOption {
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.difftastic.git.enable = true;

    programs.git = {
      enable = true;
      ignores = [
        ".helix/"
      ];


      settings = {
        user.name = "Paul Olteanu";
        user.email = cfg.email;

        alias = {
          lg = "log --graph --exclude=refs/remotes/* --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative";
          lga = "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative";

          lg2 = "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all -n 15";
          "difft" = "difftool";
        };

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
  };
}
