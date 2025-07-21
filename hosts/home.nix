{config, ...}: {
  imports = [
    ../modules/home/zsh.nix
    ./config.nix
  ];

  # Important
  home = {
    username = config.user.name;
    homeDirectory = config.user.home;
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    home-manager.enable = true; # Let Home Manager manage itself
  };

  stylix.targets = {
    nvf.enable = false;
    btop.enable = false;
  };

  home.stateVersion = "24.05"; # Dont touch
}
