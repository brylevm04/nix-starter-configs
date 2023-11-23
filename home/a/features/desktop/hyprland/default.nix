{ lib, config, pkgs, ... }:

{
  imports = [
    ../common
  ];

  home.packages = with pkgs; [
    labwc
    foot
    zellij
    kanshi
    fuzzel
    wlay
    alacritty
    wezterm
    bemenu
    mako
    swayidle
    swaybg
    kanshi
    waybar
    eww
    dunst
    libnotify
    hyprpaper
    rofi-wayland
    wofi
    bemenu
    tofi

    qt6.qtwayland
    libsForQt5.qt5.qtwayland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.inputs.hyprland.hyprland;
    settings = {
      general = {
        allow_tearing = true;
      };
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        touchpad.disable_while_typing = false;
        accel_profile = "flat";
        follow_mouse = 1;
      };

      misc = {
        animate_mouse_windowdragging = false;
        vrr = 1;
        force_default_wallpaper = 0;
        disable_autoreload = true;
      };

      bind =
        let
          terminal = "${pkgs.xterm}/bin/xterm";
        in
        [
          # Program bindings
          "SUPER,Return,exec,${terminal}"
        ];
      animations = {
        enabled = false;
      };
    };
  };
}
