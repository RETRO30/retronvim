require("mason-lspconfig").setup({
  ensure_installed = { "gopls", "clangd", "pyright" },
})

vim.lsp.config('gopls', {
  flags = { debounce_text_changes = 150 },
  settings = {
    gopls = {
      analyses    = { unusedparams = true, unreachable = true },
      staticcheck = true,
    },
  },
})


vim.lsp.config('clangd', {
  flags = { debounce_text_changes = 150 } 
})


vim.lsp.config('pyright', {
  flags = { debounce_text_changes = 150 },
  settings = { python = { analysis = { typeCheckingMode = "basic" } } }, 
})
