{...}: {
  programs.nvf.settings.vim = {
    statusline.lualine.enable = true;
    statusline.lualine.setupOpts.options.theme = "gruvbox_dark";
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

    mini.surround.enable = true;

    utility.oil-nvim = {
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
  };
}
