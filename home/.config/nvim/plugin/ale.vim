" ALE config

" Needed, otherwise it conflicts with Coc.
let g:ale_disable_lsp = 1

" Only run linters that are mentioned
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\}

" Run specified fixers when file is saved
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'css': ['prettier'],
\}

" Always show the side column
let g:ale_sign_column_always = 1

" Don't open window for errors
let g:ale_open_list = 0

" 3 seconds before running ale
let g:ale_completion_delay = 3000

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠️'
