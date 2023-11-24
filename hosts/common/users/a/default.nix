{ pkgs, config, inputs, outputs, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  users.groups.a = {};
  systemd.tmpfiles.rules = [
    "d /persist/home/a 0700 a users"
    "d /home/a 0700 a users"
  ];
  users.users.a = {
    description = "Main user of this NixOS deployment";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "input"
    ] ++ ifTheyExist [
      "a"
      "minecraft"
      "network"
      "wireshark"
      "i2c"
      "mysql"
      "docker"
      "podman"
      "git"
      "libvirtd"
      "deluge"
      "adbusers"
      "vboxusers"
      "dialout"
      "networkmanager"
      "sambashare"
      "rtkit"
      "kvm"
      "cdrom"
    ];

    initialPassword = "password";
    packages = [ pkgs.home-manager ];
  };
}
