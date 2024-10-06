{ pkgs, ... }:
{
    # This was made following this walkthrough:
    # https://forum.level1techs.com/t/nixos-vfio-pcie-passthrough/130916


    # For Intel: intel_iommu=on
    # For Amd: amd_iommu=on
    boot.kernelParams = [ "intel_iommu=on"];

    # For Nvidia: nvidia 
    # For Amd: amdgpu / radeon
    #boot.blacklistedKernelModules = [ "nvidia" "nouveau" ];
    
    #boot.kernelModules = [ "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];

    # IDS (Found using lspci script @ link):
    # PCI-bridge: 8086:1901 
    # Nvidia GPU: 10de:2484
    # Audio Device: 10de:228b
    boot.extraModprobeConfig = "options vfio-pci ids=10de:2484,10de:228b";
   /*
    boot.postBootCommands = ''
	DEVS="0000:00:01.0 0000:01:00.0 0000:01:00.1"
	
	for DEV in $DEVS; do
	    echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
	done
	modprobe -i vfio-pci
    '';*/
}
