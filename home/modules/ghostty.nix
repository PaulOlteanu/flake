{
  config,
  pkgs,
  ...
}: {
  programs.ghostty.enable = true;
  programs.ghostty.enableFishIntegration = true;

  programs.ghostty.settings = {
    command = "fish";
    font-family = "JetbrainsMonoNL Nerd Font";
    # cursor-style = "block";
    cursor-style-blink = false;
    shell-integration-features = "no-cursor";

    keybind = [
      "ctrl+one=goto_tab:1"
      "ctrl+two=goto_tab:2"
      "ctrl+three=goto_tab:3"
      "ctrl+four=goto_tab:4"
      "ctrl+five=goto_tab:5"
      "ctrl+six=goto_tab:6"
      "ctrl+seven=goto_tab:7"
      "ctrl+eight=goto_tab:8"
      "ctrl+nine=last_tab"
      "ctrl+tab=next_tab"
      "ctrl+shift+tab=previous_tab"
    ];

    mouse-scroll-multiplier = 0.5;

    theme = "OneHalfDarkFixed";
  };

  xdg.configFile."ghostty/themes/OneHalfDarkFixed".text = ''
    palette = 0=#282c34
    palette = 1=#e06c75
    palette = 2=#98c379
    palette = 3=#e5c07b
    palette = 4=#61afef
    palette = 5=#c678dd
    palette = 6=#56b6c2
    palette = 7=#dcdfe4
    palette = 8=#707682
    palette = 9=#e06c75
    palette = 10=#98c379
    palette = 11=#e5c07b
    palette = 12=#61afef
    palette = 13=#c678dd
    palette = 14=#56b6c2
    palette = 15=#dcdfe4
    background = #282c34
    foreground = #dcdfe4
    cursor-color = #a3b3cc
    cursor-text = #dcdfe4
    selection-background = #474e5d
    selection-foreground = #dcdfe4
  '';
}
