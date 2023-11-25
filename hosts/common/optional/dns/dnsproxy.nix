{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    dns-root-data
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
      "quic://unfiltered.adguard-dns.com"
      "quic://dns.comss.one:784"
      "https://dns.cloudflare.com/dns-query"
      "https://dns.google/dns-query"
      "https://dns.comss.one/dns-query"
      "https://dns11.quad9.net/dns-query"
      "tls://dns.google"
      "tls://1dot1dot1dot1.cloudflare-dns.com"
      "tls://dns.comss.one"
      "tls://dns11.quad9.net"
      "77.88.8.8"
      "77.88.8.1"
      "193.58.251.251"
      "1.1.1.1"
      "1.0.0.1"
      "4.2.2.1"
      "4.2.2.2"
      "80.80.80.80"
      "80.80.81.81"
    ];

    chooseFastestIP = true;
    openFirewall = false;
    allServers = true;
    proxyArgs = "--cache --cache-optimistic --cache-size=${toString (256 * 1024)} --http3 --edns --edns-addr=\"178.70.30.0\"";
  };
}
