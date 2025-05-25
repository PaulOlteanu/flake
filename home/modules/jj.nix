{
  config,
  pkgs,
  ...
}: {
  programs.jujutsu.enable = true;
  programs.jujutsu.settings = {
    user.name = "Paul Olteanu";
    user.email = "p.a.olteanu@gmail.com";

    git = {
      write-change-id-header = true;
      subprocess = true;
    };

    ui = {
      default-command = "status";
      pager = "less -FRX";
      diff.format = "git";
      diff.tool = ["difft" "--color=always" "$left" "$right"];
    };

    aliases = {
      lg = ["log" "-T" "log_compact"];
      tug = ["bookmark" "move" "--from" "heads(::@- & bookmarks())" "--to" "@-"];
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
}
