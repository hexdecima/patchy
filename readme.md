My personal Neovim configuration, written in Lua and built with Nix.

## Usage
*Requires [Nix](https://nixos.org). 
I'll probably write a way to use this without it when I get bothered enough.*

Grab a derivation under `packages.${system}.neovim` and drop it inside your package list, like:
```nix
# configuration.nix
{ inputs, system, ... }: {
    environment.systemPackages = [
        inputs.patchy.packages.${system}.neovim
    ];
}
```

****
*A previous version written in Fennel is under the `fennel` branch.*
