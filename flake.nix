{
  outputs = { nixpkgs, ... }@inputs:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      eachSystem = f:
        nixpkgs.lib.genAttrs systems
        (sys: f (nixpkgs.legacyPackages.${sys} // { inherit inputs; }));
    in {
      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell { buildInputs = with pkgs; [ lua fennel ]; };
      });

      packages = eachSystem (pkgs: import ./packages pkgs);
    };

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.nightly.url = "github:nix-community/neovim-nightly-overlay/master";

  nixConfig = {
    substituters = [ "https://nix-community.cachix.org" ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
