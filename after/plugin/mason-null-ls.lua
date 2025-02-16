local null_ls = require("null-ls")

require("mason").setup()
require("mason-null-ls").setup({
    ensure_installed = { "pylint", "flake8", "eslint", "shellcheck", "luacheck" },
    automatic_installation = true,
})

null_ls.setup({
    sources = {
        -- Python Linters
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.flake8,

        -- Shell Linters
        null_ls.builtins.diagnostics.shellcheck,

        -- Lua Linters
        null_ls.builtins.diagnostics.luacheck,
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
