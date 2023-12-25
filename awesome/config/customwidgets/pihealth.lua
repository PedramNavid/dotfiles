local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require('gears')

local cmd = 'bash -c "~/dotfiles/awesome/config/customwidgets/pihealth_script.sh"'

local config = {
	font = 'Play 9',
	temp_max_value = 80,
	temp_min_value = 20,
	widget_step_width = 2,
	widget_step_spacing = 1,
	widget_width = 50,
	popup_width = 650,
	popup_height = 120,
	popup_border_color = beautiful.border_color_active,
	popup_border_width = 1,
	popup_text_width = 30,
	bar_width = 90,
	bar_height = 10,
	bar_paddings = 1,
	bar_border_width = 2,
	bar_color = 'linear:80,0:0,0:0,#D08770:0.5,#BF616A:0.9,' .. beautiful.fg_normal,
	background_color = beautiful.bg_normal,
}

local function parse_cmd_output(s)
	local temp_result = {}
	local uptime_result = {}
	local lines = gears.string.split(s, '\n')
	for _, line in pairs(lines) do
		local row = gears.string.split(line, ' ')
		if row[2] == 'temp' then
			temp_result[row[1]] = row[3]
		elseif row[2] == 'uptime' then
			uptime_result[row[1]] = row[3]
		end
	end
	return temp_result, uptime_result
end

local popup = awful.popup({
	widget = {},
	maximum_width = config.popup_width,
	border_color = config.popup_border_color,
	border_width = config.popup_border_width,
	shape = gears.shape.rectangle,
	ontop = true,
	visible = false,
	offset = {
		y = 5,
	},
})

local function create_textbox(args)
	return wibox.widget({
		text = args.text,
		align = 'left',
		markup = args.markup,
		forced_width = args.forced_width or config.popup_text_width,
		font = config.font,
		widget = wibox.widget.textbox,
	})
end

local function uptime_to_parts(uptime)
	local up_t = math.floor(uptime)
	local up_d = math.floor(up_t / (3600 * 24))
	local up_h = math.floor((up_t % (3600 * 24)) / 3600)
	local up_m = math.floor(((up_t % (3600 * 24)) % 3600) / 60)
	local up_s = math.floor(((up_t % (3600 * 24)) % 3600) % 60)
	return string.format('%02.0f:%02.0f:%02.0f:%02.0f', up_d, up_h, up_m, up_s)
end

local function update_widget(widget, stdout, stderr)
	if stderr ~= '' then print(stderr) end
	local temp_results, uptime_results = parse_cmd_output(stdout)

	local rows = {
		layout = wibox.layout.fixed.vertical,
		bg = beautiful.bg_normal,
	}

	local i = 1
	local hostnames = {}
	for n in pairs(temp_results) do
		table.insert(hostnames, n)
	end
	table.sort(hostnames)
	for _, host in ipairs(hostnames) do
		local temp = temp_results[host]
		local uptime = uptime_to_parts(uptime_results[host])
		widget:add_value(temp)
		local row = {
			create_textbox({
				text = host,
			}),
			create_textbox({
				text = uptime,
				forced_width = 170,
			}),
			create_textbox({
				text = string.format('%.1f°C', temp),
				forced_width = 80,
				align = 'right',
			}),
			{
				min_value = config.temp_min_value,
				max_value = config.temp_max_value,
				forced_width = config.bar_width,
				forced_height = config.bar_height,
				paddings = config.bar_padddings,
				border_width = config.bar_border_width,
				border_color = config.background_color,
				value = math.floor(temp),
				background_color = config.background_color,
				color = config.bar_color,
				widget = wibox.widget.progressbar,
			},
			layout = wibox.layout.ratio.horizontal,
		}
		rows[i] = row
		i = i + 1
	end

	local text_headers = wibox.widget({
		create_textbox({
			markup = '<b>Host</b>',
		}),
		create_textbox({
			markup = '<b>Uptime</b>',
		}),
		create_textbox({
			markup = '<b>Temp</b>',
		}),
		create_textbox({
			markup = '<b>Temp Graph</b>',
		}),
		widget = wibox.layout.ratio.horizontal,
	})

	local text_rows = {
		rows,
		widget = wibox.container.background,
		bg = config.background_color,
	}

	popup:setup({
		text_headers,
		text_rows,
		widget = wibox.layout.fixed.vertical,
	})
end

local graph_widget = wibox.widget({
	max_value = config.temp_max_value,
	min_value = config.temp_min_value,
	step_width = config.widget_step_width,
	step_spacing = config.widget_step_spacing,
	background_color = config.background_color,
	color = 'linear:0,0:0,30:0,#FF0000:0.4,#FFFF00:0.8,' .. beautiful.fg_normal,
	forced_width = config.widget_width,
	widget = wibox.widget.graph,
})

local pihealth_widget = wibox.widget({
	{
		graph_widget,
		right = 4,
		left = 4,
		layout = wibox.container.margin,
	},
	widget = wibox.container.mirror,
	reflection = {
		horizontal = true,
	},
})

graph_widget:buttons(awful.util.table.join(awful.button({}, 1, function()
	if popup.visible then
		popup.visible = not popup.visible
	else
		popup:move_next_to(mouse.current_widget_geometry)
	end
end)))

awful.widget.watch(cmd, 10, update_widget, graph_widget)

return pihealth_widget
