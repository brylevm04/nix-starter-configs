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

  services.smartdns.enable = true;
  services.smartdns.settings = rec {
    bind = "127.0.0.1:53";
    bind-tcp = "${bind}";

    server = [
      "8.8.8.8"
      "1.1.1.1"
      "9.9.9.11"
      "8.8.4.4"
      "77.88.8.8"
      "77.88.8.1"
    ];

    server-tcp = [
      "8.8.8.8"
      "1.1.1.1 -bootstrap-dns"
      "9.9.9.11"
      "8.8.4.4"
      "77.88.8.8"
      "77.88.8.1"
    ];

    server-https = [
      "https://cloudflare-dns.com/dns-query"
      "https://dns.google/dns-query"
      "https://dns.quad9.net/dns-query"
      "https://dns.adguard.com/dns-query"
      "77.88.8.8:443"
    ];

    server-tls = [
      "8.8.8.8:853"
      "1.1.1.1:853"
      "9.9.9.11:853"
      "8.8.4.4:853"
      "89.233.43.71:853"
      "159.69.114.157:853"
      "80.241.218.68:853"
      "185.49.141.37:853"
      "159.69.198.101:853"
      "146.255.56.98:853"
      "77.88.8.8:853"
    ];

  };
}
