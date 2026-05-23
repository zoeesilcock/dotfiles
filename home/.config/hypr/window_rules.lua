--
-- Global.
--
--
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
hl.window_rule({
    name  = "no-gaps-wtv1",
    match = { float = false, workspace = "w[tv1]" },
    border_size = 0,
    rounding    = 0,
})

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
  no_focus = true,
})

--
-- Specific.
--

hl.window_rule({
  name = "1password",
  match = { class = "1password" },
  float = true,
})

hl.window_rule({
  name = "pip-windows",
  match = { title = "^(Picture in picture)$" },
  pin = true,
  float = true,
  move = "2293 1",
  size = "1146 644",
})

hl.window_rule({
  name = "unity-hub",
  match = { class = "^(unityhub)$" },
  float = true,
})

hl.window_rule({
  name = "unity",
  match = {
    class = "^(Unity)$",
    title = "^(Unity - .*)$",
  },
  fullscreen = true
})

hl.window_rule({
  name = "aseprite",
  match = { class = "^(Aseprite)$" },
  workspace = 4,
  float = false,
})

hl.window_rule({
  name = "joplin",
  match = { class = "^(@joplin/app-desktop)$" },
  workspace = "special:magic",
  float = true,
  move = "1146 0",
  size = "1146 1440",
})

hl.window_rule({
  name = "spotify",
  match = { class = "^(Spotify)$" },
  workspace = "special:magic",
  float = true,
  move = "0 0",
  size = "1146 1440",
})

hl.window_rule({
  name = "speedcrunch",
  match = { class = "^(org.speedcrunch.speedcrunch)$" },
  workspace = "special:magic",
  float = true,
  move = "2292 720",
  size = "1146 720",
})

hl.window_rule({
  name = "floating-flint",
  match = { class = "^(hello_pixels|evolver|diamonds|cube|template)$" },
  float = true,
  move = "monitor_w-window_w 0",
})

hl.window_rule({
  name = "handmade-hero",
  match = { title = "^(Handmade Zig)$" },
  workspace = 3,
})

hl.window_rule({
  name = "looking-glass",
  match = { class = "^(looking-glass-client)$" },
  fullscreen = true,
  workspace = 4,
})
