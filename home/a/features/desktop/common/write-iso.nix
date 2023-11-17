{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ventoy-full
    binwalk
    woeusb-ng
    popsicle
    unetbootin
  ];
}
