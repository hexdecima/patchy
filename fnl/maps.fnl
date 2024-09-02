(fn setmap [mode map action]
  (vim.keymap.set mode map action { :noremap true }))
(fn setn [map action]
  (setmap "n" map action))
(fn setv [map action]
  (setmap "v" map action))

(setn "<C-u>" "<C-u>zz")
(setn "<C-d>" "<C-d>zz")
(setn "G" "Gzz")
(setn "<leader>y" "\"+y" "Copy to system clipboard")
; (setn "<leader>ft" (fn [] (vim.lsp.buf.format)))

(setv "<leader>y" "\"+y")
(setv "K" ":m '<-2<CR>gv=gv")
(setv "J" ":m '>+1<CR>gv=gv")
