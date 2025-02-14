{ inputs, ... }:
{

    imports = [ inputs.nvf.homeManagerModules.default ];

    programs.nvf = {
        enable = true;
	  settings = {
	    vim = {

		theme = {
		    enable = true;
		    name = "gruvbox";
		    style = "dark";
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
