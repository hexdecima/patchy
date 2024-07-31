(local code_actions (. (require :actions-preview) "code_actions"))

(lambda [client buffer]
  (local bufopts { :noremap true :silent true : buffer })
  (fn setn [map action] (vim.keymap.set "n" map action bufopts))
  (setn "gD" vim.lsp.buf.declaration)
  (setn "gd" vim.lsp.buf.definition)
  (setn "K" vim.lsp.buf.hover)
  (setn "gi" vim.lsp.buf.implementation)
  (setn "gr" vim.lsp.buf.references)
  (setn "<leader>ca" code_actions)
  (setn "<leader>e" vim.diagnostic.open_float))
