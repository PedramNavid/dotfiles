local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local globalkeys = require('modules.globalkeys')

local key_mappings = require("modules.keys")
local modkey = key_mappings.modkey

awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = globalkeys.clientkeys,
            buttons = globalkeys.clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap +
                awful.placement.no_offscreen,
            size_hints_honor = false
        }
    }, -- Titlebars
    {
        rule_any = {type = {'dialog', 'normal'}},
        properties = {titlebars_enabled = false}
    }, -- Set Firefox to always map on the first tag on screen 1.
    {
        rule = {class = 'Firefox'},
        properties = {screen = 1, tag = awful.util.tagnames[1]}
    },
    {
        rule = {class = 'Gimp', role = 'gimp-image-window'},
        properties = {maximized = true}
    },
    {
	    rule = { class = 'Slack' },
	    properties = { screen = 1, tag = awful.util.tagnames[6] }
    },
}

