(vim.api.nvim_create_autocmd [:BufEnter :BufWinEnter]
                             {:pattern [:*.md]
                              :callback (fn []
                                          (vim.keymap.set :n :<leader>mp
                                                          :<cmd>MarkdownPreview<cr>))})

