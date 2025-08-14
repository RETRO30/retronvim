require("mason-lspconfig").setup({
  ensure_installed = { "gopls", "clangd", "pyright" },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config('gopls', {
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
    settings = {
        gopls = {
            analyses    = { unusedparams = true, unreachable = true },
            staticcheck = true,
        },
    },
})


vim.lsp.config('clangd', {
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 } 
})


vim.lsp.config('pyright', {
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
    settings = { python = { analysis = { typeCheckingMode = "basic" } } }, 
})
