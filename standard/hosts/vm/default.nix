{ pkgs, inputs, outputs, config, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
  
    ../common/global
    ../common/users/a

    ../common/optional/zfs-plus-tmpfs.nix
    ../common/optional/encrypted-root.nix
    ../common/optional/pipewire.nix
    ../common/optional/perdoling.nix
    ../common/optional/sysrq.nix
    ../common/optional/security-sysctl.nix
    ../common/optional/unified-cgroup-hierarchy.nix
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
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      a = import ../../home/a/${config.networking.hostName}.nix;
    };
  };
  system.stateVersion = "23.05";
}

