{pkgs, ...}: {
  # I3
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
        i3lock-color
      ];
    };
  };

  services.displayManager.defaultSession = "none+i3";
}
