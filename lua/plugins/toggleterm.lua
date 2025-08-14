require("toggleterm").setup({
    shell = "pwsh",
    size = 20,
    open_mapping = [[<c-t>]],
    shade_terminals = true,
    shading_factor = 2,
    direction = "horizontal", 
    float_opts = {
        border = "rounded",
    },
})
