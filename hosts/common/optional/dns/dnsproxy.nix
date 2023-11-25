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
      quic://unfiltered.adguard-dns.com
      "77.88.8.8"
      "77.88.8.1"
      "193.58.251.251"
      https://dns.cloudflare.com/dns-query
      https://dns.google/dns-query
      tls://dns.google
      tls://1dot1dot1dot1.cloudflare-dns.com
      "1.1.1.1"
      "1.0.0.1"
      "https://dns11.quad9.net/dns-query"
      "tls://dns11.quad9.net"
    ];

    chooseFastestIP = true;
    openFirewall = false;
    allServers = true;
    proxyArgs = "--cache --edns --edns-addr=\"178.70.30.0\"";
  };
}
