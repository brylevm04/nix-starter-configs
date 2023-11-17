{ lib, config, pkgs, ... }:

{
  imports = [
    ../common
  ];


  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.inputs.hyprland.hyprland;

    settings = {
      input = {
        kb_layout = "ru,us";
        touchpad.disable_while_typing = false;
      };
      misc = {
        vfr = true;
        close_special_on_empty = true;
        # Unfullscreen when opening something
        new_window_takes_over_fullscreen = 2;
      };
      layerrule = [ "blur,waybar" ];

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
