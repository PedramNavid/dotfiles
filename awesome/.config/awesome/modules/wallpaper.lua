local awful = require("awful")

local mywallpaper = class()

local function set_wallpaper(s)
    awful.spawn.with_shell("nitrogen --set-zoom-fill --random ~/wallpaper")
end

function mywallpaper:init(s)
    set_wallpaper(s)
    screen.connect_signal("property::geometery", set_wallpaper)
end

return mywallpaper
