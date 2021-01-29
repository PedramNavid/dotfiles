local awful = require('awful')
local freedesktop = require('freedesktop')
local beautiful = require('beautiful')
local dpi = require('beautiful.xresources').apply_dpi

local hotkeys_popup = require('awful.hotkeys_popup').widget
local apps = require('modules.apps')

local myawesomemenu = {
    {'hotkeys', function() return false, hotkeys_popup.show_help end},
    {'manual', apps.default.terminal .. ' -e man awesome'},
    {
        'edit config',
        string.format('%s -e %s %s', apps.default.terminal, apps.default.editor, awesome.conffile)
    },
    {'restart', awesome.restart},
    {'quit', function() awesome.quit() end}
}

awful.util.mymainmenu = freedesktop.menu.build(
                            {
        icon_size = beautiful.menu_height or dpi(16),
        before = {{'Awesome', myawesomemenu, beautiful.awesome_icon}},
        after = {{'Open terminal', apps.default.terminal}}
    })
