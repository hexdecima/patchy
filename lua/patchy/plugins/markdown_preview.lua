vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.md" },
	callback = function()
		vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<cr>")
	end,
})
