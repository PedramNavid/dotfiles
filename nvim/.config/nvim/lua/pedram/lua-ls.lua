local system_name

local lua_ls = {}

if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
lua_ls.sumneko_root_path = ''
if system_name == "Linux" then
    lua_ls.sumneko_root_path '/home/pedram/projects/lua-langauge-server'
else
    lua_ls.sumneko_root_path = '/Users/pedram/projects/lua-language-server'
end

lua_ls.sumneko_binary = lua_ls.sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

lua_ls.runtime_path = vim.split(package.path, ';')
table.insert(lua_ls.runtime_path, "lua/?.lua")
table.insert(lua_ls.runtime_path, "lua/?/init.lua")

return lua_ls
