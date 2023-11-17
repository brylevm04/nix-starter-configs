{ lib, config, pkgs, ... }: {
  imports = [
    ../common
  ];

  home.packages = with pkgs; [
    inputs.hyprwm-contrib.grimblast
    hyprslurp
    hyprpicker
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.inputs.hyprland.hyprland;
  };
}
