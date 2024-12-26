" vim:tw=0:ts=2:sw=2:et:norl:ft=vim
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/
" Copyright © 2024 Landon Bouma.

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_vim_depoxy_vim_filetype_help
endif

if exists('g:loaded_vim_depoxy_vim_filetype_help') || &cp

  finish
endif

let g:loaded_vim_depoxy_vim_filetype_help = 1

" -------------------------------------------------------------------

" Let me modify my own help files when opened via :help.

function! s:CreateAutocommands() abort
  augroup vim-depoxy--vim-filetype-help
    au!

    autocmd FileType help
      \ if match(expand('%:p:h'), '/.vim/pack/\(landonb\|DepoXy\|embrace-vim\)/start/') > -1
      \ |   set modifiable noreadonly
      \ | endif
  augroup END
endfunction

call s:CreateAutocommands()

