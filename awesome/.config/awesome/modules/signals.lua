local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')

local wibox = require('wibox')

local dpi = require('beautiful.xresources').apply_dpi

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
-- }}}

-- {{{ Client

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

client.connect_signal('manage', function(c)
    if awesome.startup and not c.size_hints.user_position and
        not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

-- }}}
