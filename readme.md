# ✨⚙️ patchy
A minimal, experimental [Neovim](https://neovim.io) configuration written in [Fennel](https://fennel-lang.org) and built with [Nix](https://nixos.org).

## Usage
*This is not only my personal configuration but also a learning project, so you probably shouldn't.*

Try it out without installing with:
```sh
nix run github:comfybyte/patchy -- .
```
****
*Everything below assumes you're using [flakes](https://wiki.nixos.org/wiki/Flakes).*

This repository is a flake exposing a configured Neovim as `package.default` or `packages.neovim`
(currently for `x86_64-linux` and `aarch64-linux`, with the latter untested).

Firstly, add this repository as an input, like:
```nix
# flake.nix
{
    inputs.patchy.url = "github:comfybyte/patchy";
}
```

### with NixOS
2. Add it to your system packages:
```nix
# configuration.nix
{ inputs, system, ... }: {
    environment.systemPackages = [
        inputs.patchy.packages.${system}.default
    ];
}
```

### with [Home Manager](https://github.com/nix-community/home-manager)
2. Add it to your home packages:
```nix
{ inputs, system, ... }: {
    home.packages = [
        inputs.patchy.packages.${system}.default
    ];
}
```

### without Nix
That's a to-do.
