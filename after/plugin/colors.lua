-- assuming you added {'rebelot/kanagawa.nvim'} to your lazy.lua file for your colorscheme
-- ~/.config/nvim/after/plugin/colors.lua
-- Default options:
require("kanagawa").setup({
    transparent = true,
    theme = "wave",
})
--vim.o.background = 'dark'
vim.cmd("colorscheme kanagawa")
