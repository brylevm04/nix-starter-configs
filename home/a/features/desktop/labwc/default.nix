{ lib, config, pkgs, ... }:

{
  imports = [
    ../common
  ];

  home.file = {
    ".fvwm/config" = {
      source = ../../../dotfiles/fvwm3/config;
    };
  };

  home.packages = with pkgs; [
    labwc
    foot
    zellij
    kanshi
    fuzzel
    wlay
    alacritty
    wezterm
    bemenu
  ];
}
