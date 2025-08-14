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


-- Window navigation: cycle between Explorer, Editor, Terminal
local function cycle_windows()
  local api = vim.api
  local cur_win = api.nvim_get_current_win()
  -- gather window types: explorer(FileTree), terminal, others(editor)
  local wins = api.nvim_tabpage_list_wins(0)
  local order = {}
  for _, w in ipairs(wins) do
    local buf = api.nvim_win_get_buf(w)
    local ft = api.nvim_buf_get_option(buf, 'filetype')
    local bt = api.nvim_buf_get_option(buf, 'buftype')
    if ft == 'NvimTree' then
      table.insert(order, {win=w, kind='explorer'})
    elseif bt == 'terminal' then
      table.insert(order, {win=w, kind='terminal'})
    else
      table.insert(order, {win=w, kind='editor'})
    end
  end
  -- find current index in order
  local idx = 1
  for i, entry in ipairs(order) do
    if entry.win == cur_win then idx = i; break end
  end
  local next = order[(idx % #order) + 1]
  api.nvim_set_current_win(next.win)
end

vim.keymap.set('n', '<C-b>', cycle_windows, { desc = 'Cycle Explorer, Editor, Terminal' })
