{ inputs, pkgs, ... }:

{
  networking.timeServers = [
    "nts.netnod.se"
    "ntppool1.time.nl"
    "ntppool2.time.nl"
    "ntp3.ipv6.fau.de"
    "ptbtime1.ptb.de"
    "ptbtime2.ptb.de"
    "ptbtime3.ptb.de"
    "ptbtime4.ptb.de"
    "paris.time.system76.com"
  ];

  services.chrony = {
    enable = true;
    enableNTS = true;
    extraFlags = ["-r" "-s"];
    extraConfig = ''
      rtcfile /var/lib/chrony/rtc
      rtcautotrim 1
    '';
  };
}
