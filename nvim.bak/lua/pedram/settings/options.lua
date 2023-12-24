vim.opt.autoindent = false
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.colorcolumn = "80"
vim.opt.completeopt = "menu,menuone,noselect,preview,noinsert"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 3
vim.opt.foldmethod = "expr"
vim.opt.foldminlines = 2
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep --smart-case"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true
vim.opt.list = true
vim.opt.listchars = "tab:▸\\ ,trail:·"
vim.opt.mouse = "nv"
vim.opt.number = true
vim.opt.pumblend = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shortmess:append({ C = true })
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.updatetime = 50
vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.g.python3_host_prog = vim.fn.expand("$HOME/.pyenv/shims/python")

vim.cmd([[
try
    colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

]])

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
