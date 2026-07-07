{pkgs, ...}: {
  environment.systemPackages = [pkgs.sbctl];
  stylix.targets.plymouth.enable = false;
  boot = {
    plymouth = {
      enable = true;
      theme = "hexagon";
      themePackages = [pkgs.adi1090x-plymouth-themes];
    };
    consoleLogLevel = 0;
    kernelParams = ["quiet" "udev.log_level=3" "usbcore.autosuspend=-1"];
    initrd.verbose = false;
    loader = {
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      limine = {
        enable = true;
        secureBoot.enable = true;
        efiSupport = true;
        maxGenerations = 10;
        extraEntries = ''
          /Windows
              protocol: efi
              path: guid(64aceaf0-5244-4fde-91d8-e3883894613e):/EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };
    };
  };
}
