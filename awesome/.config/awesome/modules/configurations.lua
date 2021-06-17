local awful = require('awful')
local layouts = require('modules.layouts')

local chosen_theme = 'pedram'

awful.util.tagnames = {
    "", -- 1
    "", -- 2
    "", -- 3
    "", -- 4
    "", -- 5
    ""  -- 6
}

local mylayouts = {
    layouts[1],  -- 1
    layouts[1],  -- 2
    layouts[1],  -- 3
    layouts[1],  -- 4
    layouts[1],  -- 5
    layouts[1],  -- 6
}

return {
    chosen_theme = chosen_theme,
    layouts = mylayouts
}
