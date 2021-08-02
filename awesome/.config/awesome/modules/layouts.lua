local awful = require('awful')
local lain = require('lain')
local dpi = require('beautiful.xresources').apply_dpi

lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 1
lain.layout.termfair.center.nmaster = 3
lain.layout.termfair.center.ncol = 1
lain.layout.cascade.tile.offset_x = dpi(2)
lain.layout.cascade.tile.offset_y = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster = 5
lain.layout.cascade.tile.ncol = 2

return {
    awful.layout.suit.tile, -- 1
    awful.layout.suit.tile.left, -- 2
    awful.layout.suit.tile.bottom, -- 3
    awful.layout.suit.tile.top, -- 4
    awful.layout.suit.fair, -- 5
    awful.layout.suit.corner.nw, -- 6
    lain.layout.termfair, -- 7
    lain.layout.termfair.center -- 8
}
