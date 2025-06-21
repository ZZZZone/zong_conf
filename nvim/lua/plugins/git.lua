return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup({
				signs              = {
					add          = { text = '▎' },
					change       = { text = '░' },
					delete       = { text = '_' },
					topdelete    = { text = '▔' },
					changedelete = { text = '▒' },
					untracked    = { text = '┆' },
				},
				signcolumn         = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl              = true, -- Toggle with `:Gitsigns toggle_numhl`
				current_line_blame = true,
			})
			vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "]c", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>h", ":Gitsigns blame_line<CR>", { noremap = true, silent = true })
		end
	},
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
			vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
			vim.g.lazygit_floating_window_border_chars = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' } -- customize lazygit popup window border characters
			vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true })
		end
	}
	-- {
	-- 	"APZelos/blamer.nvim",
	-- 	config = function()
	-- 		vim.g.blamer_enabled = true
	-- 		vim.g.blamer_relative_time = true
	-- 	end
	-- }
}
