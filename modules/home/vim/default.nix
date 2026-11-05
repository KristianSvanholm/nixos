{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./plugins.nix
  ];

  home.packages = with pkgs; [
    fd
    ripgrep
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      keymaps = [
        {
          key = "<leader>o";
          mode = "n";
          action = ":Oil --float <CR>";
        }
      ];
      clipboard = {
        enable = true;
        registers = "unnamedplus";
      };
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };

      options.signcolumn = "yes";
      options.shiftwidth = 4;
      options.wrap = false;
    };
  };
}
