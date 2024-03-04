local awful = require 'awful'
local widgets = require 'widgets'
awful.mouse.append_global_mousebindings {
  awful.button({}, 3, function() widgets.mainmenu:toggle() end),
  awful.button({}, 4, awful.tag.viewprev),
  awful.button({}, 5, awful.tag.viewnext),
}
