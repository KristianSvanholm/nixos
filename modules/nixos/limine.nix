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
              path: guid(d231388f-61b3-4154-b7f4-729369be9efa):/EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };
    };
  };
}
