{ lib, config, pkgs, ... }:

{
  imports = [
    ../common
  ];

  home.file = {
    ".fvwm/config" = {
      source = ../../dotfiles/fvwm3/config
    };
  };

  home.packages = with pkgs; [
    xdg-user-dirs
    xorg.xinit
    sx
    xfce.xfce4-power-manager
    xfce.xfce4-settings
    jgmenu
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xarchiver
    rofi
    picom-next
    kitty
    kitty-img
    kitty-themes
    pixcat
    dockbarx
    xfce.xfce4-dockbarx-plugin
    xterm
    #gtk2
    gtk3
    gtk4
    playerctl
    libwnck
    gtk-engine-murrine
    appmenu-gtk3-module
    #libappindicator-gtk2
    libappindicator-gtk3
    #
    light
    #xorg.xbacklight
    acpilight
    brightnessctl
    #
    edid-decode
    edid-generator
    libdisplay-info
    rwedid
    read-edid
    acpi
    acpid
    acpic
    acpitool
    acpidump-all
    acpica-tools
    #
    pamixer
    ncpamixer
    wmctrl
    #
    maim
    yaxg
    slop
    tint2
    pavucontrol
    albert
    redshift
    libsForQt5.qt5ct
    libsForQt5.lightly
    mate.mate-polkit
    python311Packages.praw
    python311Packages.wand
    conky
    eww
    dunst
    #
    xorg.iceauth
    nitrogen
  ];
}
