local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local lspkind = require 'lspkind'

require("luasnip.loaders.from_vscode").lazy_load()


cmp.setup({

	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-n>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(), -- 取消补全，esc也可以退出
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),

	}),

	sources = cmp.config.sources(
		{
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
		},
		{
			{ name = 'buffer' },
			{ name = 'path' }
		}
	),

	-- 使用lspkind-nvim显示类型图标
	formatting = {
		format = lspkind.cmp_format({
			with_text = true, -- do not show text alongside icons
			maxwidth = 50,    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			before = function(entry, vim_item)
				-- Source 显示提示来源
				vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
				return vim_item
			end
		})
	},

})
