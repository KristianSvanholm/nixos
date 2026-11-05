{...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration-1.nix
    ../../modules/nixos/homelab/k3s.nix
  ];
  networking.hostName = "HomeLab-1";

  nix.settings = {
    extra-substituters = ["http://192.168.3.112:5000"];
    extra-trusted-public-keys = ["homelab-0:YkXXd/mBRuJwUjj706kaSzL4iBrbDEb9s6zlGLzWQLs="];
  };

  services.k3s.nodeLabel = [
    "homelab/av1-decode=true" # N150 iGPU, jellyfin is pinned here
  ];
}
