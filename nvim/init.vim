" Plug {{{
call plug#begin('~/.config/nvim/plugged')

" Map Neovim's external plugin update function (no args) to vim-plug's (1 arg)
function! DoRemote(arg)
	UpdateRemotePlugins
endfunction

"" Language Support
Plug 'chun-yang/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-mix-format'
" Plug 'pangloss/vim-javascript'
" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'
" Generate JSDoc commands based on function signature
" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'
" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'leshill/vim-json'
Plug 'reedes/vim-pencil'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'rizzatti/dash.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'sophacles/vim-processing'
Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
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

" Colorsheme
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

" Tasks Running 
" Plug 'w0rp/ale'

" Git
Plug 'tpope/vim-fugitive'
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'

" CoC Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Denite - Fuzzy finding, buffer management
" Plug 'Shougo/denite.nvim'

" Wiki
Plug 'vimwiki/vimwiki'

" Autocomplete SuperCollider
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

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
" set colorcolumn=120
" macos clipboard sharing
set clipboard=unnamed 
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
set showtabline=0
set softtabstop=2
" set spell
set spelllang=en_us,fr
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

" ============================== CoC.nvim Setup ==============================
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,requirejs,react'

" === Signify === "
let g:signify_sign_delete = '-'

" CoC Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ============================== SuperCollider ==============================
" get information about git and server status in your statusline
function! s:startSCNvim()
    let g:lightline = { 'colorscheme': 'nord' }
    let g:lightline.component_function = {
                \ 'server_status': 'scnvim#statusline#server_status',
                \ 'gitbranch': 'FugitiveHead'
                \ }

    function! s:set_sclang_lightline_stl()
        let g:lightline.active = {
                    \ 'left':  [ [ 'mode', 'paste' ],
                    \          [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
                    \ 'right': [ [ 'lineinfo' ],
                    \            [ 'percent' ],
                    \            [ 'server_status'] ]
                    \ }
    endfunction 
    call s:set_sclang_lightline_stl()

" whenever you hit <cr> you will toggle the post window
    let g:scnvim_postwin_auto_toggle = 1
    " make sure the post window doesn't eat half your window
    let g:scnvim_postwin_size = 50 
    " and wrap the output to make it easier to read
    autocmd FileType scnvim setlocal wrap 
    " vertical 'v' or horizontal 'h' split
    let g:scnvim_postwin_orientation = 'v'

    " automatically open post window on a SuperCollider error
    let g:scnvim_postwin_auto_toggle = 1

    " duration of the highlight
    let g:scnvim_eval_flash_duration = 100

    " number of flashes. A value of 0 disables this feature.
    let g:scnvim_eval_flash_repeats = 2

    " configure the color
    highlight SCNvimEval guifg=black guibg=white ctermfg=black ctermbg=white

    " position of the post window 'right' or 'left'
    let g:scnvim_postwin_direction = 'right'

    " enable sc-help right in your nvim session!
    let g:scnvim_scdoc = 1 
    " ensure that your comments look good
    setlocal commentstring=//%s

    " map your function keys to useful functions
    nnoremap <F2> :SCNvimStart<cr>
    nnoremap <F4> :SCNvimRecompile<cr>

    " see what the server is doing
    nnoremap <silent><buffer> <F5> :call scnvim#sclang#send('s.plotTree')<CR>
    nnoremap <silent><buffer> <F6> :call scnvim#sclang#send('s.meter')<CR>

    " record output of the default server to 
    " ~/sc-rec/<name-of-current-document>/<timestamp>.wav
    nnoremap <silent><buffer> <F7> :call scnvim#sclang#send('s.record("~/sc-rec"+/+PathName(thisProcess.nowExecutingPath).fileNameWithoutExtension+/+Date.localtime.stamp++".wav")')<CR>
    " stop recording
    nnoremap <silent><buffer> <F8> :call scnvim#sclang#send('s.stopRecording')<CR>

    " remap supercollider post window toggle
    nmap <Space>o <Plug>(scnvim-postwindow-toggle)
    nmap <Space>l <Plug>(scnvim-postwindow-clear)

    " include your supercollider project root in nvim's search path
    set path+="~/sc-rec"

    " make sure argument lists are properly closed when using auto-pairs
    let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '|':'|'}

    " make sure deoplete starts up to enable autocompletion of code 
    let g:deoplete#enable_at_startup = 1

endfunction 
" finally, call the function whenever a SuperCollider file opens up
augroup sclang
    autocmd FileType supercollider call s:startSCNvim()
augroup end

" =========== Tidal
" Tidal Terminal
let g:tidal_target = "terminal"

" =========== Polyglot-LaTeX
" Stop vim-polyglot from loading for TeX, using vimtex instead
let g:polyglot_disabled = ['latex']

" set completeopt=menu,menuone,noinsert,noselect

" no bullet indent stuff
let g:indentguides_toggleListMode = get(g:, 'indentguides_toggleListMode', 0)

" vimwiki
" let g:manual='list'
let g:vimwiki_listsyms = '✗○◐●✓'

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

" vifm 
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>

" coc.nvim
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

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

" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" folds on save 
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview 

" fix transparent background in Vim/ Neovim: 
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

set background=dark
syntax on
colorscheme nord
let g:lightline = { 'colorscheme': 'nord' }

" ============================== END ===================================
