" NEEDS: python-mode and vim-isort plugins installed
"
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" http://stackoverflow.com/questions/1523482/vimrc-configuration-for-python
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" https://stackoverflow.com/questions/13787475/automatic-headers-when-opening-a-new-python-file-with-vim
au BufNewFile *.py 0r ~/.vim/templates/python.template

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
syntax on
set listchars=tab:>-
set listchars+=trail:.
set ignorecase
set smartcase
set hlsearch

" disable rope
let g:pymode_rope = 0
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']
" ignore pep 8 errors
let g:pep8_ignore="E401, E501"
let g:pymode_lint_ignore = "F0401"
let g:pymode_lint_config = '$HOME/pylint.rc'
" Maximum line length
let g:pymode_options_max_line_length =79
let g:pymode_lint_options_pyflakes = { 'builtins': '_' }
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}

" shortcuts
nmap j <Esc>:tabprev<CR>
nmap k <Esc>:tabnext<CR>

" js folding https://github.com/pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END
