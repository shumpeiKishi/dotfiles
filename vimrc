" BASIC SETTINGS --------------------------------
" Set character code to UTF8
set fenc=utf-8

" Reload when the file is changed.
set autoread

" Autocomplete Vim commands
set wildmenu
set wildmode=list:longest,full

" EDIT SETTINGS ---------------------------------
" Convert tabs to spaces.
set expandtab

" Set number of spaces for tab.
set tabstop=2

" Set tab width for >> and << commands.
set shiftwidth=2

" Automatically indent docs.
set autoindent
set smartindent

" ◯□to 全角
set ambiwidth=double

" Auto complete PHP syntax. (Actually not sure what this is...)
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Move to next or previous lines by moving forward.
set whichwrap=h,l

" Allow navigation via mouse.
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
 endif

" Turn off indentation when pasting from clipboard.
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" DISPLAY SETTINGS -------------------------------
" Show line numbers.
set number

" Show tab as "\▸\-".
set list listchars=tab:\▸\-

" Highlight cursor line.
set cursorline 

" Show location of the cursor.
set ruler

" Automatically set syntax for Drupal specific files.
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif
syntax on

" SEARCH CONFIGURATION ----------------------------
" Highlight searching words realtime.
set incsearch

" Highlight search results.
set hlsearch

" Remove highlight by repeat pressing Esc
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Ignore case in search
set ignorecase

" Go back to first search result when finished.
set wrapscan

" KEYMAPS ------------------------------------------
" Autocomplete brackets.
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" PLUGING BY PLUGGED ------------------------------
" vim-plug: https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')
  Plug 'crusoexia/vim-monokai'
  Plug 'pangloss/vim-javascript'
  Plug 'crusoexia/vim-javascript-lib'
  Plug 'scrooloose/nerdtree'
call plug#end()

colorscheme monokai


" REFERENCES ---------------------------------------
" https://www.drupal.org/docs/develop/development-tools/configuring-vim
" http://qiita.com/mfujimori/items/9fd41bcd8d1ce9170301
" http://chat-rate.com/it/1635


