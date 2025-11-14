vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use "folke/tokyonight.nvim"

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')

	-- harpoon
	use('nvim-lua/plenary.nvim')
	use('ThePrimeagen/harpoon')
	-- Not harpoon anymore

	use('mbbill/undotree')

	use('tpope/vim-fugitive')

    use {
      "kiyoon/jupynium.nvim",
      run = ":UpdateRemotePlugins",
      requires = {
        "benlubas/molten-nvim",  -- for inline result rendering (optional but awesome)
      },
      config = function()
        -- Basic setup for jupyter-nvim
        vim.g.jupyter_server_command = { "jupyter", "console", "--simple-prompt" }

        -- Keybindings (example)
      end
    }

end)

