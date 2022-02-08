local wibox = require('wibox')
local watch = require('awful.widget.watch')
local gears = require('gears')
local beautiful = require('beautiful')

local SENSOR_ID = "109500|116323"
local GET_SENSOR_CMD =
    [[bash -c "curl -s --show-error -X GET 'https://www.purpleair.com/json?show=]]
        .. SENSOR_ID .. "' |"
local JQ_CMD =
    [[jq '.results[] | select(.DEVICE_LOCATIONTYPE != null) | {location: .DEVICE_LOCATIONTYPE, value: .PM2_5Value} | join(\",\")'"]]

local FULL_CMD = GET_SENSOR_CMD .. JQ_CMD

local icon_widget = wibox.widget {
    {
        widget = wibox.widget.imagebox,
        resize = false,
        image = beautiful.purpleair_icon
    },
    layout = wibox.container.margin(0, 6, 0, 6),
    set_image = function(self, path)
        self.icon.image = path
    end
}

local temp_widget = wibox.widget {
    widget = wibox.widget.textbox,
    font = 'Play 10'
}

local purpleair_widget = wibox.widget {
    icon_widget,
    temp_widget,
    layout = wibox.layout.fixed.horizontal
}

local function parse_command_output(s)
    local lines = gears.string.split(s, "\n")
    local result = {}
    for _, line in pairs(lines) do
        line = string.gsub(line, '"', '')
        local row = gears.string.split(line, ",")
        local location = row[1]
        if row[2] ~= nil then
            local aqi = math.floor(tonumber(row[2]))
            result[location] = aqi
        end
    end
    return result
end

local function update_widget(widget, stdout, stderr)
    local text = ""
    if stderr ~= '' then print(stderr) end
    local result = parse_command_output(stdout)
    for _, v in pairs(result) do text = text .. v .. " : " end
    text = text:sub(1, -3)
    widget:set_text(text)
end

watch(FULL_CMD, 10, update_widget, temp_widget)

return purpleair_widget
