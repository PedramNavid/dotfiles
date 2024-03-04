local o = vim.opt

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.undofile = true

o.clipboard = 'unnamedplus'
o.cmdheight = 2

o.hlsearch = true
o.number = true
o.relativenumber = true

o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'

o.termguicolors = true

o.mouse = 'a'
o.showmode = false
o.breakindent = true

o.ignorecase = true
o.smartcase = true

o.signcolumn = 'yes'

o.updatetime = 250
o.timeoutlen = 300

o.splitright = true
o.splitbelow = true

o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

o.inccommand = 'split'
o.cursorline = true
o.scrolloff = 5
