" Plug {{{
call plug#begin('~/.config/nvim/plugged')

" Map Neovim's external plugin update function (no args) to vim-plug's (1 arg)
function! DoRemote(arg)
	UpdateRemotePlugins
endfunction

"" Language Support
Plug 'chun-yang/auto-pairs'
Plug 'jamshedvesuna/vim-markdown-preview'
Plug 'mhinz/vim-mix-format'
Plug 'leshill/vim-json'
Plug 'reedes/vim-pencil'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'rizzatti/dash.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'sophacles/vim-processing'
" Plug 'tidalcycles/vim-tidal'
" Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
" Code formatting for c++
Plug 'ludovicchabant/vim-gutentags'
" Plug 'vim-scripts/a.vim'

" GLSL
Plug 'tikhomirov/vim-glsl'

Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ } 

" Navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Editing
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-easy-align'
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

" Colorsheme
Plug 'arcticicestudio/nord-vim'
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhartington/oceanic-next' 

" Tasks Running 
" Plug 'w0rp/ale'

" Git
Plug 'tpope/vim-fugitive'
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'

" Autocomplete SuperCollider
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'SirVer/ultisnips'

" lilypond
Plug 'sersorrel/vim-lilypond'

" clang-format
Plug 'rhysd/vim-clang-format'

call plug#end()
" }}}


" ============================== FZF/RIPGREP
set rtp+=/usr/local/opt/fzf

" ========== files
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" ========== words
command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --ignore-case --color=always '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right:50%', '?'))

" ============================== ALE
" ALEToggle to activate
" let g:ale_enabled = 0
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_fixers = {'javascript': ['eslint', 'prettier']}

" ============================== STATUS LINE ==============================
" function! LinterStatus() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    return l:counts.total == 0 ? '  ✔  ' : printf('  PROBLEMS: %s  ', counts.total)
"  endfunction
" set statusline=
" set statusline=%#Question#
" set statusline+=%{LinterStatus()}
" set statusline+=%#StatusLineNC#
" set statusline+=[%n]\ %f\ %m%r
" set statusline+=%=[line:\ %l/%L][col:\ %03c]

 " ============================== SETTINGS ==============================
set autoindent
set autoread
set backspace=indent,eol,start
set nobackup
set nowritebackup
set clipboard^=unnamedplus
" set colorcolumn=120
" macos clipboard sharing
set clipboard=unnamed 
set cmdheight=2
" set cursorcolumn
set cursorline
set expandtab
" remove all scrollbars
set guioptions=
" folds
set foldmethod=manual
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:✗,space:·
set mouse=a
set nobackup
set noswapfile
set noshowmode
set number relativenumber
" treat all numerals as decimals
set nrformats=
" hybrid line numbers
set number relativenumber
set ruler
set shell=zsh
set shiftwidth=2
set shortmess+=c
set showtabline=0
set signcolumn=yes
set softtabstop=2
" set spell
set spelllang=en_us,fr
set splitbelow splitright
set termguicolors
set timeoutlen=2000
set ttimeoutlen=0
set updatetime=300
set wildmenu
set wildmode=longest,list,full

" reload changed file on focus, buffer enter
" helps if file was changed externally.
augroup ReloadGroup
  autocmd!
  autocmd! FocusGained,BufEnter * checktime
augroup END

" =========== cursorline
hi CursorLine ctermfg=NONE ctermbg=NONE
hi CursorLineNR ctermfg=black ctermbg=yellow

" ============================== Editor Config ===============================
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" === Signify === "
let g:signify_sign_delete = '-'

" autocompletion c++
let g:gutentags_project_root = ['.gutctags']
let g:gutentags_add_default_project_roots = 0

" lang-client for c++
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'], 
            \ }

function LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
        nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    endif
endfunction

autocmd FileType * call LC_maps()

augroup c
    autocmd!
    autocmd FileType c,cpp,h,hpp,glsl call MakeRun()
augroup end

function! MakeRun()
    nnoremap <C-e> :terminal make -j8 && make run<cr>
    inoremap <C-e> <esc>:terminal make -j8 && make run<cr>
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Code formatting ( c++ )
autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format

" Code formatting ( GLSL )
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" no bullet indent stuff
let g:indentguides_toggleListMode = get(g:, 'indentguides_toggleListMode', 0)

" ============================== MAPPINGS ==============================
let mapleader = " "

" close buffer
nnoremap ,d :bd<CR>
" close all buffers
nnoremap ,D :%bd<CR>

" nerdtree
nnoremap ,nt :NERDTreeToggle<CR>
" vert split
nnoremap ,v :vs<CR>

" session save/open/remove
nnoremap ,ss :mksession! ~/.config/nvim/sessions/
nnoremap ,so :source ~/.config/nvim/sessions/
nnoremap ,sr :!rm ~/.config/nvim/sessions/

" edit/save .vimrc
nnoremap ,ev :e ~/.config/nvim/init.vim<CR>
nnoremap ,sv :so ~/.config/nvim/init.vim<CR>

" find and replace word
nnoremap ,fr :%s//g<Left><Left>
" find file
nnoremap ,ff :Files<CR>
" find fuzzy
nnoremap ,fg :Rg
" find buffer
nnoremap ,b :Buffers<CR>

" git
nnoremap ,gb :Gblame<CR>

" goyo
nnoremap ,gy :Goyo<CR>

" quit all
nnoremap ,q :qa<CR>

" show invisible chars
nnoremap ,l :set list!<CR>

" no highlights
nnoremap ,hh :noh<CR>

" select all
nnoremap ,sa ggVG

" ALE next error
" nmap <silent> ,es <Plug>(ale_next_wrap)
" nmap <leader>d <Plug>(ale_fix)

" kill all windows but current
nnoremap ,x :only<CR>

" close quickfix
nnoremap ,cc :cclose<CR>

" open Dash documentation
nnoremap ,da :Dash<CR>

" exit terminal
tnoremap <Esc> <C-\><C-n>

" Processing run make
nnoremap <silent> <F5> :wa<CR>:silent make<CR>
inoremap <silent> <F5> <Esc>:wa<CR>:silent make<CR>
nnoremap <silent> <F6> :wa<CR>:silent make clean<CR>
nnoremap <silent> <F7> :wa<CR>:silent make launch<CR>

" new split with alternate file  
" nnoremap mv :AV<cr>
" switch in same window
" nnoremap ma :A<cr>

" these only get hit by accident
nnoremap Q <Nop>
nnoremap q: <Nop>

" redo
nnoremap U <C-r>

" move by one visual line
nnoremap j gj
nnoremap k gk

" 0 is easier. ^ is more useful.
nnoremap 0 ^
nnoremap ^ 0

" explore project dir
nnoremap ,, :Explore .<CR>
" explore dir of current buffer
nnoremap - :Explore<CR>

" ============================== COMMANDS ==============================

" turn a snake into a camel
command! SnakeToCamel normal mmviw:s/\%V_\(.\)/\U\1/g<CR>:nohlsearch<CR>`m

" turn a camel into a snake
command! CamelToSnake normal mmviw:s/\%V\(\u\)/_\L\1/g<CR>:nohlsearch<CR>`m

" markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" ClangFormat
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
" auto-enabling auto-formatting
autocmd FileType c ClangFormatAutoEnable

" fix transparent background in Vim/ Neovim: 
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

set background=dark
syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" colorscheme nord
" let g:lightline = { 'colorscheme': 'nord' }
colorscheme OceanicNext
" let g:airline_theme='oceanicnext'
let g:airline_theme='deus'
" let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" let g:python3_host_prog = '/usr/bin/python3.10'
" ============================== END ===================================