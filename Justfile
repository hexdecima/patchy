_default:
  just --list

build:
  nix build .#

test:
  nix run .# -- .
