{ lib, config, pkgs, ... }:

{
  imports = [
    ./display-brightness.nix
    ./archive.nix
    ./browser.nix
    ./all-shells.nix
    ./benchmark.nix
    ./system-monitor.nix
    ./write-iso.nix
    ./json.nix
    ./hardware-info.nix
    ./multimedia.nix
    ./cli-fun.nix
    ./image-manipulation.nix
    ./cli.nix
    ./gamung.nix
    ./crypt.nix
    ./productivity-suite.nix
    ./p2p.nix
    ./calculator.nix
    ./sound.nix
    ./my-desktop-stuff.nix
    ./node.nix
    ./fs.nix
  ];
  home.packages = with pkgs; [
    comma # Install and run programs by sticking a , before them
    distrobox # Nice escape hatch, integrates docker images with my environment

    nil # Nix LSP
    nixfmt # Nix formatter

    ltex-ls # Spell checking LSP
    zenith
    yad
  ];
}
