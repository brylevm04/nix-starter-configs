{ ... }:

{
  boot = {
    initrd = {
      includeDefaultModules = true;
      availableKernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
        "radeon"
        "amdgpu"
        "i915"
        "md_mod"
        "raid0"
        "raid1"
        "raid10"
        "raid456"
        "ehci_hcd"
        "ahci"
        "virtio_net"
        "virtio_pci"
        "virtio_mmio"
        "virtio_blk"
        "virtio_scsi"
        "9p"
        "9pnet_virtio"
      ];
      kernelModules = [
        "virtio_balloon"
        "virtio_console"
        "virtio_rng"
        "tcp_bbr"
        "netconsole"
        "nvme"
      ];
    };
    extraModprobeConfig = ''
      options kvm-amd nested=1
      options kvm-intel nested=1
    '';
  };

}
