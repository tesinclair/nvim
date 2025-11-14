vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>jf', vim.cmd.Ex)

-- harpoon
vim.keymap.set('n', '<leader>hm', function()
    require("harpoon.ui").toggle_quick_menu()
end)

vim.keymap.set('n', '<leader>hj', function()
    require("harpoon.ui").nav_next()
end)

vim.keymap.set('n', '<leader>hg', function()
    require("harpoon.ui").nav_prev()
end)

vim.keymap.set('n', '<leader>ha', function()
    require("harpoon.mark").add_file()
end)

-- Move cursor to end of file
vim.keymap.set('n', '<leader>e', ':$<CR>')

-- jupyter
vim.keymap.set("n", "<leader>jhc", "<cmd>JupyniumStartAndAttachToServer<CR>", { desc = "Start Jupyter server" })
vim.keymap.set("n", "<leader>jhr", "<cmd>JupyniumExecuteSelectedCells<CR>", { desc = "Run selected cells" })
vim.keymap.set("n", "<leader>jha", "<cmd>JupyniumExecuteAllCells<CR>", { desc = "Run all cells" })
-- Fixing y and C-c and d
vim.keymap.set('v', 'y', '"+y');
vim.keymap.set('n', 'yy', '"+yy');

-- Undotree

vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

vim.keymap.set('n', 'n', 'nzzzv')

vim.keymap.set('n', 'Q', '<nop>')

-- My Keymaps
-- DELETE file from current position (for work)
vim.keymap.set('n', '<leader>df', 'VGd')

-- Make quick code runner
vim.keymap.set('n', '<leader>r', ':lua run_code()<CR>', {noremap = true})

-- DELETE ALL the text in the current file
vim.keymap.set('n', '<leader>da', ':%d<CR>')

-- Copy whole file into "+
vim.keymap.set('n', '<leader>ca', 'ggVG"+y<Esc>')

-- Making :w and :wq easier
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':wq<CR>')
vim.keymap.set('n', '<leader>qq', ':q<CR>')

-- u as undo really messes me up (it is way too close to p and i)
vim.keymap.set('n', 'u', '<nop>')
vim.keymap.set('n', '<leader>u', ':u<CR>')

-- exit to current dir if opened with vi
vim.keymap.set('n', '<leader>cd', ':lua exit_current_dir()<CR>')

-- Change normal mode to hjkl because your hand is already there
-- if you want to start normal mode
-- ESC still works
vim.keymap.set('v', 'hjkl', '<Esc>')
vim.keymap.set('i', 'hjkl', '<Esc>')

-- New line in normal mode -- do not preseve comments
vim.keymap.set('n', '<leader>o', 'o<Esc>0<S-D>')

-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
-- list available buffers
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
-- search for the word under the cursor
vim.keymap.set('n', '<leader>fw', ':Telescope grep_string<CR>')
