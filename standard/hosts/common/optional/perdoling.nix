{
  boot.kernel.sysctl = {
    "net.core.somaxconn" = 8192;
    "net.core.rmem_default" = 1048576;
    "net.core.rmem_max " = 16777216;
    "net.core.wmem_default" = 1048576;
    "net.core.wmem_max" = 16777216;
    "net.core.optmem_max" = 65536;
    "net.ipv4.tcp_rmem" = "4096 1048576 2097152";
    "net.ipv4.tcp_wmem" = "4096 65536 16777216";
    "net.ipv4.udp_rmem_min" = 8192;
    "net.ipv4.udp_wmem_min" = 8192;
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_max_syn_backlog" = 8192;
    "net.ipv4.tcp_max_tw_buckets" = 2000000;
    "net.ipv4.tcp_tw_reuse" = 1;
    "net.ipv4.tcp_fin_timeout" = 10;
    "net.ipv4.tcp_slow_start_after_idle" = 0;
    "net.ipv4.tcp_keepalive_time" = 60;
    "net.ipv4.tcp_keepalive_intvl" = 10;
    "net.ipv4.tcp_keepalive_probes" = 6;
    "net.ipv4.tcp_mtu_probing" = 1;
    "net.ipv4.tcp_sack" = 1;
    "net.ipv4.tcp_fack" = 1;
    "net.ipv4.tcp_low_latency" = 1;
    "net.ipv4.tcp_workaround_signed_windows" = 1;
    "net.ipv4.tcp_window_scaling" = 1;
    "net.core.default_qdisc" = "cake";
    "vm.max_map_count" = 2147483642;
    "vm.dirty_bytes" = (48 * 1024 * 124);
    "vm.dirty_background_bytes" = (16 * 1024 * 124);
    "vm.vfs_cache_pressure" = 50;
    "vm.compaction_proactiveness" = 20;
    "vm.swappiness" = 180;
    "vm.zone_reclaim_mode" = 0;
    "vm.page_lock_unfairness" = 1;
    "vm.overcommit_memory" = 1;
    "vm.dirty_writeback_centisecs" = 1500;
    "fs.file-max" = 9223372036854775807;
    "fs.inotify.max_user_watches" = 524288;
    "kernel.sched_rt_runtime_us" = 980000;
    "kernel.nmi_watchdog" = 0;
    "kernel.shmmax" = 33554432;
    "kernel.msgmax" = 33554432;
    "kernel.msgmnb" = 33554432;

    "fs.suid_dumpable" = 2;
    "kernel.pid_max" = 999999;
  };
  systemd.tmpfiles.rules = [
    "w /sys/kernel/mm/transparent_hugepage/enabled - - - - madvise"
    "w /sys/kernel/mm/transparent_hugepage/shmem_enabled - - - - advise"
    "w /sys/kernel/mm/transparent_hugepage/defrag - - - - defer+madvise"
    "w /sys/kernel/mm/transparent_hugepage/khugepaged/defrag - - - - 1"
    "w /sys/kernel/mm/lru_gen/enabled - - - - 7"
    "w /sys/kernel/debug/sched/latency_ns  - - - - 1000000"
    "w /sys/kernel/debug/sched/migration_cost_ns - - - - 500000"
    "w /sys/kernel/debug/sched/min_granularity_ns - - - - 500000"
    "w /sys/kernel/debug/sched/wakeup_granularity_ns  - - - - 0"
    "w /sys/kernel/debug/sched/nr_migrate - - - - 8"
  ];

  security.pam.loginLimits = [
    { domain = "@audio"; item = "rtprio" ; type = "-"   ; value = "99"       ; }
    { domain = "*"; item = "nofile"; type = "-"; value = "9223372036854775807"; }
    { domain = "*"; item = "memlock"; type = "-"; value = "unlimited"; }
    { domain = "*"; item = "fsize"; type = "-"; value = "unlimited"; }
    { domain = "*"; item = "data"; type = "-"; value = "unlimited"; }
    { domain = "*"; item = "rss"; type = "-"; value = "unlimited"; }
    { domain = "*"; item = "stack"; type = "-"; value = "unlimited"; }
    { domain = "*"; item = "cpu"; type = "-"; value = "unlimited"; }
    { domain = "*"; item = "nproc"; type = "-"; value = "unlimited"; }
    { domain = "*"; item = "as"; type = "-"; value = "unlimited"; }
    { domain = "*"; item = "locks"; type = "-"; value = "unlimited"; }
    { domain = "*"; item = "sigpending"; type = "-"; value = "unlimited"; }
    { domain = "*"; item = "msgqueue"; type = "-"; value = "unlimited"; }
  ];
}
