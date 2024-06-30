{ inputs, wrapNeovimUnstable, neovimUtils, system, vimPlugins, ... }@pkgs:
let
  nightly = inputs.nightly.packages.${system}.default;

  patchy = import ./patchy.nix pkgs;

  plugins = (with vimPlugins; [ patchy which-key-nvim catppuccin-nvim nvim-lspconfig ]);

  nvim-config = (neovimUtils.makeNeovimConfig {
    inherit plugins;
    wrapRc = false;
  });
in rec {
  # for debugging the compiled config.
  inherit patchy;

  # see: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/neovim/wrapper.nix
  neovim = (wrapNeovimUnstable nightly nvim-config).overrideAttrs (old: {
    generatedWrapperArgs = old.generatedWrapperArgs or [ ]
      ++ [ "--add-flags" "-u ${patchy}/init.lua" ];
  });
  default = neovim;
}
