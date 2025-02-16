local opts = {
    actions = {
        open_file = {
            window_picker = {
            enable = false
            },
        }
    },

    git = {
        enable = true,
        ignore = false, -- Show untracked files
    }
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup(opts)
