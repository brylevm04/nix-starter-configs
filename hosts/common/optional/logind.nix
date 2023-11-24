{ pkgs, ... }:

{
  services.logind = {
    killUserProcesses = true;
    extraConfig = "UserStopDelaySec=0";
  };
}
