local menu = {}

local awful = require('awful')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup')
local menubar = require('menubar')

local apps = require('config.apps')

menu.menu = {
	{
		'hotkeys',
		function() hotkeys_popup.show_help(nil, awful.screen.focused()) end,
	},
	{ 'manual', apps.terminal .. ' -e man awesome' },
	{ 'edit config', apps.editor_cmd .. ' ' .. awesome.conffile },
	{ 'restart', awesome.restart },
	{
		'quit',
		function() awesome.quit() end,
	},
}

menu.mainmenu = awful.menu({
	items = {
		{ 'awesome', menu.menu, beautiful.awesome_icon },
		{ 'open terminal', apps.terminal },
	},
})

menubar.utils.terminal = apps.terminal -- Set the terminal for applications that require it

return menu
