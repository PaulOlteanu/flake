{
  config,
  pkgs,
  ...
}: {
  programs.vscode.enable = true;
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    # rust-lang.rust-analyzer
    dbaeumer.vscode-eslint
    tamasfe.even-better-toml
    eamodio.gitlens
    yzhang.markdown-all-in-one
    esbenp.prettier-vscode
    shardulm94.trailing-spaces
    vscode-icons-team.vscode-icons
  ];
}
