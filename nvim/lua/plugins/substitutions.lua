return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitute = require("substitute")

		substitute.setup()

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
		keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
		keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
		keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
		keymap.set("n", "<leader>sr", require("substitute.range").operator, { noremap = true })
		keymap.set("x", "<leader>sr", require("substitute.range").visual, { noremap = true })
		keymap.set("n", "<leader>ss", require("substitute.range").word, { noremap = true })
		keymap.set("n", "sr", require("substitute.exchange").operator, { noremap = true })
		keymap.set("n", "sR", require("substitute.exchange").line, { noremap = true })
		keymap.set("x", "X", require("substitute.exchange").visual, { noremap = true })
		keymap.set("n", "src", require("substitute.exchange").cancel, { noremap = true })
	end,
}
