require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    auto_install = true, -- automatically install syntax support when entering new file type buffer
}
