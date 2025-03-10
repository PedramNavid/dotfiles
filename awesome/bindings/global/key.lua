local awful = require 'awful'
local hotkeys_popup = require 'awful.hotkeys_popup'
require 'awful.hotkeys_popup.keys'
local menubar = require 'menubar'
local beautiful = require 'beautiful'
local gears = require 'gears'

local apps = require 'config.apps'
local mod = require 'bindings.mod'
local widgets = require 'widgets'
local volume_widget = require 'awesome-wm-widgets.pactl-widget.volume'
local naughty = require 'naughty'

menubar.utils.terminal = apps.terminal

local inc = function()
  local volume_script = 'bash -c "pactl get-sink-volume @DEFAULT_SINK@"'
  awful.spawn.easy_async_with_shell(volume_script, function(stdout)
    local voltext = string.match(stdout, '%d+%%')
    naughty.notification {
      icon = beautiful.volume_icon,
      text = voltext or '0',
      timeout = 2,
      urgency = 'low',
      border_width = 0,
    }
  end)
end

-- General Awesome keys
awful.keyboard.append_global_keybindings {
  awful.key({ mod.super }, 's', hotkeys_popup.show_help, { description = 'show help', group = 'awesome' }),
  awful.key({ mod.super, 'Control' }, 'r', awesome.restart, { description = 'reload awesome', group = 'awesome' }),
  awful.key({ mod.super, 'Shift' }, 'q', awesome.quit, { description = 'quit awesome', group = 'awesome' }),
  awful.key {
    modifiers = { mod.super },
    key = 'w',
    on_press = function() widgets.mainmenu:show() end,
    description = 'show main menu',
    group = 'awesome',
  },
  awful.key({}, 'XF86AudioRaiseVolume', function()
    awful.util.spawn('pactl set-sink-volume @DEFAULT_SINK@ +2.5%', false)
    inc()
  end, { description = 'volume up', group = 'hotkeys' }),
  awful.key({}, 'XF86AudioLowerVolume', function()
    awful.util.spawn('pactl set-sink-volume @DEFAULT_SINK@ -5%', false)
    inc()
  end, { description = 'volume down', group = 'hotkeys' }),
  awful.key({}, 'XF86AudioPlay', function() awful.util.spawn('playerctl play-pause', false) end),

  awful.key(
    {},
    'XF86AudioNext',
    function() awful.util.spawn('playerctl next', false) end,
    { description = 'next track', group = 'hotkeys' }
  ),

  awful.key(
    {},
    'XF86AudioPrev',
    function() awful.util.spawn('playerctl previous', false) end,
    { description = 'previous track', group = 'hotkeys' }
  ),

  awful.key({}, 'XF86AudioMute', function()
    awful.spawn('amixer -D pulse set Master 1+ toggle', false)
    awesome.emit_signal 'volume_change'
  end, { description = 'toggle mute', group = 'hotkeys' }),

  awful.key(
    { mod.super },
    'Return',
    function() awful.spawn(apps.terminal) end,
    { description = 'open a terminal', group = 'launcher' }
  ),
  awful.key(
    { mod.super },
    'p',
    function() menubar.show() end,
    { description = 'show the menubar', group = 'launcher' }
  ),
  awful.key(
    { mod.super },
    'b',
    function() awful.spawn.with_shell(apps.browser, false) end,
    { description = 'Browser', group = 'net' }
  ),
  awful.key(
    {},
    '#202',
    function() awful.spawn(apps.screenshot, false) end,
    { description = 'Take screenshot', group = 'utilities' }
  ),

  -- Prompt
  awful.key(
    { mod.super },
    'a',
    function() awful.spawn.with_shell 'rofi -show drun -show-icons' end,
    { description = 'run rofi apps', group = 'launcher' }
  ),

  awful.key(
    { mod.super },
    'r',
    function() awful.spawn.with_shell 'rofi -show combi -modes combi -combi-modes "window,drun,run"' end,
    { description = 'run rofi programs', group = 'launcher' }
  ),

  awful.key(
    { mod.super },
    'w',
    function() awful.spawn.with_shell 'rofi -show window' end,
    { description = 'run rofi windows', group = 'launcher' }
  ),
  awful.key(
    { 'Control' },
    'F4',
    function() awful.spawn.with_shell 'flameshot gui' end,
    { description = 'run flameshot', group = 'launcher' }
  ),
}

-- Tags related keybindings
awful.keyboard.append_global_keybindings {
  awful.key({ mod.super }, 'Left', awful.tag.viewprev, { description = 'view previous', group = 'tag' }),
  awful.key({ mod.super }, 'Right', awful.tag.viewnext, { description = 'view next', group = 'tag' }),
  awful.key({ mod.super }, 'Escape', awful.tag.history.restore, { description = 'go back', group = 'tag' }),
}

-- Focus related keybindings
awful.keyboard.append_global_keybindings {
  awful.key(
    { mod.super },
    'j',
    function() awful.client.focus.byidx(1) end,
    { description = 'focus next by index', group = 'client' }
  ),
  awful.key(
    { mod.super },
    'k',
    function() awful.client.focus.byidx(-1) end,
    { description = 'focus previous by index', group = 'client' }
  ),
  awful.key({ mod.super }, 'Tab', function()
    awful.client.focus.history.previous()
    if client.focus then client.focus:raise() end
  end, { description = 'go back', group = 'client' }),
  awful.key({ mod.super, 'Control' }, 'n', function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then c:activate { raise = true, context = 'key.unminimize' } end
  end, { description = 'restore minimized', group = 'client' }),
}

-- Layout related keybindings
awful.keyboard.append_global_keybindings {
  awful.key(
    { mod.super, 'Shift' },
    'j',
    function() awful.client.swap.byidx(1) end,
    { description = 'swap with next client by index', group = 'client' }
  ),
  awful.key(
    { mod.super, 'Shift' },
    'k',
    function() awful.client.swap.byidx(-1) end,
    { description = 'swap with previous client by index', group = 'client' }
  ),
  awful.key(
    { mod.super },
    'u',
    awful.client.urgent.jumpto,
    { description = 'jump to urgent client', group = 'client' }
  ),
  awful.key(
    { mod.super },
    'l',
    function() awful.tag.incmwfact(0.02) end,
    { description = 'increase master width factor', group = 'layout' }
  ),

  awful.key(
    { mod.super },
    'h',
    function() awful.tag.incmwfact(-0.02) end,
    { description = 'decrease master width factor', group = 'layout' }
  ),

  awful.key(
    { mod.super, 'Shift' },
    'h',
    function() awful.tag.incnmaster(1, nil, true) end,
    { description = 'increase the number of master clients', group = 'layout' }
  ),

  awful.key(
    { mod.super, 'Shift' },
    'l',
    function() awful.tag.incnmaster(-1, nil, true) end,
    { description = 'decrease the number of master clients', group = 'layout' }
  ),

  awful.key(
    { mod.super, 'Control' },
    'h',
    function() awful.tag.incncol(1, nil, true) end,
    { description = 'increase the number of columns', group = 'layout' }
  ),

  awful.key(
    { mod.super, 'Control' },
    'l',
    function() awful.tag.incncol(-1, nil, true) end,
    { description = 'decrease the number of columns', group = 'layout' }
  ),

  awful.key(
    { mod.super },
    'space',
    function() awful.layout.inc(1) end,
    { description = 'select next', group = 'layout' }
  ),

  awful.key(
    { mod.super, 'Shift' },
    'space',
    function() awful.layout.inc(-1) end,
    { description = 'select previous', group = 'layout' }
  ),
}

awful.keyboard.append_global_keybindings {
  awful.key {
    modifiers = { mod.super },
    keygroup = 'numrow',
    description = 'only view tag',
    group = 'tag',
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then tag:view_only() end
    end,
  },
  awful.key {
    modifiers = { mod.super, 'Control' },
    keygroup = 'numrow',
    description = 'toggle tag',
    group = 'tag',
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then awful.tag.viewtoggle(tag) end
    end,
  },
  awful.key {
    modifiers = { mod.super, 'Shift' },
    keygroup = 'numrow',
    description = 'move focused client to tag',
    group = 'tag',
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then client.focus:move_to_tag(tag) end
      end
    end,
  },
  awful.key {
    modifiers = { mod.super, 'Control', 'Shift' },
    keygroup = 'numrow',
    description = 'toggle focused client on tag',
    group = 'tag',
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then client.focus:toggle_tag(tag) end
      end
    end,
  },
  awful.key {
    modifiers = { mod.super },
    keygroup = 'numpad',
    description = 'select layout directly',
    group = 'layout',
    on_press = function(index)
      local t = awful.screen.focused().selected_tag
      if t then t.layout = t.layouts[index] or t.layout end
    end,
  },
}
