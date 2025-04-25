{ inputs, pkgs, config, ... }:
let
    inherit (config.lib.stylix) colors;
in
{

    imports = [ 
        inputs.nvf.homeManagerModules.default
        ./latex.nix 
    ];

    home.packages = with pkgs; [
        fd
        nodejs_23
        tree-sitter
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
                    base16-colors = {
                        inherit (colors) base00 base01 base02 base03 base04 base05 base06 base07;
                        inherit (colors) base08 base09 base0A base0B base0C base0D base0E base0F;
                    };
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

                    typst = {
                        enable = true;
                        format.enable = true;
                        extensions.typst-preview-nvim = {
                            enable = true;
                            setupOpts = {
                                extra_args = [
                                    "--input=ver=draft"
                                    "--ignore-system-fonts"
                                ];
                            };
                        };
                    };

	            nix.enable = true;
                    nix.format.enable = true;
	            rust.enable = true;
	            go.enable = true;
	        };
            };
        };
    };
}
