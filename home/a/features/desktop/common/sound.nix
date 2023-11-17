{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    pavucontrol
    xdragon
    alsa-utils
    ffmpeg-normalize
  ];
}
