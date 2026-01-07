{...}: {
  boot.consoleLogLevel = 0;
  boot.kernelParams = ["quiet" "udev.log_level=3"];
  boot.initrd.verbose = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.limine = {
    enable = true;
    efiSupport = true;
    maxGenerations = 10;
  };
}
