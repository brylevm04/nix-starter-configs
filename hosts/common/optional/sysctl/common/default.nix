{
  imports = [
    ./performance.nix
    ./security.nix
    ./ip-forward.nix
  ];
  boot.kernel.sysctl = {
    "kernel.sysrq" = 1;
    "systemd.unified_cgroup_hierarchy" = 1;
    "net.ipv4.tcp_congestion_control" = "bbr";
  };
}
