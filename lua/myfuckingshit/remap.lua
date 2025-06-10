vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>jf', vim.cmd.Ex)

-- harpoon
vim.keymap.set('n', '<leader>hm', function()
    require("harpoon.ui").toggle_quick_menu()
end)

vim.keymap.set('n', '<leader>hj', function()
    require("harpoon.ui").nav_next()
end)

vim.keymap.set('n', '<leader>hp', function()
    require("harpoon.ui").nav_prev()
end)

vim.keymap.set('n', '<leader>ha', function()
    require("harpoon.mark").add_file()
end)


-- Fixing y and C-c and d
vim.keymap.set('v', 'y', '"+y');
vim.keymap.set('n', 'yy', '0V$"+y<Esc>');

-- Undotree

vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

vim.keymap.set('n', 'n', 'nzzzv')

vim.keymap.set('n', 'Q', '<nop>')

-- My Keymaps
vim.keymap.set('n', '<leader>df', 'VGd')

-- Doesn't work very well
vim.keymap.set('n', '<leader>fa', 'ggVG=<C-o><Esc>')

-- Make quick code runner
vim.keymap.set('n', '<leader>r', ':lua run_code()<CR>', {noremap = true})

-- Delete all
vim.keymap.set('n', '<leader>da', ':%d<CR>')

-- Copy all into "+
vim.keymap.set('n', '<leader>ca', 'ggVG"+y<Esc>')

-- Making :w and :wq easier
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':wq<CR>')
vim.keymap.set('n', '<leader>qq', ':q<CR>')

-- u as undo really messes me up (it is way too close to p and i)
vim.keymap.set('n', 'u', '<nop>')
vim.keymap.set('n', '<leader>uu', ':u<CR>')

-- exit to current dir
vim.keymap.set('n', '<leader>cd', ':lua exit_current_dir()<CR>')

-- Change normal mode to hjkl because your hand is already there
-- if you want to start normal mode
vim.keymap.set('v', 'hjkl', '<Esc>')
vim.keymap.set('i', 'hjkl', '<Esc>')

vim.keymap.set('n', '<leader>o', 'o<Esc>')
