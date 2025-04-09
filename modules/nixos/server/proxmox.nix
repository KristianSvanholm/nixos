{ inputs, ... }:
{

    services.proxmox-ve = {
        enable = true;
        ipAddress = "192.168.3.112";
    };


    nixpkgs.overlays = [inputs.proxmox-nixos.overlays.${"x86_64-linux"}];

}
