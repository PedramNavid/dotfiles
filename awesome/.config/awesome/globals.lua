local _M = {}
local theme_no     = 11
local modkey       = "Mod4"
local altkey       = "Mod1"
local terminal     = "alacritty"
local cycle_prev   = true
local editor       = os.getenv("EDITOR") or "nvim"
local browser      = os.getenv("BROWSER") or "luakit"
local scrlocker    = "slock"


function _M.terminal() return terminal end
function _M.get_themes() 
  return {
    "blackburn",       -- 1
    "copland",         -- 2
    "dremora",         -- 3
    "holo",            -- 4
    "multicolor",      -- 5
    "powerarrow",      -- 6
    "powerarrow-dark", -- 7
    "rainbow",         -- 8
    "steamburn",       -- 9
    "vertex",          -- 10
    "pedram",          -- 11
  }
end

function _M.get_theme()
  return _M.get_themes()[theme_no]
end


return _M

