-- {{{ Required libraries
local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')

require('awful.autofocus')
require('awful.hotkeys_popup.keys')

require('modules.errors')
require('modules.globalkeys')
require('modules.menu')
require('modules.mouse')
require('modules.signals')

local config = require('modules.configurations')
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
