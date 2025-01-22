return {
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			require("flutter-tools").setup({
				decorations = {
					statusline = {
						-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
						-- this will show the current version of the flutter app from the pubspec.yaml file
						app_version = true,
						-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
						-- this will show the currently running device if an application was started with a specific
						-- device
						device = true,
					},
				},
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
