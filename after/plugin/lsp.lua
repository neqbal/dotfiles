require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'jdtls',
        'html',
        'pyright',
        'clangd',
    },
})

require('mason-tool-installer').setup({
      -- Install these linters, formatters, debuggers automatically
    ensure_installed = {
        'java-debug-adapter',
        'java-test',
        'black',
        'debugpy',
        'flake8',
        'isort',
        'mypy',
        'pylint',
    },
})

vim.api.nvim_command('MasonToolsInstall')

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

require('mason-lspconfig').setup_handlers({
    function(servername)
        if servername ~= 'jdtls' then
            lspconfig[servername].setup({
                on_attach = lsp_attach,
                capabilities = lsp_capabilities
            })
        end
    end
})
