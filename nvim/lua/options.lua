-- UI
vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.wo.wrap = false
vim.opt.cursorline = true

-- Tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 系统剪切板
vim.opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
vim.opt.splitright = true
vim.opt.splitbelow = true


vim.opt.mouse:append("a")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true -- 启用折叠
vim.opt.foldlevel = 99    -- 打开文件时不自动折叠
vim.opt.foldlevelstart = 99

-- 自动保存/恢复折叠视图
vim.cmd([[
  augroup RememberFolds
    autocmd!
    autocmd BufWinLeave * if &buftype == '' && bufname('%') != '' | silent! mkview | endif
    autocmd BufWinEnter * if &buftype == '' && bufname('%') != '' | silent! loadview | endif
  augroup END
]])

