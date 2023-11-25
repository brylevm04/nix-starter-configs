{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    # ...various
    dejavu_fonts
    powerline-fonts
    carlito
    caladea
    unifont
    symbola
    joypixels
    iosevka # Iosevka (Source Build)
    noto-fonts # Base Noto Fonts
    noto-fonts-cjk # CJK Noto Fonts
    noto-fonts-cjk-serif # Noto Serif CJK
    noto-fonts-emoji # Noto Color Emoji
    sarasa-gothic # Sarasa Gothic
    jost # Jost
    ubuntu_font_family
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    nerdfonts
    terminus-nerdfont
    inconsolata-nerdfont
    fira-code-nerdfont
    corefonts
    powerline-fonts
  ];

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      crOSMaps = true;
      defaultFonts = {
        emoji = [ "JoyPixels" ];
        monospace = [ "Ubuntu" "Symbols Nerd Font" ];
        serif = [ "Ubuntu" "Symbols Nerd Font" ];
        sansSerif = [ "Ubuntu" "Symbols Nerd Font" ];
      };
    };
  };
}
