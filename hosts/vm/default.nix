{ pkgs, inputs, outputs, config, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix

    ../common/global
    ../common/users/a

    ../common/optional/impermanence.nix
    ../common/optional/zfs-plus-tmpfs.nix
    ../common/optional/encrypted-root.nix
    ../common/optional/pipewire.nix
    ../common/optional/zram.nix
    ../common/optional/perdoling.nix
    ../common/optional/sysrq.nix
    ../common/optional/security-sysctl.nix
    ../common/optional/unified-cgroup-hierarchy.nix
    ../common/optional/unprivileged-userns-clone.nix
    ../common/optional/podman.nix
    ../common/optional/auto-cpufreq.nix
  ];

  networking = {
    hostName = "vm";
    useDHCP = true;
  };

  environment.systemPackages = [
    pkgs.xorg.xf86videoqxl
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.windowManager.fvwm3 = {
    enable = true;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  };
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

