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

  # the nodes resolve through public dns, which gives the wan address and doesn't hairpin
  networking.hosts."192.168.3.112" = ["git.krsv.no"];

  services.comin = {
    enable = true;
    hostname = lib.toLower config.networking.hostName;
    sshAllowedSignersPath = "${pkgs.writeText "comin-allowed-signers" ''
      kristianrorensvanholm@gmail.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOK8RufgRPvoPDRovOxteHN5ZEAXiJpXwJfVQuZsVtmj
    ''}";
    remotes = [
      {
        name = "gitea";
        url = "https://git.krsv.no/homelab/nixos.git";
        branches.main.name = "deploy";
      }
      {
        name = "github";
        url = "https://github.com/KristianSvanholm/nixos.git";
        branches.main.name = "deploy";
      }
    ];
  };
}
