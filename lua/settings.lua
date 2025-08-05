--- settings.lua
local opt = vim.opt

-- Tabs and indentation
opt.tabstop = 4                -- width of a hard tabstop
opt.shiftwidth = 4             -- width for auto-indent
opt.expandtab = true           -- use spaces instead of tabs

-- Line numbering
opt.number = true              -- show absolute line numbers
opt.relativenumber = false     -- no relative numbers

-- Cursor
opt.cursorline = true          -- highlight the current cursor line
opt.scrolloff = 8              -- minimal lines to keep above/below cursor
opt.sidescrolloff = 8          -- minimal columns to keep at sides
-- Optional: customize cursor appearance (blinking, shape)
opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkwait700-blinkoff400-blinkon250",
}

