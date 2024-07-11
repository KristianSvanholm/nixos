{ config, ... }:

{
    # Nvidia
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false; # Enable if graphical corruption
        powerManagement.finegrained = false; # Turns off gpu when not in use (EXP)
        open = false; # Use nvidia open source kernel module
        nvidiaSettings = true; # Enable 'nvidia-settings' menu
        package = config.boot.kernelPackages.nvidiaPackages.production; # Specify which drivers
    };
}
