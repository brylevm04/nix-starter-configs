{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    pavucontrol
    xdragon
    alsa-utils
    ffmpeg-normalize
    jamesdsp
    qpwgraph
    helvum
    pwvucontrol
    pw-viz
    pw-volume
    pipecontrol
    easyeffects
    noisetorch
  ];
}
