{ pkgs, inputs, ... }:

{
  networking = {
    nameservers = [ "127.0.0.1" "::1" ];
    # If using dhcpcd:
    dhcpcd.extraConfig = "nohook resolv.conf";
    # If using NetworkManager:
    networkmanager.dns = "none";
  };

  services.smartdns.enable = true;
  services.smartdns.settings = rec {
    bind = "127.0.0.1:53";
    bind-tcp = "${bind}";

    server = [
      "8.8.8.8"
      "1.1.1.1"
      "9.9.9.11"
      "8.8.4.4"
    ];

    server-tcp = [
      "8.8.8.8"
      "1.1.1.1 -bootstrap-dns"
      "9.9.9.11"
      "8.8.4.4"
    ];

    server-https = [
      "https://cloudflare-dns.com/dns-query"
      "https://dns.google/dns-query"
      "https://dns.quad9.net/dns-query"
    ];

    server-tls = [
      "8.8.8.8:853"
      "1.1.1.1:853"
      "9.9.9.11:853"
      "8.8.4.4:853"
    ];

  };
}
