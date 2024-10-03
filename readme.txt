this repository contains my Neovim configuration, writen in Fennel and currently built with Nix.

# usage
a Nix derivation containing a wrapped Neovim is exposed as `packages.${system}.default` (or neovim),
just drop that inside `environment.systemPackages` or `home.packages` and rebuild.
it currently conflicts with any other package providing a `neovim` binary, since I haven't renamed it (yet).

# to-do
- implement a generic build (i.e. don't use Nix)

# license
no.
