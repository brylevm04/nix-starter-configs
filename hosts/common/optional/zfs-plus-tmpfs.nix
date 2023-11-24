# This file contains an ephemeral btrfs root configuration
# TODO: perhaps partition using disko in the future
{ config, lib, pkgs, modulesPath, ... }:
let
  hostname = config.networking.hostName;
in
{
  boot = {
    initrd = {
      availableKernelModules = [ "aesni_intel" "cryptd" "uas" "usbcore" "usb_storage" "vfat" "nls_cp437" "nls_iso8859_1" ];
    };
    supportedFilesystems = [ "ntfs" "btrfs" "ext4" "ext3" "xfs" "vfat" "zfs" ];
    kernelParams = [ "elevator=none" ];
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        copyKernels = true;
        zfsSupport = true;
      };
      efi.efiSysMountPoint = "/boot";
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "none";
      fsType = "tmpfs";
      options = [ "size=100%" "defaults" "mode=755" ];
    };

    "/home/a" = {
      device = "none";
      fsType = "tmpfs";
      options = [ "size=100%" "defaults" "mode=750" ];
    };

    "/boot" = {
      device = "/dev/disk/by-partlabel/disk-main-${hostname}-efi";
      fsType = "vfat";
      neededForBoot = true;
    };

    "/nix" = {
      device = "zfspool/nix";
      fsType = "zfs";
      options = [ "noatime" "xattr" "posixacl" ];
      neededForBoot = true;
    };

    "/persist" = {
      device = "zfspool/persist";
      fsType = "zfs";
      options = [ "xattr" "posixacl" ];
      neededForBoot = true;
    };
  };

}
