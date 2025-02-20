local servers = {
	lua_ls = {
		bin = "lua-language-server",
	},
	rust_analyzer = {
		bin = "rust-analyzer",
		extra_options = {
			settings = {
				check = {
					command = "clippy",
					allTargets = false,
				},
			},
		},
	},
	nil_ls = {
		bin = "nil",
	},
	html = {
		bin = "vscode-html-language-server",
	},
	cssls = {
		bin = "vscode-css-language-server",
	},
	ts_ls = {
		bin = "typescript-language-server",
	},
	bashls = {
		bin = "bash-language-server",
	},
	nushell = {
		bin = "nu",
	},
	gleam = {},
	taplo = {},
	clangd = {},
}
local keymaps = {
	["gD"] = vim.lsp.buf.declaration,
	["gd"] = vim.lsp.buf.definition,
	["K"] = vim.lsp.buf.hover,
	["gi"] = vim.lsp.buf.implementation,
	["gr"] = vim.lsp.buf.references,
	["<leader>ca"] = require("actions-preview").code_actions,
	["<leader>e"] = vim.diagnostic.open_float,
}
local function on_attach(_, buffer)
	for map, action in pairs(keymaps) do
		vim.keymap.set("n", map, action, {
			noremap = true,
			silent = true,
			buffer = buffer,
		})
	end
end
local default_setup = {
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities,
}

for server, config in pairs(servers) do
	local bin = config.bin or server
	local options = (config.extra_options ~= nil) and vim.tbl_extend("force", default_setup, config.extra_options)
		or default_setup

	if vim.fn.executable(bin) == 1 then
		require("lspconfig")[server].setup(options)
	end
end
