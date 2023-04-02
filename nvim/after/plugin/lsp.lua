local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  vim.keymap.set({ "n", "x" }, "<Leader>\\", function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end)
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  "pyright",
  "lua_ls",
  "vimls",
  "rust_analyzer",
})

require("lspconfig").pyright.setup({
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

lsp.format_on_save({
  servers = {
    ["lua_ls"] = { "null_ls" },
    ["rust_analyzer"] = { "rust" },
    ["pyright"] = { "python" },
    ["vimls"] = { "vim" },
  },
})

lsp.setup()

local nls = require("null-ls")
local b = nls.builtins

nls.setup({
  debug = true,
  sources = {
    b.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
    b.formatting.isort,
    b.formatting.black.with({
      command = "/Users/pedram/.pyenv/versions/neovim/bin/black",
    }),
  },
})
