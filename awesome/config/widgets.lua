local beautiful = require("beautiful")
local widgets = {}

local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")
local pacman_widget = require("awesome-wm-widgets.pacman-widget.pacman")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")

widgets.calwidget = calendar_widget({
	placement = "top_center",
	radius = 8,
	theme = "nord",
})

widgets.cpuwidget = cpu_widget({
	width = 70,
	step_width = 2,
	step_spacing = 1,
	color = beautiful.fg_normal,
	process_info_max_length = 50,
	timeout = 1,
})

widgets.fswidget = fs_widget({
	mounts = { "/" },
})

widgets.memwidget = ram_widget()
widgets.logout = logout_menu_widget({
	font = "Play 10",
})

widgets.netspeed = net_speed_widget()
widgets.pacman = pacman_widget()
widgets.volume = volume_widget()

return widgets
