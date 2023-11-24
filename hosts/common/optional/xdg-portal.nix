{ pkgs, ... }:

{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-xapp
    xdg-desktop-portal-kde
    xdg-desktop-portal-gnome
  ];
}
