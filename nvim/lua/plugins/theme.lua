return {
	-- {
	-- 	"Mofiqul/dracula.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd [[colorscheme dracula]]
	-- 		-- vim.cmd[[colorscheme dracula-soft]]
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd [[colorscheme tokyonight-moon]]
	-- 	end,
	-- },
	{
		"dracula/vim",
		lazy = false,  -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[
	    let g:dracula_colorterm = 0
			colorscheme dracula
		  hi Visual  ctermbg=gray " ctermfg=green guibg=gray guifg=green
		" hi Comment cterm=italic gui=italic ctermfg=248 guifg=#999999
		" hi ColorColumn guibg=#44475A
	  ]])
		end,
	},
	"mhinz/vim-startify",
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			-- Lua
			require('lualine').setup {
				-- options = {
				-- 	-- theme = 'tokyonight'
				-- 	-- theme = 'dracula-nvim'
				-- }
			}
		end
	},

	{
		"nvim-treesitter/nvim-treesitter", -- 语法高亮
		config = function()
			require 'nvim-treesitter.configs'.setup {
				-- 添加不同语言
				ensure_installed = { "vim", "vimdoc", "bash", "c", "cpp", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "markdown", "markdown_inline" }, -- one of "all" or a list of languages

				highlight = { enable = true },
				indent = { enable = true },

				-- 不同括号颜色区分
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				}
			}
		end,
	},
	"p00f/nvim-ts-rainbow",    -- 配合treesitter，不同括号颜色区分
	{
		"akinsho/bufferline.nvim", -- buffer分割线
		config = function()
			require("bufferline").setup()
			-- require("plugins.config.bufferline")
		end,
	},
	{
		'VonHeikemen/fine-cmdline.nvim',
		dependencies = { 'MunifTanjim/nui.nvim' },
		config = function()
			vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
			require('fine-cmdline').setup({
				cmdline = {
					enable_keymaps = true,
					smart_history = true,
					prompt = ': '
				},
				popup = {
					position = {
						row = '40%',
						col = '50%',
					},
					size = {
						width = '60%',
					},
					border = {
						style = 'rounded',
					},
					win_options = {
						winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
					},
				},
				hooks = {
					before_mount = function(input)
						-- code
					end,
					after_mount = function(input)
						-- make escape go to normal mode
					end,
					set_keymaps = function(imap, feedkeys)
						local fn = require('fine-cmdline').fn

						imap('<C-K>', fn.up_search_history)
						imap('<C-J>', fn.down_search_history)
						imap('<Up>', fn.previous_item)
						imap('<Down>', fn.next_item)
					end
				}
			})
		end
	},

}
