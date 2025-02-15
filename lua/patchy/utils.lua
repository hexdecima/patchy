local function set_map(mode, map, action)
	vim.keymap.set(mode, map, action, { noremap = true, silent = true })
end

local function set_n(map, action)
	set_map("n", map, action)
end

local function set_v(map, action)
	set_map("v", map, action)
end

return {
	set_map = set_map,
	set_n = set_n,
	set_v = set_v,
}
