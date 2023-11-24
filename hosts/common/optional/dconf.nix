{ pkgs, ... }:

{
  programs.dconf.enable = true;
  services.dbus = {
    packages = with pkgs; [
      dconf
    ];
    implementation = "broker";
  };
}
