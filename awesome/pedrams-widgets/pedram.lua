local vicious = require('vicious')
local wibox = require('wibox')
local beautiful = require('beautiful')
local utils = require('pedrams-widgets.utils')

M = {}
M.datewidget = wibox.widget.textbox()
vicious.register(M.datewidget, vicious.widgets.date, '%a %b %d - %R', 60)

local calendar_widget = require('awesome-wm-widgets.calendar-widget.calendar')
local wi_cal = calendar_widget({
    theme = 'nord',
    radius = beautiful.border_radius,
    placement = 'top_right',
})

M.datewidget:connect_signal('button::press', function(_, _, _, button)
    if button == 1 then wi_cal.toggle() end
end)

M.memwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(M.memwidget, vicious.widgets.mem, function(_, args)
    local used = utils.convert(args[2], 'MiB', 'GiB')
    return '󰍛 ' .. args[1] .. '% (' .. string.format('%.1fGiB)', used)
end)

return M
