-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------
local themes_path = require('gears.filesystem').get_themes_dir()
local config_dir = require('gears.filesystem').get_configuration_dir()
local rnotification = require('ruled.notification')
local dpi = require('beautiful.xresources').apply_dpi
local gfs = require('gears.filesystem')
local lain = require('lain')

local theme = {}
local theme_dir = os.getenv("HOME") .. "/.config/awesome/theme/pedburn"
local wallpath = '/home/pedram/wallpaper'
theme.wallpaper = gfs.get_random_file_from_dir(wallpath, {'jpg'}, true)

local black = '#001219'
local black_blue = '#041833'
local blue_sapphire = '#005f73'
local middle_green = '#2699A6'
local yellow = '#F2D57E'
local peach = '#F28D8D'
local muted_purple = '#BF6396'
local purple = '#A6038B'

theme.font = 'Terminus 9'

theme.fg_normal = black
theme.fg_focus = yellow
theme.fg_urgent = yellow
theme.bg_normal = black
theme.bg_focus = black_blue
theme.bg_urgent = black
theme.bg_systray = black

theme.useless_gap = dpi(4)
theme.border_width = dpi(3)
theme.border_color_normal = blue_sapphire
theme.border_color_active = middle_green
theme.border_color_marked = purple

theme.titlebar_bg_focus = black
theme.titlebar_bg_normal = black

theme.blue_sapphire= blue_sapphire
theme.middle_greeen = middle_green
theme.yellow= yellow
theme.peach = peach
theme.muted_purple= muted_purple
theme.black_blue = black_blue
theme.mouse_finder_color = peach;

theme.menu_height = dpi(30)
theme.menu_width = dpi(100)

theme.menu_submenu_icon                         = theme_dir .. '/icons/submenu.png'

theme.taglist_squares_sel                       = theme_dir .. '/icons/square_sel.png'
theme.taglist_squares_unsel                     = theme_dir..  '/icons/square_unsel.png'
theme.awesome_icon                              = theme_dir .. '/icons/awesome.png'

theme.layout_tile                               = theme_dir .. "/layouts/tile.png"
theme.layout_tileleft                           = theme_dir .. "/layouts/tileleft.png"
theme.layout_tilebottom                         = theme_dir .. "/layouts/tilebottom.png"
theme.layout_tiletop                            = theme_dir .. "/layouts/tiletop.png"
theme.layout_fairv                              = theme_dir .. "/layouts/fairv.png"
theme.layout_fairh                              = theme_dir .. "/layouts/fairh.png"
theme.layout_spiral                             = theme_dir .. "/layouts/spiral.png"
theme.layout_dwindle                            = theme_dir .. "/layouts/dwindle.png"
theme.layout_max                                = theme_dir .. "/layouts/max.png"
theme.layout_fullscreen                         = theme_dir .. "/layouts/fullscreen.png"
theme.layout_magnifier                          = theme_dir .. "/layouts/magnifier.png"
theme.layout_floating                           = theme_dir .. "/layouts/floating.png"
theme.layout_cornernw                           = theme_dir .. "/layouts/cornernw.png"
theme.layout_cornerne                           = theme_dir .. "/layouts/cornerne.png"
theme.layout_cornersw                           = theme_dir .. "/layouts/cornersw.png"
theme.layout_cornerse                           = theme_dir .. "/layouts/cornerse.png"

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 0
theme.titlebar_close_button_focus               = theme_dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme_dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme_dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme_dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme_dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme_dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme_dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme_dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme_dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme_dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme_dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme_dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme_dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme_dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme_dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme_dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme_dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme_dir .. "/icons/titlebar/maximized_normal_inactive.png"

theme.widget_ac                                 = theme_dir .. "/icons/ac.png"
theme.widget_battery                            = theme_dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme_dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme_dir .. "/icons/battery_empty.png"
theme.widget_brightness                         = theme_dir .. "/icons/brightness.png"
theme.widget_mem                                = theme_dir .. "/icons/mem.png"
theme.widget_cpu                                = theme_dir .. "/icons/cpu.png"
theme.widget_temp                               = theme_dir .. "/icons/temp.png"
theme.widget_net                                = theme_dir .. "/icons/net.png"
theme.widget_hdd                                = theme_dir .. "/icons/hdd.png"
theme.widget_music                              = theme_dir .. "/icons/note.png"
theme.widget_music_on                           = theme_dir .. "/icons/note_on.png"
theme.widget_music_pause                        = theme_dir .. "/icons/pause.png"
theme.widget_music_stop                         = theme_dir .. "/icons/stop.png"
theme.widget_vol                                = theme_dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme_dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme_dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme_dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme_dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme_dir .. "/icons/mail_on.png"
theme.widget_task                               = theme_dir .. "/icons/task.png"
theme.widget_scissors                           = theme_dir .. "/icons/scissors.png"

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule = {
            urgency = 'critical'
        },
        properties = {
            bg = '#ff0000',
            fg = '#ffffff'
        }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
