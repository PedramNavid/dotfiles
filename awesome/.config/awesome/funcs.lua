local awful = require('awful')

_M = {}

function _M.run_once(cmd_arr)
  for _, cmd in ipairs(cmd_arr) do
    awful.spawn.with_shell(string.format(
                               "pgrep -u $USER -fx '%s' > /dev/null || (%s)",
                               cmd, cmd))
  end
end

return _M
