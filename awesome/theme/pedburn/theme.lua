-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------
local themes_path = require('gears.filesystem').get_themes_dir()
local rnotification = require('ruled.notification')
local dpi = require('beautiful.xresources').apply_dpi
local gfs = require('gears.filesystem')

-- {{{ Main
local theme = {}
local wallpath = '/home/pedram/wallpaper'
theme.wallpaper = gfs.get_random_file_from_dir(wallpath, {'jpg'}, true)
-- }}

-- {{ Color Theme

local black = '#001219'
local black_blue = '#041833'
local blue_sapphire = '#005f73'
local middle_green = '#2699A6'
local yellow = '#F2D57E'
local peach = '#F28D8D'
local muted_purple = '#BF6396'
local purple = '#A6038B'
local marron = '#59024B'
-- }}

-- {{{ Styles
theme.font = 'Play 10'

-- {{{ Colors
theme.fg_normal = middle_green
theme.fg_focus = yellow
theme.fg_urgent = yellow
theme.bg_normal = black
theme.bg_focus = black_blue
theme.bg_urgent = black
theme.bg_systray = black
-- }}}

-- {{{ Borders
theme.useless_gap = dpi(4)
theme.border_width = dpi(3)
theme.border_color_normal = blue_sapphire
theme.border_color_active = middle_green
theme.border_color_marked = purple
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus = black
theme.titlebar_bg_normal = black
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
-- theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
 theme.stack1 = blue_sapphire
 theme.stack2 = middle_green
 theme.stack3 = yellow
 theme.stack4 = peach
 theme.stack5 =  muted_purple
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = peach;
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(20)
theme.menu_width = dpi(100)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel = themes_path .. 'zenburn/taglist/squarefz.png'
theme.taglist_squares_unsel = themes_path .. 'zenburn/taglist/squarez.png'
-- theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon = themes_path .. 'zenburn/awesome-icon.png'
theme.menu_submenu_icon = themes_path .. 'default/submenu.png'
-- }}}

-- {{{ Layout
theme.layout_tile = themes_path .. 'zenburn/layouts/tile.png'
theme.layout_tileleft = themes_path .. 'zenburn/layouts/tileleft.png'
theme.layout_tilebottom = themes_path .. 'zenburn/layouts/tilebottom.png'
theme.layout_tiletop = themes_path .. 'zenburn/layouts/tiletop.png'
theme.layout_fairv = themes_path .. 'zenburn/layouts/fairv.png'
theme.layout_fairh = themes_path .. 'zenburn/layouts/fairh.png'
theme.layout_spiral = themes_path .. 'zenburn/layouts/spiral.png'
theme.layout_dwindle = themes_path .. 'zenburn/layouts/dwindle.png'
theme.layout_max = themes_path .. 'zenburn/layouts/max.png'
theme.layout_fullscreen = themes_path .. 'zenburn/layouts/fullscreen.png'
theme.layout_magnifier = themes_path .. 'zenburn/layouts/magnifier.png'
theme.layout_floating = themes_path .. 'zenburn/layouts/floating.png'
theme.layout_cornernw = themes_path .. 'zenburn/layouts/cornernw.png'
theme.layout_cornerne = themes_path .. 'zenburn/layouts/cornerne.png'
theme.layout_cornersw = themes_path .. 'zenburn/layouts/cornersw.png'
theme.layout_cornerse = themes_path .. 'zenburn/layouts/cornerse.png'
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus = themes_path ..
                                        'zenburn/titlebar/close_focus.png'
theme.titlebar_close_button_normal = themes_path ..
                                         'zenburn/titlebar/close_normal.png'

theme.titlebar_minimize_button_normal = themes_path ..
                                            'default/titlebar/minimize_normal.png'
theme.titlebar_minimize_button_focus = themes_path ..
                                           'default/titlebar/minimize_focus.png'

theme.titlebar_ontop_button_focus_active = themes_path ..
                                               'zenburn/titlebar/ontop_focus_active.png'
theme.titlebar_ontop_button_normal_active = themes_path ..
                                                'zenburn/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_inactive = themes_path ..
                                                 'zenburn/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_inactive = themes_path ..
                                                  'zenburn/titlebar/ontop_normal_inactive.png'

theme.titlebar_sticky_button_focus_active = themes_path ..
                                                'zenburn/titlebar/sticky_focus_active.png'
theme.titlebar_sticky_button_normal_active = themes_path ..
                                                 'zenburn/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_inactive = themes_path ..
                                                  'zenburn/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_inactive = themes_path ..
                                                   'zenburn/titlebar/sticky_normal_inactive.png'

theme.titlebar_floating_button_focus_active = themes_path ..
                                                  'zenburn/titlebar/floating_focus_active.png'
theme.titlebar_floating_button_normal_active = themes_path ..
                                                   'zenburn/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_inactive = themes_path ..
                                                    'zenburn/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_inactive = themes_path ..
                                                     'zenburn/titlebar/floating_normal_inactive.png'

theme.titlebar_maximized_button_focus_active = themes_path ..
                                                   'zenburn/titlebar/maximized_focus_active.png'
theme.titlebar_maximized_button_normal_active = themes_path ..
                                                    'zenburn/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_inactive = themes_path ..
                                                     'zenburn/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_inactive = themes_path ..
                                                      'zenburn/titlebar/maximized_normal_inactive.png'
-- }}}
-- }}}

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
