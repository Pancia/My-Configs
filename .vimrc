set nocompatible

" PLUGINS "{{{
call plug#begin('~/.vim/plugged')
" Essentials {{{
Plug 'vim-scripts/vim-auto-save'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'takac/vim-spotifysearch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
" }}} Essentials
" Movement {{{
Plug 'Lokaltog/vim-easymotion'
Plug 'deris/vim-shot-f'
Plug 'Shougo/vimproc.vim',     { 'do' : 'make' }
" }}} Movement
" AutoComplete {{{
Plug 'Valloric/YouCompleteMe', { 'do' : 'git submodule update --init --recursive; ./install.sh --clang-completer' }
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
" }}} AutoComplete
" Clojure {{{
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
"TODO: Lag caused by one of the following?
Plug 'tpope/vim-leiningen'
Plug 'clojure-emacs/cider-nrepl'
Plug 'tpope/vim-fireplace'
" }}} Clojure
" Haskell {{{
Plug 'dag/vim2hs',          { 'for' : 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for' : 'haskell' }
Plug 'eagletmt/neco-ghc',   { 'for' : 'haskell' }
" }}} Haskell
" Elixir {{{
Plug 'elixir-lang/vim-elixir', { 'for' : 'elixir' }
" }}} Elixir
" Prolog {{{
Plug 'adimit/prolog.vim', { 'for' : 'prolog' }
" }}} Prolog
" JavaScript {{{
Plug 'jelera/vim-javascript-syntax'
" }}} JavaScript
" Node.js {{{
Plug 'sidorares/node-vim-debugger'
Plug 'moll/vim-node'
Plug 'myhere/vim-nodejs-complete'
"Plug 'marijnh/tern_for_vim'
" }}} Node.js
call plug#end()
" }}} PLUGINS

" PLUGIN CONFIG {{{
" AUTO_SAVE {{{
let g:auto_save=1
let g:auto_save_in_insert_mode=0
" }}} AUTO_SAVE

" CTRLP {{{
let g:ctrlp_by_filename=1
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/target/*,*/dist/*,*/build/*,*/build/*,*.o
set wildignore+=*/.vim/autoload/*,*/.vim/bundle/*,*/.vim/plugged/*
set wildignore+=*/node_modules/*
function! MyCtrlP()
    if expand('%:t') =~ '.vimrc'
        silent! call CtrlP_WithDir('~/.vim')<CR>
    else
        :CtrlP
    endif
endfunction
nnoremap <c-p> :call MyCtrlP()<CR>
" }}} CTRLP

" EASYMOTION {{{
"map <Space>  <Plug>(easymotion-prefix)
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
map <Space>s <Plug>(easymotion-s)
map //       <Plug>(easymotion-sn)
" }}} EASYMOTION

" AIRLINE {{{
let g:airline#extensions#tabline#enabled=1
set laststatus=2 "Always show status line
" }}} AIRLINE

" SYNTASTIC {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_mode_map = {
            \ "mode": "active",
            \ }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_cpp_compiler = 'clang'
let g:syntastic_cpp_compiler_options = '-g -O0 -Wall -Wextra -Wpedantic -std=c++11'
augroup syntastic_plus_autosave
    au CursorHold,InsertLeave * nested update
augroup END
" }}} SYNTASTIC

" ULTISNIPS {{{
let g:UltiSnipsExpandTrigger="<ctrl><cr>"
" }}} ULTISNIPS

" YOUCOMPLETEME {{{
let g:ycm_semantic_triggers = {'haskell' : ['.'], 'javascript' : ['.']}
" Helps with cpp and synastic
" - https://github.com/Valloric/YouCompleteMe#the-gycm_show_diagnostics_ui-option
let g:ycm_show_diagnostics_ui = 0
" Enables & configures semantic completion for c,c++...
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_insertion = 1
" TODO: NOT WORKING, Disable arrow keys
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
" }}} YOUCOMPLETEME

" TAGBAR {{{
let g:tagbar_left = 1
" }}} TAGBAR
" }}} PLUGIN CONFIG

" MAPPINGS {{{
" Disable arrows
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>
nmap <Space> <nop>
nmap <CR> <nop>
" Leader mappings
let mapleader = "<Space>"
map s \
map <Space><Space> \
" Swap j,k with gj,gk
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" map Q to gQ, which is a more useful `q:`
noremap Q gQ
" U redoes
nnoremap U <c-r>
" ctrl-e removes last search highlighting
nnoremap <c-e> :nohlsearch<CR>
" Use BS to navigate cursor history
nmap <BS>   <c-o>
nmap <S-BS> <c-i>
" Center screen when searching
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" alt: {j :bp, k :bn, h :tabp, l :tabn}
map ˚ :bnext<CR>
map ∆ :bprevious<CR>
map ˙ :tabp<CR>
map ¬ :tabn<CR>
" Enter.+ mappings
map <CR>pi  :PlugInstall<CR>
map <CR>pc  :PlugClean<CR>
map <CR>bsh :e ~/.bashrc<CR>
map <CR>vim :e ~/.vimrc<CR>:cd ~/.vim<CR>
map <CR>so  :so %<CR>
map <CR>u   :GundoToggle<CR>
map <CR>dc  :cd ~/dunjeon-crawler/<CR>
map <CR>ss  :SpotifySearch<space>
map <CR>tb  :TagbarToggle<CR>
command! Bda 1,99bdelete
map <CR>bda :Bda<CR>
"}}} MAPPINGS

" SETTINGS {{{
filetype plugin indent on
set backspace=indent,eol,start
set nobackup
set noswapfile
set history=100 "Number of mdl lines
set ruler
set showcmd
set incsearch
set number
set hlsearch
set tabstop=4 "Tab Literal(\t) == width 4
set shiftwidth=4 "Indent Key(Tab) == width 4
set expandtab "Use spaces, not tabs!
set smarttab "Indent & delete by shiftwidth
set guifont=Menlo\ Regular:h22
set visualbell "Dont make noise
set foldmethod=indent
set wildmenu "Visual autocomplete for command menu
set lazyredraw "Silly macros
set cursorline "Highlight line cursor is on
if exists("&undodir")
    set undofile
    "store undo files in .vim/undo & make the path unique
    set undodir=~/.vim/undo//
    set undolevels=500
    set undoreload=500
endif
let g:strip_whitespace_on_save = 1
" }}} SETTINGS

" THEME {{{
colorscheme darkblue
silent! colorscheme macvim
hi folded guibg=#707070
" }}} THEME

" AUTOGROUPS {{{
function! SetCursorToLastKnownPosition()
    if &filetype !~ 'git\|commit\c'
        if line("'\"") > 1 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    endif
endfunction
augroup Essentials
    au!
    au FileType text setlocal textwidth=80
    au BufReadPost * call SetCursorToLastKnownPosition()
    au FileType vim setlocal foldmethod=marker
    autocmd BufEnter * silent! lcd %:p:h " Eqv to `set autochdir`
augroup END
augroup RainbowParens
    au!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
augroup END
augroup Assorted
    au BufNewFile,BufRead *.loki set filetype=clojure
augroup END
" }}} AUTOGROUPS

" VIM TIPS / HELP / TRICKS {{{
" HELP HELP {{{
" ---------------------------------
" :helpg pattern               search grep!! ---  JUMP TO OTHER MATCHES WITH: >
" :help holy-grail
" :help all
" :help termcap
"  :help user-toc.txt          Table of contents of the User Manual. >
"  :help :subject              Ex-command "subject", for instance the following: >
"  :help :help                 Help on getting help. >
"  :help CTRL-B                Control key <C-B> in Normal mode. >
"  :help 'subject'             Option 'subject'. >
"  :help EventName             Autocommand event "EventName"
"  :help pattern<Tab>          Find a help tag starting with "pattern".  Repeat <Tab> for others. >
"  :help pattern<Ctrl-D>       See all possible help tag matches "pattern" at once. >
"                 :cn                         next match >
"                 :cprev, :cN                 previous match >
"                 :cfirst, :clast             first or last match >
"                 :copen,  :cclose            open/close the quickfix window; press <Enter> to jump to the item under the cursor
" }}}

" SET HELP {{{
" ---------------------------------
" :verbose set opt? - show where opt was set
" set opt!              - invert
" set invopt            - invert
" set opt&              - reset to default
" set all&              - set all to def
" :se[t]                        Show all options that differ from their default value.
" :se[t] all            Show all but terminal options.
" :se[t] termcap                Show all terminal options.  Note that in the GUI the
" }}}

" TAB HELP   {{{
" ---------------------------------
" tc    - create a new tab
" td    - close a tab
" tn    - next tab
" tp    - previous tab
" }}}

" UPPERCASE, LOWERCASE, INDENTS {{{
" ---------------------------------
" '.    - last modification in file!
" gf  - open file under cursor
" guu - lowercase line
" gUU - uppercase line
" =   - reindent text
" }}}

" FOLDS {{{
" ---------------------------------
" F     - create a fold from matching parenthesis
" fm    - (zm)  more folds
" fl  - (zr) less/reduce folds
" fo    - open all folds (zR)
" fc    - close all folds (zM)
" ff  -  (zf)   - create a fold
" fd    - (zd)  - delete fold at cursor
" zF    - create a fold N lines
" zi    - invert foldenable
" }}}

" KEYSEQS HELP {{{
" ---------------------------------
" CTRL-I - forward trace of changes
" CTRL-O - backward trace of changes!
" C-W W  - Switch to other split window
" CTRL-U                  - DELETE FROM CURSOR TO START OF LINE
" CTRL-^                  - SWITCH BETWEEN FILES
" CTRL-W-TAB  - CREATE DUPLICATE WINDOW
" CTRL-N                  - Find keyword for word in front of cursor
" CTRL-P                  - Find PREV diddo
" }}}

" SEARCH / REPLACE {{{
" ---------------------------------
" :%s/\s\+$//    - delete trailing whitespace
" :%s/a\|b/xxx\0xxx/g             modifies a b      to xxxaxxxbxxx
" :%s/\([abc]\)\([efg]\)/\2\1/g   modifies af fa bg to fa fa gb
" :%s/abcde/abc^Mde/              modifies abcde    to abc, de (two lines)
" :%s/$/\^M/                      modifies abcde    to abcde^M
" :%s/\w\+/\u\0/g                 modifies bla bla  to Bla Bla
" :g!/\S/d                              delete empty lines in file
" }}}

"  COMMANDS {{{
" ---------------------------------
" :runtime! plugin/**/*.vim  - load plugins
" :so $VIMRUNTIME/syntax/hitest.vim       " view highlight options
" :so $VIMRUNTIME/syntax/colortest.vim
" :!!date - insert date
" :%!sort -u  - only show uniq (and sort)
" :r file " read text from file and insert below current line
" :v/./.,/./-1join  - join empty lines
" :e! return to unmodified file
" :tabm n  - move tab to pos n
" :jumps
" :history
" :reg   -  list registers
" delete empty lines
" global /^ *$/ delete
" }}}
" }}} VIM TIPS / HELP / TRICKS
