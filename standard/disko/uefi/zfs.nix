{ crypt, ssd, pcname, disks, ... }: {
  disko.devices = {
    disk = {
      main = {
        device = builtins.elemAt disks 0;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            mbrcompat = {
              size = "1M";
              type = "EF02";
            };
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
            nix = {
              size = "100%";
              content = (if crypt then {
                type = "luks";
                name = pcname + "-cryptnix";
                extraOpenArgs = [ (if ssd then "--allow-discards --perf-no_read_workqueue --perf-no_write_workqueue" else "") "--persistent" ];
                passwordFile = "/tmp/secret.key";
                content = {
                  type = "zfs";
                  pool = "zfspool";
                };
              } else {
                type = "zfs";
                pool = "zfspool";
                name = pcname + "-nix";
              });
            };
          };
        };
      };
    };
    nodev."/" = {
      fsType = "tmpfs";
      mountOptions = [
        "size=100%"
        "defaults"
        "mode=755"
      ];
    };
    zpool = {
      zfspool = {
        type = "zpool";
        mode = "";
        rootFsOptions = {
          canmount = "on";
          compression = "zstd";
          dedup = "off";
          xattr = "sa";
          atime = "off";
          "com.sun:auto-snapshot" = "false";
        };
        datasets = {
          nix = {
            type = "zfs_fs";
            mountpoint = "/nix";
          };
          persist = {
            type = "zfs_fs";
            mountpoint = "/persist";
          };
        };
      };
    };
  };
}
