local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local keys = require("config.keys")
local widgets = require("config.widgets")

-- Custom Widgets
-- Create a textclock widget
screen.connect_signal("request::desktop_decoration", function(s)
	local layout = awful.layout.suit
	awful.tag.add("web", {
		layout = layout.tile.right,
		screen = s,
		selected = true,
	})

	awful.tag.add("term", {
		layout = layout.fair.horizontal,
		screen = s,
	})

	awful.tag.add("code", {
		layout = layout.corner.ne,
		screen = s,
	})
	awful.tag.add("other", {
		layout = layout.fair,
		screen = s,
	})

	s.mypromptbox = awful.widget.prompt()

	s.mylayoutbox = awful.widget.layoutbox({
		screen = s,
		buttons = {
			awful.button({}, 1, function()
				awful.layout.inc(1)
			end),
			awful.button({}, 2, function()
				awful.layout.set(awful.layout.layouts[1])
			end),
			awful.button({}, 3, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 4, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 5, function()
				awful.layout.inc(1)
			end),
		},
	})

	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = {
			awful.button({}, 1, function(t)
				t:view_only()
			end),
			awful.button({ keys.modkey }, 1, function(t)
				if client.focus then
					client.focus:move_to_tag(t)
				end
			end),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button({ keys.modkey }, 3, function(t)
				if client.focus then
					client.focus:toggle_tag(t)
				end
			end),
			awful.button({}, 4, function(t)
				awful.tag.viewprev(t.screen)
			end),
			awful.button({}, 5, function(t)
				awful.tag.viewnext(t.screen)
			end),
		},
	})

	-- @TASKLIST_BUTTON@
	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = {
			awful.button({}, 1, function(c)
				c:activate({
					context = "tasklist",
					action = "toggle_minimization",
				})
			end),
			awful.button({}, 3, function()
				awful.menu.client_list({
					theme = {
						width = 250,
					},
				})
			end),
			awful.button({}, 4, function()
				awful.client.focus.byidx(-1)
			end),
			awful.button({}, 5, function()
				awful.client.focus.byidx(1)
			end),
		},
	})

	-- @DOC_WIBAR@
	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		-- @DOC_SETUP_WIDGETS@
		widget = {
			layout = wibox.layout.align.horizontal,
			{ -- Left widgets
				layout = wibox.layout.fixed.horizontal,
				s.mytaglist,
				s.mypromptbox,
				widgets.sp,
			},
			s.mytasklist, -- Middle widget
			{ -- Right widgets
				layout = wibox.layout.fixed.horizontal,

				wibox.widget.systray(),
				widgets.arrow(beautiful.bg_normal, "#343434"),

				widgets.purpleair_widget,
				widgets.arrow("#343434", beautiful.muted_purple),

				widgets.mpd_widget,
				widgets.arrow(beautiful.muted_purple, beautiful.yellow),

				widgets.mem_widget,
				widgets.arrow(beautiful.yellow, beautiful.peach),

				wibox.container.background(
					wibox.container.margin(widgets.mytextclock, dpi(3), dpi(6)),
					beautiful.peach
				),
				s.mylayoutbox,
			},
		},
	})
end)

-- }}}
