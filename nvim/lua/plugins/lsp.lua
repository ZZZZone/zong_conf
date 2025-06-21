local plugins = {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"gopls",
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = {
				exclude = { -- 手动启动lua_ls,有额外配置,其他的自动启用
					"lua_ls"
				}
			}
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"j-hui/fidget.nvim", -- lsp加载进度显示
		config = function()
			require("fidget").setup({})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts) require 'lsp_signature'.setup(opts) end
	},
	{
		"aznhe21/actions-preview.nvim",
		config = function()
			vim.keymap.set({ "n" }, "<space>ca", require("actions-preview").code_actions)
		end,
	},
}

return plugins
