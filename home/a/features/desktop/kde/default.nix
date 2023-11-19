{ inputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
    ../common
  ];

  programs.plasma = {
    enable = true;

    workspace.clickItemTo = "select";
    configFile."baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
  };
}
