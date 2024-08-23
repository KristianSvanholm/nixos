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
	    signcolumn = "yes";
	    background = "";
	};

	plugins = { 
	    lualine.enable = true;
	    telescope.enable = true;
	    treesitter = {
		enable = true;
		settings.auto_install = true;
		settings.ensure_installed = [ "go" "rust" "python" "lua" ];
	    };
	    gitsigns = {
		enable = true;
		settings = {
		    signcolumn = true;
		    signs = {
			add.text = "+";
			change.text = "~";
			changedelete.text = "~";
			delete.text = "-";
			topdelete.text = "-";
			untracked.text = " ";
		    };
		    watch_gitdir.follow_files = true;
		};
	    };
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

	colorschemes.kanagawa.enable = true;
	colorschemes.kanagawa.settings = {
	    theme = "wave";
	    commentStyle.italic = true;
	    compile = false;
	    terminalColors = true;
	    transparent = false;
	    undercurl = false;
	};
    };
}
