local wezterm = require('wezterm')
local platform = require('utils.platform')

-- local font = 'Maple Mono SC NF'
local font_family = 'Monaspace Argon'
local font_size = platform.is_mac and 12 or 9.5

return {
   font = wezterm.font({
      family = font_family,
      weight = 'Medium',
   }),
   font_size = font_size,
   line_height = 1.3,
   harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
   
   font_rules = {
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font("Monaspace Radon", { weight = "Regular" }),
		},
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font("Monaspace Argon", { weight = "ExtraBold" }),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font("Monaspace Radon", { weight = "ExtraBold" }),
		},
	},

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}