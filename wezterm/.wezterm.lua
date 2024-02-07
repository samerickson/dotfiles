local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { 'pwsh.exe' }

-- config.font = wezterm.font "Delugia Mono"

config.background = {
  {
    source = {
      File = 'C:/Users/erick/Pictures/Wallpapers/Best/term.jpg',
    },
    -- width = '100%',
    repeat_x = 'NoRepeat',
    hsb = { brightness = 0.6 },
  }
}

return config

