return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
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

				--- preview in a floating window
				local preview = require('nvim-tree-preview')

				vim.keymap.set('n', '<C-p>', preview.watch, opts 'Preview (Watch)')
				vim.keymap.set('n', '<Esc>', preview.unwatch, opts 'Close Preview/Unwatch')
				vim.keymap.set('n', '<C-f>', function() return preview.scroll(4) end, opts 'Scroll Down')
				vim.keymap.set('n', '<C-b>', function() return preview.scroll(-4) end, opts 'Scroll Up')

				-- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
				vim.keymap.set('n', '<Tab>', function()
					local ok, node = pcall(api.tree.get_node_under_cursor)
					if ok and node then
						if node.type == 'directory' then
							api.node.open.edit()
						else
							preview.node(node, { toggle_focus = true })
						end
					end
				end, opts 'Preview')

				--- theme color
				vim.cmd [[
				hi NvimTreeNormal guibg=none
				hi NvimTreeNormalFloat guibg=none
			]]
			end

			require("nvim-tree").setup {
				view = {
					width = 40,
					-- float = {
					-- 	enable = true,
					-- 	open_win_config = {
					-- 		relative = "editor",
					-- 		-- border = "rounded",
					-- 		width = win_width,
					-- 		height = win_height,
					-- 		row = row,
					-- 		col = col,
					-- 	},
					-- }
				},
				on_attach = my_on_attach,
			}
			-- vim.keymap.set("n", "<leader>g", function()
			-- 	local api = require("nvim-tree.api")
			-- 	local view = require("nvim-tree.view")

			-- 	if view.is_visible() then
			-- 		if view.get_winnr() == vim.api.nvim_get_current_win() then
			-- 			-- 当前在 nvim-tree 窗口中，则关闭
			-- 			api.tree.close()
			-- 		else
			-- 			-- nvim-tree 已打开，但不在 nvim-tree 窗口中，则切换焦点到 nvim-tree
			-- 			api.tree.focus()
			-- 		end
			-- 	else
			-- 		-- nvim-tree 未打开，则打开并跳转到当前文件
			-- 		api.tree.toggle({ find_file = true, focus = true })
			-- 	end
			-- end, { noremap = true, silent = true })

			vim.keymap.set("n", "<C-g>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>g", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>G", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		end,
	},
	{
		'kyazdani42/nvim-tree.lua',
		dependencies = {
			{
				'b0o/nvim-tree-preview.lua',
				dependencies = {
					'nvim-lua/plenary.nvim',
					'3rd/image.nvim', -- Optional, for previewing images
				},
			},
		},
	},
}
