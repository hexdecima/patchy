;; returns the file extension of `filename`.
;; returns the filename itself if no extension is found.
(fn get_file_extension [filename]
  (var ext nil)
  ;; split by . and grab the last bit
  (each [substr (string.gmatch filename "([^.]+)")]
    (set ext substr))
  ext)

(local rustfmt :rustfmt)
(local nixfmt :nixfmt)
(local fnlfmt "fntfmt --fix")

(fn format_file [filename]
  (local ext (get_file_extension filename))
  (local formatter (case ext
                     :nix nixfmt
                     :rs rustfmt
                     :fnl fnlfmt
                     _ nil))
  (if (= formatter nil)
      (vim.api.nvim_notify "[patchy] no formatters configured for the current file type."
                           vim.log.levels.WARN {})
      (vim.cmd (.. "silent exec " "\"!" formatter " " filename "\""))))

{: format_file}

