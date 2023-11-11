{ pkgs, ... }:

{
  home.packages = with pkgs; [ wireshark ostinato audacity deadbeef anki obsidian gwenview par2cmdline dar okular bitwarden scrcpy yt-dlp ffmpeg  ];
}
