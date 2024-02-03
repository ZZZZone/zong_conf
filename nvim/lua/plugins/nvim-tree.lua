return {
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			local vim_api = vim.api
			local buf
			buf = vim_api.nvim_create_buf(false, true) -- create new emtpy buffer
			vim_api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
			-- get dimensions
			local width = vim_api.nvim_get_option("columns")
			local height = vim_api.nvim_get_option("lines")

			-- calculate our floating window size
			local win_height = math.ceil(height * 0.8 - 4)
			local win_width = math.ceil(width * 0.8)

			-- and its starting position
			local row = math.ceil((height - win_height) / 2 - 1)
			local col = math.ceil((width - win_width) / 2)

			-- Custom Mappings
			local function my_on_attach(bufnr)
				local api = require "nvim-tree.api"
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
				vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
				vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
				vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
				vim.keymap.set('n', '<ESC>', api.tree.close, opts('Close'))
			end

			require("nvim-tree").setup {
				view = {
					float = {
						enable = true,
						open_win_config = {
							relative = "editor",
							-- border = "rounded",
							width = win_width,
							height = win_height,
							row = row,
							col = col,
						},
					}
				},
				on_attach = my_on_attach,
			}

			vim.keymap.set("n", "<leader>g", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		end,
	},
}
