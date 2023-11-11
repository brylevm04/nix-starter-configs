{ pkgs, inputs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
  
    ../common/global
    ../common/users/a

    ../common/optional/zfs-plus-tmpfs.nix
    ../common/optional/encrypted-root.nix
  ];

  networking = {
    hostName = "vm";
    useDHCP = true;
  };

  boot = {
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  };

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  programs.fuse.userAllowOther = true;
  system.stateVersion = "23.05";
}

