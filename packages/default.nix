{ inputs, wrapNeovimUnstable, neovimUtils, system, lib, ... }:
let
  # filters out everything in `set` that isn't a derivation.
  # since treesitter parsers (see below) have some junk in it.
  filterDrvs = set:
    builtins.filter (v: lib.isDerivation v) (builtins.attrValues set);
  nightly = inputs.nightly.packages.${system}.default;
  unstable = inputs.unstable.legacyPackages.${system};
  luaSrc = ../lua;
  plugins = (with unstable.vimPlugins;
    [
      oxocarbon-nvim
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
      oil-nvim
      smear-cursor-nvim

      nvim-cmp
      luasnip
      friendly-snippets
      cmp_luasnip
      cmp-path
      cmp-nvim-lua
      cmp-nvim-lsp
      cmp-git
      cmp-cmdline
      cmp-buffer

      nvim-treesitter

      plenary-nvim # required by: harpoon2, telescope-nvim, nvim-cmp
      nvim-web-devicons # required by menu stuff i guess?
    ] ++ (filterDrvs nvim-treesitter-parsers));
  nvim-config = (neovimUtils.makeNeovimConfig { inherit plugins; });
  neovim = (wrapNeovimUnstable nightly nvim-config).overrideAttrs (old: {
    generatedWrapperArgs = old.generatedWrapperArgs
      ++ [ "--add-flags" "-u ${luaSrc}/init.lua" ];
  });
in {
  inherit neovim;
  default = neovim;
}
