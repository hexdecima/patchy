{ inputs, system, lib, writeText, ... }@pkgs:
let
  unstable = inputs.unstable.legacyPackages.${system};
  patchy = import ./patchy.nix pkgs;
  wrapNeovim = import ./wrap-neovim.nix pkgs;
  plugins = (with unstable.vimPlugins;
    let
      treesitter-parsers = builtins.filter (v: lib.isDerivation v)
        (builtins.attrValues nvim-treesitter-parsers);
    in [
      patchy
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
    ] ++ treesitter-parsers);
  luaRc = writeText "init.lua" "require('patchy')";
  neovim = wrapNeovim { inherit plugins luaRc; };
in {
  inherit neovim;
  default = neovim;
}
