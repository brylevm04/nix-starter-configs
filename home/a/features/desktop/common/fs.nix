{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btrfs-progs
    dosfstools
    exfatprogs
    f2fs-tools
    e2fsprogs
    hfsprogs
    jfsutils
    nilfs-utils
    ntfs3g
    reiserfsprogs
    udftools
    xfsprogs
    bcachefs-tools
    reiser4progs
    zfstools
    # FUSE
    apfs-fuse
    adbfs-rootless
    avfs
    curlftpfs
    davfs2
    encfs
    fuse-archive
    fuseiso
    gitfs
    gocryptfs
    google-drive-ocamlfuse
    gphoto2fs
    hubicfuse
    ifuse
    s3fs
    sshfs
    tmsu
    mtpfs
    android-file-transfer
    jmtpfs
    simple-mtpfs
    go-mtpfs
    libmtp
    # stackable
    # ecryptfs
    # ecryptfs-helper
    mergerfs
    mergerfs-tools
    mhddfs
    fuse-overlayfs
    unionfs-fuse
    erofs-utils
    squashfs-tools-ng
    # ceph
    ceph-client
    glusterfs
    kubo
    minio
    minio-client
    moosefs
    openafs
    orangefs
    tahoe-lafs
    gfs2-utils
    vmfs-tools
  ];
}
