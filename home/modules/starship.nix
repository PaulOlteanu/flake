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
    git_branch.format = "\\[[\$symbol\$branch](\$style)\\]";
    git_state.format = "[\(\$state( \$progress_current of \$progress_total)\)](\$style)";
    git_state.cherry_pick = "[🍒 PICKING](bold red)";
    git_status.format = "([\\[\$all_status\$ahead_behind\\]](\$style))";
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
  };
}
