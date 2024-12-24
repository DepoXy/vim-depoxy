" vim:tw=0:ts=2:sw=2:et:norl
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/
"   Copyright © 2024 Landon Bouma.
" Summary: vim-buffer-delights config.
"   https://github.com/embrace-vim/vim-buffer-delights#🍧

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_vim_depoxy_vim_buffer_delights_config
endif

if exists('g:loaded_vim_depoxy_vim_buffer_delights_config') || &cp

  finish
endif

let g:loaded_vim_depoxy_vim_buffer_delights_config = 1

" -------------------------------------------------------------------

" CXREF:
" ~/.vim/pack/embrace-vim/start/vim-buffer-delights/autoload/embrace/windows.vim

function! s:CreateMaps__CloseVimHelpWindow(key_sequence = '<Leader>dG') abort
  nnoremap <silent> <expr> <script> <Plug>(vim-depoxy-close-vim-help-window)
    \ g:embrace#windows#CloseVimHelpWindow()

  execute 'nnoremap <silent> ' .. a:key_sequence .. ' <Plug>(vim-depoxy-close-vim-help-window)'

  execute 'nnoremap <silent> ' .. a:key_sequence .. ' <Plug>(vim-depoxy-close-vim-help-window)'
endfunction

call s:CreateMaps__CloseVimHelpWindow('<Leader>dG')

