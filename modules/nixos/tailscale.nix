{config, ...}: {
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
    extraUpFlags = ["--operator=${config.user.name}" "--exit-node=rds.tailebf2dc.ts.net" "--accept-dns=true"];
  };
}
