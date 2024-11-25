 require('config.lazy')
 require('core.keymaps')
-- Function to toggle relative line numbers in normal mode
local function set_relative_line_numbers()
    vim.opt.relativenumber = true
  end
  -- Function to disable relative line numbers in insert mode
  local function disable_relative_line_numbers()
    vim.opt.relativenumber = false
  end
  -- Set up autocommands for mode change
  vim.api.nvim_create_autocmd({"InsertEnter"}, {
    callback = disable_relative_line_numbers
  })
  vim.api.nvim_create_autocmd({"InsertLeave"}, {
    callback = set_relative_line_numbers
  })
  -- Make sure relative number is enabled when starting in normal mode
  if vim.fn.mode() == 'n' then
    vim.opt.number = true
    set_relative_line_numbers()
  end

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4
vim.o.scrolloff = 999


