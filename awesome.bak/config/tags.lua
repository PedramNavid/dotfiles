local awful = require('awful')
local lain = require('lain')

tag.connect_signal(
	'request::default_layouts',
	function()
		awful.layout.append_default_layouts({
			awful.layout.suit.tile,
			awful.layout.suit.tile.left,
			awful.layout.suit.tile.top,
			lain.layout.termfair.center,
			lain.layout.centerwork,
			awful.layout.suit.max,
		})
	end
)
-- }}}
