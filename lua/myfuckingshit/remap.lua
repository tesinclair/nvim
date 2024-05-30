vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
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

-- Fugitive

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)


-- Std remaps
-- Heavily *borrowed* from the primeagen

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- My Keymaps
vim.keymap.set('n', '<leader>df', 'VGd')

-- Doesn't work very well
vim.keymap.set('n', '<leader>fa', 'ggVG=<C-o><Esc>')

-- Make quick code runner
vim.keymap.set('n', '<leader>r', ':lua run_code()<CR>', {noremap = true})

vim.keymap.set('n', '<leader>da', ':%d<CR>')

vim.keymap.set('n', '<leader>ca', 'ggVG"+y<Esc>')

-- Making :w and :wq easier
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':wq<CR>')

-- u as undo really messes me up (it is way too close to p and i)
vim.keymap.set('n', 'u', '<nop>')
vim.keymap.set('n', '<leader>uu', ':u<CR>')

-- exit to current dir
vim.keymap.set('n', '<leader>qc', ':lua exit_current_dir()<CR>')

