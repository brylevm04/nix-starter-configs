{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bc
    calc
    clac
    kalker
    libqalculate
    qalculate-qt
    galculator
    libsForQt5.kcalc
    speedcrunch
    xorg.xcalc
  ];
}
