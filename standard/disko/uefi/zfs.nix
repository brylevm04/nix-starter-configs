{ crypt, ssd, pcname, disks, ... }: {
  disko.devices = {
    disk = {
      main = {
        device = builtins.elemAt disks 0;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            efi = {
              size = "1G";
              type = "EF00";
              name = pcname + "-efi";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = (if crypt then {
                type = "luks";
                name = pcname + "-crypt";
                extraOpenArgs = [ (if ssd then "--allow-discards --perf-no_read_workqueue --perf-no_write_workqueue" else "") "--persistent" ];
                passwordFile = "/tmp/secret.key";
                content = {
                  type = "zfs";
                  pool = "zfspool";
                };
              } else {
                type = "zfs";
                pool = "zfspool";
                name = pcname + "-root";
              });
            };
          };
        };
      };
    };
    zpool = {
      zfspool = {
        type = "zpool";
        mode = "";
        rootFsOptions = {
          canmount = "on";
          compression = "zstd";
          dedup = "on";
          xattr = "sa";
          atime = "off";
          "com.sun:auto-snapshot" = "false";
        };
        datasets = {
          root = {
            type = "zfs_fs";
            mountpoint = "/";
            postCreateHook = "zfs snapshot zfspool/root@blank";
          };
          nix = {
            type = "zfs_fs";
            mountpoint = "/nix";
          };
          persist = {
            type = "zfs_fs";
            mountpoint = "/persist";
          };
          home = {
            type = "zfs_fs";
            mountpoint = "/home";
            postCreateHook = "zfs snapshot zfspool/home@blank";
          };
        };
      };
    };
  };
}
