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
    nix-inspect # See which pkgs are in your PATH

    ltex-ls # Spell checking LSP

    tly # Tally counter

    htop
    htop-vim
    zenith
    yad
  ];
}
