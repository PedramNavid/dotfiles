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
    awful.layout.suit.tile, -- 2
    awful.layout.suit.tile, -- 3
    awful.layout.suit.tile, -- 4
    awful.layout.suit.tile, -- 5
    awful.layout.suit.tile, -- 6
    awful.layout.suit.tile, -- 7
    awful.layout.suit.tile, -- 8
}
