(local formatter (require :formatter))
(local utils (require :formatter.util))

(local fnlfmt (fn []
                {:exe :fnlfmt
                 :args [(utils.escape_path (utils.get_current_buffer_file_path))]
                 :stdin true}))

(local rustfmt
       (fn []
         {:exe :rustfmt
          :args [(utils.escape_path (utils.get_current_buffer_file_path))]}))

(formatter.setup {:filetype {:lua [(. (require :formatter.filetypes.lua)
                                      :stylua)]
                             :nix [(. (require :formatter.filetypes.nix)
                                      :nixfmt)]
                             :rs [rustfmt]
                             :fnl [fnlfmt]
                             :fennel [fnlfmt]}})

(vim.keymap.set :n :<leader>ft (fn [] (vim.cmd :FormatWrite)))

