local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
<<<<<<< Updated upstream
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
=======
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
>>>>>>> Stashed changes
    })
end

vim.cmd [[packadd packer.nvim]]

<<<<<<< Updated upstream
return require('packer').startup(function()

    use 'Mofiqul/dracula.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'rafamadriz/friendly-snippets'
    use 'tpope/vim-unimpaired'
    use 'wbthomason/packer.nvim'
    use 'thalesmello/lkml.vim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
=======
return require("packer").startup(function()
    use("Mofiqul/dracula.nvim")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/vim-vsnip")
    use("jose-elias-alvarez/null-ls.nvim")
    use("jose-elias-alvarez/nvim-lsp-ts-utils")
    use("kyazdani42/nvim-web-devicons")
    use("neovim/nvim-lspconfig")
    use("norcalli/nvim-colorizer.lua")
    use("rafamadriz/friendly-snippets")
    use("rust-lang/rust.vim")
    use("simrat39/rust-tools.nvim")
    use("tpope/vim-unimpaired")
    use("wbthomason/packer.nvim")
    use("mfussenegger/nvim-dap")
    use("windwp/nvim-autopairs")

    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
>>>>>>> Stashed changes
end)
