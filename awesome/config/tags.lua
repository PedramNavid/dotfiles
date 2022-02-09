local awful = require("awful")
-- local bling = require('bling')
-- {{{ Tag layout
tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
		awful.layout.suit.tile.left,
		awful.layout.suit.fair.horizontal,
		awful.layout.suit.max,
		awful.layout.suit.corner.ne,
	})
end)
-- }}}
