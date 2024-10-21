{ inputs, pkgs, ... }:
{
    imports = [
	inputs.nixvim.homeManagerModules.nixvim
    ];

    home.packages = with pkgs; [ 
	fd
	ripgrep
	nodejs
    ];

    programs.nixvim = {
	enable = true;
	defaultEditor = true;
	plugins.lsp = {
	    enable = true;

	    servers = {

		lua_ls = {
		    enable = true;
		    settings.telemetry.enable = false;
		};

		gopls.enable = true;

		rust_analyzer = {
		    enable = true;
                    installCargo = true;
		    installRustc = true;
		};

		java_language_server = {
		    enable = true;
		};
	    };
	};

	opts = {
	    number = true;
            relativenumber = true;
            shiftwidth = 4;
	    signcolumn = "yes";
	    background = "";
	    termguicolors = true;
	};

	plugins = { 
	    lualine.enable = true;
	    telescope.enable = true;
	    /*mini = {
		enable = true;
		mockDevIcons = true;
		modules.icons = {
		    style = "glyph";
		};
	    };*/
	    treesitter = {
		enable = true;
		settings.highlight.enable = true;
		settings.auto_install = true;
		settings.ensure_installed = [ "go" "nix" "rust" "python" "lua" ];
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
		settings.mapping = {
		    "<C-Space>" = "cmp.mapping.complete()";
		    "<C-d>" = "cmp.mapping.scroll_docs(-4)";
		    "<C-e>" = "cmp.mapping.close()";
		    "<C-f>" = "cmp.mapping.scroll_docs(4)";
		    "<CR>" = "cmp.mapping.confirm({ select = true })";
		    "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
		    "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
		};
		settings.sources = [{name = "nvim_lsp";}];
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
	
	/*
	colorschemes.kanagawa.enable = true;
	colorschemes.kanagawa.settings = {
	    theme = "dragon";
	    commentStyle.italic = true;
	    compile = false;
	    terminalColors = true;
	    transparent = false;
	    undercurl = false;
	};
	*/

	#colorschemes.gruvbox.enable = true;
	#colorschemes.gruvbox.settings.terminal_colors = true;
	
	colorschemes.catppuccin.enable = true;
	colorschemes.catppuccin.settings = {
	    flavour = "mocha";
	    integrations = {
		cmp = true;
		gitsigns = true;
		treesitter = true;
	    };
	    disable_underline = true;
	    term_clors = true;

	};
    };
}
