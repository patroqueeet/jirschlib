" NEEDS: python-mode and vim-isort plugins installed
"
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

" folding for filetypes
set foldmethod=indent
autocmd BufNewFile,BufReadPost *.py setl foldnestmax=2
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent shiftwidth=2 expandtab foldnestmax=2
autocmd BufNewFile,BufReadPost *.html setl foldnestmax=10

" render on save
autocmd BufWritePre *.py :Isort
autocmd BufWritePre *.py :Black

" http://stackoverflow.com/questions/1523482/vimrc-configuration-for-python
au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" https://stackoverflow.com/questions/13787475/automatic-headers-when-opening-a-new-python-file-with-vim
au BufNewFile *.py 0r ~/.vim/templates/python.template

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set listchars=tab:>-
set listchars+=trail:.
set ignorecase
set smartcase
set hlsearch
set backspace=indent,eol,start

" shortcuts
nmap j <Esc>:tabprev<CR>
nmap k <Esc>:tabnext<CR>
" fix https://github.com/fisadev/vim-isort/issues/15
let g:vim_isort_config_overrides = {'multi_line_output': 3}

""" VUNDLE
set nocompatible              " required
filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
"Plugin 'nvie/vim-flake8'
Plugin 'fisadev/vim-isort'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'arunsahadeo/webval'
"Plugin 'joeyemard/Python'
Plugin 'ambv/black'
Plugin 'eslint/eslint'
Plugin 'python-mode/python-mode'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=88  |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1

" disable rope
let g:pymode_rope = 0
let g:pymode_lint = 1
" in .vim/bundle/python-mode/pymode/lint.py:L100
" change to `err_dict["text"] = f"[{e.number}] {e.message}"`
" to display err nr
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']
"" ignore pep 8 errors
let g:pymode_lint_config = '$HOME/pylint.rc'
" Maximum line length
let g:pymode_options_max_line_length = 88
let g:pymode_lint_options_pyflakes = { 'builtins': '_' }
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}
let g:pymode_python = 'python3'

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read())
EOF

" py3 as default
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_auto_jump = 0

" end of file!
syntax enable
