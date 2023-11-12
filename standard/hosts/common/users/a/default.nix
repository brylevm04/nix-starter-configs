{ pkgs, config, inputs, outputs, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  systemd.tmpfiles.rules = [
    "d /persist/home/a 0750 a a"
  ];
  users.users.a = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
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
