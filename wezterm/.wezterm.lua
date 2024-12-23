local wezterm = require("wezterm")
local font = "Hasklug Nerd Font Mono"
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_prog = { "nu" }

config.font = wezterm.font(font)
config.font_size = 13

-- function scheme_for_appearance(appearance)
-- 	if appearance:find("Dark") then
-- 		return "Catppuccin Mocha"
-- 	else
-- 		return "Catppuccin Latte"
-- 	end
-- end
--
-- config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

config.font_size = 13
config.cell_width = 0.9
config.line_height = 1.15
config.font = wezterm.font(font, { weight = "Medium" })
config.font_rules = {
	{
		intensity = "Bold",
		font = wezterm.font(font, { weight = "DemiBold" }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font(font, { weight = "DemiBold", style = "Italic" }),
	},
	{
		italic = true,
		font = wezterm.font(font, { style = "Italic" }),
	},
}

config.front_end = "WebGpu"

-- Color theme.
local colors = {
	bg = "#0E1419",
	black = "#000000",
	dark_lilac = "#6D5978",
	lilac = "#BAA0E8",
}
config.color_scheme = "Dracula (Official)"
config.colors = {
	background = colors.bg,
	tab_bar = {
		inactive_tab_edge = colors.black,
		active_tab = {
			bg_color = colors.lilac,
			fg_color = colors.black,
		},
		inactive_tab = {
			bg_color = colors.black,
			fg_color = colors.dark_lilac,
		},
		inactive_tab_hover = {
			bg_color = colors.black,
			fg_color = colors.lilac,
		},
		new_tab = {
			bg_color = colors.bg,
			fg_color = colors.lilac,
		},
		new_tab_hover = {
			bg_color = colors.lilac,
			fg_color = colors.black,
		},
	},
}

config.command_palette_bg_color = colors.bg
config.command_palette_fg_color = colors.lilac
config.command_palette_font_size = 12
config.command_palette_rows = 18

config.window_frame = {
	font = wezterm.font(font, { weight = "DemiBold" }),
	active_titlebar_bg = colors.bg,
	inactive_titlebar_bg = colors.bg,
}

-- Inactive panes.
config.inactive_pane_hsb = {
	saturation = 0.6,
	brightness = 0.6,
}

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.cursor_thickness = 2

wezterm.on("format-tab-title", function(tab)
	-- Get the process name.
	local process = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

	-- Current working directory.
	local cwd = tab.active_pane.current_working_dir
	cwd = cwd and string.format("%s ", cwd.file_path:gsub(os.getenv("HOME"), "~")) or ""

	-- Format and return the title.
	return string.format("(%d %s) %s", tab.tab_index + 1, process, cwd)
end)

config.window_decorations = "RESIZE"

config.keys = {
	{ mods = "CTRL", key = "w", action = act.CloseCurrentPane({ confirm = true }) },
	{ mods = "ALT", key = "1", action = act.ActivateTab(0) },
	{ mods = "ALT", key = "2", action = act.ActivateTab(1) },
	{ mods = "ALT", key = "3", action = act.ActivateTab(2) },
	{ mods = "ALT", key = "4", action = act.ActivateTab(3) },
	{ mods = "ALT", key = "5", action = act.ActivateTab(4) },

	-- I do not love this keybinding, but I want the clipboard manager from windows
	-- with Win+V to work, and it sends uses your selection with CTRL+V
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
}

return config
