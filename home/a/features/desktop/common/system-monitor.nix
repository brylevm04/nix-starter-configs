{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
    htop-vim
    qjournalctl
    sysprof
    libsysprof-capture
  ];
}
