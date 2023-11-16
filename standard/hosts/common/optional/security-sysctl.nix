{
  boot.kernel.sysctl = {
    "net.ipv4.tcp_rfc1337" = 1;
    "net.ipv4.tcp_syncookies" = 1;
    "fs.protected_hardlinks" = 1;
    "fs.protected_symlinks" = 1;
    #"net.ipv4.conf.default.rp_filter" = 1;
    #"net.ipv4.conf.all.rp_filter" = 1;
  };
}
