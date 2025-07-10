vim.g.mapleader = " "
require("config.lazy")
require("core.keymaps")

-- Function to toggle relative line numbers in normal mode
local function set_relative_line_numbers()
	vim.opt.relativenumber = true
end
-- Function to disable relative line numbers in insert mode
local function disable_relative_line_numbers()
	vim.opt.relativenumber = false
end
-- Set up autocommands for mode change
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	callback = disable_relative_line_numbers,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = set_relative_line_numbers,
})
-- Make sure relative number is enabled when starting in normal mode
if vim.fn.mode() == "n" then
	vim.opt.number = true
	set_relative_line_numbers()
end

local opt = vim.opt
-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 4

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

--keep cursor centered
opt.scrolloff = 999
opt.sidescrolloff = 8

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showmode = false
vim.diagnostic.config({
	float = { border = "rounded" }, -- add border to diagnostic popups
})

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- enable mouse mode
vim.o.mouse = "a"
