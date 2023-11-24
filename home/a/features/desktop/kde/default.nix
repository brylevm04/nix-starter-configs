{ inputs, ... }:

{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager

    ../common
  ];

  home.packages = with pkgs; [
    xsettingsd
    go-mtpfs
    xclip
    vokoscreen-ng
    virt-manager
    ix
    dfeet
    bustle
  ];

  programs.plasma = {
    enable = true;

    #workspace.clickItemTo = "select";

    #configFile."baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
  };

}
