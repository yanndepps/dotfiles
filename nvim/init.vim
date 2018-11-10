" Plug {{{
call plug#begin('~/.config/nvim/plugged')

" Map Neovim's external plugin update function (no args) to vim-plug's (1 arg)
function! DoRemote(arg)
	UpdateRemotePlugins
endfunction

"" Language Support
Plug 'bfrg/vim-cpp-modern'
Plug 'chun-yang/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-mix-format'
Plug 'munshkr/vim-tidal'
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'
Plug 'reedes/vim-pencil'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'rizzatti/dash.vim'
Plug 'sbl/scvim'
Plug 'sheerun/vim-polyglot'
Plug 'sophacles/vim-processing'

" Navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'

" Editing
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

" Vim, Tmux, and Airline theming
Plug 'arcticicestudio/nord-vim'
Plug 'trevordmiller/nova-vim'
Plug 'vim-airline/vim-airline'

" Tasks Running 
Plug 'w0rp/ale'

" Git
Plug 'tpope/vim-fugitive'

call plug#end()
" }}}

" Colors/Theme {{{
set background=dark
colorscheme nord
" colorscheme nova
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
let g:ale_enabled = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {'javascript': ['eslint', 'prettier']}

" ============================== POWERLINE
let g:airline_powerline_fonts = 1

" ============================== PYTHON

" ============================== STATUS LINE ==============================
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? '  ✔  ' : printf('  PROBLEMS: %s  ', counts.total)
endfunction
set statusline=
set statusline=%#Question#
set statusline+=%{LinterStatus()}
set statusline+=%#StatusLineNC#
set statusline+=[%n]\ %f\ %m%r
set statusline+=%=[line:\ %l/%L][col:\ %03c]

" ============================== SETTINGS ==============================
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set clipboard^=unnamedplus
set colorcolumn=120
set cursorcolumn
set cursorline
set expandtab
"" remove all scrollbars
set guioptions=
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
set number
" set path+=src
set shell=zsh
set shiftwidth=2
set showtabline=0
set softtabstop=2
set spelllang=en_us
" set spellfile=~/Dropbox/vimspell/en.utf-8.add
set splitbelow
set timeoutlen=2000
set ttimeoutlen=0
set wildmenu

" reload changed file on focus, buffer enter
" helps if file was changed externally.
augroup ReloadGroup
  autocmd!
  autocmd! FocusGained,BufEnter * checktime
augroup END

" =========== cursorline
hi CursorLine ctermfg=NONE ctermbg=NONE
hi CursorLineNR ctermfg=black ctermbg=yellow
set cursorline

" =========== SuperCollider SCVim
let g:sclangPipeApp = "/Users/yanndepps/.config/nvim/plugged/scvim/bin/start_pipe"
let g:sclangDispatcher = "/Users/yanndepps/.config/nvim/plugged/scvim/bin/sc_dispatcher"
let g:scFlash = 1
" options for the multiplexer
" :call SClangStart("h", 30)

" Stop vim-polyglot from loading for TeX, using vimtex instead
let g:polyglot_disabled = ['latex']

" ============================== MAPPINGS ==============================
let mapleader = " "

" close buffer
nnoremap ,d :bd<CR>
" close all buffers
nnoremap ,D :%bd<CR>

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

" non-leader mappings ==========

" run make
nnoremap <silent> <F5> :wa<CR>:silent make<CR>
inoremap <silent> <F5> <Esc>:wa<CR>:silent make<CR>
nnoremap <silent> <F6> :wa<CR>:silent make clean<CR>
nnoremap <silent> <F7> :wa<CR>:silent make launch<CR>

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

" go to file using index.js if path is dir
nnoremap gf :call GfIndex('<C-r><C-p>')<CR>

" ============================== COMMANDS ==============================

" turn a snake into a camel
command! SnakeToCamel normal mmviw:s/\%V_\(.\)/\U\1/g<CR>:nohlsearch<CR>`m

" turn a camel into a snake
command! CamelToSnake normal mmviw:s/\%V\(\u\)/_\L\1/g<CR>:nohlsearch<CR>`m

" go to file using index.js if path is dir
function! GfIndex(filepath)
  let indexpath = a:filepath . "/index.js"
  if isdirectory(a:filepath) && filereadable(indexpath)
    execute "edit" indexpath
  else
    execute "edit" a:filepath
  endif
endfunction

" markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" OF setup : run make runRelease
autocmd  BufRead,BufNewFile  *.cpp let &makeprg = 'if [ -f Makefile ]; then make Release && make RunRelease; else make Release -C .. && make RunRelease -C ..; fi'

" ============================== END ===================================
