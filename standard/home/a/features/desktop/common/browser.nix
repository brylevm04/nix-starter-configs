{ pkgs, ... }:

{
  home.packages = with pkgs; [ qutebrowser firefox chromium ];
}
