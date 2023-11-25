{
  boot.kernel.sysctl = {
    "net.netfilter.nf_conntrack_generic_timeout" = 60;
    "net.netfilter.nf_conntrack_tcp_timeout_established" = 600;
    "net.netfilter.nf_conntrack_tcp_timeout_time_wait" = 10;
    "net.netfilter.nf_conntrack_max" = 1048576;

    "net.core.netdev_max_backlog" = 100000;
    "net.ipv4.tcp_ecn" = 0;
    "kernel.perf_event_paranoid" = 0;
  };
}
