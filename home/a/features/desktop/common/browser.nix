{ pkgs, ... }:

{
  home.packages = with pkgs; [
    qutebrowser
    chromium
    firefox
    dillong
    palemoon-bin
    netsurf.browser
    links2
    libsForQt5.falkon
    libsForQt5.konqueror
    w3m
    elinks
    links2
    lynx

    amfora
    castor
    lagrange
    telescope
    kristall

    filezilla
    tor
    torsocks
    tor-browser
    arti
    meek
    eschalot
    orjail
    obfs4
    dnsutils
    dig
  ];
}
