require("binds")
require("window_rules")
require("input")

hl.monitor({
  output = "DP-3",
  mode = "3440x1440@165",
})

hl.on("hyprland.start", function ()
  hl.exec_cmd("dropbox")
  hl.exec_cmd("waybar")
  hl.exec_cmd("mako") -- For notifications.

  -- Dark mode.
  hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"Adwaita-dark\"") -- For GTK3 apps.
  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"") -- For GTK4 apps.
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Fix keyboard issues with accent keys.
hl.env("GTK_IM_MODULE", "gtk-im-context-simple")

-- Dark mode.
hl.env("GTK_THEME", "Adwaita:dark")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 1,

    col = {
      active_border = { colors = {"rgba(74c7ecff)", "rgba(89b4faff)"}, angle = 45 },
      inactive_border = "rgba(000000aa)",
    },

    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },
  decoration = {
    rounding = 2,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = false,
      range = 4,
      render_power = 3,
      color = 0x1a1a1aee,
    },

    blur = {
      enabled = false,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },
  animations = {
    enabled = false,
  },
  dwindle = {
    preserve_split = true,
  },
  master = {
    new_status = "master",
  },
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
  },
})
