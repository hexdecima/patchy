(require :patchy/cmp)

;; setup completion before lsp.

(local lsp (require :lspconfig))
(local on_attach (require :patchy/lsp/on_attach))
(local cmp (require :cmp_nvim_lsp))
(local capabilities (cmp.default_capabilities))

(fn lsp_setup [server_name]
  ((. (. lsp server_name) :setup) {: on_attach
                                   : capabilities
                                   :settings {:rust_analyzer {:check {:allTargets false}}}}))

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
                :bashls
                :nushell])

(each [_ server (ipairs servers)]
  (lsp_setup server))

;; workaround for https://github.com/neovim/neovim/issues/30985
(local methods [:textDocument/diagnostic :workspace/diagnostic])
(each [_ method (ipairs methods)]
  (local default (. vim.lsp.handlers method))
  (tset vim.lsp.handlers method (fn [err result context config]
                                  (when (and (not= err nil)
                                             (not= err.code -32802))
                                    (default err
                                      result
                                      context
                                      config)))))

nil
