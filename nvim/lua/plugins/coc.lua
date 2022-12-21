local add_cmd = vim.api.nvim_create_user_command

vim.g.coc_global_extensions = { 'coc-json',
    'coc-git',
    'coc-sumneko-lua',
    'coc-pyright',
    'coc-yaml',
    'coc-vetur' }

-- Completion
vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })

vim.cmd [[
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]]
vim.cmd [[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

]]

-- Diagnostics
vim.api.nvim_set_keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.api.nvim_set_keymap("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- Go To Code Nav
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", { silent = true })
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Documentation
vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", { silent = true, noremap = true })

-- Renaming
vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})

-- Code Actions
vim.api.nvim_set_keymap("n", "<leader>.", "<Plug>(coc-codeaction)", {})
vim.api.nvim_set_keymap("n", "<leader>ac", "v<Plug>(coc-codeaction-selected)", {})
vim.api.nvim_set_keymap("n", "<leader>qf", "<Plug>(coc-fix-current)", {})


-- Commands
add_cmd('Format', ':call CocActionAsync("format")', { nargs = 0 })
add_cmd('Fold', ':call CocAction("fold")', { nargs = 0 })
add_cmd('OR', ':call CocActionAsync("runCommand", "editor.action.organizeImport")', { nargs = 0 })
vim.api.nvim_set_keymap("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", { noremap = true })

-- vim.o.statusline = vim.o.statusline .. "=%{coc#status()}%{get(b:,'coc_current_function','')}"
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
