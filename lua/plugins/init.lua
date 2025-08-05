-- plugins/init.lua
require("lazy").setup({

  -- manager
  { "folke/lazy.nvim", version = "*" },
  
  -- mason
  { "williamboman/mason.nvim",          
    build = ":MasonUpdate",             
    cmd   = "Mason",
    lazy  = false,
    config = function() require("plugins.mason") end,
  },

  { "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    lazy   = false,
    config = function() require("plugins.mason-lspconfig") end,
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function() require("plugins.telescope") end,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPre",
    config = function() require("plugins.treesitter") end,
  },

  -- theme
  {
    "projekt0n/github-nvim-theme",
    config = function() require("plugins.github-theme") end,
  },
  

  -- explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<C-e>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
    },
    config = function()
      require("plugins.nvim-tree")
    end,
  },
})

