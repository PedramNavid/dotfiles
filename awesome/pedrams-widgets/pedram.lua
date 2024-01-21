local vicious = require('vicious')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require('gears')

M = {}
M.datewidget = wibox.widget.textbox()
vicious.register(M.datewidget, vicious.widgets.date, '%a %b %d %R', 60)

local calendar_widget = require('awesome-wm-widgets.calendar-widget.calendar')
local wi_cal = calendar_widget({
    theme = 'nord',
    radius = beautiful.border_radius,
    placement = 'top_right',
})

M.datewidget:connect_signal('button::press', function(_, _, _, button)
    if button == 1 then wi_cal.toggle() end
end)

local theme = require('theme')
local graph_color = {
    type = 'linear',
    from = { 0, 0 },
    to = { 0, 20 },
    stops = {
        { 0,   beautiful.nord11 },
        { 0.2, beautiful.nord13 },
        { 1,   beautiful.nord14 },
    },
}

local memwidget = wibox.widget({
    max_value = 1,
    min_value = 0,
    step_width = 2,
    step_shape = gears.shape.rounded_bar,
    background_color = theme.bg_normal,
    color = graph_color,
    widget = wibox.widget.graph,
})

M.memwidget = wibox.container.margin(wibox.container.mirror(memwidget, { horizontal = true }), 0, 0, 0, 2)

vicious.register(memwidget, vicious.widgets.mem, '$1', 3)

local cpuwidget = wibox.widget({
    max_value = 1,
    min_value = 0,
    step_width = 2,
    step_shape = gears.shape.rounded_bar,
    background_color = theme.bg_normal,
    color = graph_color,
    widget = wibox.widget.graph,
})

M.cpuwidget = wibox.widget({
    {
        {
            {
                widget = cpuwidget,
            },
            reflection = { horizontal = true },
            widget = wibox.container.mirror,
        },
        left = 5,
        right = 5,
        top = 5,
        bottom = 5,
        widget = wibox.container.margin,
        color = theme.nord13,
        draw_empty = true,
    },
    shape = gears.shape.rounded_bar,
    bg = theme.nord11,
    border_color = theme.nord11,
    border_width = 2,
    forced_width = 50,
    widget = wibox.container.background,
})

vicious.register(cpuwidget, vicious.widgets.cpu, '$1', 1)

return M
