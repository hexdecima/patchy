(fn set-map [mode map action desc]
   (vim.keymap.set mode map action { :desc desc :noremap true }))

(set-map "n" "<C-u>" "<C-u>zz" "Jump up and centre")
(set-map "n" "<C-d>" "<C-d>zz" "Jump down and centre")
(set-map "n" "G" "Gzz" "Jump to bottom and centre")
(set-map "n" "<leader>y" "\"+y" "Copy to system clipboard")

(set-map "v" "<leader>y" "\"+y" "Copy to system clipboard")
(set-map "v" "K" ":m '<-2<CR>gv=gv" "Shift selection 1 line up")
(set-map "v" "J" ":m '>+1<CR>gv=gv" "Shift selection 1 line down")
nil
