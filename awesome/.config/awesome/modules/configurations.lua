local awful = require('awful')
local layouts = require('modules.layouts')

local chosen_theme = 'pedram'

awful.util.tagnames = {"", "", "", "", "", "", }

local mylayouts = {
    layouts[1],
    layouts[2],
    layouts[5],
    layouts[5],
    layouts[3],
    layouts[5]
}

return {
    chosen_theme = chosen_theme,
    tag_names = tag_names,
    layouts = mylayouts
}
