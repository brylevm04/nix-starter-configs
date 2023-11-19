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
    #
    edid-decode
    edid-generator
    libdisplay-info
    rwedid
    read-edid
    acpi
    acpid
    acpic
    acpitool
    acpidump-all
    acpica-tools
    libsmbios
    powertop
    tlp
    libsForQt5.powerdevil
    poweralertd
    throttled
    limitcpu
    undervolt
    evillimiter
  ];
}
