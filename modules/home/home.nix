{username, ...}: {
  imports = [
    ./zsh.nix
  ];

  # Important
  home = {
    username = username;
    homeDirectory = "/home/${username}";
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
