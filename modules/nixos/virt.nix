{config, ...}: {
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [config.user.name];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
