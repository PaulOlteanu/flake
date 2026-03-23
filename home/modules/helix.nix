{
  config,
  pkgs,
  ...
}: {
  programs.helix.enable = true;

  programs.helix.settings = {
    theme = "onedark";

    editor = {
      cursorline = true;
      completion-trigger-len = 1;
      auto-pairs = true;
      true-color = true;
      scrolloff = 3;
      idle-timeout = 50;
      bufferline = "always";
      color-modes = true;

      soft-wrap.enable = true;

      statusline.left = ["mode" "spinner" "version-control" "file-name"];

      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      file-picker.hidden = false;

      whitespace = {
        render.newline = "none";
        characters.space = "·";
        characters.tab = "→";
        characters.newline = "⏎";
      };

      indent-guides = {
        render = true;
        character = "⎸";
        skip-levels = 1;
      };

      lsp = {
        display-messages = true;
        display-inlay-hints = true;
        auto-signature-help = false;
        display-signature-help-docs = true;
      };
    };

    keys.normal = {
      esc = ["collapse_selection" "keep_primary_selection"];
      X = ["extend_line_up" "extend_to_line_bounds"];
      space.i = "signature_help";
      space.H = ":toggle lsp.display-inlay-hints";
    };

    keys.select = {
      X = ["extend_line_up" "extend_to_line_bounds"];
    };

    keys.insert = {
      "C-left" = "move_prev_word_start";
      "C-right" = "move_next_word_start";
      "C-up" = "move_line_up";
      "C-down" = "move_line_down";
    };
  };

  programs.helix.languages = {
    language = [
      {
        name = "python";
        auto-format = true;
        language-servers = ["pyright" "ruff"];
      }

      {
        name = "nix";
        formatter.command = "alejandra";
        language-servers = ["nil"];
      }

      {
        name = "typescript";
        language-servers = ["typescript-language-server"];
        formatter = {
          command = "prettier";
          args = ["--parser" "typescript"];
        };
      }

      {
        name = "tsx";
        language-servers = ["typescript-language-server"];
        formatter = {
          command = "prettier";
          args = ["--parser" "typescript"];
        };
      }

      {
        name = "scala";
        auto-format = false;
      }

      {
        name = "yaml";
        auto-format = false;
        formatter = {
          command = "yamlfmt";
          args = ["-"];
        };
      }

      {
        name = "toml";
        indent = {
          tab-width = 4;
          unit = "  ";
        };
      }
    ];

    language-server = {
      rust-analyzer.timeout = 120;
      rust-analyzer.config.check.command = "clippy";

      pyright.config.python.analysis.typeCheckingMode = "basic";

      ruff.command = "ruff";
      ruff.args = ["server"];

      metals.timeout = 60;
    };
  };
}
