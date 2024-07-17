--  See `:help vim.keymap.set()`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.jump { count = -1 }, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.jump { count = 1 }, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Rebind arrow keys to move through windows
vim.keymap.set('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('t', '<C-Left>', '<C-\\><C-n><C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('t', '<C-Right>', '<C-\\><C-n><C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('t', '<C-Down>', '<C-\\><C-n><C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<C-Up>', '<C-\\><C-n><C-w><C-k>', { desc = 'Move focus to the upper window' })

--
-- NOTE: [[ Custom Bindings Start here ]]
--

local norm_map = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

-- Paste from 0 buffer (i.e. the recently yanked from)
vim.keymap.set('n', '<leader>p', '"0p', { desc = '[P]aste infront from 0 buffer' })
vim.keymap.set('n', '<leader>P', '"0P', { desc = '[P]aste behind from 0 buffer' })

-- Various Delete to null buffer
vim.keymap.set('n', '<leader>dd', '"_dd', { desc = '[D]elete line to null buffer' })
vim.keymap.set('n', '<leader>diw', '"_diw', { desc = '[Diw] to null buffer' })
vim.keymap.set('n', '<leader>daw', '"_daw', { desc = '[Daw] to null buffer' })
vim.keymap.set('n', '<leader>d$', '"_d$', { desc = '[D$] to null buffer' })

-- Open terminal/run
local run_proj = function()
  local file_in_buffer = vim.fn.expand '%'
  local extension = string.gmatch(file_in_buffer, '([^.]+)$')()
  local what_to_do = '# file extension behaviour not set'

  if extension == 'rs' then
    what_to_do = 'cargo run'
  elseif extension == 'py' then
    what_to_do = 'python3 ' .. file_in_buffer
  end

  return '<c-w>v:term<cr>i' .. what_to_do .. '<cr>'
end

vim.keymap.set('n', '<leader>tv', '<c-w>v:term<cr>i', { desc = 'Open [T]erminal in [V]ertical split with insert' })
vim.keymap.set('n', '<leader>ts', '<c-w>s:term<cr>i', { desc = 'Open [T]erminal in Horizontal [S]plit with insert' })
vim.keymap.set('n', '<leader>tr', run_proj(), { desc = 'Open [T]erminal and try run project' })

-- Open Neotree
vim.keymap.set('n', '<leader>T', ':Neotree<cr>', { desc = 'Open/switch to Neo[T]ree' })

-- If windows add option to run idle based on the run idle batch file
-- which must exist to work
if vim.loop.os_uname().sysname == 'Windows_NT' then
  local run_idle_on_file = ':!' .. vim.fn.stdpath 'config' .. '\\run_idle.bat ' .. vim.fn.expand '%' .. '<CR>'
  vim.keymap.set('n', '<leader>i', run_idle_on_file, { desc = 'Run [I]DLE on current file' })
end
