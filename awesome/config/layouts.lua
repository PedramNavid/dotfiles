local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local lain = require('lain')
local gears = require('gears')
local calendar_widget = require('awesome-wm-widgets.calendar-widget.calendar')
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local dpi = beautiful.xresources.apply_dpi
local markup = lain.util.markup
local menu = require('config.menu')
local keys = require('config.keys')

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()
local calwidget = calendar_widget({
  placement = 'top_right',
  radius = 8
})

-- Other widgets

local temp = lain.widget.temp({
  timeout = 10,
  settings = function()
    widget:set_markup(markup.fontfg(beautiful.font, "#f1af5f", coretemp_now .. "°C"))
  end
})
local memory = lain.widget.mem({
  settings = function()
    widget:set_markup(markup.fontfg(beautiful.font, "#e0da37", mem_now.used .. "M "))
  end
})
screen.connect_signal('request::desktop_decoration', function(s)
  local layout = awful.layout.suit
  awful.tag.add('1', {
    layout = layout.tile.right,
    master_fill_policy = 'master_width_factor',
    gap_single_client = true,
    screen = s,
    selected = true
  })

  awful.tag.add('2', {
    layout = layout.tile,
    screen = s
  })

  awful.tag.add('3', {
    layout = layout.tile,
    screen = s
  })
  awful.tag.add('4', {
    layout = layout.tile,
    screen = s
  })

  awful.tag.add('5', {
    layout = lain.layout.termfair.center,
    screen = s
  })

  s.mypromptbox = awful.widget.prompt()

  s.mylayoutbox = awful.widget.layoutbox {
    screen = s,
    buttons = {
      awful.button({}, 1, function()
        awful.layout.inc(1)
      end), awful.button({}, 3, function()
      awful.layout.inc(-1)
    end), awful.button({}, 4, function()
      awful.layout.inc(-1)
    end), awful.button({}, 5, function()
      awful.layout.inc(1)
    end)
    }
  }

  s.mytaglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({}, 1, function(t)
        t:view_only()
      end), awful.button({ keys.modkey }, 1, function(t)
      if client.focus then client.focus:move_to_tag(t) end
    end), awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ keys.modkey }, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
      end), awful.button({}, 4, function(t)
      awful.tag.viewprev(t.screen)
    end), awful.button({}, 5, function(t)
      awful.tag.viewnext(t.screen)
    end)
    }
  }

  -- @TASKLIST_BUTTON@
  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = {
      awful.button({}, 1, function(c)
        c:activate {
          context = 'tasklist',
          action = 'toggle_minimization'
        }
      end), awful.button({}, 3, function()
      awful.menu.client_list {
        theme = {
          width = 250
        }
      }
    end), awful.button({}, 4, function()
      awful.client.focus.byidx(-1)
    end), awful.button({}, 5, function()
      awful.client.focus.byidx(1)
    end)
    },
    style = {
      shape = gears.shape.circle,
    },
    layout = {
      spacing = dpi(5),
      layout = wibox.layout.fixed.horizontal,
    },
    widget_template = {
      {
        {
          {
            id = "icon_role",
            widget = wibox.widget.imagebox,
          },
          margins = 2,
          widget = wibox.container.margin,
        },
        margins = dpi(4),
        widget = wibox.container.margin,
      },
      id = "background_role",
      widget = wibox.container.background,
      create_callback = function(self, c, _, _)
        self:connect_signal("mouse::enter", function()
          awesome.emit_signal("bling::task_preview::visibility", s, true, c)
        end)
        self:connect_signal("mouse::leave", function()
          awesome.emit_signal("bling::task_preview::visibility", s, false, c)
        end)
      end,
    },
  }

  -- @DOC_WIBAR@
  -- Create the wibox
  s.mywibox = awful.wibar {
    position = 'top',
    screen = s,
    width = 1000,
    -- @DOC_SETUP_WIDGETS@
    widget = {
      layout = wibox.layout.align.horizontal,
      {
              -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        s.mytaglist,
        s.mypromptbox
      },
      s.mytasklist,       -- Middle widget
      {
                          -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        temp,
        memory,
        volume_widget({
          font = "Play 10"
        }),
        wibox.widget.systray(),
        mytextclock,
      }
    }
  }
end)

mytextclock:connect_signal('button::press', function(_, _, _, button)
  if button == 1 then calwidget.toggle() end
end)
-- }}}
