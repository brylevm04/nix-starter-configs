{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wireshark
    ostinato
    audacity
    deadbeef
    anki
    obsidian
    gwenview
    par2cmdline
    dar
    okular
    bitwarden
    scrcpy
    yt-dlp
    ffmpeg
    # ?
    pavucontrol
    xdragon
    alsa-utils
    ranger

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

    libsForQt5.kolourpaint
    gimp-with-plugins
    krita
    inkscape-with-extensions
    blender-hip
    onlyoffice-bin
    libsForQt5.kate
    libreoffice-qt
    shotcut
    filezilla

    kchmviewer
    xchm
    calibre
    coolreader
    cuneiform
    gocr
    ocrad
    ocrmypdf
    tesseract

    clamav
    ccrypt
    age
    gnupg
    libsForQt5.kgpg
    passphrase2pgp
    scrypt
    sequoia-sq
    sequoia-sqv
    sequoia-sqop
    steghide
    stegseek

    bc
    calc
    clac
    kalker
    libqalculate
    #
    qalculate-qt
    galculator
    libsForQt5.kcalc
    speedcrunch
    xorg.xcalc

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

    bash
    elvish
    es
    fish
    ion
    ksh
    mksh
    murex
    nushellFull
    oksh
    powershell
    tcsh
    xonsh
    yash
    zsh

    #dillo
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

    ffmpeg-normalize
    ffmpegthumbnailer

    slade
    dosbox-staging
    dosbox-x


    # ?
    comma # Install and run programs by sticking a , before them
    distrobox # Nice escape hatch, integrates docker images with my environment

    bc # Calculator
    bottom # System viewer
    ncdu # TUI disk usage
    eza # Better ls
    ripgrep # Better grep
    fd # Better find
    httpie # Better curl
    diffsitter # Better diff
    jq # JSON pretty printer and manipulator

    nil # Nix LSP
    nixfmt # Nix formatter

    ltex-ls # Spell checking LSP

    htop-vim
    zenith
    yad

    nodejs
    nodenv

    pngoptimizer
    oxipng
    pngquant
    gifski
    pngcrush
    pngout
    advancecomp
    optipng
    jhead
    jpegoptim
    jpeg-archive
    libjpeg
    gifsicle
    nodePackages_latest.svgo
    image_optim
    pngloss
    guetzli

    lolcat
    cowsay

    qoi

    zlib
    zopfli
    fontconfig
    ghostscript
    liblqr1
    libpng
    libraw
    libtiff
    libxml2
    libheif
    djvulibre
    libjxl
    openexr
    librsvg
    pango
    openjpeg
    bzip2
    freetype
    libjpeg
    lcms2
    xorg.libX11
    xorg.libXt
    xorg.libXft
    xorg.libXext
    libwebp
    libimagequant
    libspectre
    imlib2Full
    openimageio
    imagemagickBig
    graphicsmagick
    vips
    imageworsener
    gmic
    gmic-qt
    graphicsmagick
    posterazor

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

    vlc

    # benchmark
    hdparm
    unixbench
    fio
    sysbench
    hdparm
    phoronix-test-suite
    geekbench
    # vdbench?
    iozone
    # iomter ?
    # interbench ?
    hyperfine
    nbench
    glmark2
    bench
    rewrk
    dbench
    bonnie
    ghz
    lzbench
    iomelt
    kdiskmark
    netperf
    bandwidth
    hpl
    tsung
    stress-ng
    iperf

    duc
    du-dust
    gdu
    gt5
    ncdu
    btop
    libsForQt5.libksysguard
    libsForQt5.plasma-systemmonitor
    stacer
    bottom
  
    dmidecode
    hwinfo
    hw-probe
    inxi
    nmon
    zenmonitor
    gpu-viewer
    hardinfo
    lshw
    libsForQt5.kinfocenter
    usbview
    qjournalctl

    ventoy-full
    binwalk
    woeusb-ng
    popsicle
    unetbootin

    gron
    fastgron
    jid
    jiq
    jo
    jshon
  ];
}
