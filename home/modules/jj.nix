{
  lib,
  config,
  ...
}: let
  cfg = config.modules.jj;
in {
  options.modules.jj = {
    enable = lib.mkEnableOption "jj module";
    email = lib.mkOption {
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.jujutsu.enable = true;
    programs.jujutsu.settings = {
      user.name = "Paul Olteanu";
      user.email = cfg.email;

      git = {
        write-change-id-header = true;
        subprocess = true;
      };

      ui = {
        default-command = "status";
        pager = "less -FRX";
        diff.format = "git";
        diff.tool = ["difft" "--color=always" "$left" "$right"];
        editor = "hx";
      };

      aliases = {
        lg = ["log" "-T" "log_compact"];
        lga = ["log" "-T" "log_compact" "-r" "all()"];
        tug = ["bookmark" "move" "--from" "heads(::@- & bookmarks())" "--to" "closest_pushable(@)"];
      };

      revset-aliases = {
        "closest_pushable(to)" = "heads(::to & mutable() & ~description(exact:\"\") & (~empty() | merges()))";
      };

      template-aliases = {
        log_compact = ''
          if(root,
            format_root_commit(self),
            label(if(current_working_copy, "working_copy"),
              concat(
                separate(" ",
                  pad_end(4, format_short_change_id_with_hidden_and_divergent_info(self)),
                  if(empty, label("empty", "(empty)")),
                  if(description,
                    description.first_line(),
                    label(if(empty, "empty"), description_placeholder),
                  ),
                  bookmarks,
                  tags,
                  working_copies,
                  if(git_head, label("git_head", "HEAD")),
                  if(conflict, label("conflict", "conflict")),
                  if(config("ui.show-cryptographic-signatures").as_boolean(),
                    format_short_cryptographic_signature(signature)),
                  format_timestamp(commit_timestamp(self)),
                ) ++ "\n",
              ),
            )
          )
        '';
      };
    };
  };
}
