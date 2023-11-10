{ pcname, disks, inputs, ... }: {
  imports = [ inputs.disko.nixosModules.disko ];
  disko.devices = {
    disk = {
      main = {
        device = builtins.elemAt disks 0;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            efi = {
              size = "1024M";
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
              content = {
                type = "luks";
                name = pcname + "-crypt";
                extraOpenArgs = [ "--allow-discards" ];
                passwordFile = "/tmp/secret.key";
                content = {
                  type = "zfs";
                  pool = "zfspool";
                };
              };
            };
          };
        };
      };
    };
    zpool = {
      zfspool = {
        type = "zpool";
        mode="";
        mountpoint="/";
        rootFsOptions = {
          canmount = "on";
          compression = "zstd";
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
