local set_n = require("patchy.utils").set_n;
local open_oil = "<cmd>Oil<cr>"

require("oil").setup {
  view_options = { show_hidden = true },
  keymaps = {
    ["-"] = open_oil,
    ["<c-b>"] = open_oil,
    ["<c-h>"] = false,
    ["<c-v>"] = "actions.select_vsplit"
  },
  columns = { "icon", "size" };
}

set_n("<leader>pp", open_oil)
set_n("<leader>px", function ()
  vim.cmd("split | Oil")
end)
set_n("<leader>pv", function ()
  vim.cmd("vsplit | Oil")
end)

-- don't load netrw.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
