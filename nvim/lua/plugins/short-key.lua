return {
	"tpope/vim-commentary",
	"lfv89/vim-interestingwords",
	"tpope/vim-surround",
	"easymotion/vim-easymotion",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	{
		'ojroques/nvim-osc52',
		config = function()
			require('osc52').setup {
				max_length = 0,     -- Maximum length of selection (0 for no limit)
				silent = false,     -- Disable message on successful copy
				trim = false,       -- Trim surrounding whitespaces before copy
				tmux_passthrough = true, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
			}
			vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
		end
	}
}
