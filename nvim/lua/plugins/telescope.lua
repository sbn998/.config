return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				sorting_strategy = "ascending",
				layout_strategy = "flex",
				layout_config = {
					horizontal = { preview_cutoff = 80, preview_width = 0.55 },
					vertical = { mirror = true, preview_cutoff = 25 },
					prompt_position = "top",
					width = 0.87,
					height = 0.80,
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-c>"] = actions.delete_buffer, -- deletes selected buffer in insert mode.
						["<C-x>"] = actions.close, -- closes telescope window in insert mode.
						["<C-v>"] = actions.select_vertical, -- opens file in vertical split.
						["<C-h>"] = actions.select_horizontal, -- opens file in horizontal split.
					},
					n = {
						["<C-c>"] = actions.delete_buffer, -- deletes selected buffer in normal mode.
						["<C-x>"] = actions.close, -- closes telescope window in insert mode.
						["<C-v>"] = actions.select_vertical, -- opens file in vertical split.
						["<C-h>"] = actions.select_horizontal, -- opens file in horizontal split.
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("flutter")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader>fd", "<cmd>Telescope flutter commands<cr>", { desc = "Show Flutter commands" })
		keymap.set("n", "<leader>be", "<cmd>Telescope buffers<cr>", { desc = "Show active buffers" })
		keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Show active marks" })
		keymap.set("n", "<leader>re", "<cmd>Telescope registers<cr>", { desc = "Show registers" })
		keymap.set(
			"n",
			"<leader>bf",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			{ desc = "Fuzzy find string in current buffer" }
		)
		keymap.set("n", "<leader>fh", "<cmd>Telescope git_status<cr>", { desc = "Fuzzy find git files" })
	end,
}
