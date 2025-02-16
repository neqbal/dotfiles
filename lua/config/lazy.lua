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

vim.g.mapleader = " "

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

    { 'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }},

    {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    	"neovim/nvim-lspconfig",
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
      'windwp/nvim-ts-autotag',
    },
    {
        "mfussenegger/nvim-jdtls",
    },
    -- debugger
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {'mfussenegger/nvim-dap',
                        -- https://github.com/nvim-neotest/nvim-nio
                        'nvim-neotest/nvim-nio',
                        -- https://github.com/theHamsta/nvim-dap-virtual-text
                        'theHamsta/nvim-dap-virtual-text', -- inline variable text while debugging
                        -- https://github.com/nvim-telescope/telescope-dap.nvim
                        'nvim-telescope/telescope-dap.nvim', -- telescope integration with dap
        }
    },

    {"hrsh7th/cmp-nvim-lsp"}, -- autocompletion

    {"hrsh7th/nvim-cmp"}, --additional autocompletion

    {"L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp", dependencies = {'saadparwaiz1/cmp_luasnip','rafamadriz/friendly-snippets'}}, --snippet engine
    --lsp configuration
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = {
      -- https://github.com/nvim-tree/nvim-web-devicons
      'nvim-tree/nvim-web-devicons', -- Fancy icon support
      }
    },
    --color scheme 
    {'rebelot/kanagawa.nvim'},
    --{"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {},}
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "rose-pine/neovim", name = "rose-pine" }
}

require("lazy").setup(plugins, {})
