my personal Neovim configuration, built with Nix.

## usage
a Nix derivation containing a wrapped Neovim is exposed as `packages.${system}.default` (or neovim),
just drop that inside `environment.systemPackages` or `home.packages` and rebuild.

*previously written in Fennel. that version is under the `fennel` branch.*
