{
  pkgs,
  lib,
  default,
  ...
}: {
  systemd.user.services.swaybg = {
    Unit = {
      Description = "Wayland wallpaper daemon";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.swaybg} -c '#000000' -m fill";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}