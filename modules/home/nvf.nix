{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    fd
    nodejs
    eslint_d
    tree-sitter
    typst
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        keymaps = [
          {
            key = "<leader>o";
            mode = "n";
            action = ":Oil --float <CR>";
          }
        ];
        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        # Plugins
        statusline.lualine.enable = true;
        statusline.lualine.theme = "gruvbox_dark";
        autocomplete.nvim-cmp.enable = true;
        /*
          # Produces graphical artifacts...
          autocomplete.blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
        };
        */
        git.gitsigns.enable = true;

        telescope = {
          enable = true;
          setupOpts = {
            defaults.color_devicons = true;
            defaults.selection_caret = "> ";
          };
          mappings = {
            findFiles = "<leader>sf";
            liveGrep = "<leader>sg";
            diagnostics = "<leader>se";
            buffers = "<leader>sb";
            resume = "<leader>sr";
            gitBranches = "<leader>gb";
            gitBufferCommits = "<leader>gcb";
            gitCommits = "<leader>gc";
            gitStatus = "<leader>gs";
          };
        };

        # Opts
        options.signcolumn = "yes";
        options.shiftwidth = 4;
        options.wrap = false;

        lsp.enable = true;
        lsp.formatOnSave = true;
        lsp.trouble.enable = true;

        mini.surround.enable = true;
        # Utility
        utility = {
          oil-nvim = {
            enable = true;
            gitStatus.enable = true;
            setupOpts = {
              columns = [
                "icon"
              ];
              view_options = {
                show_hidden = true;
              };
              float = {
                max_width = 0.5;
                max_height = 0.8;
              };
            };
          };
          preview.markdownPreview = {
            enable = true;
            autoStart = true;
            autoClose = true;
          };
        };

        # Lsp
        languages = {
          enableTreesitter = true;
          enableFormat = true;
          enableExtraDiagnostics = true;

          typst = {
            enable = true;
            format.enable = true;
            extensions.typst-preview-nvim = {
              enable = true;
              setupOpts = {
                invert_colors = "always";
                extra_args = [
                  "--input=ver=draft"
                  "--ignore-system-fonts"
                ];
              };
            };
          };

          nix.enable = true;
          nix.format.enable = true;
          yaml.enable = true;
          kotlin.enable = true;
          typescript.enable = true;
          typescript.format.enable = true;
          markdown.enable = true;
          rust.enable = true;
          rust.format.enable = true;
          go.enable = true;
          go.format.enable = true;
          java.enable = true;
          terraform.enable = true;
        };
      };
    };
  };
}
