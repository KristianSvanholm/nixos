{...}: {
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    host = "0.0.0.0";
  };

  networking.firewall = {
    allowedTCPPorts = [53 1616];
    allowedUDPPorts = [53];
  };
}
