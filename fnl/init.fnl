(require :patchy/maps) ; keymaps
(require :patchy/ui) ; ui elements & menus
(require :patchy/lsp) ; language servers & their configurations

(set vim.opt.nu true)
(set vim.opt.nuw 2)
(set vim.opt.hlsearch false)
(local wk (require :which-key))
(wk.setup {})
nil
