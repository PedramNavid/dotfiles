-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use("folke/neodev.nvim")
    use({
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup({})
        end,
    })
    use("folke/zen-mode.nvim")
    use("github/copilot.vim")
    use("jose-elias-alvarez/null-ls.nvim")
    use("lewis6991/gitsigns.nvim")
    use("mbbill/undotree")
    use("milisims/nvim-luaref")
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { { "nvim-lua/plenary.nvim" } } })

    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    use({
        "shaunsingh/nord.nvim",
        config = function()
            vim.cmd("colorscheme nord")
        end,
    })

    use("simrat39/rust-tools.nvim")
    use("simrat39/symbols-outline.nvim")

    use("nvim-lualine/lualine.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("rust-lang/rust.vim")
    use("thalesmello/lkml.vim")
    use("theprimeagen/harpoon")
    use("tpope/vim-fugitive")
    use("tpope/vim-unimpaired")
    use("vimwiki/vimwiki")

    use({ "~/projects/dbtpal", requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" } } })

    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {
                -- Optional
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" }, -- Required
        },
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
