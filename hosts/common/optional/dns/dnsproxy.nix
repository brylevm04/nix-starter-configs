{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    gzip
  ];

  networking = {
    nameservers = [ "127.0.0.1" "::1" ];
    # If using dhcpcd:
    dhcpcd.extraConfig = "nohook resolv.conf";
    # If using NetworkManager:
    networkmanager.dns = "none";
  };

  services.dnsproxy = {
    enable = true;
    upstreams = [
      "8.8.8.8:53"
      "tls://dns.adguard.com"
      "https://dns.adguard.com/dns-query"
    ];

    chooseFastestIP = true;
    openFirewall = false;
    allServers = true;
    proxyArgs = "--cache --edns --edns-addr=\"178.70.30.0\""
  };
}
