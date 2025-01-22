local function format(component, text, hl_group)
	if not hl_group then
		return text
	end

	---@type table<string, string>
	component.hl_cache = component.hl_cache or {}
	local lualine_hl_group = component.hl_cache[hl_group]
	if not lualine_hl_group then
		local utils = require("lualine.utils.utils")
		local mygui = function()
			local mybold = utils.extract_highlight_colors(hl_group, "bold") and "bold"
			local myitalic = utils.extract_highlight_colors(hl_group, "italic") and "italic"
			if mybold and myitalic then
				return mybold .. "," .. myitalic
			elseif mybold then
				return mybold
			elseif myitalic then
				return myitalic
			else
				return ""
			end
		end

		lualine_hl_group = component:create_hl({
			fg = utils.extract_highlight_colors(hl_group, "fg"),
			gui = mygui(),
		}, "LV_" .. hl_group)
		component.hl_cache[hl_group] = lualine_hl_group
	end
	return component:format_hl(lualine_hl_group) .. text .. component:get_default_hl()
end

local function pretty_path(opts)
	opts = vim.tbl_extend("force", {
		relative = "cwd",
		modified_hl = "MatchParen",
		filename_hl = "Bold",
		dirpath_hl = "Conceal",
	}, opts or {})

	return function(self)
		local path = vim.fn.expand("%:p") --[[@as string]]
		if path == "" then
			return ""
		end

		local root = vim.fn.stdpath("config")
		local cwd = vim.fn.getcwd()

		if opts.relative == "cwd" and path:find(cwd, 1, true) == 1 then
			path = path:sub(#cwd + 2) -- Strip cwd path prefix
		else
			path = path:sub(#root + 2) -- Strip root path prefix
		end

		local sep = package.config:sub(1, 1)
		local parts = vim.split(path, "[\\/]")

		-- Keep only the file name, i.e., the last part of the path
		local filename = parts[#parts]

		-- Apply the highlight to the filename
		if opts.modified_hl and vim.bo.modified then
			filename = format(self, filename, opts.modified_hl)
		else
			filename = format(self, filename, opts.filename_hl)
		end

		-- If there is a directory part, apply the formatting to it
		local dirpath = ""
		if #parts > 1 then
			local dir_parts = { unpack(parts, 1, #parts - 1) }
			dirpath = table.concat(dir_parts, sep) .. sep
			dirpath = format(self, dirpath, opts.dirpath_hl)
		end

		-- Return formatted directory path + filename
		return dirpath .. filename
	end
end

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			local lazy_status = require("lazy.status")
			local better_escape_status = require("better_escape")

			lualine.setup({
				options = {
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{
							function()
								return ""
							end,
							padding = { left = 1, right = 0 },
							separator = "",
						},
						"mode",
					},
					lualine_b = {
						function()
							local ok, m = better_escape_status, better_escape_status
							return ok and m.waiting and "✺" or ""
						end,
					},
					-- Use the pretty_path function here
					lualine_c = { pretty_path() },
					lualine_y = { "progress" },
					lualine_z = {
						{ "location", separator = "" },
						{
							function()
								return ""
							end,
							padding = { left = 0, right = 1 },
						},
					},
					lualine_x = {
						{
							lazy_status.updates,
							cond = lazy_status.has_updates,
							color = { fg = "#ff9e64" },
						},
					},
				},
			})
		end,
	},
}
