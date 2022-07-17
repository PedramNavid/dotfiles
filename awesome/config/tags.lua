local awful = require('awful')
-- {{{ Tag layout
tag.connect_signal('request::default_layouts', function()
    awful.layout.append_default_layouts({
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
    })
end)
-- }}}
