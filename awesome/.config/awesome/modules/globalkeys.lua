local gtable = require("gears.table")
local awful = require("awful")
local lain =  require("lain")
local beautiful = require("beautiful")
local hotkeys_popup = require('awful.hotkeys_popup').widget
local naughty = require("naughty")


local apps = require("modules.apps")
local key_mappings = require("modules.keys")
local keys = {}

local modkey = key_mappings.modkey
local altkey = key_mappings.altkey
local shiftkey = key_mappings.shiftkey
local controlkey = key_mappings.controlkey

local quake = lain.util.quake({ app = 'alacritty' })

-- {{{ Global Keys
keys.globalkeys = gtable.join(
    awful.key({altkey}, 'p', function() os.execute('scrot') end,
    { description = 'take a screenshot', group = 'hotkeys' }),

    awful.key({modkey}, 's', hotkeys_popup.show_help,
    { description = 'show help', group = 'awesome' }),

    -- {{{ Tag Browsing
    awful.key({modkey}, 'Left', awful.tag.viewprev,
    { description = 'view next', group = 'tag' }),

    awful.key({modkey}, 'Right', awful.tag.viewnext,
    { description = 'view next', group = 'tag' }),

    awful.key({modkey, controlkey}, 'j', awful.tag.viewprev,
    { description = 'view next', group = 'tag' }),

    awful.key({modkey, controlkey}, 'k', awful.tag.viewnext,
    { description = 'view next', group = 'tag' }),
     -- }}}

    -- {{{ Focus by direction
    awful.key({ modkey, }, "j", function()
    awful.client.focus.byidx(-1) end,
    { description = "focus down", group = "client" }),

    awful.key({ modkey, }, "k", function()
    awful.client.focus.byidx(1) end,
    { description = "focus up", group = "client" }),

    awful.key({ modkey, }, "h", function()
    awful.client.focus.bydirection("left") end,
    { description = "focus left", group = "client" }),

    awful.key({ modkey, }, "l", function()
    awful.client.focus.bydirection("right") end,
    { description = "focus right", group = "client" }),
    -- }}}

    -- {{{ Client Management
    awful.key({modkey, shiftkey}, 'j', function()
    awful.client.swap.byidx(1) end,
    { description = 'swap with next client by index', group = 'client' }),

    awful.key({modkey, shiftkey}, 'k', function()
    awful.client.swap.byidx(-1) end,
    { description = 'swap with previous client by index', group = 'client' }),

    awful.key({modkey}, 'u', awful.client.urgent.jumpto,
    { description = 'jump to urgent client', group = 'client' }),

    awful.key({modkey, controlkey}, 'n', function()
    local c = awful.client.restore()
    if c then client.focus = c c:raise()
    end end,
    { description = 'restore minimized', group = 'client' }),
    --- }}}

    -- {{{ Client Size Managemnt
    awful.key({altkey, shiftkey}, 'l', function()
    awful.tag.incmwfact(0.05) end,
    { description = 'increase master width factor', group = 'layout' }),

    awful.key({altkey, shiftkey}, 'h', function()
    awful.tag.incmwfact(-0.05) end,
    { description = 'decrease master width factor', group = 'layout' }),

    awful.key({altkey, controlkey}, '=', function()
    lain.util.useless_gaps_resize(1) end,
    { description = 'increment useless gaps', group = 'layout' }),

    awful.key({altkey, controlkey}, '-', function()
    lain.util.useless_gaps_resize(-1) end,
    { description = 'decrement useless gaps', group = 'layout' }),
    --- }}}

    --- {{{ Screen Management
    awful.key({modkey, controlkey}, 'j', function()
    awful.screen.focus_relative(1) end,
    { description = 'focus the next screen', group = 'screen' }),

    awful.key({modkey, controlkey}, 'k', function()
    awful.screen.focus_relative(-1) end,
    { description = 'focus the previous screen', group = 'screen' }),
    --- }}}

    --- {{{ Wibox Management
    awful.key({modkey}, 'b', function()
    for s in screen do
        s.mywibox.visible = not s.mywibox.visible
            if s.mybottomwibox then
                s.mybottomwibox.visible = not s.mybottomwibox.visible
    end end end,
    { description = 'toggle wibox', group = 'awesome' }),
    --- }}}

    --- {{{ Application Shortcut Keys
    awful.key({modkey}, 'Return', function()
    awful.spawn(apps.default.terminal) end,
    { description = 'open a terminal', group = 'launcher' }),

    awful.key({modkey, controlkey}, 'r', awesome.restart,
    { description = 'reload awesome', group = 'awesome' }),

    awful.key({modkey, shiftkey}, 'q', awesome.quit,
    { description = 'quit awesome', group = 'awesome' }),
    --- }}}

    --- {{{ Layout Management
    awful.key({modkey, shiftkey}, 'h', function()
    awful.tag.incnmaster(1, nil, true) end,
    { description = 'increase the number of master clients', group = 'layout' }),

    awful.key({modkey, shiftkey}, 'l', function()
    awful.tag.incnmaster(-1, nil, true) end,
    { description = 'decrease the number of master clients', group = 'layout' }),

    awful.key({modkey, controlkey}, 'h', function()
    awful.tag.incncol(1, nil, true) end,
    { description = 'increase the number of columns', group = 'layout' }),

    awful.key({modkey, controlkey}, 'l', function()
    awful.tag.incncol(-1, nil, true) end,
    { description = 'decrease the number of columns', group = 'layout' }),

    awful.key({modkey}, 'space', function()
    awful.layout.inc(1) end,
    { description = 'select next', group = 'layout' }),

    awful.key({modkey, shiftkey}, 'space', function()
    awful.layout.inc(-1) end,
    { description = 'select previous', group = 'layout' }),
    --- }}}

    -- {{{ Dropdown application
    -- doesnt work yet??
    awful.key({modkey}, 'z', function() quake:toggle() end,
    { description = 'dropdown application', group = 'launcher' }),
    --- }}}

    -- {{{ Widgets popups
    awful.key({altkey}, 'c', function()
    if beautiful.cal then beautiful.cal.show(7) end end,
    { description = 'show calendar', group = 'widgets' }),

    awful.key({altkey}, 'w', function()
    if beautiful.weather then beautiful.weather.show(7) end
    end, { description = 'show weather', group = 'widgets' }),

    --- }}}

    -- {{{ Hotkeys
    awful.key({}, 'XF86MonBrightnessUp', function()
    os.execute('xbacklight -inc 10') end,
    { description = '+10%', group = 'hotkeys' }),

    awful.key({}, 'XF86MonBrightnessDown', function()
    os.execute('xbacklight -dec 10') end,
    { description = '-10%', group = 'hotkeys' }),

    awful.key({}, 'XF86AudioRaiseVolume', function()
    os.execute(string.format('amixer -q set %s 1%%+', beautiful.volume.channel))
    beautiful.volume.update()
    end,
    { description = 'volume up', group = 'hotkeys' }),

    awful.key({}, 'XF86AudioLowerVolume', function()
    os.execute(string.format('amixer -q set %s 1%%-', beautiful.volume.channel))
    beautiful.volume.update()
    end,
    { description = 'volume down', group = 'hotkeys' }),

    awful.key({}, 'XF86AudioMute', function()
    os.execute(string.format(
        'amixer -q set %s toggle',
         beautiful.volume.togglechannel or beautiful.volume.channel))
    beautiful.volume.update()
    end,
    { description = 'toggle mute', group = 'hotkeys' }),

    awful.key({}, 'XF86AudioPlay', function()
    os.execute('mpc toggle') beautiful.mpd.update() end,
    { description = 'mpc toggle', group = 'widgets' }),

    awful.key({}, 'XF86AudioPrev', function()
    os.execute('mpc prev') beautiful.mpd.update() end,
    { description = 'mpc prev', group = 'widgets' }),

    awful.key({}, 'XF86AudioNext', function()
    os.execute('mpc next') beautiful.mpd.update()
    end, { description = 'mpc next', group = 'widgets' }),

    -- does this do anything?
    awful.key({altkey}, '0', function()
        local common = {
            text = 'MPD widget ',
            position = 'top_middle',
            timeout = 2
        }
        if beautiful.mpd.timer.started then
            beautiful.mpd.timer:stop()
            common.text = common.text .. lain.util.markup.bold('OFF')
        else
            beautiful.mpd.timer:start()
            common.text = common.text .. lain.util.markup.bold('ON')
        end
        naughty.notify(common)
    end, { description = 'mpc on/off', group = 'widgets' }),


    -- Copy primary to clipboard (terminals to gtk)
    awful.key({modkey}, 'c', function()
    awful.spawn.with_shell('xsel | xsel -i -b') end,
    { description = 'copy terminal to gtk', group = 'hotkeys' }),

    -- Copy clipboard to primary (gtk to terminals)
    awful.key({modkey}, 'v', function()
    awful.spawn.with_shell('xsel -b | xsel') end,
    { description = 'copy gtk to terminal', group = 'hotkeys' }),

    -- User programs
    awful.key({modkey}, 'q', function() awful.spawn(apps.default.browser) end,
    { description = 'run browser', group = 'launcher' }),

    awful.key({modkey}, 'r', function()
    os.execute(string.format('dmenu_run -i -fn \'Tamsyn\' -nb \'%s\' ' ..
      '-nf \'%s\' -sb \'%s\' -sf \'%s\'',
      beautiful.bg_normal, beautiful.fg_normal,
      beautiful.bg_focus, beautiful.fg_focus))
    end,
    { description = 'show dmenu', group = 'launcher' }),

    awful.key({modkey}, 'x', function()
        awful.prompt.run {
            prompt = 'Run Lua code: ',
            textbox = awful.screen.focused().mypromptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. '/history_eval'
        }
    end, { description = 'lua execute prompt', group = 'awesome' }) -- ]]

)
-- }}}
-- }}}

-- {{{ Client Buttons
local buttons = gtable.join(
    awful.button({}, 1, function(c)
        c:emit_signal('request::activate', 'mouse_click', {raise = true})
    end),

    awful.button({modkey}, 1, function(c)
        c:emit_signal('request::activate', 'mouse_click', {raise = true})
        awful.mouse.client.move(c)
    end),

    awful.button({modkey}, 3, function(c)
        c:emit_signal('request::activate', 'mouse_click', {raise = true})
        awful.mouse.client.resize(c)
    end)

)


local clientkeys = gtable.join(

    awful.key({modkey, 'Shift'}, 'm', lain.util.magnify_client,
    { description = 'magnify client', group = 'client' }),

    awful.key({modkey}, 'f', function(c)
    c.fullscreen = not c.fullscreen c:raise() end,
    { description = 'toggle fullscreen', group = 'client' }),

    awful.key({modkey, 'Shift'}, 'c', function(c)
    c:kill() end,
    { description = 'close', group = 'client' }),

    awful.key({modkey, 'Control'}, 'space',
    awful.client.floating.toggle,
    { description = 'toggle floating', group = 'client' }),

    awful.key({modkey, 'Control'}, 'Return', function(c)
    c:swap(awful.client.getmaster()) end,
    { description = 'move to master', group = 'client' }),

    awful.key({modkey}, 'o', function(c)
    c:move_to_screen() end,
    { description = 'move to screen', group = 'client' }),

    awful.key({modkey}, 'n', function(c)
    c.minimized = true end,
    { description = 'minimize', group = 'client' }),

    awful.key({modkey}, 'm', function(c)
    c.maximized = not c.maximized c:raise() end,
    { description = 'maximize', group = 'client' })
)

for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = { description = 'view tag #', group = 'tag' }
        descr_toggle = { description = 'toggle tag #', group = 'tag' }
        descr_move = { description = 'move focused client to tag #', group = 'tag' }
        descr_toggle_focus = {
            description = 'toggle focused client on tag #',
            group = 'tag'
        }
    end
    keys.globalkeys = gtable.join(keys.globalkeys,

    awful.key({modkey}, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then tag:view_only() end
    end, descr_view),

    awful.key({modkey, 'Control'}, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then awful.tag.viewtoggle(tag) end
    end, descr_toggle),

    awful.key({modkey, 'Shift'}, '#' .. i + 9, function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then client.focus:move_to_tag(tag) end
        end
    end, descr_move),

    awful.key({modkey, 'Control', 'Shift'}, '#' .. i + 9, function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then client.focus:toggle_tag(tag) end
        end
    end, descr_toggle_focus))
end

root.keys(keys.globalkeys)
keys.clientbuttons = buttons
keys.clientkeys = clientkeys

return keys
