{ lib, config, pkgs, ... }: {
  imports = [
    ../common
  ];


  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.inputs.hyprland.hyprland;
  };
}
