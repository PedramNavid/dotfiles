local _M = {
  terminal = os.getenv 'TERMINAL' or 'alacritty',
  editor = os.getenv 'EDITOR' or 'vim',
  browser = 'firefox',
  screenshot = "scrot -e 'mv $f ~/screenshots/ 2>/dev/null'",
}

_M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor
_M.manual_cmd = _M.terminal .. ' -e man awesome'

return _M
