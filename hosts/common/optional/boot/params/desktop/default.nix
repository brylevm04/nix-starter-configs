{ ... }:

{
  imports = [
    ./no-spectre.nix
  ];

  boot = {
    kernelParams = [
      "split_lock_detect=off"
      "nmi_watchdog=0"
      "nowatchdog"
      "elevator=none"
    ];
  };
}
