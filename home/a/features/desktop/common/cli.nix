{ pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    ripgrep
    fd
    httpie
    diffsitter
    ranger
  ];
}
