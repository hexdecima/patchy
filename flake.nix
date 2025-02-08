{
  outputs = { stable, ... }@inputs:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      eachSystem = f:
        stable.lib.genAttrs systems
        (sys: f (stable.legacyPackages.${sys} // { inherit inputs; }));
    in {
      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            just
            treefmt
            luajit
            fennel
            fennel-ls
            lua-language-server
            nil
            fnlfmt
            nixfmt-classic
            taplo
          ];
        };
      });

      packages = eachSystem (pkgs: import ./packages pkgs);
    };

  inputs = {
    stable.url = "github:nixos/nixpkgs/release-24.11";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  nixConfig = {
    substituters = [ "https://cache.nixos.org" ];
    trusted-public-keys =
      [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
  };
}
