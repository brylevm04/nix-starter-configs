{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
  ];
}
