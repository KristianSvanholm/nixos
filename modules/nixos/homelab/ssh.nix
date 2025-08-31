{config, ...}: {
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    openFirewall = true; # 22
    settings.PasswordAuthentication = false;
  };
  users.users.${config.user.name}.openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOK8RufgRPvoPDRovOxteHN5ZEAXiJpXwJfVQuZsVtmj"];
}
