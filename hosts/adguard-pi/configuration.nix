{
  config,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/sd-card/sd-image-aarch64.nix")
    (modulesPath + "/profiles/minimal.nix")
    (modulesPath + "/profiles/headless.nix")
    ../config.nix
    ../../modules/nixos/homelab/ssh.nix
    ../../modules/nixos/homelab/comin.nix
  ];

  disabledModules = [(modulesPath + "/profiles/base.nix")];

  nixpkgs.hostPlatform = "aarch64-linux";
  sdImage.compressImage = false;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["@wheel"]; # lets `--target-host` push closures
    extra-substituters = ["http://192.168.3.112:5000"];
    extra-trusted-public-keys = ["homelab-0:YkXXd/mBRuJwUjj706kaSzL4iBrbDEb9s6zlGLzWQLs="];
    connect-timeout = 5;
    fallback = true;
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  boot.loader.generic-extlinux-compatible.configurationLimit = 5;

  time.timeZone = "Europe/Oslo";

  networking = {
    hostName = "adguard-pi";
    firewall = {
      enable = true;
      allowedTCPPorts = [53];
      allowedUDPPorts = [53];
    };
    # the pi resolves upstream itself, never through its own adguard
    nameservers = ["1.1.1.1" "8.8.8.8"];
    dhcpcd.extraConfig = "nohook resolv.conf";
  };

  services.adguardhome = {
    enable = true;
    mutableSettings = true;
    openFirewall = true; # 3000
  };

  users.users.${config.user.name} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "26.11";
}
