local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.enable_wayland=false
-- config.color_scheme = 'Sugarplum'
-- config.color_scheme = 'Shaman'
config.color_scheme = 'Sakura'
-- 

-- config.color_scheme = 'Dracula'
-- config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.88

-- config.window_background_image = '~/Downloads/castle.jpg'

-- OG
-- config.window_background_gradient = {
--   orientation = 'Vertical',
--   colors = {
--     '#0f0c29',
--     '#302b63',
--     '#24243e',
--   },
--   interpolation = 'Linear',
--   blend = 'Rgb',
-- }

config.keys = {
  {
    key = 'F10',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = ']',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = ']',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'f',
    mods = 'CTRL|ALT',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      local pos = pane:get_cursor_position()
      local move_viewport_to_scrollback = string.rep('\r\n', pos.y)
      pane:inject_output(move_viewport_to_scrollback)
      pane:send_text('\x0c') -- CTRL-L
    end)
  },
  {
    key = "RightArrow",
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = "LeftArrow",
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },

  {
    key = "UpArrow",
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = "DownArrow",
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
}

return config
