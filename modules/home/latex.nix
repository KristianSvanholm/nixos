{pkgs, ...}: {
  home.packages = with pkgs; [
    zathura
    texliveFull
    inkscape
  ];

  programs.nvf = {
    settings.vim = {
      globals = {
        tex_flavor = "latex";
        maplocalleader = " ";
        vimtex_compiler_method = "latexmk";
        vimtex_view_method = "zathura";
        vimtex_compiler_latexmk = {
          callback = 1;
          continuous = 1;
          executable = "latexmk";
          hooks = [];
          options = [
            "-verbose"
            "-file-line-error"
            "-synctex=1"
            "-interaction=nonstopmode"
            "-shell-escape"
          ];
        };
      };

      lazy.plugins.vimtex = {
        enabled = true;
        package = pkgs.vimPlugins.vimtex;
        lazy = true;
        ft = "tex";
      };
    };
  };
}
