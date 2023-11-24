{ pkgs, ... }:

{
  home.packages = with pkgs; [
    aria
    ariang
    axel
    curlFull
    curlie
    curlftpfs
    wget
    #toybox
    #busybox
    lftp
    streamlink
    you-get
    clipgrab
    libsForQt5.kget
    motrix
    persepolis
    #pyload-ng
    uget

    #rtorrent
    jesec-rtorrent
    transmission
    mldonkey
    lbry
    eiskaltdcpp
    #amule
    #amule-web
    amule-gui
    nicotine-plus
    kubo
    qbittorrent
    qbittorrent-nox
    deluge-gtk
    torrenttools
  ];
}
