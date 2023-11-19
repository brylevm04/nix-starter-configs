{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./features/desktop/wayland
  ];
}
