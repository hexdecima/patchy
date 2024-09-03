(local inlayhints (require :lsp-inlayhints))
(inlayhints.setup {:inlay_hints {:parameter_hints {:prefix :f}}})

(vim.api.nvim_create_augroup :LspAttach_inlayhints {})
(vim.api.nvim_create_autocmd :LspAttach
                             {:group :LspAttach_inlayhints
                              :callback (fn [args]
                                          (if (and args.data
                                                   args.data.client_id)
                                              (inlayhints.on_attach (vim.lsp.get_client_by_id args.data.client_id)
                                                                    args.buf)))})
