{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    termimage
    gqview
    qiv
    sxiv
    nsxiv
    imgcat
    s2png
    feh
    vipsdisp
    genimage
    meh
    photofield

    kchmviewer
    xchm
    calibre
    coolreader
    cuneiform
    gocr
    ocrad
    ocrmypdf
    tesseract
  ];
}
