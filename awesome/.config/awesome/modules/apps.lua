local awful = require('awful')

default = {
        browser = 'luakit',
        editor = 'nvim',
        terminal = 'alacritty',
}

awful.util.terminal = default.terminal

return { default = default }
