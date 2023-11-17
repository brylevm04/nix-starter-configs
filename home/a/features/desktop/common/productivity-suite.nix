{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp-with-plugins
    krita
    inkscape-with-extensions
    blender-hip
    onlyoffice-bin
    libsForQt5.kate
    libreoffice-qt
    shotcut
    libsForQt5.kolourpaint
    azpainter
    CuboCore.corepaint
    deepin.deepin-draw
    drawing
    drawpile
    grafx2
    mtpaint
    mypaint
    mypaint-brushes
    libmypaint
    photoflare
    pinta
    swappy
    darktable
    hugin
    luminanceHDR
    rawtherapee
    digikam
    ffmpeg
  ];
}
