local awful = require('awful')
local dpi = require('beautiful.xresources').apply_dpi

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

return { tasklist_buttons = tasklist_buttons }
