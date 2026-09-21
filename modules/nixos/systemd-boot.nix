{
  config,
  lib,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # hl-0 mounts the ESP at /boot/efi, hl-1 at /boot.
  boot.loader.efi.efiSysMountPoint = lib.mkIf (config.fileSystems ? "/boot/efi") "/boot/efi";
}
