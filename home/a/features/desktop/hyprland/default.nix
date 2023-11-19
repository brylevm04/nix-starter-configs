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
