local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'
local vars = require 'config.vars'
local widgets = require 'widgets'
screen.connect_signal(
  'request::wallpaper',
  function(s)
    awful.wallpaper {
      screen = s,
      widget = {
        {
          image = beautiful.wallpaper,
          upscale = true,
          downscale = true,
          widget = wibox.widget.imagebox,
        },
        valign = 'center',
        halign = 'center',
        tiled = false,
        widget = wibox.container.tile,
      },
    }
  end
)

screen.connect_signal('request::desktop_decoration', function(s)
  local names = vars.tags
  local layouts = vars.tag_layouts
  awful.tag(names, s, layouts)
  s.promptbox = widgets.create_promptbox()
  s.layoutbox = widgets.create_layoutbox(s)
  s.taglist = widgets.create_taglist(s)
  s.tasklist = widgets.create_tasklist(s)
  s.wibox = widgets.create_wibox(s)
  s.layoutbox = widgets.create_layoutbox(s)
end)
