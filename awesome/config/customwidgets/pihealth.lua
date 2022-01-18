local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require('gears')

local cmd = 'bash -c "~/dotfiles/awesome/config/customwidgets/script.sh"'

local config = {
    font = "sans 10",
    temp_max_value = 80,
    temp_min_value = 20,
    widget_step_width = 2,
    widget_step_spacing = 1,
    widget_width = 50,
    popup_width = 300,
    popup_height = 200,
    popup_border_color = beautiful.border_color_active,
    popup_border_width = 1,
    popup_text_width = 40,
    bar_width = 150,
    bar_height = 15,
    bar_paddings = 2,
    bar_border_width = 3,
    bar_color = "linear:80,0:0,0:0,#D08770:0.5,#BF616A:0.9,"
        .. beautiful.fg_normal,
    background_color = "#000000"

}

local function parse_cmd_output(s)
    local result = {}
    local lines = gears.string.split(s, "\n")
    for _, line in pairs(lines) do
        local row = gears.string.split(line, " ")
        result[row[1]] = row[2]
    end
    return result
end

local popup = awful.popup {
    widget = {},
    maximum_width = config.popup_width,
    border_color = config.popup_border_color,
    border_width = config.popup_border_width,
    shape = gears.shape.rectangle,
    ontop = true,
    visible = false,
    offset = {
        y = 5
    }
}

local function create_textbox(args)
    return wibox.widget {
        text = args.text,
        align = 'left',
        markup = args.markup,
        forced_width = args.forced_width or config.popup_text_width,
        font = config.font,
        widget = wibox.widget.textbox
    }
end

local function update_widget(widget, stdout, stderr)
    if stderr ~= '' then print(stderr) end
    local parsed = parse_cmd_output(stdout)

    local rows = {
        layout = wibox.layout.fixed.vertical,
        bg = beautiful.bg_normal
    }

    local i = 1
    local hostnames = {}
    for n in pairs(parsed) do table.insert(hostnames, n) end
    table.sort(hostnames)
    for _, host in ipairs(hostnames) do
        local temp = parsed[host]
        widget:add_value(temp)
        local row = {
            create_textbox {
                text = host
            },
            create_textbox {
                text = string.format("%.1f", temp)
            },
            {
                min_value = 10,
                max_value = 60,
                forced_width = config.bar_width,
                forced_height = config.bar_height,
                paddings = config.bar_padddings,
                border_width = config.bar_border_width,
                border_color = config.background_color,
                value = math.floor(temp),
                background_color = config.background_color,
                color = config.bar_color,
                widget = wibox.widget.progressbar
            },
            layout = wibox.layout.ratio.horizontal
        }
        rows[i] = row
        i = i + 1
    end

    local texthost = wibox.widget {
        rows,
        widget = wibox.container.background,
        bg = config.background_color
    }

    popup:setup{
        texthost,
        layout = wibox.layout.ratio.horizontal
    }

end

local graph_widget = wibox.widget {
    max_value = config.temp_max_value,
    min_value = config.temp_min_value,
    step_width = config.widget_step_width,
    step_spacing = config.widget_step_spacing,
    color = "linear:0,0:0,30:0,#FF0000:0.4,#FFFF00:0.8," .. beautiful.fg_normal,
    forced_width = config.widget_width,
    widget = wibox.widget.graph
}

local pihealth_widget = wibox.widget {
    {
        graph_widget,
        right = 4,
        left = 4,
        layout = wibox.container.margin
    },
    widget = wibox.container.mirror,
    reflection = {
        horizontal = true
    }
}

graph_widget:buttons(awful.util.table.join(
                         awful.button({}, 1, function()
        if popup.visible then
            popup.visible = not popup.visible
        else
            popup:move_next_to(mouse.current_widget_geometry)
        end
    end)))

awful.widget.watch(cmd, 10, update_widget, graph_widget)

return pihealth_widget
