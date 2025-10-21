-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- local sessions = wezterm.plugin.require("https://github.com/abidibo/wezterm-sessions")

-- Load the mappings from the mappings.lua file
config.keys = require("mappings")
config.font = wezterm.font_with_fallback({
	"FiraCode Nerd Font",
	"MesloLGS NF",
	"Noto Color Emoji",
})
-- General
config.initial_cols = 120
config.initial_rows = 28
config.font_size = 10
config.color_scheme = "Catppuccin Mocha"

config.default_prog = { "pwsh.exe", "-NoLogo" }

config.window_decorations = "RESIZE"

-- Finally, return the configuration to wezterm:
return config
