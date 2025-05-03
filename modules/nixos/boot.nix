{...}: {
  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable BBR congestion control
  boot.kernelModules = [
    "tcp_bbr"
    "kvm-intel"
    "vfio_virqfd"
    "vfio_pci"
    "vfio_iommu_type1"
    "vfio"
    "intel_iommu=on"
    "iommu=pt"
  ];

  /*
     boot.kernel.sysctl = {
  "net.ipv4.tcp_congestion_control" = "bbr";
  "net.core.default_qdisc" = "fq";
  "net.core.wmem_max" = 1073741824; # 1 GiB
  "net.core.rmem_max" = 1073741824; # 1 GiB
  "net.ipv4.tcp_rmem" = "4096 87380 1073741824"; # 1 GiB max
  "net.ipv4.tpc_wmem" = "4096 87380 1073741824"; # 1 GiB max
     };
  */
}
