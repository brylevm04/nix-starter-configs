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
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.inputs.hyprland.hyprland;
    settings = {
      input = {
        kb_layout = "ru,us";
        kb_options = "grp:alt_shift_toggle";
        touchpad.disable_while_typing = false;
      };
      bind =
        let
          terminal = "${pkgs.xterm}/bin/xterm";
        in
        [
          # Program bindings
          "SUPER,Return,exec,${terminal}"
        ];
    };
  };
}
