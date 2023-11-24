{ inputs, ... }:

{
  imports = [
    ../common
  ];
  programs.plasma = {
    enable = true;

    workspace.clickItemTo = "select";

    configFile."baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
  };

}
