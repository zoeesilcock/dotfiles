hl.config({
  input = {
    kb_layout = "se",
    kb_variant = "",
    kb_model = "",
    kb_options = "ctrl:nocaps",
    kb_rules = "",

    repeat_delay = 250,
    repeat_rate = 50,
    follow_mouse = 1,
    sensitivity = 0.75,
    natural_scroll = true,

    touchpad = {
      natural_scroll = true,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

hl.device({
  name = "zmk-project-sofle-choc-pro-keyboard",
  kb_layout = "us",
})
