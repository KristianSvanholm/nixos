{lib, ...}: let
  # Small hack to keep evaluation pure, but bypassing the need of including hardware-configuration in git.
  # Allows for multiple devices to use same host without hardware-configurations clashing.
  hwConfigPath = "/etc/nixos/hardware-configuration.nix";
  hwConfigExists = builtins.pathExists hwConfigPath;
in {
  imports = lib.optional hwConfigExists [hwConfigPath];
}
