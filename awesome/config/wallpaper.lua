local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
-- {{{ Wallpaper
-- @DOC_WALLPAPER@
screen.connect_signal("request::wallpaper", function(s)
	awful.wallpaper({
		screen = s,
		widget = {
			{
				image = beautiful.wallpaper,
				upscale = true,
				downscale = true,
				widget = wibox.widget.imagebox,
				horizontal_fit_policy = "fit",
				vertical_fit_policy = "fit",
			},
			valign = "center",
			halign = "center",
			tiled = false,
			widget = wibox.container.tile,
		},
	})
end)
-- }}}
