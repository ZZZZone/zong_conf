return {
  -- ✨ 折叠增强
  'kevinhwang91/nvim-ufo',
  event = 'BufReadPost',          -- 文件读入后加载，加快启动
  dependencies = { 'kevinhwang91/promise-async' },

  config = function()
    ------------------------------------------------------------------
    -- 全局折叠相关 Neovim 选项
    ------------------------------------------------------------------
    vim.o.foldcolumn      = '1'   -- 显示折叠列
    vim.o.foldlevel       = 99    -- 默认全部打开（> 缩进层级）
    vim.o.foldlevelstart  = 99
    vim.o.foldenable      = true

    ------------------------------------------------------------------
    -- nvim‑ufo 配置
    ------------------------------------------------------------------
    require('ufo').setup({
      ---@param bufnr    number
      ---@param filetype string
      ---@param buftype  string
      provider_selector = function(bufnr, filetype, buftype)
        -- ① 首选 LSP 折叠
        -- ② 若当前 buffer 无 LSP 且 filetype 支持 Treesitter，可用 'treesitter'
        -- ③ 最后回退到缩进
        return { 'lsp', 'indent' }
      end,
    })
  end,
}

