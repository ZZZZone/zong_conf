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
			vim.keymap.set('n', '<C-p>f', builtin.find_files, opts)
			vim.keymap.set('n', '<C-p>w', builtin.live_grep, opts) -- 环境里要安装ripgrep
			vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
			vim.keymap.set('n', 'gd', ':Telescope lsp_definitions initial_mode=normal<CR>', opts)
			vim.keymap.set('n', 'gf', ':Telescope lsp_references initial_mode=normal<CR>', opts)
			vim.keymap.set('n', 'gi', ':Telescope lsp_implementations initial_mode=normal<CR>', opts)
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
			local trouble = require("trouble.providers.telescope")

			local telescope = require("telescope")

			telescope.setup {
				defaults = {
					file_ignore_patterns = {
						"go.mod",
						"go.sum",
					},
					mappings = {
						i = { ["<c-s>"] = trouble.open_with_trouble },
						n = { ["<c-s>"] = trouble.open_with_trouble },
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
	}
}
