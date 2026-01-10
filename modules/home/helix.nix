{pkgs, ...}: {
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      nil
      rust-analyzer
      gopls
      jdt-language-server
      nixfmt
    ];
    settings = {
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        true-color = true;
        indent-guides.render = true;
      };
    };
    languages = {
      language-server = {
        nil = {
          command = "${pkgs.nil}/bin/nil";
        };

        gopls = {
          command = "${pkgs.gopls}/bin/gopls";
        };

        rust-analyzer = {
          command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        };

        jdtls = {
          command = "${pkgs.jdt-language-server}/bin/jdtls";
        };
      };

      language = [
        # Nix
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
          language-servers = ["nil"];
        }

        # Go
        {
          name = "go";
          auto-format = true;
          formatter.command = "${pkgs.go}/bin/gofmt";
          language-servers = ["gopls"];
        }

        # Rust
        {
          name = "rust";
          auto-format = true;
          language-servers = ["rust-analyzer"];
        }

        # Java
        {
          name = "java";
          auto-format = true;
          language-servers = ["jdtls"];
        }
      ];
    };
  };
}
