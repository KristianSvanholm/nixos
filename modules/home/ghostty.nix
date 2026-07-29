{ pkgs, ... }: {
  home.packages = [ pkgs.timg ];

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      #theme = "";
      confirm-close-surface = false;
    };
    systemd.enable = true;
  };
}
