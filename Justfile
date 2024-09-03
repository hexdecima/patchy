_default:
  just --list

build:
  nix build .#

test:
  git add . && nix run .# -- .

fmt:
  treefmt
