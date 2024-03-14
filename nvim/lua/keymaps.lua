local opts = {
	noremap = true,   -- non-recursive
	silent = true,    -- do not show message
}

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- instert
vim.keymap.set('i', 'jk', '<Esc>', opts)

-- normal
vim.keymap.set({'n', 'v'}, 'J', '5j', opts)
vim.keymap.set({'n', 'v'}, 'K', '5k', opts)
vim.keymap.set({'n', 'v'}, 'H', '5h', opts)
vim.keymap.set({'n', 'v'}, 'L', '5l', opts)

vim.keymap.set('n', 'tn', ':tabe<CR>', opts)
vim.keymap.set('n', 't[', ':-tabnext<CR>', opts)
vim.keymap.set('n', 't]', ':+tabnext<CR>', opts)
vim.keymap.set('n', 'tm[', ':-tabmove<CR>', opts)
vim.keymap.set('n', 'tm]', ':+tabmove<CR>', opts)

vim.keymap.set('n', '<leader><CR>', ':nohlsearch<CR>', opts)

vim.keymap.set('n', '<up>', ':res +5<CR>', opts)
vim.keymap.set('n', '<down>', ':res -5<CR>', opts)
vim.keymap.set('n', '<left>', ':vertical res-5<CR>', opts)
vim.keymap.set('n', '<right>', ':vertical res+5<CR>', opts)

vim.keymap.set('n', '-', 'zc', opts)
vim.keymap.set('n', '_', 'zM', opts)
vim.keymap.set('n', '=', 'zO', opts)
vim.keymap.set('n', '+', 'zR', opts)

-- 窗口分割
vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")

-- 重新加载配置
vim.api.nvim_set_keymap('n', '<leader>r', ':luafile $MYVIMRC<CR>', opts)


vim.keymap.set('n', '<leader>h', ':Git blame <CR>', opts)
vim.keymap.set('n', '<leader>s', '<Plug>(easymotion-s2)', opts)


-- v
vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "<C-L>", ":BufferNext<CR>", opts)
vim.keymap.set("n", "<C-H>", ":BufferPrevious<CR>", opts)
-- vim.keymap.set("n", "<C-X>", ":bwipeout<CR>")

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>w', vim.diagnostic.setloclist)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)


-- 关闭当前窗口或当前缓冲区
function close_window_or_buffer()
  -- 获取当前窗口数量
  local num_windows = vim.fn.winnr('$')

  -- 如果只有一个窗口，则关闭当前缓冲区
  if num_windows == 1 then
    vim.cmd('bwipeout')
  else
    -- 关闭当前窗口
    vim.cmd('silent! close')

    -- 获取新的窗口数量
    local new_num_windows = vim.fn.winnr('$')

    -- 如果新的窗口数量与旧的相同，则说明无法关闭窗口（例如只有两个水平分割的窗口时）
    -- 这种情况下关闭当前缓冲区
    if new_num_windows == num_windows then
      vim.cmd('bwipeout')
    end

  end
end

-- 将函数绑定到快捷键
vim.api.nvim_set_keymap('n', '<C-x>', '<cmd>lua close_window_or_buffer()<CR>', opts)
