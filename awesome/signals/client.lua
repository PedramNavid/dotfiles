local awful = require 'awful'
require 'awful.autofocus'
local wibox = require 'wibox'

client.connect_signal('mouse::enter', function(c) c:activate { context = 'mouse_enter', raise = false } end)

client.connect_signal('request::titlebars', function(c)
  -- buttons for the titlebar
  local buttons = {
    awful.button({}, 1, function() c:activate { context = 'titlebar', action = 'mouse_move' } end),
    awful.button({}, 3, function() c:activate { context = 'titlebar', action = 'mouse_resize' } end),
  }

  awful.titlebar(c).widget = {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout = wibox.layout.fixed.horizontal,
    },
    { -- Middle
      { -- Title
        halign = 'center',
        widget = awful.titlebar.widget.titlewidget(c),
      },
      buttons = buttons,
      layout = wibox.layout.flex.horizontal,
    },
    layout = wibox.layout.align.horizontal,
  }
end)
