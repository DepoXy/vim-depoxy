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
  unlet! g:loaded_vim_depoxy_buffer_delights_config
endif

if exists('g:loaded_vim_depoxy_buffer_delights_config') || &cp

  finish
endif

let g:loaded_vim_depoxy_buffer_delights_config = 1

" -------------------------------------------------------------------

" DUNNO: Cannot use <expr> for <Plug> call, e.g.:
"   nnoremap <silent> <expr> <script> <Plug>(vim-depoxy-close-vim-help-window)
"     \ g:embrace#windows#CloseVimHelpWindow()
" which cause error such as:
"   Error detected while processing function embrace#windows#CloseVimHelpWindow:
"   line    9:
"   E565: Not allowed to change text or change window
" which is this line:
"   execute l:curr_winnr . "wincmd q"

" CXREF:
" ~/.kit/nvim/embrace-vim/start/vim-buffer-delights/autoload/embrace/windows.vim

function! s:CreateMaps__CloseVimHelpWindow(key_sequence = '<Leader>dG') abort
  nnoremap <silent> <script> <Plug>(vim-depoxy-close-vim-help-window)
    \ :call g:embrace#windows#CloseVimHelpWindow()<CR>

  execute 'nnoremap' .. a:key_sequence .. ' <Plug>(vim-depoxy-close-vim-help-window)'

  execute 'inoremap ' .. a:key_sequence .. ' <C-O><Plug>(vim-depoxy-close-vim-help-window)'
endfunction

call s:CreateMaps__CloseVimHelpWindow('<Leader>dG')

" -------------------------------------------------------------------

" Open Scratch window with \dN (and enter Insert mode)
" ----------------------------
nnoremap <silent> <Leader>dN :call g:embrace#scratch#CreateScratchWindow()<CR>i
inoremap <silent> <Leader>dN <C-o>:call g:embrace#scratch#CreateScratchWindow()<CR>

" -------------------------------------------------------------------

" Resize windows with \dW
" -----------------------
nnoremap <silent> <Leader>dV :call g:embrace#vresize#VerticalResizeNormalBufferWindowsEqually()<CR>
inoremap <silent> <Leader>dV <C-o>:call g:embrace#vresize#VerticalResizeNormalBufferWindowsEqually()<CR>

