" Configuration for CoC

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" hi default link CoCHoverRange   Syntax

function! s:show_documentation()
  call CocAction('doHover')
endfunction

" Show documentation when the cursor is above something interesting
autocmd CursorHold * silent call s:show_documentation()
