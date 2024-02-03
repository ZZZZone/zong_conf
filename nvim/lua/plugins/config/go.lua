-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require('go.format').goimport()
	end,
	group = format_sync_grp,
})


local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('go').setup({
	lsp_keymaps = false, -- keymap太多, 出现冲突 在lsp中手动设置了
	lsp_codelens = false,
	-- other setups ....
	-- lsp_cfg = {  出现函数自动填充, 不是很好用
	-- 	capabilities = capabilities,
	-- 	-- other setups
	-- },
})
