call plug#begin('~/.local/share/nvim/plugged')

" Color theme
Plug 'morhetz/gruvbox'

" Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Commenting
Plug 'preservim/nerdcommenter'

" Object motions for python, easy navigation in python
Plug 'jeetsukumaran/vim-pythonsense'

" Python identation done according to pep8
Plug 'Vimjas/vim-python-pep8-indent'

" Python syntax highlighting
Plug 'vim-python/python-syntax'

" Custom snippets
Plug 'sirver/ultisnips'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Show buffer visuals and status lines on top/bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Real time linter and completion
Plug 'dense-analysis/ale'

" Go language support
Plug 'fatih/vim-go'

" Typescript syntax
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Please fix typescript indent
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

" CSS
Plug 'styled-components/vim-styled-components'

" Git stuff
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Find and replace
Plug 'brooth/far.vim'

call plug#end()


" Lua plugin configs
lua <<EOF
require 'plugins.gitsigns'
EOF


" Random configuration
:let mapleader = "\<Space>"
set number " Always show line numbers
set cursorline " Highlight the currentline
set so=5 " Scroll when close to screen boundaries
" Show tabs and spaces
set list
set listchars=tab:>-
set shiftwidth=4 " Tab length is 4 spaces
set autoindent
set smarttab
set expandtab " Tabs are converted to spaces
set tabstop=4 " Define tabstop as 4 spaces
set softtabstop=4

" Ignore unnecessary files
set wildignore+=__pyache__
set wildignore+=.pyc
set wildignore+=*/.git/*

"Set line marker at column 80
set colorcolumn=88,100

set backspace=indent,eol,start


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" SimpylFold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0


" buffers
" left buffer
noremap <leader>h <Esc>:bp<CR>
" right buffer
noremap <leader>l <Esc>:bn<CR>
" close buffer
noremap <leader>j <Esc>:bd<CR>


" javascript/typescript indenting
autocmd FileType javascript,typscript,jsx,tsx setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab

