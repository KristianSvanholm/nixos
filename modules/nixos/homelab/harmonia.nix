{...}: {
  services.harmonia.cache = {
    enable = true;
    signKeyPaths = ["/var/lib/secrets/harmonia.key"];
  };

  networking.firewall.extraCommands = ''
    iptables -A nixos-fw -p tcp --dport 5000 -s 192.168.3.91 -j nixos-fw-accept
    iptables -A nixos-fw -p tcp --dport 5000 -s 192.168.3.51 -j nixos-fw-accept
  '';
}
