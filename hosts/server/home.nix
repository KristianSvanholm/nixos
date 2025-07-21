{username, ...}: {
  imports = [
    ../../modules/home/zsh.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    sessionVariables = {EDITOR = "nvim";};
  };

  programs.home-manager.enable = true;

  stylix.targets = {
    btop.enable = false;
  };

  home.stateVersion = "24.05";
}
