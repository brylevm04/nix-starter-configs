{ lib, config, pkgs, ... }: {
    imports = [
    ../common
  ];

  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.enable = true;
}