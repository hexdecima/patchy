# ✨⚙️ patchy
an experimental [Neovim](https://neovim.io) configuration written in [Fennel](https://fennel-lang.org) and built with [Nix](https://nixos.org).

this is a learning project and will eventually become my new configuration, hopefully.

## usage
a configured Neovim derivation is exposed as `packages.default` (or `packages.neovim`).

run it once with:
```
nix run github:mtlhrt/patchy
```

or install it imperatively with:
```
nix profile install github:mtlhrt/patchy
```

or else.

## notes
- LSPs are not included and must be installed separatedly, preferably through a dev shell for reproducibility and flexibility (i.e. no mason).

## to-do
- [ ] write a script for installing without Nix.
