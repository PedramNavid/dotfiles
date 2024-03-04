-- awesome_mode: api-level=4:screen=on

-- load luarocks if installed
pcall(require, 'luarocks.loader')

-- load theme
local beautiful = require 'beautiful'
local gears = require 'gears'
beautiful.init(gears.filesystem.get_xdg_config_home() .. 'awesome/theme.lua')
--
-- load key and mouse bindings
local awful = require 'awful'
require 'bindings'

-- load rules
require 'rules'

-- load signals
require 'signals'

awful.spawn.with_shell '~/.config/awesome/autorun.sh'
