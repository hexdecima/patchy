# ✨⚙️ patchy
A minimal, experimental [Neovim](https://neovim.io) configuration written in [Fennel](https://fennel-lang.org) and built with [Nix](https://nixos.org).

## Usage
*This is not only my personal configuration but also a learning project, so you probably shouldn't.*

Trying out without installing:
```sh
nix run github:comfybyte/patchy -- .
```
****
*Everything below assumes you're using [flakes](https://wiki.nixos.org/wiki/Flakes).*

Firstly, add this repository as an input, like:
```nix
# flake.nix
{
    inputs.patchy.url = "github:comfybyte/patchy";
}
```

Then add it to your system packages:
```nix
# configuration.nix
{ inputs, system, ... }: {
    environment.systemPackages = [
        inputs.patchy.packages.${system}.default
    ];
}
```

## To-do
- [ ] Build without Nix.
