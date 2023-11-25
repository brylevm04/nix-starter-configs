{ ... }:

{
  boot = {
    kernelParams = [
      "cma=128M"
      "boot.shell_on_fail"
      "quiet"
      "intel_iommu=on"
      "iommu=pt"
      "nmi_watchdog=0"
      "nowatchdog"
      "rd.systemd.show_status=auto"
      "rd.udev.log_priority=3"
      "amd_pstate=active"
      "intel_pstate=active"
      "pcie_acs_override=downstream,multifunction"
      "panic=180"
      "consoleblank=0"
    ];
  };
}
