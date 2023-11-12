{ inputs, lib, config, ... }:
{
  nix = {
    settings = {
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = true;
      system-features = [ "kvm" "big-parallel" "nixos-test" ];
    };

    # Add each flake input as a registry
    # To make nix3 commands consistent with the flake
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);


    nixPath = [ "/etc/nix/path" ];
    # Add nixpkgs input to NIX_PATH
    # This lets nix2 commands still use <nixpkgs>
  };
  environment.etc =
    lib.mapAttrs'
      (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      })
      config.nix.registry;
}
