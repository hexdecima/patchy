(local hp (require :harpoon))
(fn setn [map action]
  (vim.keymap.set :n map action {:noremap true :silent true}))

(hp:setup)
(setn :<C-a> (fn [] (: (hp:list) :add)))

;; this syntax is absolutely cursed
(setn :<C-e> (fn [] (hp.ui:toggle_quick_menu (hp:list))))
(setn :<leader>1 (fn [] (: (hp:list) :select 1)))
(setn :<leader>2 (fn [] (: (hp:list) :select 2)))
(setn :<leader>3 (fn [] (: (hp:list) :select 3)))
(setn :<leader>4 (fn [] (: (hp:list) :select 4)))
