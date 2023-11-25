{ pkgs, ... }:

{
  services.earlyoom = {
    enable = true;
    enableNotifications = true;
    freeMemThreshold = 10;
    freeSwapThreshold = 10;
    freeMemKillThreshold = 5;
    freeSwapKillThreshold = 5;    
  };

  services.systembus-notify.enable = pkgs.lib.mkIf (config.services.earlyoom.enableNotifications) (pkgs.lib.mkDefault true);
}
