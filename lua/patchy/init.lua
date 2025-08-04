require("patchy.editor")
require("patchy.plugins")

require("silkcircuit").setup {
  variant = "soft",
  styles = {
    comments = { italic = false },
    functions = { bold = true, italic = false },
    strings = { italic = false }
  }
}

vim.cmd.colorscheme("silkcircuit")
