local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local separators = lain.util.separators
local markup = lain.util.markup

local widgets = {}
widgets.calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
widgets.volume_widget = require("awesome-wm-widgets.volume-widget.volume")

local mpd_icon = wibox.widget.imagebox(beautiful.widget_music)
local purpleicon = wibox.widget.imagebox(beautiful.widget_cloud)
local mem_icon = wibox.widget.imagebox(beautiful.widget_mem)
local cpu_icon = wibox.widget.imagebox(beautiful.widget_cpu)

widgets.sp = wibox.widget.textbox(" ")
widgets.arrow = separators.arrow_left

local cpu = lain.widget.cpu({
  settings = function()
    widget:set_markup("Cpu " .. cpu_now.usage)
  end
})


local mem = lain.widget.mem({
  settings = function()
    widget:set_markup(markup.font(beautiful.font, " " .. markup(beautiful.black, mem_now.used .. "MB ")))
  end,
})

local mpd = lain.widget.mpd({
  settings = function()
    if mpd_now.state == "play" then
      local artist = " " .. mpd_now.artist .. " "
      local title = mpd_now.title .. " "
      mpd_icon:set_image(beautiful.widget_music_on)
      widget:set_markup(
        markup.font(beautiful.font, markup(beautiful.black, artist) .. " " .. markup(beautiful.black, title))
      )
    elseif mpd_now.state == "pause" then
      widget:set_markup(markup.font(beautiful.font, " mpd paused "))
      mpd_icon:set_image(beautiful.widget_music_pause)
    else
      widget:set_text("")
      mpd_icon:set_image(beautiful.widget_music)
    end
  end,
})

widgets.mpd_widget = wibox.container.background(
  wibox.container.margin(wibox.widget({ mpd_icon, mpd, layout = wibox.layout.align.horizontal }), dpi(3), dpi(6)),
  beautiful.muted_purple
)

widgets.mem_widget = wibox.container.background(
  wibox.container.margin(wibox.widget({ mem_icon, mem, layout = wibox.layout.align.horizontal }), dpi(2), dpi(3)),
  beautiful.yellow
)

widgets.cpu_widget = wibox.container.background(
  wibox.container.margin(wibox.widget({ cpu_icon, cpu, layout = wibox.layout.align.horizontal }), dpi(2), dpi(3)),
  beautiful.yellow
)

widgets.mytextclock = wibox.widget.textclock(markup(beautiful.black, "%A %m-%d | %H:%M"), 10)
widgets.mytextclock:connect_signal("button::press", function(_, _, _, button)
  if button == 1 then
    calwidget.toggle()
  end
end)

return widgets
