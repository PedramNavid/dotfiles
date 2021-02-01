-- {{{ Required libraries
local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local xrdb = beautiful.xresources.get_current_theme()

require('awful.autofocus')
require('awful.hotkeys_popup.keys')
local config = require('modules.configurations')

require('modules.errors')
require('modules.globalkeys')
require('modules.menu')
require('modules.mouse')
require('modules.rules')
require('modules.signals')

local funcs = require('modules.funcs')
local layouts = require("modules.layouts")
local taglist = require('modules.taglist')
local tasklist = require('modules.tasklist')

-- }}}

local chosen_theme = config.chosen_theme

local function new(self, ...)
  local instance = setmetatable({}, { __index = self })
  return instance:init(...) or instance end

-- Function to create object in lua - used globally
function class(base)
  return setmetatable({ new = new }, { __call = new, __index = base })
end

x = {
    --           xrdb variable
    background = xrdb.background,
    foreground = xrdb.foreground,
    color0     = xrdb.color0,
    color1     = xrdb.color1,
    color2     = xrdb.color2,
    color3     = xrdb.color3,
    color4     = xrdb.color4,
    color5     = xrdb.color5,
    color6     = xrdb.color6,
    color7     = xrdb.color7,
    color8     = xrdb.color8,
    color9     = xrdb.color9,
    color10    = xrdb.color10,
    color11    = xrdb.color11,
    color12    = xrdb.color12,
    color13    = xrdb.color13,
    color14    = xrdb.color14,
    color15    = xrdb.color15,
}

awful.layout.layouts = layouts
awful.util.taglist_buttons = gears.table.join(table.unpack(taglist.tag_maps))
awful.util.tasklist_buttons = gears.table.join(table.unpack(tasklist.tasklist_buttons))

beautiful.init(string.format('%s/.config/awesome/themes/%s/theme.lua',
                             os.getenv('HOME'), chosen_theme))

funcs.run_once({'picom -b', 'unclutter &'})

awful.screen.connect_for_each_screen(function(s)
    require("modules.wallpaper")(s)
    beautiful.at_screen_connect(s)
end)

-- vim: foldmethod=marker ts=4 shiftwidth=4
