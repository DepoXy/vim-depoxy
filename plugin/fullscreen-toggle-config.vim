" vim:tw=0:ts=2:sw=2:et:norl
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/
"   Copyright © 2024 Landon Bouma.
" Summary: vim-buffer-delights config.
"   https://github.com/embrace-vim/vim-fullscreen-toggle#💯

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_vim_depoxy_fullscreen_toggle_config
endif

if exists('g:loaded_vim_depoxy_fullscreen_toggle_config') || &cp

  finish
endif

let g:loaded_vim_depoxy_fullscreen_toggle_config = 1

" -------------------------------------------------------------------

" CXREF:
" ~/.vim/pack/landonb/start/vim-fullscreen-toggle/autoload/embrace/resize.vim

" Default: s:pixels_per_col = 7.014
let g:fstoggle_pixels_per_col = 7.014
" Default: s:pixels_per_row = 16.180
let g:fstoggle_pixels_per_row = 14.580

" CXREF:
" ~/.vim/pack/landonb/start/vim-fullscreen-toggle/autoload/embrace/fullscreen_toggle.vim

call g:embrace#fullscreen_toggle#CreateMaps()

call g:embrace#fullscreen_toggle#InitWindowSize()

