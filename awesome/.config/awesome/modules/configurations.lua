local awful = require('awful')
local layouts = require('modules.layouts')

local chosen_theme = 'pedram'

awful.util.tagnames = {
    "", -- 1
    "", -- 2
    "", -- 3
    "", -- 4
    "", -- 5
    "", -- 6
    ""  -- 7
}

local mylayouts = {
    layouts[2],  -- 1
    layouts[2],  -- 2
    layouts[1],  -- 3
    layouts[1],  -- 4
    layouts[8],  -- 5
    layouts[7],  -- 6
    layouts[8]   -- 7
}

return {
    chosen_theme = chosen_theme,
    layouts = mylayouts
}
