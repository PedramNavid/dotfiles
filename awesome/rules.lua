local awful = require 'awful'
local ruled = require 'ruled'

ruled.client.connect_signal('request::rules', function()
  ruled.client.append_rule {
    id = 'global',
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    },
    callback = function(c) awful.client.setslave(c) end,
  }

  -- Floating Clients
  ruled.client.append_rule {
    id = 'floating',
    rule_any = {
      instance = { 'copyq', 'pinentry' },
      class = {
        'Arandr',
        'Blueman-manager',
        'Gpick',
        'Kruler',
        'Sxiv',
        'Tor Browser',
        'Wpa_gui',
        'veromix',
        'xtightvncviewer',
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        'Event Tester', -- xev.
      },
      role = {
        'AlarmWindow', -- Thunderbird's calendar.
        'ConfigManager', -- Thunderbird's about:config.
        'pop-up', -- e.g. Google Chrome's (detached) Developer Tools.
      },
    },
    properties = { floating = true },
  }

  -- Add titlebars to normal clients and dialogs
  ruled.client.append_rule {
    id = 'titlebars',
    rule_any = { type = { 'normal', 'dialog' } },
    properties = { titlebars_enabled = function(c) return not c.requests_no_titlebar end },
  }
  ruled.client.append_rule {
    rule = { class = '1Password' },
    properties = { screen = 1, tag = 'media' },
  }

  ruled.client.append_rule {
    rule = { class = 'Spotify' },
    properties = { screen = 1, tag = 'media' },
  }
  ruled.client.append_rule {
    rule = { instance = 'slack' },
    properties = { screen = 1, tag = 'chat' },
  }
  ruled.client.append_rule {
    rule = { instance = 'discord' },
    properties = { screen = 1, tag = 'chat' },
  }
  ruled.client.append_rule {
    rule = { instance = 'obsidian' },
    properties = { screen = 1, tag = 'notes' },
  }
  ruled.client.append_rule {
    rule = { instance = 'feh' },
    properties = { floating = true },
  }
  ruled.client.append_rule {
    rule_any = { class = { 'Alacritty', 'Google-chrome' } },
    properties = { titlebars_enabled = false },
  }
end)
