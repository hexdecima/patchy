local set_n = require("patchy.utils").set_n
local hp = require("harpoon")
local function select(n)
  hp:list():select(n)
end

hp:setup()
set_n("<c-e>", function () hp.ui:toggle_quick_menu(hp:list()) end)
set_n("<c-a>", function () 
  hp:list():add() 
  vim.notify("[patchy] added current buffer's file to harpoon.")
end)
set_n("<leader>1", function () select(1) end)
set_n("<leader>2", function () select(2) end)
set_n("<leader>3", function () select(3) end)
set_n("<leader>4", function () select(4) end)
