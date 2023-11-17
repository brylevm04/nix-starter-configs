{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
  ];
}
