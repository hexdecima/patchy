(local formatters (require :patchy/lsp/formatting/formatters))

(vim.keymap.set :n :<leader>ft
                (fn []
                  (when vim.bo.modified
                    (vim.cmd :w)
                    (vim.api.nvim_notify "[patchy] saving and formatting."
                                         vim.log.levels.WARN {}))
                  (formatters.format_file (vim.api.nvim_buf_get_name 0))))
