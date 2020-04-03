" Plug {{{
call plug#begin('~/.config/nvim/plugged')

" Map Neovim's external plugin update function (no args) to vim-plug's (1 arg)
function! DoRemote(arg)
	UpdateRemotePlugins
endfunction

"" Language Support
" Plug 'bfrg/vim-cpp-modern'
Plug 'chun-yang/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-mix-format'
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'
Plug 'reedes/vim-pencil'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'rizzatti/dash.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'sophacles/vim-processing'
Plug 'davidgranstrom/scnvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tidalcycles/vim-tidal'

" Navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vifm/vifm.vim'

" Editing
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

" Snippets
" Plug 'sirver/ultisnips'
" Plug 'honza/vim-snippets'

" Theming
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

" Tasks Running 
Plug 'w0rp/ale'

" Git
" Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Wiki
Plug 'vimwiki/vimwiki'

call plug#end()
" }}}

" Themes
set background=dark
syntax on
colorscheme nord
let g:lightline = { 'colorscheme': 'nord' }


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
 set statusline^=%{coc#status()}

 " ============================== SETTINGS ==============================
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard^=unnamedplus
set colorcolumn=120
" macos clipboard sharing
set clipboard=unnamed 
" set cursorcolumn
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
set number relativenumber
" treat all numerals as decimals
set nrformats=
" hybrid line numbers
set number relativenumber
set ruler
set shell=zsh
set shiftwidth=2
set showtabline=0
set softtabstop=2
set spelllang=en_us
set splitbelow splitright
set termguicolors
set timeoutlen=2000
set ttimeoutlen=0
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

" =========== SuperCollider SCNvim
" vertical 'v' or horizontal 'h' split
let g:scnvim_postwin_orientation = 'h'

" position of the post window 'right' or 'left'
" let g:scnvim_postwin_direction = 'right'

" default is half the terminal size for vertical and a third for horizontal
" let g:scnvim_postwin_size = 25

" automatically open post window on a SuperCollider error
let g:scnvim_postwin_auto_toggle = 1

" duration of the highlight
let g:scnvim_eval_flash_duration = 100

" number of flashes. A value of 0 disables this feature.
let g:scnvim_eval_flash_repeats = 2

" configure the color
highlight SCNvimEval guifg=black guibg=white ctermfg=black ctermbg=white

" Tidal Terminal
let g:tidal_target = "terminal"

" =========== Polyglot-LaTeX
" Stop vim-polyglot from loading for TeX, using vimtex instead
let g:polyglot_disabled = ['latex']

" set completeopt=menu,menuone,noinsert,noselect

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

" remap supercollider post window toggle
nmap <Space>o <Plug>(scnvim-postwindow-toggle)
nmap <Space>l <Plug>(scnvim-postwindow-clear)

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

" vifm 
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>

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
" autocmd  BufRead,BufNewFile  *.cpp let &makeprg = 'if [ -f Makefile ]; then make Release && make RunRelease; else make Release -C .. && make RunRelease -C ..; fi'

" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" OF autocomplete
" let g:gutentags_project_root = ['.gutctags']
" let g:gutentags_add_default_project_roots = 0
" ============================== END ===================================
