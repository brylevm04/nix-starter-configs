{ pkgs, ... }:

{
  home.packages = with pkgs; [ wireshark ostinato audacity deadbeef anki obsidian gwenview par2 dar okular bitwarden scrcpy  ];
}
