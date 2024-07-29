{ inputs, wrapNeovimUnstable, neovimUtils, system, vimPlugins, ... }@pkgs:
let
  nightly = inputs.nightly.packages.${system}.default;

  patchy = import ./patchy.nix pkgs;

  plugins = (with vimPlugins; [
    patchy # load this configuration as a plugin. funky, yeah.
    which-key-nvim
    zenbones-nvim
    nvim-lspconfig
    lualine-nvim
    harpoon2
    telescope-nvim
    telescope-file-browser-nvim
    telescope-fzf-native-nvim
    actions-preview-nvim
    nvim-autopairs
    leap-nvim
    comment-nvim
    lush-nvim # required by: zenbones-nvim
    plenary-nvim # required by: harpoon2, telescope-nvim
    nvim-web-devicons # required by menu stuff i guess?
  ]);

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
    # ++ [ "--set" "NVIM_APPNAME" "patchy"];
  });
  default = neovim;
}
