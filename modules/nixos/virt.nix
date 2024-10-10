{ ... }:
{
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "krs" ];

    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
}
