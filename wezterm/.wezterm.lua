-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = {}


-- General

config.window_background_opacity = .90

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}

config.font = wezterm.font("FiraMono Nerd Font", {weight="Medium", stretch="Normal", style="Normal"})
config.font_size = 19.0
config.line_height = 1.2

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 40

-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Dracula (Official)'
config.color_scheme = 'Dracula+'

config.colors = {
  cursor_bg = "purple",
}

-- Finally, return the configuration to wezterm:
return config