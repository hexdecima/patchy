(local lsp (require :lspconfig))
(local ut (require :patchy/utils))

(lambda [client buffnr]
  (local bufopts { :noremap true :silent true :buffer bufnr })
  (ut.setn "gD" vim.lsp.buf.declaration bufopts)
  (ut.setn "gd" vim.lsp.buf.definition bufopts)
  (ut.setn "K" vim.lsp.buf.hover bufopts))
