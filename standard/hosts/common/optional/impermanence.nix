{ config, pkgs, inputs, ... }:

{
  imports = [ "${inputs.impermanence}/nixos.nix" ];

  # this folder is where the files will be stored (don't put it in tmpfs)
  environment.persistence."/persist/" = {
    hideMounts = true;
    directories = [
#      "/etc/nixos"
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/tmp"
      "/var/lib/systemd"
#      "/etc/NetworkManager/system-connections"
      "/srv"
    ];
    files = [
      #  NOTE: if you persist /var/log directory,  you should persist /etc/machine-id as well
      #  otherwise it will affect disk usage of log service
      "/etc/machine-id"   
      "/etc/nix/id_rsa"
      "/etc/adjtime"
    ];
  };

}