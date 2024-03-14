return {
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd [[colorscheme dracula]]
			-- vim.cmd[[colorscheme dracula-soft]]
		end,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd [[colorscheme tokyonight-moon]]
	-- 	end,
	-- },
	-- {
	-- 	"dracula/vim",
	-- 	lazy = false,  -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		vim.cmd([[
	--     let g:dracula_colorterm = 0
	-- 	colorscheme dracula
	-- 	hi Visual  ctermbg=gray ctermfg=green guibg=gray guifg=green
	-- 	hi Comment cterm=italic gui=italic ctermfg=248 guifg=#999999
	-- 	hi ColorColumn guibg=#44475A
	--   ]])
	-- 	end,
	-- },
	-- "mhinz/vim-startify",
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				-- config
			}
		end,
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			-- Lua
			require('lualine').setup {
				options = {
					-- theme = 'tokyonight'
					theme = 'dracula'
				}
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
	"p00f/nvim-ts-rainbow", -- 配合treesitter，不同括号颜色区分
	-- {
	-- 	"akinsho/bufferline.nvim", -- buffer分割线
	-- 	config = function()
	-- 		require("bufferline").setup {}
	-- 		-- require("plugins.config.bufferline")
	-- 	end,
	-- },
	-- -- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				messages = {
					-- NOTE: If you enable messages, then the cmdline is enabled automatically.
					-- This is a current Neovim limitation.
					enabled = false,        -- enables the Noice messages UI
				},
				routes = {
					{
						view = "split",
						filter = { event = "msg_show", min_height = 20 },
					},
				},
				lsp = {
					signature = {
						enabled = false,
					},
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true,    -- use a classic bottom cmdline for search
					command_palette = true,  -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false,      -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true,   -- add a border to hover docs and signature help
				},
			})
		end
	},
	-- {
	-- 	'VonHeikemen/fine-cmdline.nvim',
	-- 	dependencies = { 'MunifTanjim/nui.nvim' },
	-- 	config = function()
	-- 		vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
	-- 		require('fine-cmdline').setup({
	-- 			cmdline = {
	-- 				enable_keymaps = true,
	-- 				smart_history = true,
	-- 				prompt = ': '
	-- 			},
	-- 			popup = {
	-- 				position = {
	-- 					row = '40%',
	-- 					col = '50%',
	-- 				},
	-- 				size = {
	-- 					width = '60%',
	-- 				},
	-- 				border = {
	-- 					style = 'rounded',
	-- 				},
	-- 				win_options = {
	-- 					winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
	-- 				},
	-- 			},
	-- 			hooks = {
	-- 				before_mount = function(input)
	-- 					-- code
	-- 				end,
	-- 				after_mount = function(input)
	-- 					-- make escape go to normal mode
	-- 				end,
	-- 				set_keymaps = function(imap, feedkeys)
	-- 					local fn = require('fine-cmdline').fn

	-- 					imap('<C-K>', fn.up_search_history)
	-- 					imap('<C-J>', fn.down_search_history)
	-- 					imap('<Up>', fn.previous_item)
	-- 					imap('<Down>', fn.next_item)
	-- 				end
	-- 			}
	-- 		})
	-- 	end
	-- },
	"solarnz/thrift.vim",
	"xiyaowong/transparent.nvim",
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim',  -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	}
}
