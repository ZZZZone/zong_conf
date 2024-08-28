-- 绑定 F3 键，打开相应的 .in 文件
vim.api.nvim_set_keymap('n', '<F3>', ':topleft vsplit %:r.in<CR>', { noremap = true, silent = true })

-- 绑定 F4 键，调用 XX 函数
vim.api.nvim_set_keymap('n', '<F4>', ':lua XX()<CR>', { noremap = true, silent = true })

function XX()
	vim.cmd("w") -- 保存当前文件
	local filename_no_ext = vim.fn.expand('%:r')
	-- 执行带输入重定向的命令
	vim.cmd("!time ./" .. filename_no_ext .. " < " .. filename_no_ext .. ".in")
end

-- 绑定 F9 键，调用 InitCompile 函数
vim.api.nvim_set_keymap('n', '<F9>', ':lua InitCompile()<CR>', { noremap = true, silent = true })

function InitCompile()
	local filetype = vim.bo.filetype
	local filename = vim.fn.expand('%:p')
	local filename_no_ext = vim.fn.expand('%:r')

	if filetype == 'c' or filetype == 'cpp' then
		vim.cmd("!make " .. filename_no_ext)
	elseif filetype == 'go' then
		vim.cmd("!go build " .. filename) -- 编译 Go 文件
	end
end

-- 绑定 F10 键，调用 CompileRunGcc 函数
vim.api.nvim_set_keymap('n', '<F10>', ':lua CompileRunGcc()<CR>', { noremap = true, silent = true })

function CompileRunGcc()
	vim.cmd("w") -- 保存当前文件
	local filetype = vim.bo.filetype
	local filename = vim.fn.expand('%:p')
	local filename_no_ext = vim.fn.expand('%:r')

	if filetype == 'c' or filetype == 'cpp' then
		vim.cmd("terminal ./" .. filename_no_ext)
	elseif filetype == 'go' then
		vim.cmd("terminal go run " .. filename)
	end
	vim.cmd("startinsert")
end

vim.api.nvim_set_keymap('n', '<F2>', ':lua SetTitlea()<CR>', { noremap = true, silent = true })

function SetTitlea()
	local filetype = vim.bo.filetype
	if filetype == 'cpp' then
		local l = 0
		l = l + 1; vim.fn.setline(l, '/********************************************')
		l = l + 1; vim.fn.setline(l, ' *Author*        :ZZZZone')
		l = l + 1; vim.fn.setline(l, ' *Created Time*  : ' .. os.date('%c'))
		l = l + 1; vim.fn.setline(l, '')
		l = l + 1; vim.fn.setline(l, '*********************************************/')
		l = l + 1; vim.fn.setline(l, '')
		l = l + 1; vim.fn.setline(l, '#include <cstdio>')
		l = l + 1; vim.fn.setline(l, '#include <cstring>')
		l = l + 1; vim.fn.setline(l, '#include <iostream>')
		l = l + 1; vim.fn.setline(l, '#include <algorithm>')
		l = l + 1; vim.fn.setline(l, '#include <vector>')
		l = l + 1; vim.fn.setline(l, '#include <queue>')
		l = l + 1; vim.fn.setline(l, '#include <set>')
		l = l + 1; vim.fn.setline(l, '#include <map>')
		l = l + 1; vim.fn.setline(l, '#include <string>')
		l = l + 1; vim.fn.setline(l, '#include <cmath>')
		l = l + 1; vim.fn.setline(l, '#include <cstdlib>')
		l = l + 1; vim.fn.setline(l, '#include <ctime>')
		l = l + 1; vim.fn.setline(l, '#include <stack>')
		l = l + 1; vim.fn.setline(l, 'using namespace std;')
		l = l + 1; vim.fn.setline(l, '#define debug(x) std::cerr << #x << " = " << (x) << std::endl')
		l = l + 1; vim.fn.setline(l, 'typedef pair<int, int> PII;')
		l = l + 1; vim.fn.setline(l, 'typedef long long LL;')
		l = l + 1; vim.fn.setline(l, 'typedef unsigned long long ULL;')
		l = l + 1; vim.fn.setline(l, '')
		l = l + 1; vim.fn.setline(l, 'inline void OPEN(string s){')
		l = l + 1; vim.fn.setline(l, '    freopen((s + ".in").c_str(), "r", stdin);')
		l = l + 1; vim.fn.setline(l, '    freopen((s + ".out").c_str(), "w", stdout);')
		l = l + 1; vim.fn.setline(l, '}')
		l = l + 1; vim.fn.setline(l, '')
		l = l + 1; vim.fn.setline(l, 'int main()')
		l = l + 1; vim.fn.setline(l, '{')
		l = l + 1; vim.fn.setline(l, '    return 0;')
		l = l + 1; vim.fn.setline(l, '}')
	elseif filetype == 'go' then
		local l = 0
		l = l + 1; vim.fn.setline(l, 'package main')
		l = l + 1; vim.fn.setline(l, '')
		l = l + 1; vim.fn.setline(l, 'import (')
		l = l + 1; vim.fn.setline(l, '    "fmt"')
		l = l + 1; vim.fn.setline(l, ')')
		l = l + 1; vim.fn.setline(l, '')
		l = l + 1; vim.fn.setline(l, 'func main() {')
		l = l + 1; vim.fn.setline(l, '    // TODO: implement your code here')
		l = l + 1; vim.fn.setline(l, '    fmt.Println("Hello, World!")')
		l = l + 1; vim.fn.setline(l, '}')
	end
end
