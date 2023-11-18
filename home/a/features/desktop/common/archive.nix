{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnutar
    tarlz
    libarchive
    cpio
    bzip2
    lbzip2
    bzip3
    lrzip
    lz4
    lzip
    lzop
    xz
    zstd
    p7zip
    rar
    #unrar
    unar
    tarlz
    zip
    unzipNLS
    gzip
    zpaq
    zpaqd
    zpaqfranz
    lhasa
    atool
    dtrx
    unp
    arj
    ncompress
    libxcomp
    woff2
    mozlz4a
    dar
    par2cmdline
    sharutils
    unzoo
    vdo
    brotli
    libzip
    zlib-ng
    zopfli
    lepton
    leptonica
    pxz
    ucl
    efficient-compression-tool
  ];
}
