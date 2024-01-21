local themes_path = require('gears.filesystem').get_themes_dir()
local rnotification = require('ruled.notification')
local dpi = require('beautiful.xresources').apply_dpi

-- {{{ Main
local theme = {}
theme.wallpaper = '/home/pedram/wallpapers/nord-forest.png'
theme.lain_icons = os.getenv('HOME') .. '/.config/awesome/lain/icons/layout/zenburn/'
theme.widgets_icons = os.getenv('HOME') .. '/.config/awesome/awesome-wm-widgets/'
theme.volume_icon = theme.widgets_icons .. 'volume-widget/icons/audio-volume-low-symbolic.svg'
theme.layout_termfair = theme.lain_icons .. 'termfair.png'
theme.layout_centerfair = theme.lain_icons .. 'centerfair.png'   -- termfair.center
theme.layout_cascade = theme.lain_icons .. 'cascade.png'
theme.layout_cascadetile = theme.lain_icons .. 'cascadetile.png' -- cascade.tile
theme.layout_centerwork = theme.lain_icons .. 'centerwork.png'
theme.layout_centerworkh = theme.lain_icons .. 'centerworkh.png' -- centerwork.horizontal
-- }}}

-- {{{ Styles

-- {{{ Colors

theme.font = 'Hack Nerd Font 11'

theme.nord0 = '#2E3440'
theme.nord1 = '#3B4252'
theme.nord2 = '#434C5E'
theme.nord3 = '#4C566A'
theme.nord4 = '#D8DEE9'
theme.nord5 = '#E5E9F0'
theme.nord6 = '#ECEFF4'
theme.nord7 = '#8FBCBB'
theme.nord8 = '#88C0D0'
theme.nord9 = '#81A1C1'
theme.nord10 = '#5E81AC'
theme.nord11 = '#BF616A'
theme.nord12 = '#D08770'
theme.nord13 = '#EBCB8B'
theme.nord14 = '#A3BE8C'
theme.nord15 = '#B48EAD'
theme.transparent = '#00000000'

theme.bg_normal = theme.nord0
theme.bg_focus = theme.bg_normal
theme.bg_urgent = theme.bg_normal
theme.bg_minimize = theme.bg_normal
theme.bg_systray = theme.bg_normal

theme.fg_normal = theme.nord4
theme.fg_focus = theme.fg_normal
theme.fg_urgent = theme.fg_normal
theme.fg_minimize = theme.fg_normal
theme.backround = theme.nord0
theme.hotkeys_fg = theme.fg_normal
theme.hotkeys_modifiers_fg = theme.nord9

-- }}}

-- {{{ Borders
theme.master_width_factor = 0.4
theme.bar_height = dpi(10)
theme.useless_gap = dpi(8)
theme.border_width = dpi(1)

theme.border_normal = theme.nord9
theme.border_marked = theme.nord11
theme.border_focus = theme.nord11
theme.border_radius = dpi(10)
-- }}}
--
-- {{{ Tasklist

theme.tasklist_plain_task_name = true
theme.tasklist_bg = theme.bg_normal
theme.tasklist_bg_focus = theme.nord11
theme.tasklist_bg_urgent = theme.nord12 .. '4D' -- 30% of transparency

-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus = theme.bg_normal
theme.titlebar_bg_normal = theme.nord0
-- }}}

-- {{{ Task/taglist
theme.taglist_fg_focus = theme.nord13
theme.taglist_fg_urgent = theme.nord11
theme.taglist_fg_occupied = theme.nord8
theme.taglist_fg_empty = theme.nord2
theme.taglist_fg_volatile = theme.nord2

-- }}}

-- {{{ Menu
theme.menu_height = dpi(30)
theme.menu_width = dpi(200)
-- }}}

--- {{{ Systray
theme.systray_icon_spacing = dpi(12)
--theme.systray_max_rows = 7
-- }}}
-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel = themes_path .. 'zenburn/taglist/squarefz.png'
theme.taglist_squares_unsel = themes_path .. 'zenburn/taglist/squarez.png'

theme.taglist_squares_resize = 'true'
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
theme.titlebar_close_button_focus = themes_path .. 'zenburn/titlebar/close_focus.png'
theme.titlebar_close_button_normal = themes_path .. 'zenburn/titlebar/close_normal.png'

theme.titlebar_minimize_button_normal = themes_path .. 'default/titlebar/minimize_normal.png'
theme.titlebar_minimize_button_focus = themes_path .. 'default/titlebar/minimize_focus.png'

theme.titlebar_ontop_button_focus_active = themes_path .. 'zenburn/titlebar/ontop_focus_active.png'
theme.titlebar_ontop_button_normal_active = themes_path .. 'zenburn/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_inactive = themes_path .. 'zenburn/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_inactive = themes_path .. 'zenburn/titlebar/ontop_normal_inactive.png'

theme.titlebar_sticky_button_focus_active = themes_path .. 'zenburn/titlebar/sticky_focus_active.png'
theme.titlebar_sticky_button_normal_active = themes_path .. 'zenburn/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_inactive = themes_path .. 'zenburn/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_inactive = themes_path .. 'zenburn/titlebar/sticky_normal_inactive.png'

theme.titlebar_floating_button_focus_active = themes_path .. 'zenburn/titlebar/floating_focus_active.png'
theme.titlebar_floating_button_normal_active = themes_path .. 'zenburn/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_inactive = themes_path .. 'zenburn/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_inactive = themes_path .. 'zenburn/titlebar/floating_normal_inactive.png'

theme.titlebar_maximized_button_focus_active = themes_path .. 'zenburn/titlebar/maximized_focus_active.png'
theme.titlebar_maximized_button_normal_active = themes_path .. 'zenburn/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_inactive = themes_path .. 'zenburn/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_inactive = themes_path .. 'zenburn/titlebar/maximized_normal_inactive.png'
-- }}}
-- }}}

-- Set different colors for urgent notifications.
rnotification.connect_signal(
    'request::rules',
    function()
        rnotification.append_rule({
            rule = { urgency = 'critical' },
            properties = { bg = '#ff0000', fg = '#ffffff' },
        })
    end
)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
