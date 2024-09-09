local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.default_prog = { "powershell" }
config.default_cwd = "C:\\Users\\zoee\\Developer"

config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font("FiraMono Nerd Font", { weight = "Bold" })
config.enable_tab_bar = false

return config