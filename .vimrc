"----------------------
"--basically settings--
"----------------------

filetype off

"show encoding
set statusline=[%{&fileencoding}]%{fugitive#statusline()}

"always show statusline
set laststatus=2

"file enc
set fileencoding=utf-8

"show line number
set number

"search
set smartcase

"search with highlighting
set hlsearch

"use indent algorythm to cindent
set cindent

"seve to current directory
set browsedir=buffer

set autoread
set nobackup
set noswapfile
set noundofile

"clipboard
set clipboard=unnamed,autoselect

"syntax highlight
syntax on

"tab to space
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"emphasize tab and space
highlight space ctermbg=gray guibg=gray
match space /\s\+$/

" escape insert mode
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>

" moving cursol in insert mode
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Esc removes search highlight
nnoremap <Esc><Esc> :nohlsearch<CR>

" complement brace
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap < <><Left>
inoremap <% <%%><Left><Left>

" reload alias
nnoremap rr :e!<CR>

" use OverCommandLine in replacing
nnoremap <silent> ,s :OverCommandLine<CR>%s/
vnoremap <silent> ,s :OverCommandLine<CR>s/


"-------------
"--neobundle--
"-------------

set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
  \ },
\ }
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'L9'
NeoBundle 'sudo.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'rails.vim'
NeoBundle 'surround.vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'fugitive.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'yanktmp.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'ruby-matchit'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'switch.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'taglist.vim'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'ref.vim'
NeoBundle 'terryma/vim-multiple-cursors.git'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'osyo-manga/vim-operator-search'
NeoBundle 'monochromegane/unite-yaml'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'szw/vim-tags'
NeoBundle 'git://git.wincent.com/command-t.git'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'pasela/unite-webcolorname'
NeoBundle 'fxn/vim-monochrome'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'basyura/unite-rails'
NeoBundle 'very-monochrome-grey-theme'
NeoBundle 'rename.vim'
NeoBundle 'othree/html5.vim'

""filetype plugin on
NeoBundleCheck


"-------------
"---yanktmp---
"-------------

map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>


"---------------
"--neosnippets--
"---------------

" Plugin key-mappings.
imap <C-[>     <Plug>(neosnippet_expand_or_jump)
smap <C-[>     <Plug>(neosnippet_expand_or_jump)
xmap <C-[>     <Plug>(neosnippet_expand_target)


"-------------------------
"--vim-rails+neosnippets--
"-------------------------

autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip


"------------
"--quickrun--
"------------

let g:quickrun_config={}
let g:quickrun_config['markdown']={
  \   'outputter': 'browser'
  \ }


"---------------------
"--vim-indent-guides--
"---------------------

hi IndentGuidesEven ctermbg=darkgray

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0


"-----------
"--TagList--
"-----------

let g:tlist_javascript_settings = 'javascript;c:class;m:method;F:function;p:property'


"---------
"--ctags--
"---------

nnoremap <C-]> g<C-]>


"-------------------
"--operator-search--
"-------------------

nmap <Space>s <Plug>(operator-search)
nmap <Space>/ <Plug>(operator-search)if


"---------
"--unite--
"---------

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:unite_source_rec_min_cache_files = 1
let g:unite_source_rec_max_cache_files = 25000

call unite#custom#source('file_rec', 'ignore_pattern', '\(png\|.git\|jpeg\|jpg\)$')
" call unite#custom#source('file_rec', 'filters', ['converter_relative_word'])
" call unite#custom#source('file_mru', 'filters', ['converter_relative_word'])

function! ChangeCurrentDirectoryToProjectRoot()
  let root = unite#util#path2project_directory(expand('%'))
  execute ":lcd " . root
endfunction
:au BufEnter * :call ChangeCurrentDirectoryToProjectRoot()

nnoremap <silent> ,ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,ur :<C-u>UniteResume search-buffer<CR>

nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>Unite file_rec:!<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,uc :<C-u>Unite webcolorname<CR>

nnoremap <silent> ,rm :<C-u>Unite rails/model<CR>
nnoremap <silent> ,rv :<C-u>Unite rails/view<CR>
nnoremap <silent> ,rc :<C-u>Unite rails/controller<CR>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"---------------
"--neocomplete--
"---------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions',
      \ 'php' : $HOME.'/.vim/dict/php.dict',
      \ 'ruby' : $HOME.'/.vim/dict/ruby.dict'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-u>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-;> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"overwrite completefunc
let g:neocomplete#force_overwrite_completefunc=1


"-------------------
"--filetype indent--
"-------------------

filetype plugin indent on

"respective filetype indent
autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 noet
autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
autocmd FileType css        setlocal sw=4 sts=4 ts=4 noet
autocmd FileType diff       setlocal sw=4 sts=4 ts=4 noet
autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 noet
autocmd FileType html       setlocal sw=4 sts=4 ts=4 noet
autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript setlocal sw=4 sts=4 ts=4 noet
autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
autocmd FileType vb         setlocal sw=4 sts=4 ts=4 noet
autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 noet
autocmd FileType xml        setlocal sw=4 sts=4 ts=4 noet
autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh        setlocal sw=2 sts=2 ts=2 et
autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd FileType puppet     setlocal sw=2 sts=2 ts=2 et
autocmd FileType tpl        setlocal sw=2 sts=2 ts=2 et

colorscheme monochrome
