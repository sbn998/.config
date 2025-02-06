return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = require("config.snacks.dashboard"),
		explorer = require("config.snacks.explorer"),
		picker = require("config.snacks.picker"),
		indent = require("config.snacks.indent"),
	},
	keys = require("config.snacks.keymaps"),
}
