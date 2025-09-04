{
  inputs,
  pkgs,
  config,
  ...
}: let
  inherit (config.lib.stylix) colors;
in {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./latex.nix
  ];

  home.packages = with pkgs; [
    fd
    nodejs
    tree-sitter
    typst
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };
        theme = {
          enable = true;
          base16-colors = {
            inherit (colors) base00 base01 base02 base03 base04 base05 base06 base07;
            inherit (colors) base08 base09 base0A base0B base0C base0D base0E base0F;
          };
        };

        # Plugins
        statusline.lualine.enable = true;
        autocomplete.nvim-cmp.enable = true;
        git.gitsigns.enable = true;

        telescope = {
          enable = true;
          mappings = {
            findFiles = "<leader>sf";
            liveGrep = "<leader>sg";
          };
        };

        # Opts
        options.signcolumn = "yes";
        options.shiftwidth = 4;
        options.wrap = false;

        lsp.enable = true;
        lsp.formatOnSave = true;
        lsp.trouble.enable = true;

        # Utility
        utility.oil-nvim.enable = true;
        # Lsp
        languages = {
          enableTreesitter = true;
          enableFormat = true;

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
          kotlin = {
            enable = true;
            lsp.enable = true;
          };
          ts.enable = true;
          ts.format.enable = true;
          rust.enable = true;
          go.enable = true;
        };
      };
    };
  };
}
