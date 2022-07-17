local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

    use 'Mofiqul/dracula.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'rafamadriz/friendly-snippets'
    use 'tpope/vim-unimpaired'
    use 'wbthomason/packer.nvim'
    use 'thalesmello/lkml.vim'
    use 'vimwiki/vimwiki'
    use { 'neoclide/coc.nvim', branch = 'release' }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
end)
