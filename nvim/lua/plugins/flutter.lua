return {
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			require("flutter-tools").setup({
				widget_guides = {
					enabled = true,
				},
				dev_log = {
					enabled = true,
					open_cmd = "10sp", -- command to use to open the log buffer
				},
				lsp = {
					color = {
						enabled = true,
						background = false,
						background_color = nil,
						foreground = false,
					},
					settings = {
						showTodos = false,
						completeFunctionCalls = true,
						renameFilesWithClasses = "prompt",
						enableSnippets = true,
						updateImportsOnRename = true,
					},
				},
			})
		end,
	},
}
