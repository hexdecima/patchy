(require :patchy/cmp)

;; setup completion before lsp.

(local lsp (require :lspconfig))
(local on_attach (require :patchy/lsp/on_attach))
(local cmp (require :cmp_nvim_lsp))
(local capabilities (cmp.default_capabilities))

(fn lsp_setup [server_name]
  ((. (. lsp server_name) :setup) {: on_attach : capabilities}))

(local servers [:lua_ls
                :fennel_ls
                :rust_analyzer
                :taplo
                :nil_ls
                :gleam
                :clangd
                :html
                :cssls
                :tsserver
                :bashls])
(each [_ server (ipairs servers)]
  (lsp_setup server))

