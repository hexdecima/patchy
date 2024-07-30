(local cmp (require :cmp))
(local luasnip (require :luasnip))
(local luasnip_loader (require :luasnip.loaders.from_vscode))
(local select { :behavior cmp.SelectBehavior.Select })

(luasnip_loader.lazy_load)
(cmp.setup {
           :snippet {
            :expand (fn [args] 
                      (luasnip.lsp_expand args.body))
            }
            :window {
              :completion (cmp.config.window.bordered)
              :documentation (cmp.config.window.bordered)
            }
            :mapping (cmp.mapping.preset.insert {
                                                "<c-space>" (cmp.mapping.complete)
                                                "<c-p>" (cmp.mapping.select_prev_item select)
                                                "<c-n>" (cmp.mapping.select_next_item select)
                                                "<cr>" (cmp.mapping.confirm { :select true })
                                                "<c-u>" (cmp.mapping.scroll_docs -4)
                                                "<c-d>" (cmp.mapping.scroll_docs 4)
                                                })
            :sources (cmp.config.sources [
                                          { :name "nvim_lsp" }
                                          { :name "luasnip" }
                                          { :name "path" }
                                          { :name "nvim_lua" }
                                          { :name "git" }
                                          { :name "buffer" }
                                         ])
           })
(cmp.setup.cmdline ":" {
                   :mapping (cmp.mapping.preset.cmdline)
                   :sources (cmp.config.sources [
                                                 { :name "path" }
                                                 { :name "cmdline" }
                                                ])
                   })
(cmp.setup.cmdline "/" {
                   :mapping (cmp.mapping.preset.cmdline)
                   :sources [ { :name "buffer" } ]
                   })
(cmp.setup.filetype "gitcommit" {
                    :sources [ { :name "git" } { :name "buffer" }]
                    })
