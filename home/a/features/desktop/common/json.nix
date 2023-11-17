{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gron
    fastgron
    jid
    jiq
    jo
    jshon
  ];
}
