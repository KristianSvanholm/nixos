{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    inputs.comin.nixosModules.comin
  ];
  services.comin = {
    enable = true;
    sshAllowedSignersPath = "${pkgs.writeText "comin-allowed-signers" ''
      kristianrorensvanholm@gmail.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOK8RufgRPvoPDRovOxteHN5ZEAXiJpXwJfVQuZsVtmj
    ''}";
    remotes = [
      {
        name = "origin";
        url = "https://github.com/KristianSvanholm/nixos.git";
        branches.main.name = "main";
        hostname = lib.toLower config.networking.hostName;
      }
    ];
  };
}
