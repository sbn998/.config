return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	version = "*",
	config = function()
		require("lsp_lines").setup()
		vim.diagnostic.config({ virtual_text = false })
		vim.keymap.set("", "<Leader>ls", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
	end,
}
