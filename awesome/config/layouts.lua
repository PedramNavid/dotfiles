local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local lain = require('lain')
local my_table = awful.util.table
local separators = lain.util.separators
local dpi   = require("beautiful.xresources").apply_dpi

local calendar_widget = require('awesome-wm-widgets.calendar-widget.calendar')
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')

local menu = require('config.menu')
local keys = require('config.keys')

local mylauncher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = menu.mainmenu
})

-- Custom Widgets
local pihealth = require('config.customwidgets.pihealth')
local purpleair_widget = require('config.customwidgets.purpleair')
local task = wibox.widget.imagebox(beautiful.widget_task)
local spr  = wibox.widget.textbox(' ')
local arrow = separators.arrow_left
local mpdicon = wibox.widget.imagebox(beautiful.widget_music)
local purpleicon = wibox.widget.imagebox(beautiful.widget_ac)
local markup = lain.util.markup
local memicon = wibox.widget.imagebox(beautiful.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. mem_now.used .. "MB "))
    end
})
local mpd_widget = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(beautiful.widget_music_on)
            widget:set_markup(markup.font(beautiful.font, markup("#111111", artist) .. " " .. title))
        elseif mpd_now.state == "pause" then
            widget:set_markup(markup.font(beautiful.font, " mpd paused "))
            mpdicon:set_image(beautiful.widget_music_pause)
        else
            widget:set_text("")
            mpdicon:set_image(beautiful.widget_music)
        end
    end
})
lain.widget.contrib.task.attach(task, {
    -- do not colorize output
    show_cmd = "task | sed -r 's/\\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g'"
})
task:buttons(my_table.join(awful.button({}, 1, lain.widget.contrib.task.prompt)))

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()
local calwidget = calendar_widget({
    placement = 'top_right',
    radius = 8
})

screen.connect_signal('request::desktop_decoration', function(s)
    local layout = awful.layout.suit
    awful.tag.add('web', {
        layout = layout.tile.right,
        screen = s,
        selected = true
    })

    awful.tag.add('term', {
        layout = layout.fair.horizontal,
        screen = s
    })

    awful.tag.add('code', {
        layout = layout.corner.ne,
        screen = s
    })
    awful.tag.add('other', {
        layout = layout.fair,
        screen = s
    })

    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox = awful.widget.layoutbox {
        screen = s,
        buttons = {
            awful.button({}, 1, function() awful.layout.inc(1) end),
            awful.button({}, 2, function() awful.layout.set(awful.layout.layouts[1]) end),
            awful.button({}, 3, function() awful.layout.inc(-1) end),
            awful.button({}, 4, function() awful.layout.inc(-1) end),
            awful.button({}, 5, function() awful.layout.inc(1) end)
        }
    }

    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({}, 1, function(t)
                t:view_only()
            end), awful.button({keys.modkey}, 1, function(t)
                if client.focus then client.focus:move_to_tag(t) end
            end), awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({keys.modkey}, 3, function(t)
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
                c:activate{
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
        }
    }

    -- @DOC_WIBAR@
    -- Create the wibox
    s.mywibox = awful.wibar {
        position = 'top',
        screen = s,
        -- @DOC_SETUP_WIDGETS@
        widget = {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                s.mytaglist,
                s.mypromptbox,
                spr
            },
            s.mytasklist, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,

                wibox.widget.systray(),
                arrow(beautiful.bg_normal, "#343434"),

                wibox.container.background(
                    wibox.container.margin(
                        wibox.widget { purpleicon, purpleair_widget, layout = wibox.layout.align.horizontal },
                    dpi(4), dpi(7)), "#343434"),
                arrow("#343434", beautiful.muted_purple),

                wibox.container.background(
                    wibox.container.margin(
                        wibox.widget { mpdicon, mpd_widget, layout=wibox.layout.align.horizontal },
                    dpi(3), dpi(6)), beautiful.muted_purple),
                arrow(beautiful.muted_purple, beautiful.yellow),

                wibox.container.background(
                    wibox.container.margin(
                        wibox.widget { memicon, mem.widget, layout = wibox.layout.align.horizontal },
                    dpi(2), dpi(3)), beautiful.yellow),
                arrow(beautiful.yellow, beautiful.peach),

                wibox.container.background(
                    wibox.container.margin(mytextclock,
                        dpi(3), dpi(6)), beautiful.peach),
                s.mylayoutbox
            }
        }
    }
end)

mytextclock:connect_signal('button::press', function(_, _, _, button)
    if button == 1 then calwidget.toggle() end
end)
-- }}}
