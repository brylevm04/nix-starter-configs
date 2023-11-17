{ pkgs, ... }:

{
  home.packages = with pkgs; [
    slade
    dosbox-staging
    dosbox-x
  ];
}
