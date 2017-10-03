set runtimepath+=$HOME/.vim
call pathogen#infect()

" NERDTree alias
map <F2> :NERDTreeToggle<CR>

" Lorem Ipsum text
command -nargs=* Lipsum Loremipsum <args>

" Go language support.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
set hidden

" Default color scheme, indentation, etc
set background=dark
colorscheme seoul256
let g:seoul256_background=235
set autoread nobackup nowritebackup noswapfile
set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab smarttab
set autoindent copyindent
set guifont=Fira\ Code:h14
if has("gui_macvim")
	set macligatures
end
set number ruler cc=80
set nowrap
set encoding=utf-8
set backspace=indent,eol,start
set showmatch hlsearch incsearch
set ignorecase smartcase
set mouse=a
syntax on

" Lightline configuration
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" Enable filetype plugins
filetype plugin indent on

" Turn on Terraform auto format
let g:terraform_fmt_on_save=1

" Display leading/trailing whitespace
set listchars=tab:--,trail:#,nbsp:+
set list

" Smart Home-Button Behavior from http://vim.wikia.com/wiki/Smart_home
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif

  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction
noremap <expr> <silent> <Home> SmartHome()
imap <silent> <Home> <C-O><Home>

" Conque shell
command Bash ConqueTerm bash
let g:ConqueTerm_Color = 2

" Rotating between indentation styles (F9).
function SwitchTabStyle()
  " Style 1: Tabs, not spaces
  " Style 2: 2 spaces
  " Style 3: 4 spaces
  if &expandtab == 0
    " Switch to style 2
    set tabstop=2 shiftwidth=2 softtabstop=2 expandtab smarttab
    echo "Tab Style: 2 spaces"
  else
    if &tabstop == 2
      " Switch to style 3
      set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab
      echo "Tab Style: 4 spaces"
    else
      " Switch to style 1
      set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab smarttab
      echo "Tab Style: tabs"
    endif
  endif
endfunction
map <F9> :call SwitchTabStyle()<CR>

" Spell check (F7)
map <F7> :setlocal spell spelllang=en_us<CR>

" Windows-specific functionality
if has('win32')
  " SnipMate Windows support
  source ~/.vim/bundle/snipMate/after/plugin/snipMate.vim
  source $VIMRUNTIME/mswin.vim
endif
