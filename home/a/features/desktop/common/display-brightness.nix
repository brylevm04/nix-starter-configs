{ pkgs, ... }:

{
  home.packages = with pkgs; [
    light
    #xorg.xbacklight
    acpilight
    brightnessctl
  ];
}
