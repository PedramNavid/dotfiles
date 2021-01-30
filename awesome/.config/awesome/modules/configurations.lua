local layouts = require('modules.layouts')

local chosen_theme = 'pedram'
local tag_names = {'browse', 'term', 'read', 'music', 'misc', 'misc2'}

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
