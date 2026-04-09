{...}: {
  boot.consoleLogLevel = 0;
  boot.kernelParams = ["quiet" "udev.log_level=3" "usbcore.autosuspend=-1"];
  boot.initrd.verbose = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.limine = {
    enable = true;
    efiSupport = true;
    maxGenerations = 10;
    extraEntries = ''
      /Windows
          protocol: efi
          path: guid(64aceaf0-5244-4fde-91d8-e3883894613e):/EFI/Microsoft/Boot/bootmgfw.efi
    '';
  };
}
