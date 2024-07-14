(require :patchy/ui/telescope/browser) ;; enable telescope's file browser
(require :patchy/ui/telescope/fzf) ;; enable faster fuzzy finder
(local builtin (require :telescope.builtin))
(fn setn [map action] (vim.keymap.set "n" map action))

(setn "<leader>ff" builtin.find_files)
(setn "<leader>fg" builtin.live_grep)
(setn "<leader>fd" builtin.diagnostics)
(setn "<leader>fb" builtin.buffers)
(setn "<leader>fr" builtin.lsp_references)
(setn "<leader>fi" builtin.lsp_implementations)
(setn "<leader>o" builtin.oldfiles)

(local ts (require :telescope))
(ts.setup { :extensions { :file_browser { :hijack_netrw true } }})
