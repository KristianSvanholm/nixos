{
  pkgs,
  config,
}: {
  environment.systemPackages = with pkgs; [
    kubectl
  ];

  services.k3s = {
    enable = true;
  };
}
