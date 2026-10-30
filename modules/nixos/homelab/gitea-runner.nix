{pkgs, ...}: {
  # the nodes resolve through public dns, which gives the wan address and doesn't hairpin
  networking.hosts."192.168.3.112" = ["git.krsv.no"];

  # host label: jobs share this node's nix daemon and store, comin then finds the build locally
  services.gitea-actions-runner.instances.homelab = {
    enable = true;
    name = "homelab-0";
    url = "https://git.krsv.no";
    # repo-scoped registration token, not managed by nix; must exist before the first switch
    tokenFile = "/var/lib/gitea-runner-token";
    labels = ["nix:host"];
    hostPackages = with pkgs; [
      bash
      coreutils
      curl
      gawk
      gitMinimal
      gnused
      nix
      nodejs
      wget
    ];
  };
}
