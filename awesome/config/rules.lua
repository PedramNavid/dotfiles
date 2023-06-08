local awful = require('awful')
local ruled = require('ruled')
-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal('request::rules', function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id = 'global',
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap +
                awful.placement.no_offscreen
        }
    }

    -- @DOC_FLOATING_RULE@
    -- Floating clients.
    ruled.client.append_rule {
        id = 'floating',
        rule_any = {
            instance = {'copyq', 'pinentry'},
            class = {
                'Arandr',
            },
            name = {
                'Event Tester' -- xev.
            },
            role = {
                'AlarmWindow', -- Thunderbird's calendar.
                'ConfigManager', -- Thunderbird's about:config.
                'pop-up' -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = {
            floating = true
        }
    }

    -- @DOC_DIALOG_RULE@
    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        -- @DOC_CSD_TITLEBARS@
        id = 'titlebars',
        rule_any = {
            type = {'normal', 'dialog'}
        },
        properties = {
            titlebars_enabled = true
        }
    }

    ruled.client.append_rule {
      id = "titlebars_hidden",
      rule_any = {
        type = { "normal", "dialog" },
        class = { "kitty" },
      },
      properties = { titlebars_enabled = false },
    }
    ruled.client.append_rule {
        rule = { class = "Slack" },
        properties = { screen = 1, tag = "5" }
    }
    ruled.client.append_rule {
        rule = { class = "discord" },
        properties = { screen = 1, tag = "5" }
    }
    ruled.client.append_rule {
        rule = { class = "Spotify" },
        properties = { screen = 1, tag = "4" }
    }
    ruled.client.append_rule {
        rule = { class = "1Password" },
        properties = { screen = 1, tag = "4" }
    }


end)

-- }}}
