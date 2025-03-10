local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

local select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	view = {
		entries = { name = "wildmenu", separator = " * " },
	},
	mapping = cmp.mapping.preset.insert({
		["<c-space>"] = cmp.mapping.complete(),
		["<cr>"] = cmp.mapping.confirm({ select = true }),
		["<c-p>"] = cmp.mapping.select_prev_item(select),
		["<c-n>"] = cmp.mapping.select_next_item(select),
		["<c-u>"] = cmp.mapping.scroll_docs(-4),
		["<c-d>"] = cmp.mapping.scroll_docs(4),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "nvim_lua" },
		{ name = "git" },
		{ name = "buffer" },
	}),
})
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}),
})
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "buffer" } }),
})
cmp.setup.filetype("gitcommit", { sources = { name = "git" } })

require("crates").setup({ completion = { cmp = { enabled = true } } })
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "Cargo.toml",
	callback = function()
		cmp.setup.buffer({ sources = { name = "crates" } })
	end,
})
