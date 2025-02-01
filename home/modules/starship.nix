{
  config,
  pkgs,
  ...
}: {
  programs.starship.enable = true;

  programs.starship.settings = {
    aws.format = "\\[[\$symbol(\$profile)(\(\$region\))(\\[\$duration\\])](\$style)\\]";
    bun.format = "";
    c.format = "";
    cmake.format = "";
    # cmd_duration.format = "\\[[⏱ \$duration](\$style)\\]";
    cmd_duration.format = "";
    cobol.format = "";
    conda.format = "\\[[\$symbol\$environment](\$style)\\]";
    crystal.format = "";
    daml.format = "";
    dart.format = "";
    deno.format = "";
    docker_context.format = "\\[[\$symbol\$context](\$style)\\]";
    dotnet.format = "";
    elixir.format = "";
    elm.format = "";
    erlang.format = "";
    fennel.format = "";
    fossil_branch.format = "\\[[\$symbol\$branch](\$style)\\]";
    gcloud.format = "\\[[\$symbol\$account(@\$domain)(\(\$region\))](\$style)\\]";
    golang.format = "";
    gradle.format = "";
    guix_shell.format = "";
    haskell.format = "";
    haxe.format = "";
    helm.format = "";
    hg_branch.format = "\\[[\$symbol\$branch](\$style)\\]";
    java.format = "";
    julia.format = "";
    kotlin.format = "";
    kubernetes.disabled = false;
    kubernetes.symbol = "󱃾 ";
    # ☸
    kubernetes.format = "\\[[\$symbol\$context( \(\$namespace\))](\$style)\\]";
    lua.format = "";
    memory_usage.format = "";
    meson.format = "";
    nim.format = "";
    nix_shell.format = "\\[[\$symbol\$state( \(\$name\))](\$style)\\]";
    nodejs.format = "";
    ocaml.format = "";
    opa.format = "";
    openstack.format = "\\[[\$symbol\$cloud(\(\$project\))](\$style)\\]";
    os.format = "";
    package.format = "";
    perl.format = "";
    php.format = "";
    pijul_channel.format = "\\[[\$symbol\$channel](\$style)\\]";
    pulumi.format = "";
    purescript.format = "";
    python.format = "\\[[\${symbol}\${pyenv_prefix}(\${version})(\(\$virtualenv\))](\$style)\\]";
    raku.format = "";
    red.format = "";
    ruby.format = "";
    rust.format = "";
    scala.format = "";
    spack.format = "";
    sudo.format = "\\[[as \$symbol](\$style)\\]";
    swift.format = "";
    terraform.format = "\\[[\$symbol\$workspace](\$style)\\]";
    time.format = "";
    username.format = "\\[[\$user](\$style)\\]";
    vagrant.format = "\\[[\$symbol(\$version)](\$style)\\]";
    vlang.format = "";
    zig.format = "";
    solidity.format = "";

    git_branch = {
      # disabled = true;
      format = "\\[[\$symbol\$branch](\$style)\\]";
    };

    git_commit = {
      # disabled = true;
    };

    git_status = {
      format = "([\\[\$all_status\$ahead_behind\\]](\$style))";
      # disabled = true;
    };

    git_state = {
      # disabled = true;
      format = "[\(\$state( \$progress_current of \$progress_total)\)](\$style)";
      cherry_pick = "[🍒 PICKING](bold red)";
    };

    # git_metrics.disabled = true;

    # custom.git_branch = {
    #   when = true;
    #   command = "jj root >/dev/null 2>&1 || starship module git_branch";
    #   description = "Only show git_branch if we're not in a jj repo";
    # };

    # custom.git_commit = {
    #   when = true;
    #   command = "jj root >/dev/null 2>&1 || starship module git_commit";
    #   description = "Only show git_branch if we're not in a jj repo";
    # };

    # custom.git_state = {
    #   when = true;
    #   command = "jj root >/dev/null 2>&1 || starship module git_state";
    #   description = "Only show git_branch if we're not in a jj repo";
    # };

    # custom.git_status = {
    #   when = true;
    #   command = "jj root >/dev/null 2>&1 || starship module git_status";
    #   description = "Only show git_branch if we're not in a jj repo";
    # };

    # custom.jj = {
    #   description = "current jj status";
    #   symbol = "";
    #   when = true;
    #   # jj root > /dev/null && jj log --revisions @ --no-graph --ignore-working-copy --color always --limit 1 --template '
    #   command = ''
    #     jj root > /dev/null 2>&1 && jj log --revisions @ --no-graph --color always --limit 1 --template '
    #       separate(" ",
    #         concat(
    #           raw_escape_sequence("\e[0;37m"),
    #           "[",
    #           change_id.shortest(4),
    #           if(bookmarks.len() != 0, " "),
    #           bookmarks,
    #           "]"
    #         ),
    #         concat(
    #           if(conflict, "💥"),
    #           if(divergent, "🚧"),
    #           if(hidden, "👻"),
    #           if(immutable, "🔒"),
    #         ),
    #         raw_escape_sequence("\x1b[1;32m") ++ if(empty, "(empty)"),
    #         raw_escape_sequence("\x1b[1;32m") ++ if(description.first_line().len() == 0,
    #           "(no description set)",
    #           if(description.first_line().substr(0, 29) == description.first_line(),
    #             description.first_line(),
    #             description.first_line().substr(0, 29) ++ "…",
    #           )
    #         ) ++ raw_escape_sequence("\x1b[0m"),
    #       )
    #     '
    #   '';
    # };
  };
}
