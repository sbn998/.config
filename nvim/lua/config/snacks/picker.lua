local M = {
	win = {
		keys = {
			["<C-x>"] = { "close", mode = { "n", "i" } },
			["<c-h>"] = { "edit_split", mode = { "i", "n" } },
		},
	},
	lists = {
		keys = {
			["<C-x>"] = { "close", mode = { "n", "i" } },
			["<c-h>"] = { "edit_split", mode = { "i", "n" } },
		},
	},
}

return M
