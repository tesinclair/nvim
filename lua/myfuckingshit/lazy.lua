require("lazy").setup({
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Theme: Tokyo Night
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- Optional: Load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                -- Your treesitter config here
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },

                -- Playground config goes here now
                playground = {
                    enable = true,
                    disable = {},
                    updatetime = 25,
                    persist_queries = false,
                },
            })
        end
    }, 

    -- Harpoon (Explicit dependency on plenary is usually handled by lazy automatically, but safe to keep)
    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Undotree
    'mbbill/undotree',

    -- Fugitive
    'tpope/vim-fugitive',

    -- Jupynium
    {
        "kiyoon/jupynium.nvim",
        build = ":UpdateRemotePlugins", -- In lazy, 'run' is renamed to 'build'
        dependencies = {
            "benlubas/molten-nvim",
        },
        config = function()
            -- Basic setup for jupyter-nvim
            vim.g.jupyter_server_command = { "jupyter", "console", "--simple-prompt" }
            -- You can add keybindings here
        end
    }
})
