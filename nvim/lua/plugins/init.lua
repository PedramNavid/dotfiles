local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd([[packadd packer.nvim]])

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
end)
