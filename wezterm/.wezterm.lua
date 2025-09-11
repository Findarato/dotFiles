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
config.initial_cols = 80
config.initial_rows = 12

-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Dracula (Official)'
config.color_scheme = 'Dracula+'

config.colors = {
 cursor_bg = "purple",
 cursor_border = "purple",
}

-- No titlebar or windows
config.window_decorations = 'RESIZE'
config.enable_tab_bar = true

-- key bindings

config.keys = {
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false},
  },
  {
    key = '%',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain'},
  },
  {
    key = '"',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain'},
  },
  



}

-- Finally, return the configuration to wezterm:
return config