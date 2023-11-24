{ pkgs, ... }:

{
  services.ananicy.enable = true;
  services.ananicy.package = pkgs.ananicy-cpp;
}
