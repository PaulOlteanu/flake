{ config, pkgs, ... }:
{
  programs.ghostty.enable = true;
  programs.ghostty.enableFishIntegration = true;

  programs.ghostty.settings = {
    command = "fish";
    font-family = "JetbrainsMonoNL Nerd Font";
    theme = "OneHalfDark";

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
  };
}
