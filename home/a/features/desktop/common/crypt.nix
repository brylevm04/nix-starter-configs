{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clamav
    ccrypt
    age
    gnupg
    libsForQt5.kgpg
    passphrase2pgp
    scrypt
    sequoia-sq
    sequoia-sqv
    sequoia-sqop
    steghide
    stegseek
  ];
}
