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
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = "master",
        opts = {
            -- Do NOT put "vim", "lua", "c", or "query" here for Nvim 0.11
            ensure_installed = { "javascript", "python" }, 
            
            -- This is the magic line. It tells the plugin: 
            -- "Do not install these, use the ones built into Neovim"
            ignore_install = { "vim", "lua", "c", "vimdoc", "query" },

            highlight = {
                enable = true,
                -- OPTIONAL: If it still crashes, uncomment the line below 
                -- to disable treesitter specifically for vim files.
                -- disable = { "vim" }, 
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
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
