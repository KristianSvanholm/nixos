{ config, lib, ... }:

{
    # Nvidia
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false; # Enable if graphical corruption
        powerManagement.finegrained = false; # Turns off gpu when not in use (EXP)
        open = false; # Use nvidia open source kernel module
        nvidiaSettings = true; # Enable 'nvidia-settings' menu
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        /**package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
            version = "555.58";

            sha256_64bit = "sha256-bXvcXkg2kQZuCNKRZM5QoTaTjF4l2TtrsKUvyicj5ew=";
            sha256_aarch64 = lib.fakeSha256;
            openSha256 = lib.fakeSha256;
            settingsSha256 = "sha256-vWnrXlBCb3K5uVkDFmJDVq51wrCoqgPF03lSjZOuU8M=";
            persistencedSha256 = lib.fakeSha256;
        };**/ # Specify which drivers
    };
}
