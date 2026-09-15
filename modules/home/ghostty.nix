{pkgs, ...}: {
  home.packages = [pkgs.timg];

  stylix.targets.ghostty.enable = false;

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "noctalia";
      confirm-close-surface = false;
      gtk-single-instance = true;
    };
    # Provides the daemon unit + D-Bus activation; started from umbriel autostart
    # (the graphical-session.target want never fires with a persistent user manager).
    systemd.enable = true;
  };
}
