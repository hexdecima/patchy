(local lsp (require :lspconfig))
(local on-attach (require :patchy/lsp/on_attach))

(lsp.lua_ls.setup { :on_attach on-attach })
(lsp.fennel_ls.setup { :on_attach on-attach })
(lsp.rust-analyzer.setup { :on_attach on-attach })
