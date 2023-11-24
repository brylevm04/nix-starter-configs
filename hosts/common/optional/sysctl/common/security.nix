{
  boot.kernel.sysctl = {
    "net.ipv4.tcp_rfc1337" = 1;
    "net.ipv4.tcp_syncookies" = 1;
    "fs.protected_hardlinks" = 1;
    "fs.protected_symlinks" = 1;
    "kernel.unprivileged_bpf_disabled" = 1;
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
    # Generate stable, but per-boot random SLAAC addresses, don't use EUI64.
    "net.ipv6.conf.all.addr_gen_mode" = 3;
    # Ignore ICMP broadcasts to avoid participating in Smurf attacks
    "net.ipv4.icmp_echo_ignore_broadcasts" = 0;

    "kernel.unprivileged_userns_clone" = 1;
  };
}
