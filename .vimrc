" Copyright 2012 Mahdi Yusuf, all rights reserved.

set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=prc

set re=1

call pathogen#infect()              " adding pathogen to vimrc
call pathogen#helptags()

set nocompatible                    " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                         " display incomplete commands
" filetype plugin indent on           " load file type plugins + indentation

"" Whitespace
set wrap                          " wrap lines
set tabstop=4 shiftwidth=4          " a tab is two spaces (or set this to 4)
set expandtab                       " use spaces, not tabs
set backspace=indent,eol,start      " backspace through everything in insert mode


"Auto Commands
:autocmd BufWrite *.html :normal gg=G        " reindent html files on save

"Abbreviations
:iabbrev @@     yusuf.mahdi@gmail.com
:iabbrev ccopy  Copyright 2012 Mahdi Yusuf, all rights reserved.
:iabbrev pdb    # XXX BREAKPOINT XXX <cr>import pdb; pdb.set_trace()
:iabbrev ppython #!/usr/bin/env python <cr>#-*- coding: utf-8 -*-

"" Searching
set hlsearch                        " highlight matches
set incsearch                       " incremental searching
set ignorecase                      " searches are case insensitive...
set smartcase                       " ... unless they contain at least one capital letter

"" Mappings
nmap <F2> :NERDTreeTabsToggle<CR>   " mapping f2 to NERDTreeToggle
nmap <F3> :GundoToggle<CR>          " mapping f3 to Gundo
nmap <F4> :TagbarToggle<CR>         " mapping f4 to TagbarToggle
nmap <F5> :Gcommit<CR>              " mapping f5 to Gcommit


"" Mapping
let mapleader = ","                 " setting leader to ,

"" Color Scheme & Font
if has("gui_running")
    set guifont=Meslo\ LG\ S\ for\ Powerline:h15
    colorscheme Tomorrow-Night          " Tomorrow Theme
else
    colorscheme Tomorrow-Night-Bright   " Tomorrow Theme
endif

" Disable Pylint on Save
let g:pymode_lint_on_write = 0         " python-mode

" Enable python folding
let g:pymode_folding = 0            " python-mode

set laststatus=2                    " Always show the statusline

"SWAGG
set number                                   " setting line numbers
" set colorcolumn=81                           " line to show 81 character mark
set cursorline                               " shows the horizontal cursor line
nmap <leader>ev :vsplit $MYVIMRC<cr>         " mapping to edit my vimrc quickly
nmap <leader>sv :source $MYVIMRC<cr>         " mapping to source my vimrc quickly

" "Badass Functions
" function! OpenChangedFiles()
"   only " Close all windows, unless they're modified
"   let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
"   let filenames = split(status, "\n")
"   exec "edit " . filenames[0]
"   for filename in filenames[1:]
"     exec "sp " . filename
"   endfor
" endfunction
" command! OpenChangedFiles :call OpenChangedFiles()

"Use Mouse everywhere
set mouse=a

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

" airline
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

" fix pymode frozen
let g:pymode_rope_lookup_project = 0

" neocomplete
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
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
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

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

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

