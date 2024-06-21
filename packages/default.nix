{ inputs, wrapNeovimUnstable, neovimUtils, system, ... }@pkgs:
let
  nightly = inputs.nightly.packages.${system}.default;

  patchy = import ./patchy.nix pkgs;

  nvim-config = (neovimUtils.makeNeovimConfig {
    plugins = with pkgs.vimPlugins; [ patchy which-key-nvim ];
    wrapRc = false;
  });
in {
  inherit patchy;

  # see: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/neovim/wrapper.nix
  neovim = (wrapNeovimUnstable nightly nvim-config).overrideAttrs (old: {
    generatedWrapperArgs = old.generatedWrapperArgs or [ ]
      ++ [ "--add-flags" "-u ${patchy}/init.lua" ];
  });
}
