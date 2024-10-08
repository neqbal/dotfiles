local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- the leader key is used in many keymaps, 

local plugins = {
    -- plugins go here
    "nvim-lua/plenary.nvim",
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"nvim-telescope/telescope.nvim", tag = '0.1.6', 
        requires = { {"nvim-lua/plenary.nvim"}}},
    {"ThePrimeagen/harpoon", branch = "harpoon2",
        dependencies = {"nvim-lua/plenary.nvim"}},
    {"mbbill/undotree"},
    {"tpope/vim-fugitive"},
    --lsp 
    {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
    	"neovim/nvim-lspconfig",
    },
    {"hrsh7th/cmp-nvim-lsp"}, -- autocompletion
    {"hrsh7th/nvim-cmp"}, --additional autocompletion

    --lsp configuration
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    --color scheme 
    {'rebelot/kanagawa.nvim'}, 
    --{"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {},}
    --{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}

require("lazy").setup(plugins, {})
