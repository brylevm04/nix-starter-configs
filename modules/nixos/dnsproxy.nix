{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.services.dnsproxy;

  createProxyUpstream = server: "-u ${server}";
  createBootstrap = server: "-b ${server}";
  dnsProxy = concatStringsSep " " (map createProxyUpstream cfg.upstreams);
  dnsBootstrap = concatStringsSep " " (map createBootstrap cfg.bootstraps);
in
{
  options = {
    services.dnsproxy = {
      enable = mkEnableOption "DNS Server";

      chooseFastestIP = mkOption {
        default = false;
        type = types.bool;
      };

      allServers = mkOption {
        default = false;
        type = types.bool;
      };

      openFirewall = mkOption {
        default = true;
        type = types.bool;
      };

      upstreams = mkOption {
        default = [ ];
        example = ''
          8.8.8.8:53
          tls://dns.adguard.com
          https://dns.adguard.com/dns-query
        '';
        type = with types; listOf str;
      };

      bootstraps = mkOption {
        default = [ ];
        example = ''
          8.8.8.8:53
          tls://dns.adguard.com
          https://dns.adguard.com/dns-query
        '';
        type = with types; listOf str;
      };

      proxyPort = mkOption {
        default = 5553;
        description = "dnsproxy listening port number";
        type = types.int;
      };

      dnsPort = mkOption {
        default = 53;
        description = "Final dns listening port";
        type = types.int;
      };

      proxyArgs = mkOption {
        default = "";
        description = "dnsproxy extra args";
        type = types.str;
      };
    };
  };

  config = mkIf cfg.enable {
    assertions = singleton {
      assertion = (length cfg.upstreams) > 0;
      message = ''
        indexyz.services.dns should have upstream dns exist
      '';
    };

    systemd.services.dnsproxy = {
      description = "Dnsproxy dns server";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        PermissionsStartOnly = true;
        LimitNPROC = 512;
        LimitNOFILE = 1048576;
        CapabilityBoundingSet = "cap_net_bind_service";
        AmbientCapabilities = "cap_net_bind_service";
        NoNewPrivileges = true;
        DynamicUser = true;
        ExecStart = "${pkgs.dnsproxy}/bin/dnsproxy ${dnsProxy} ${dnsBootstrap} -p ${toString cfg.dnsPort} ${optionalString (chooseFastestIP) "--fastest-addr"} ${optionalString (allServers) "--all-servers"} ${cfg.proxyArgs}";
        Restart = "on-failure";
      };
    };
  };
}
