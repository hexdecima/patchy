local set_n = require("patchy.utils").set_n
local telescope = require("telescope")
local builtin = require("telescope.builtin")

set_n("<leader>ff", builtin.find_files)
set_n("<leader>fg", builtin.live_grep)
set_n("<leader>fd", builtin.diagnostics)
set_n("<leader>fb", builtin.buffers)
set_n("<leader>fr", builtin.lsp_references)
set_n("<leader>fi", builtin.lsp_implementations)
set_n("<leader>o", builtin.oldfiles)

telescope.load_extension("fzf")
telescope.setup {
  pickers = {
    oldfiles = {
      only_cwd = true
    }
  }
}
