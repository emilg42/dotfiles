"                _         
"    ____ _   __(_)___ ___ 
"   / __ \ | / / / __ `__ \
"  / / / / |/ / / / / / / /
" /_/ /_/|___/_/_/ /_/ /_/ 
"         
" customized init.vim for neovim (https://neovim.io)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim specifications
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug for handling plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" [Generic Plugins]
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
" [Navigation]    
    Plug 'preservim/nerdtree'
" [Appearance]
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" [Syntax]
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Generic settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch       " incremental search
set hlsearch        " highlight results
set nobackup        " no automatic backups
set noswapfile      " no swap
set number          " linenumbers
set nowrap          " no line wrapping
set smartcase       " smarter search
set noerrorbells    " no error sounds
set smartindent     " smarter indenting

set clipboard=unnamedplus       " universal clipboard
set mouse=nicr                  " mouse capabilites
set guicursor=                  " block cursor

set t_Co=256        " 256 colors
syntax enable       " basic syntax highlighting


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indendation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab       " replace tabs
set smarttab        " smarter usage
set shiftwidth=4    " one tab corresponds to 4 spaces
set tabstop=4       " one tab correspons to 4 spaces


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has('termguicolors'))
  set termguicolors
endif

let g:material_terminal_italics = 0
let g:material_theme_style = 'default'

colorscheme material

" transparent background
hi Normal guibg=NONE ctermbg=NONE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlighted line number
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" tabline
set laststatus=2     " always display statusline
set noshowmode       " disable default indicator

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" air-line
let g:airline_theme = 'material'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' : '
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' : '
let g:airline_symbols.maxlinenr = ' ☰ '


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <F8> : !gcc % && ./a.out <CR>

