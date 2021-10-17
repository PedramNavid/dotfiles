local defaults = {}
local editor = os.getenv("EDITOR") or "nvim"

-- Default Applications
defaults.terminal = "alacritty"
defaults.editor_cmd = defaults.terminal .. " -e " .. editor

-- Global Key Bindings
defaults.modkey = "Mod4"

return defaults
