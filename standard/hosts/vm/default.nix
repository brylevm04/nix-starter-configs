{ pkgs, inputs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
  
    ../common/global
    ../common/users/a

    ../common/optional/zfs-plus-tmpfs.nix
    ../common/optional/encrypted-root.nix
    ../common/optional/pipewire.nix
  ];

  networking = {
    hostName = "vm";
    useDHCP = true;
  };

  boot = {
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  };
  programs.fuse.userAllowOther = true;
  system.stateVersion = "23.05";
}

