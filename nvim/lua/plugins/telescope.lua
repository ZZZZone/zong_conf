return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了
		vim.keymap.set('n', '<C-p>f', builtin.find_files, {})
		vim.keymap.set('n', '<C-p>w', builtin.live_grep, {}) -- 环境里要安装ripgrep
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		vim.keymap.set('n', 'gf', builtin.lsp_references, {})
		vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
	end
}
