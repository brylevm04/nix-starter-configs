{ lib, config, pkgs, ... }:

{
  imports = [
    ../common
  ];
  services.xserver.windowManager.fvwm3 = {
    enable = true;
  };
}
