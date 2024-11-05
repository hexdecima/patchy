(local formatters (require :patchy/lsp/formatting/formatters))

(vim.keymap.set :n :<leader>ft
                (fn []
                  (if (not vim.bo.modified)
                      (formatters.format_file (vim.api.nvim_buf_get_name 0))
                      ;; TODO: save buffer WHEN formatting?
                      (vim.api.nvim_notify "[patchy] save buffer before formatting."
                                           vim.log.levels.WARN {}))))

