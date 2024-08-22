{ inputs, ... }:
{
  imports = [
	inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    plugins.lsp = {
        enable = true;

        servers = {

            lua-ls = {
                enable = true;
                settings.telemetry.enable = false;
            };

            gopls.enable = true;

            rust-analyzer = {
                enable = true;
                installCargo = true;
		installRustc = true;
            };

        };
    };

    opts = {
        number = true;
        relativenumber = true;
        shiftwidth = 4;
    };

    plugins = { 
        lualine.enable = true;
        telescope.enable = true;
        treesitter.enable = true;
        cmp = {
            enable = true;
            autoEnableSources = true;
        };
    };

    globals = {
        mapleader = " ";
	maplocalleader = " ";
    };

    keymaps = [
        {
            action = "<cmd>Telescope live_grep<CR>";
            key = "<leader>sg";
        }
	{
	    action = "<cmd>Telescope find_files<CR>";
	    key = "<leader>sf";
	}
    ];

    colorschemes.gruvbox.enable = true;
  };

}
