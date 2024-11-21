{ username, ... }:
{
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ username ];

    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
}
