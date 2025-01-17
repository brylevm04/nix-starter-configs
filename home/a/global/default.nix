{ inputs, lib, pkgs, config, outputs, ... }:
{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    inputs.plasma-manager.homeManagerModules.plasma-manager
    inputs.nixpkgs-chaotic.homeManagerModules.default
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = lib.mkDefault "a";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.05";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      FLAKE = "$HOME/Documents/NixConfig";
    };

    persistence = {
      "/persist/home/a" = {
        directories = [
          "Downloads"
          "Music"
          "Pictures"
          "Documents"
          "Videos"
          "VirtualBox VMs"
          "Git"
          "Misc"
          ".gnupg"
          ".ssh"
          ".nixops"
          ".local/share/keyrings"
          ".local/share/direnv"
          {
            directory = ".local/share/Steam";
            method = "symlink";
          }
        ];
        allowOther = true;
      };
      "/persist/home/a/chromium" = {
        removePrefixDirectory = false;
        allowOther = true;
        directories = [
          ".config/chromium"
          ".cache/chromium"
        ];
      };
    };
  };
}
