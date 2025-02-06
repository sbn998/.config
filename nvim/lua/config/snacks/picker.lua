local M = {
	win = {
		input = {
			keys = {
				["<C-x>"] = { "close", mode = { "n", "i" } },
				["<c-h>"] = { "edit_split", mode = { "i", "n" } },
			},
		},
	},
	lists = {
		input = {
			keys = {
				["<C-x>"] = { "close", mode = { "n", "i" } },
				["<c-h>"] = { "edit_split", mode = { "i", "n" } },
			},
		},
	},
}

return M
