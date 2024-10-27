my personal Neovim configuration, written in Fennel and built with Nix.

## usage
a Nix derivation containing a wrapped Neovim is exposed as `packages.${system}.default` (or neovim),
just drop that inside `environment.systemPackages` or `home.packages` and rebuild.

## to-do
- implement a generic build (i.e. don't use Nix)
