{ pkgs, ... }:

{
  home.packages = with pkgs; [
    screenfetch
    pridefetch
    neofetch
    ipfetch
    freshfetch
    hyfetch
    fastfetch
    asciiquarium
    banner
    boxes
    cbonsai
    catimg
    cmatrix
    figlet
    jp2a
    neo
    nyancat
    toilet
    tty-clock
    sl
    fortune-kind
    lolcat
    cowsay
  ];
}
