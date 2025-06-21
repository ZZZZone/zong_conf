return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require('telescope.builtin')
			local opts = {
				noremap = true, -- non-recursive
				silent = true, -- do not show message
			}
			-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了
			vim.keymap.set('n', '<C-p>f', builtin.find_files, {
				noremap = true, -- non-recursive
				silent = true, -- do not show message
				desc = 'Find Files',
			})
			vim.keymap.set('n', '<C-p>w', builtin.live_grep, {
				noremap = true, -- non-recursive
				silent = true, -- do not show message
				desc = 'word Grep',
			})            -- 环境里要安装ripgrep
			vim.keymap.set('n', '<C-p>b', builtin.buffers, {
				noremap = true, -- non-recursive
				silent = true, -- do not show message
				desc = 'Find Buffers',
			})
			-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
			vim.keymap.set('n', 'gd', ':Telescope lsp_definitions initial_mode=normal<CR>', opts)
			vim.keymap.set('n', 'gf', ':Telescope lsp_references initial_mode=normal<CR>', opts)
			vim.keymap.set('n', 'gi', ':Telescope lsp_implementations initial_mode=normal<CR>', opts)
			vim.cmd [[
				hi TelescopeNormal guibg=none
			]]
		end
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			local actions = require("telescope.actions")
			local trouble = require("trouble.sources.telescope")

			local telescope = require("telescope")

			telescope.setup {
				defaults = {
					dynamic_preview_title = true,
					layout_strategy = 'vertical',
					path_display = { "truncate" }, -- 将路径缩短显示
					file_ignore_patterns = {
						"go.mod",
						"go.sum",
					},
					mappings = {
						i = { ["<c-s>"] = trouble.open },
						n = { ["<c-s>"] = trouble.open },
					},
				},
			}

			vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
			vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
			vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
			vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
			vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
			vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
		end
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		'tomasky/bookmarks.nvim',
		config = function()
			require('bookmarks').setup {
				-- sign_priority = 8,  --set bookmark sign priority to cover other sign
				save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
				keywords = {
					["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
					["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
					["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
					["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
				},
				on_attach = function(bufnr)
					local bm = require "bookmarks"
					local map = vim.keymap.set
					map("n", "<leader>bb", bm.bookmark_toggle)                             -- add or remove bookmark at current line
					map("n", "<leader>ba", bm.bookmark_ann)                                -- add or edit mark annotation at current line
					map("n", "<leader>bx", bm.bookmark_clean)                              -- clean all marks in local buffer
					map("n", "]b", bm.bookmark_next)                                       -- jump to next mark in local buffer
					map("n", "[b", bm.bookmark_prev)                                       -- jump to previous mark in local buffer
					map("n", "<leader>bl", ":Telescope bookmarks list initial_mode=normal<CR>") -- show marked file list in quickfix window
				end
			}
		end
	}
}
