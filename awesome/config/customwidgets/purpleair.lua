local wibox = require("wibox")
local watch = require("awful.widget.watch")

local SENSOR_ID = "109500|116323"
local GET_SENSOR_CMD = [[bash -c "curl -s --show-error -X GET 'https://www.purpleair.com/json?show=]]
	.. SENSOR_ID
	.. "' |"
local JQ_CMD =
	[[jq '.results[] | select(.DEVICE_LOCATIONTYPE != null) | {location: .DEVICE_LOCATIONTYPE, value: .PM2_5Value} | join(\",\")'"]]

local FULL_CMD = GET_SENSOR_CMD .. JQ_CMD
print(FULL_CMD)

local icon_widget = wibox.widget({
	{
		widget = wibox.widget.imagebox,
		resize = false,
		image = "/home/pedram/dotfiles/awesome/theme/pedburn/weather.svg",
	},
	layout = wibox.container.margin(_, 3, 3, 0),
	set_image = function(self, path)
		self.icon.image = path
	end,
})

local temp_widget = wibox.widget({
	widget = wibox.widget.textbox,
	font = "Play 9",
	text = "AQI: 66",
})

local purpleair_widget = wibox.widget({
	icon_widget,
	temp_widget,
	layout = wibox.layout.fixed.horizontal,
})

local function update_widget(widget, stdout, stderr)
	if stderr ~= "" then
		print(stderr)
	end
	local result = stdout
	print(result)
	widget:set_text(result)
end

watch(FULL_CMD, 10, update_widget, temp_widget)

return purpleair_widget
