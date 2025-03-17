" vim:tw=0:ts=2:sw=2:et:norl
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/
"   Copyright © 2024 Landon Bouma.
" Summary: dubs_project_tray config.
"   https://github.com/landonb/dubs_project_tray#🗂

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_dubs_project_tray_config
endif

if exists('g:loaded_dubs_project_tray_config') || &cp

  finish
endif

let g:loaded_dubs_project_tray_config = 1

" -------------------------------------------------------------------

" Resize windows with \dV
" -----------------------
" REFER: You probably don't need this if you enable &equalalways.
nnoremap <silent> <Leader>dV :call g:embrace#vresize#VerticalResizeNormalBufferWindowsEqually()<CR>
inoremap <silent> <Leader>dV <C-o>:call g:embrace#vresize#VerticalResizeNormalBufferWindowsEqually()<CR>

