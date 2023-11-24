{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    coreutils-full
  ];
  zramSwap = {
    enable = true;
    memoryPercent = 200;
    priority = 255;
    algorithm = "zstd";
  };
}
