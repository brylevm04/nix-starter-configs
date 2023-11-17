{
  description = "Flake utils demo";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";
    hardware.url = "github:nixos/nixos-hardware";
    impermanence.url = "github:nix-community/impermanence";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = { url = "github:numtide/flake-utils"; };
    nur = { url = "github:nix-community/NUR"; };
  };


  outputs = inputs: inputs.flake-utils.lib.eachDefaultSystem (system:
    let
      imports = [ inputs.nixpkgs-chaotic.nixosModules.default ];
      pkgs = import inputs.nixpkgs {
        inherit system inputs.overlays imports;
      };
    in
    with pkgs;
    {
      devShells.default = mkShell {
        NIX_CONFIG = "extra-experimental-features = nix-command flakes repl-flake";
        buildInputs = [
          nix
          home-manager
          git

          sops
          ssh-to-age
          gnupg
          age

          linuxPackages_cachyos
        ];
      };
    }
  );
}
