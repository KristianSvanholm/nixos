{
  pkgs,
  username,
  home,
  ...
}: {
  imports = [
    ../../modules/home/zsh.nix
  ];

  # Important
  home = {
    username = username;
    homeDirectory = home;
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    home-manager.enable = true; # Let Home Manager manage itself
  };

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = with pkgs; [
  ];

  home.stateVersion = "24.05"; # Dont touch
}
