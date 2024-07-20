local _M = {}

local awful = require 'awful'
local hotkeys_popup = require 'awful.hotkeys_popup'
local beautiful = require 'beautiful'
local wibox = require 'wibox'
local dpi = require('beautiful.xresources').apply_dpi

local apps = require 'config.apps'
local mod = require 'bindings.mod'

_M.awesomemenu = {
  { 'hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { 'manual', apps.manual_cmd },
  { 'edit config', apps.editor_cmd .. ' ' .. awesome.conffile },
  { 'restart', awesome.restart },
  { 'quit', function() awesome.quit() end },
}

_M.mainmenu = awful.menu {
  items = {
    { 'awesome', _M.awesomemenu, beautiful.awesome_icon },
    { 'open terminal', apps.terminal },
    { 'open browser', 'google-chrome-stable' },
  },
}

_M.textclock = wibox.widget.textclock()

function _M.create_promptbox() return awful.widget.prompt() end

function _M.create_layoutbox(s)
  return awful.widget.layoutbox {
    screen = s,
    buttons = {
      awful.button {
        modifiers = {},
        button = 1,
        on_press = function() awful.layout.inc(1) end,
      },
      awful.button {
        modifiers = {},
        button = 3,
        on_press = function() awful.layout.inc(-1) end,
      },
      awful.button {
        modifiers = {},
        button = 4,
        on_press = function() awful.layout.inc(-1) end,
      },
      awful.button {
        modifiers = {},
        button = 5,
        on_press = function() awful.layout.inc(1) end,
      },
    },
  }
end

function _M.create_taglist(s)
  return awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button {
        modifiers = {},
        button = 1,
        on_press = function(t) t:view_only() end,
      },
      awful.button {
        modifiers = { mod.super },
        button = 1,
        on_press = function(t)
          if client.focus then client.focus:move_to_tag(t) end
        end,
      },
      awful.button {
        modifiers = {},
        button = 3,
        on_press = awful.tag.viewtoggle,
      },
      awful.button {
        modifiers = { mod.super },
        button = 3,
        on_press = function(t)
          if client.focus then client.focus:toggle_tag(t) end
        end,
      },
      awful.button {
        modifiers = {},
        button = 4,
        on_press = function(t) awful.tag.viewprev(t.screen) end,
      },
      awful.button {
        modifiers = {},
        button = 5,
        on_press = function(t) awful.tag.viewnext(t.screen) end,
      },
    },
  }
end

local task_buttons = {
  awful.button({}, 1, function(c) c:activate { context = 'tasklist', action = 'toggle_minimization' } end),
  awful.button({}, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
  awful.button({}, 4, function() awful.client.focus.byidx(-1) end),
  awful.button({}, 5, function() awful.client.focus.byidx(1) end),
}

local wt = {
  {
    {
      {
        {
          id = 'icon_role',
          widget = wibox.widget.imagebox,
        },
        margins = 2,
        widget = wibox.container.margin,
      },
      {
        id = 'text_role',
        widget = wibox.widget.textbox,
      },
      layout = wibox.layout.fixed.horizontal,
    },
    left = 10,
    right = 10,
    widget = wibox.container.margin,
  },
  id = 'background_role',
  widget = wibox.container.background,
}

function _M.create_tasklist(s)
  return awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = task_buttons,
    widget_template = wt,
    layout = {
      spacing = 2,
      max_widget_size = 200,
      layout = wibox.layout.flex.horizontal,
    },
  }
end

function _M.mylayoutbox(s)
  return awful.widget.layoutbox {
    screen = s,
    buttons = {
      awful.button({}, 1, function() awful.layout.inc(1) end),
      awful.button({}, 3, function() awful.layout.inc(-1) end),
      awful.button({}, 4, function() awful.layout.inc(-1) end),
      awful.button({}, 5, function() awful.layout.inc(1) end),
    },
  }
end

--- Custom Widgets
local pedram = require 'pedrams-widgets.pedram'

function _M.create_wibox(s)
  return awful.wibar {
    screen = s,
    position = 'top',
    height = dpi(30),
    widget = {
      widget = wibox.container.background,
      bg = beautiful.bg_normal,
      {
        widget = wibox.container.margin,
        margins = {
          top = dpi(4),
          bottom = dpi(4),
        },
        {
          layout = wibox.layout.align.horizontal,
          expand = 'none',
          -- left widgets
          {
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(8),
            s.taglist,
            s.promptbox,
          },
          -- middle widgets
          s.tasklist,
          -- right widgets
          {
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(6),
            --            pedram.cpuwidget,
            --           pedram.memwidget,
            pedram.datewidget,
            wibox.widget.systray(),

            s.layoutbox,
          },
        },
      },
    },
  }
end

return _M
