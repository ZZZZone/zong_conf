" ____________________                _      __     ___
"|__  /__  /__  /__  /___  _ __   ___( )___  \ \   / (_)_ __ ___  _ __ ___
"  / /  / /  / /  / // _ \| '_ \ / _ \// __|  \ \ / /| | '_ ` _ \| '__/ __|
" / /_ / /_ / /_ / /| (_) | | | |  __/ \__ \   \ V / | | | | | | | | | (__
"/____/____/____/____\___/|_| |_|\___| |___/    \_/  |_|_| |_| |_|_|  \___|
"
"
"*********************************************
"					基础配置
"*********************************************
"===================通用======================
" 不与Vi兼容
set nocompatible
"支持文件插件
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"===================样式======================
"高亮
syntax on
"显示行号
set number
" 相对行号（简写 :set rnu)
set relativenumber
"指令Tab多选
set wildmenu
"显示指令
set showcmd
" 突出显示当前行
set cursorline
" 突出显示当前列
" set cursorcolumn
" 显示括号匹配
set showmatch
" 光标移动到buffer的顶部和底部时保持x行距离
set scrolloff=5
" MacVim下字体
set guifont=CousineForPowerline:h16
set list
" set listchars=tab:▸\ ,trail:▫
set listchars=tab:\|\ ,trail:▫
"===================搜索======================
"高亮搜索结果
set hlsearch
" 开启实时搜索
set incsearch
" 忽略大小写搜索
set ignorecase
" 搜索智能大小写
set smartcase
"===================缩进======================
" 设置Tab长度为4空格
set tabstop=4
" 设置自动缩进长度为4空格
set shiftwidth=4
" 继承前一行的缩进方式，适用于多行注释
set autoindent
" 解决插入模式下delete/backspce键失效问题
set backspace=2
"===================分屏======================



" ===
" === Restore Cursor Position
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"=================按键映射====================
let mapleader = " "
" 快速移动
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l
inoremap jk <Esc>

" ===
" === Tab management
" ===
" Create a new tab with tn
noremap tn :tabe<CR>
" Move around tabs with t[ and t]
noremap t[ :-tabnext<CR>
noremap t] :+tabnext<CR>
" Move the tabs with tm[ and tm]
noremap tm[ :-tabmove<CR>
noremap tm] :+tabmove<CR>

" Search
" 关闭当前搜索的高亮结果
map <LEADER><CR> :nohlsearch<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

"窗口全屏
function! Zoom ()
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction
nmap <leader>z :call Zoom()<CR>


" Auto change directory to current dir
" autocmd BufEnter * silent! lcd %:p:h

"*********************************************
"					插件部分
"				使用vim-plug管理
"*********************************************
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

"=================插件列表====================
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify' " 启动页
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' " 目录树
Plug 'Xuyuanp/nerdtree-git-plugin' "nerdTree 支持Git
Plug 'kien/ctrlp.vim'  " 文件搜索
Plug 'easymotion/vim-easymotion' "瞬间移动
Plug 'tpope/vim-surround' "环绕修改
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " go
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 代码不全
Plug 'majutsushi/tagbar'
Plug 'lfv89/vim-interestingwords' " 高亮插件
Plug 'tpope/vim-commentary'  " 代码注释
Plug 'ianva/vim-youdao-translater' "有道翻译
Plug 'itchyny/vim-cursorword' " 下划线
Plug 'tpope/vim-surround' " 成对编辑
Plug 'vimwiki/vimwiki' "wiki
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for' :['markdown', 'vim-plug'] } " markdwon实时预览
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine' " tab对齐线
" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" 配色
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'connorholyday/vim-snazzy'
" Plug 'wadackel/vim-dogrun'

" unuse
"Plug 'python-mode/python-mode'
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
call plug#end()


"===================主题======================
let g:dracula_colorterm = 0
set termguicolors
colorscheme dracula
hi Visual  ctermbg=gray ctermfg=green guibg=gray guifg=green
hi Comment cterm=italic gui=italic ctermfg=248 guifg=#999999
"=================插件配置====================

" startify
" let g:startify_custom_header = [
" 			\'',
" 			\'',
" 			\'',
" 			\ '  ____________________                ',
" 			\ ' |__  /__  /__  /__  /___  _ __   ___ ',
" 			\ '   / /  / /  / /  / // _ \| `_ \ / _ \',
" 			\ '  / /_ / /_ / /_ / /| (_) | | | |  __/',
" 			\ ' /____/____/____/____\___/|_| |_|\___|',
" 			\'',
" 			\'',
" 			\'',
" 			\'',
" 			\]
let g:startify_custom_header = [
			\' _____  _    _     _  __   ___ ____      ____ _   _ _____    _    ____   ',
			\'|_   _|/ \  | |   | |/ /  |_ _/ ___|    / ___| | | | ____|  / \  |  _ \  ',
			\'  | | / _ \ | |   |   /    | |\___ \   | |   | |_| |  _|   / _ \ | |_) | ',
			\'  | |/ ___ \| |___| . \    | | ___) |  | |___|  _  | |___ / ___ \|  __/  ',
			\'  |_/_/   \_\_____|_|\_\  |___|____/    \____|_| |_|_____/_/   \_\_|     ',
			\'',
			\'  ____  _   _  _____        __   __  __ _____    _____ _   _ _____  ',
			\' / ___|| | | |/ _ \ \      / /  |  \/  | ____|  |_   _| | | | ____| ',
			\' \___ \| |_| | | | \ \ /\ / /   | |\/| |  _|      | | | |_| |  _|   ',
			\'  ___) |  _  | |_| |\ V  V /    | |  | | |___     | | |  _  | |___  ',
			\' |____/|_| |_|\___/  \_/\_/     |_|  |_|_____|    |_| |_| |_|_____| ',
			\'',
			\'                     ____ ___  ____  _____  ',
			\'                    / ___/ _ \|  _ \| ____| ',
			\'                   | |  | | | | | | |  _|   ',
			\'                   | |__| |_| | |_| | |___  ',
			\'                    \____\___/|____/|_____| ',
			\ ' ',
			\ ' ',
			\]


" indentLine
let g:indentLine_color_term = 239

" ctrlp.vim
let g:ctrlp_map = '<c-p>'

" nerdtree
nnoremap <leader>v :NERDTreeFind<CR>
nnoremap <leader>g :NERDTreeToggle<CR>

" TagBar
nnoremap <F3> :TagbarToggle<CR>

" Deoplete
" let g:deoplete#enable_at_startup = 1
" set completeopt-=preview

" easyMotion
nmap ss <Plug>(easymotion-s2)
map <Leader> <Plug>(easymotion-prefix)

" youdao trans
vnoremap <silent> <leader>t :<C-u>Ydv<CR>
nnoremap <silent> <leader>t :<C-u>Ydc<CR>
noremap <leader>tt :<C-u>Yde<CR>

" vim airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0

" vimwiki
" vimwiki-markdown
let g:vimwiki_list = [{
			\'path': '~/Documents/vimwiki/',
			\ 'template_path': '~/Documents/vimwiki/templates/',
			\ 'template_default': 'default',
			\ 'ext': '.md',
			\ 'syntax': 'markdown',
			\ 'path_html': '~/Documents/vimwiki/site_html/',
			\ 'custom_wiki2html': 'vimwiki_markdown',
			\ 'html_filename_parameterization': 1,
			\ 'template_ext': '.tpl'}]


" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "═",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ 'Ignored'   : '☒',
			\ "Unknown"   : "?"
			\ }

" vim-gitgutter
set updatetime=100

" undotree
nnoremap <F2> :UndotreeToggle <CR>

"================= Markdown ====================
" markdown-preview
" 打开md文件自动打开预览
" let g:mkdp_auto_start = 1

"================= Golang ====================
" vim-go
let g:go_fmt_command = "goimports"
nnoremap <silent> <leader>b :<CR>
" 禁用K打开GoDoc
let g:go_doc_keywordprg_enabled = 0

"coc.vim
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gf <Plug>(coc-references)

" Use H to show documentation in preview window.
nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>





