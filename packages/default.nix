{ inputs, wrapNeovimUnstable, neovimUtils, system, vimPlugins, lib, ... }@pkgs:
let
  nightly = inputs.nightly.packages.${system}.default;

  patchy = import ./patchy.nix pkgs;

  plugins = (let
    filterDrvs = set:
      builtins.filter (v: lib.isDerivation v) (builtins.attrValues set);
  in with vimPlugins;
  [
    patchy
    zenbones-nvim
    poimandres-nvim
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
    fidget-nvim
    vim-fugitive
    nvim-surround
    markdown-preview-nvim

    nvim-cmp
    luasnip
    friendly-snippets
    cmp_luasnip
    cmp-path # please pick one casing ffs
    cmp-nvim-lua
    cmp-nvim-lsp
    cmp-git
    cmp-cmdline
    cmp-buffer
    formatter-nvim

    nvim-treesitter
    lsp-inlayhints-nvim

    lush-nvim # required by: zenbones-nvim
    plenary-nvim # required by: harpoon2, telescope-nvim, nvim-cmp
    nvim-web-devicons # required by menu stuff i guess?
  ] ++ (filterDrvs nvim-treesitter-parsers));

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
