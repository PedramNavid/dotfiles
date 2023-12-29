local _M = {}

local awful = require('awful')

_M.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.spiral,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.corner.nw,
}

_M.tags = { 'main', 'code', 'web', 'chat', 'media' }

return _M
