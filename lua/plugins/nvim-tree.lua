-- lua/plugins/nvim-tree.lua
local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
    mappings = {
      list = {
        { key = {"l", "<CR>", "o"}, cb = tree_cb("edit") },
        { key = "h",                cb = tree_cb("close_node") },
        { key = "v",                cb = tree_cb("vsplit") },
      },
    },
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
})

