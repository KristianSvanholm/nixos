{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs
    eslint_d
    tree-sitter
    typst
  ];

  programs.nvf.settings.vim = {
    lsp.enable = true;
    lsp.formatOnSave = true;
    lsp.trouble.enable = true;

    utility.preview.markdownPreview = {
      enable = true;
      autoStart = true;
      autoClose = true;
    };

    languages = {
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;

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
      yaml.enable = true;
      kotlin.enable = true;
      typescript.enable = true;
      typescript.format.enable = true;
      markdown.enable = true;
      rust.enable = true;
      rust.format.enable = true;
      go.enable = true;
      go.format.enable = true;
      java.enable = true;
      terraform.enable = true;
    };
  };
}
