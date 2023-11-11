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
    aria
    ariang
    # ?
    pavucontrol
    xdragon
    qbittorrent
    qbittorrent-nox
    alsa-utils
    ranger

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
  ];
}
