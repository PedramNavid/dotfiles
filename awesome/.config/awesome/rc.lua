-- {{{ Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, tostring, type = ipairs, string, os, tostring, type

local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')
local wibox = require('wibox')
local beautiful = require('beautiful')
local naughty = require('naughty')
local lain = require('lain')
local freedesktop = require('freedesktop')
local hotkeys_popup = require('awful.hotkeys_popup').widget
require('awful.hotkeys_popup.keys')
local dpi = require('beautiful.xresources').apply_dpi
local funcs = require('funcs')
local keys = require('modules.keys')
-- }}}

-- {{{ Variable definitions
local chosen_theme = 'pedram'
local editor = os.getenv('EDITOR') or 'nvim'
local modkey = 'Mod4'
local tagnames = {'term', 'browse', 'music', 'misc', 'misc2'}
local terminal = 'alacritty'

local function new(self, ...)
  local instance = setmetatable({}, { __index = self })
  return instance:init(...) or instance end

-- Function to create object in lua - used globally
function class(base)
  return setmetatable({ new = new }, { __call = new, __index = base })
end


lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 1
lain.layout.termfair.center.nmaster = 3
lain.layout.termfair.center.ncol = 1
lain.layout.cascade.tile.offset_x = dpi(2)
lain.layout.cascade.tile.offset_y = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster = 5
lain.layout.cascade.tile.ncol = 2

-- }}}
--
-- {{{ Error Handling
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = 'Oops, there were errors during startup!',
        text = awesome.startup_errors
    })
end

do
    local in_error = false
    awesome.connect_signal('debug::error', function(err)
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = 'Oops, an error happened!',
            text = tostring(err)
        })
        in_error = false
    end)
end
-- }}}


-- {{{ Set Layout and Defaults
awful.util.terminal = terminal
awful.util.tagnames = tagnames

awful.layout.layouts = {
    awful.layout.suit.tile, -- 1
    awful.layout.suit.tile.left, -- 2
    awful.layout.suit.tile.bottom, -- 3
    awful.layout.suit.tile.top, -- 4
    awful.layout.suit.fair, -- 5
    awful.layout.suit.corner.nw, -- 6
    lain.layout.termfair, -- 7
    lain.layout.termfair.center -- 8
}

local tag_maps = {
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({modkey}, 1, function(t)
        if client.focus then client.focus:move_to_tag(t) end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({modkey}, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
}

local tasklist_buttons = {
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            -- c:emit_signal('request::activate', 'tasklist', {raise = true})
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            client.focus = c
            c:raise()
        end
    end),
    awful.button({}, 2, function(c) c:kill() end),
    awful.button({}, 3, function()
        local instance = nil

        return function()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = dpi(250)}})
            end
        end
    end),
    awful.button({}, 4, function() awful.client.focus.byidx(1) end),
    awful.button({}, 5, function() awful.client.focus.byidx(-1) end)
}

awful.util.taglist_buttons = gears.table.join(table.unpack(tag_maps))
awful.util.tasklist_buttons = gears.table.join(table.unpack(tasklist_buttons))

beautiful.init(string.format('%s/.config/awesome/themes/%s/theme.lua',
                             os.getenv('HOME'), chosen_theme)) -- }}}

-- {{{ Autostart windowless processes
funcs.run_once({'picom -b', 'unclutter &'})
-- }}}
--
-- {{{ Menu
local myawesomemenu = {
    {'hotkeys', function() return false, hotkeys_popup.show_help end},
    {'manual', terminal .. ' -e man awesome'},
    {
        'edit config',
        string.format('%s -e %s %s', terminal, editor, awesome.conffile)
    },
    {'restart', awesome.restart},
    {'quit', function() awesome.quit() end}
}
awful.util.mymainmenu = freedesktop.menu.build(
                            {
        icon_size = beautiful.menu_height or dpi(16),
        before = {{'Awesome', myawesomemenu, beautiful.awesome_icon}},
        after = {{'Open terminal', terminal}}
    })
-- }}}

-- {{{ Screen
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', function(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == 'function' then wallpaper = wallpaper(s) end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal('arrange', function(s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
        if only_one and not c.floating or c.maximized then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width
        end
    end
end)

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)

    require("modules.wallpaper")(s)
    beautiful.at_screen_connect(s)

end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(awful.button({}, 3, function()
    awful.util.mymainmenu:toggle()
end), awful.button({}, 4, awful.tag.viewnext),
                              awful.button({}, 5, awful.tag.viewprev)))
-- }}}

-- {{{ Key bindings
-- Set keys
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = keys.clientkeys,
            buttons = keys.clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap +
                awful.placement.no_offscreen,
            size_hints_honor = false
        }
    }, -- Titlebars
    {
        rule_any = {type = {'dialog', 'normal'}},
        properties = {titlebars_enabled = false}
    }, -- Set Firefox to always map on the first tag on screen 1.
    {
        rule = {class = 'Firefox'},
        properties = {screen = 1, tag = awful.util.tagnames[1]}
    },
    {
        rule = {class = 'Gimp', role = 'gimp-image-window'},
        properties = {maximized = true}
    }
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal('manage', function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and not c.size_hints.user_position and
        not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal('request::titlebars', function(c)
    -- Custom
    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = gears.table.join(awful.button({}, 1, function()
        c:emit_signal('request::activate', 'titlebar', {raise = true})
        awful.mouse.client.move(c)
    end), awful.button({}, 2, function() c:kill() end),
                                     awful.button({}, 3, function()
        c:emit_signal('request::activate', 'titlebar', {raise = true})
        awful.mouse.client.resize(c)
    end))

    awful.titlebar(c, {size = dpi(16)}):setup{
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align = 'center',
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

client.connect_signal('focus',
                      function(c) c.border_color = beautiful.border_focus end)
client.connect_signal('unfocus',
                      function(c) c.border_color = beautiful.border_normal end)

-- vim: foldmethod=marker ts=4 shiftwidth=4
