{config, ...}: {
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
    extraUpFlags = ["--operator=${config.user.name}"];
  };
}
