--[[

     Blackburn Awesome WM theme 3.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi


local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local config = require('modules.configurations')

local theme                                     = {}
theme.docker_widget = require("awesome-wm-widgets.docker-widget.docker")
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/blackburn"
-- theme.wallpaper                                 = theme.dir .. "/wall.png"
theme.font                                      = "Hack Nerd Font 10"
theme.taglist_font                              = "FontAwesome 14"


theme.bg_focus                                  = x.color8
theme.bg_normal                                 = x.color0
theme.bg_urgent                                 = x.color8
theme.fg_focus                                  = x.color4
theme.fg_normal                                 = x.color8
theme.fg_urgent                                 = x.color9


theme.border_width                              = dpi(2)
theme.border_normal                             = x.background
theme.border_focus                              = x.background
theme.taglist_fg_focus                          = x.foreground
theme.taglist_bg_focus                          = x.background
theme.tasklist_fg_focus                         = x.color11
theme.tasklist_bg_focus                         = x.color0
theme.menu_height                               = dpi(11)
theme.menu_width                                = dpi(100)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 3
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

-- browser, terminal, read, music, misc, misc2
local markup     = lain.util.markup
local separators = lain.util.separators
local gray       = x.color8

-- Textclock
local mytextclock = wibox.widget.textclock(markup(x.color2, "%m-%d %H:%M "))
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = theme.font,
        fg   = x.color2,
        bg   = theme.bg_normal
    }
})

-- MPD
theme.mpd = lain.widget.mpd({
    settings = function()
        mpd_notification_preset.fg = x.foreground
        artist = mpd_now.artist .. " "
        title  = mpd_now.title  .. " "

        if mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        elseif mpd_now.state == "stop" then
            artist = ""
            title  = ""
        end

        widget:set_markup(markup.font(theme.font, markup(x.color2, artist .. title .. " ")))
    end
})

---{{{ fs
theme.fs = lain.widget.fs({
    notification_preset = { fg = x.color2, bg = theme.bg_normal, font = "Terminus 10.5" },
    settings  = function()
        local fs_header = "..."
        local fs_p      = ""

        local fs_header = "/:"
        local fs_p      = fs_now["/"].percentage

        widget:set_markup(markup.font(theme.font, markup(x.color2, fs_header .. fs_p .. '%')))
    end
})
---}}}

-- ALSA volume
theme.volume = lain.widget.alsa({
    --togglechannel = "IEC958,3",
    settings = function()
        header = " Vol "
        vlevel  = volume_now.level

        if volume_now.status == "off" then
            vlevel = vlevel .. "M "
        else
            vlevel = vlevel .. " "
        end

        widget:set_markup(markup.font(theme.font, markup(x.color2, header .. vlevel)))
    end
})

-- Weather
theme.weather = lain.widget.weather({
    city_id = 5347322, -- placeholder (London)
    units = "imperial",
    settings = function()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.font(theme.font, markup(x.color2, " " .. units .. " ")))
    end
})

-- Separators
local first     = wibox.widget.textbox('<span font="Terminus 4"> </span>')
local arrl_pre  = separators.arrow_right("alpha", x.color14)
local arrl_post = separators.arrow_right(x.color14, "alpha")

local barheight = dpi(18)
local barcolor  = gears.color({
    type  = "linear",
    from  = { barheight, 0 },
    to    = { barheight, barheight },
    stops = { {0, theme.bg_focus }, {0.8, theme.border_normal}, {1, x.background} }
})
theme.titlebar_bg = barcolor

theme.titlebar_bg_focus = gears.color({
    type  = "linear",
    from  = { barheight, 0 },
    to    = { barheight, barheight },
    stops = { {0, theme.bg_normal}, {0.5, theme.border_normal}, {1, x.color4} }
})

function theme.at_screen_connect(s)
    s.quake = lain.util.quake({ app = awful.util.terminal })

    awful.tag(awful.util.tagnames, s, config.layouts)

    s.mypromptbox = awful.widget.prompt()
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags,
        awful.util.tasklist_buttons, { bg_normal = barcolor, bg_focus = barcolor })

    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(24), bg = barcolor })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            first,
            s.mytaglist,
            arrl_pre,
            arrl_post,
            s.mypromptbox,
            first,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            first,
            theme.docker_widget() {
                number_of_containers = 5
            },
            theme.mpd.widget,
            theme.weather.icon,
            theme.weather.widget,
            theme.fs.widget,
            theme.volume.widget,
            mytextclock,
            s.mylayoutbox,
        },
    }
end

return theme
