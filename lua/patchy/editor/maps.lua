local u = require("patchy.utils")

u.set_n("<C-u>", "<C-u>zz")
u.set_n("<C-d>", "<C-d>zz")
u.set_n("G", "Gzz")
u.set_n("<leader>y", "\"+y")
u.set_v("<leader>y","\"+y")
u.set_v("K", ":m '<-2<CR>gv=gv")
u.set_v("J", ":m '>+1<CR>gv=gv")
