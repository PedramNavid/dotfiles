-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable nvim-cmp for the current buffer
vim.keymap.set("n", "<leader>uk", function()
  local ok, cmp = pcall(require, "cmp")
  if not ok then
    vim.notify("nvim-cmp is not available", vim.log.levels.WARN)
    return
  end
  cmp.setup.buffer({ enabled = false })
end, { desc = "Disable nvim-cmp (buffer)" })
