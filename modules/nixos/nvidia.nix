{...}: {
  services.xserver.videoDrivers = ["nvidia"];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true; # Wayland support
    powerManagement.enable = false; # Enable if graphical corruption
    powerManagement.finegrained = false; # Turns off gpu when not in use (EXP)
    open = true; # Use nvidia open source kernel module
    nvidiaSettings = true; # Enable 'nvidia-settings' menu
  };
}
