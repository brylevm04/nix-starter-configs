{ pkgs, inputs, outputs, config, environment, ... }:

{
  imports = [
    inputs.nixpkgs-chaotic.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix

    ../common/global
    ../common/users/a

    ../common/optional/sysctl/common
    ../common/optional/sysctl/desktop
    ../common/optional/boot/modules
    ../common/optional/boot/params/common
    ../common/optional/boot/params/desktop
    ../common/optional/dns
    ../common/optional/ntp
    ../common/optional/fonts

    ../common/optional/impermanence.nix
    ../common/optional/zfs-plus-tmpfs.nix
    ../common/optional/encrypted-root.nix
    ../common/optional/pipewire.nix
    ../common/optional/zram.nix
    ../common/optional/podman.nix
    ../common/optional/auto-cpufreq.nix
    ../common/optional/ananicy.nix
    ../common/optional/dconf.nix
    ../common/optional/firmware.nix
    ../common/optional/flatpak.nix
    ../common/optional/fstrim.nix
    ../common/optional/irqbalance.nix
    ../common/optional/logind.nix
    ../common/optional/oom.nix
    ../common/optional/plymouth.nix
    ../common/optional/xdg-portal.nix
    ../common/optional/support-all-fs.nix
  ];

  networking = {
    hostName = "vm";
    networkmanager.enable = true;
  };

  environment.systemPackages = [
    pkgs.xorg.xf86videoqxl
  ];


  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    # displayManager.defaultSession = "plasma";
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" "riscv64-linux" ];
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

