{ config, lib, pkgs, modulesPath , ...}:

{
  imports = [
    ../common/optional/zfs-plus-tmpfs.nix
    ../common/optional/encrypted-root.nix
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
      kernelModules = [ "kvm-intel" "kvm-amd" ];
    };
  };

  networking.hostId = "01234567";

  nixpkgs.hostPlatform.system = "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = true;
}
