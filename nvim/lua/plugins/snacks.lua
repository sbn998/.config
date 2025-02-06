return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = require("config.snacks.dashboard"),
		explorer = require("config.snacks.explorer"),
	},
}
