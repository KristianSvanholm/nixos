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
 
    # Ensure nixd uses same pkgs as system
    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    programs.nixvim = {
	enable = true;
	defaultEditor = true;
	plugins.lsp = {
	    enable = true;

	    servers = {
		gopls.enable = true;
		
		nixd = {
		    enable = true;
		    settings = {
			formatting.command = [ "alejandra" ];
			nixpkgs.expr = "import (builtins.fetFlake \"/home/krs/nixos\").inputs.nixpkgs { }";
			options = {
			    nixos.expr = "(builtins.getFlake \"/home/krs/nixos\").nixosConfiguration.default.options";
			    home_manager.expr = "(builtins.getFlake \"/home/krs/nixos\").nixosConfiguration.default.options)";
			};
		    };
		};

		java-language-server.enable = true;

		lua-ls = {
		    enable = true;
		    settings.telemetry.enable = false;
		};

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
	/*		
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
	*/
    };
}
