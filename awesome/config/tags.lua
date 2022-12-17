local awful = require('awful')
local lain = require('lain')
-- {{{ Tag layout
lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 3
tag.connect_signal('request::default_layouts', function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        lain.layout.termfair,
        lain.layout.termfair.center,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
    })
end)
-- }}}
