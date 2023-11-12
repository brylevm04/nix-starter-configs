{ pkgs, config, inputs, outputs, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  users.groups.a = {};
  systemd.tmpfiles.rules = [
    "d /persist/home/a 0700 a a"
  ];
  users.users.a = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
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
    ];

    initialPassword = "password";
    packages = [ pkgs.home-manager ];
  };
}
