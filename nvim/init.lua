P = function(...)
  local args = {}
  for _, arg in ipairs { ... } do
    table.insert(args, vim.inspect(arg))
  end
  print(unpack(args))
  return ...
end
require 'pedram'
print 'loaded'
