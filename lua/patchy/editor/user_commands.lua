local function create(name, action)
	vim.api.nvim_create_user_command(name, action, {})
end

create("Q", "q")
create("W", "w")
create("Wq", "wq")
create("WQ", "wq")
