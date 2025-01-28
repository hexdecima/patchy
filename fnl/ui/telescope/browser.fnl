(set vim.g.loaded_netrw 1)

;; disable NetRw
(set vim.g.loaded_netrwPlugin 1)

(local ts (require :telescope))
(ts.setup {:extensions {:file_browser {:hijack_netrw true
                                       :respect_gitignore false}}})

(ts.load_extension :file_browser)

(fn setn [map action desc]
  (vim.keymap.set :n map action {:noremap true :silent true : desc}))

(fn show-browser [] (ts.extensions.file_browser.file_browser {:path "%:p:h"}))

(setn :<leader>pp show-browser "Show file browser")
(setn :<leader>pv (fn [] (vim.cmd :vsplit) (show-browser))
      "Show file browser and vsplit")
(setn :<leader>px (fn [] (vim.cmd :split) (show-browser))
      "Show file browser and hsplit")
