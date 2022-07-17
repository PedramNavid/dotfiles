local defaults = {}
local editor = os.getenv('EDITOR') or 'nvim'

-- Default Applications
defaults.terminal = 'kitty'
defaults.editor_cmd = defaults.terminal .. ' -e ' .. editor
defaults.browser = 'google-chrome-stable'

-- Global Key Bindings
defaults.modkey = 'Mod4'

return defaults
