-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
<<<<<<< Updated upstream
local beautiful = require('beautiful')
local naughty = require('naughty')
pcall(require, 'luarocks.loader')
=======
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
pcall(require, "luarocks.loader")
>>>>>>> Stashed changes

naughty.connect_signal('request::display_error', function(message, startup)
    naughty.notification {
        urgency = 'critical',
        title = 'Oops, an error happened'
            .. (startup and ' during startup!' or '!'),
        message = message
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal('mouse::enter', function(c)
    c:activate{
        context = 'mouse_enter',
        raise = false
    }
end)
require('awful.autofocus')

<<<<<<< Updated upstream
require('awful.hotkeys_popup.keys')
beautiful.init('/home/pedram/.config/awesome/theme/pedburn/theme.lua')
-- beautiful.init(gears.filesystem.get_themes_dir() .. 'zenburn/theme.lua')
require('config.bindings')
require('config.tags')
require('config.wallpaper')
require('config.rules')
require('config.titlebars')
require('config.notifications')
require('config.layouts')
=======
require("awful.hotkeys_popup.keys")
beautiful.init("/home/pedram/.config/awesome/theme/pedburn/theme.lua")

require("config.bindings")
require("config.tags")
require("config.wallpaper")
require("config.rules")
require("config.titlebars")
require("config.notifications")
require("config.layouts")

awful.spawn.once({ "picom", "--config", "/home/pedram/.config/picom.conf" })
>>>>>>> Stashed changes
