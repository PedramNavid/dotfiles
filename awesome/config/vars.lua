local _M = {}

local awful = require 'awful'
local lain = require 'lain'

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
  lain.layout.centerwork,
  lain.layout.termfair,
  lain.layout.termfair.center,
}
local l = awful.layout.suit
local ll = lain.layout
_M.tags = { 'main', 'code', 'web', 'chat', 'notes', 'media' }
_M.tag_layouts = { ll.centerwork, ll.termfair.center, l.tile, l.tile, ll.centerwork, l.tile }

return _M
