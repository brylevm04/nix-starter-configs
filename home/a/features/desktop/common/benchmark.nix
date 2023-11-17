{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # benchmark
    hdparm
    unixbench
    fio
    sysbench
    hdparm
    phoronix-test-suite
    geekbench
    # vdbench?
    iozone
    # iomter ?
    # interbench ?
    hyperfine
    nbench
    glmark2
    bench
    rewrk
    dbench
    bonnie
    ghz
    lzbench
    iomelt
    kdiskmark
    netperf
    bandwidth
    hpl
    tsung
    stress-ng
    iperf
  ];
}
