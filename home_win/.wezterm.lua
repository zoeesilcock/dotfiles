local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.default_prog = { "pwsh.exe" }
config.default_cwd = "C:\\Users\\zoee\\Developer"

config.color_scheme = "catppuccin-mocha"
config.enable_tab_bar = false
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.font = wezterm.font("0xProto Nerd Font")
config.font_size = 11
config.cell_width = 0.9
config.line_height = 0.9
config.freetype_load_flags = 'NO_HINTING'

-- Tmux-like bindings.
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  {
    key = "p",
    mods = "LEADER|CTRL",
    action = wezterm.action.ShowTabNavigator,
  },
  {
    key = "v",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal,
  },
  {
    key = "s",
    mods = "LEADER",
    action = wezterm.action.SplitVertical,
  },
  {
    key = "x",
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action.SpawnTab "CurrentPaneDomain",
  },
  {
    key = "z",
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = "n",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = "p",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Down",
  }
}

return config
