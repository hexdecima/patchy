(local oil (require :oil))
(local open_oil :<cmd>Oil<cr>)
(oil.setup {:view_options {:show_hidden true}
            :keymaps {:- open_oil
                      :<c-b> open_oil
                      :<c-h> false
                      :<c-v> :actions.select_vsplit}
            :columns [:icon :size]})

(vim.keymap.set :n :<leader>pp open_oil)
(vim.keymap.set :n :<leader>px (fn []
                                 (vim.cmd :split)
                                 (vim.cmd :Oil)))

(vim.keymap.set :n :<leader>pv (fn []
                                 (vim.cmd :vsplit)
                                 (vim.cmd :Oil)))
