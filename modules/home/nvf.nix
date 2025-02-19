{ inputs, pkgs, ... }:
{

    imports = [ 
        inputs.nvf.homeManagerModules.default
        ./latex.nix 
    ];

    programs.nvf = {
        enable = true;
	  settings = {
	    vim = {

                globals = {
                    maplocalleader = " ";
                };

		theme = {
		    enable = true;
		    name = "gruvbox";
		    style = "dark";
		};
            

                # Plugins
		statusline.lualine.enable = true;
		autocomplete.nvim-cmp.enable = true;
                git.gitsigns.enable = true;

		extraPlugins = with pkgs.vimPlugins; {
		    vimtex = {
			package = vimtex;
                        #setup = "require('vimtex').setup {}";
			after =''
                            filetype plugin indent on
                            syntax enable

                            let g:vimtex_view_method = 'zathura'

                            let g:vimtex_compiler_method = 'latexmk'

                        '';
		    };
		};

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

                # Lsp
	        languages = {
	            enableLSP = true;
	            enableTreesitter = true;

	            nix.enable = true;
                    nix.format.enable = true;
	            rust.enable = true;
	            go.enable = true;
	        };
            };
        };
    };
}
