" vim:tw=0:ts=2:sw=2:et:norl
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/
"   Copyright © 2024 Landon Bouma.
" Summary: https://github.com/landonb/dubs_after_dark#🌃
"   https://github.com/embrace-vim/vim-webopen#🐣

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_vim_depoxy_vim_after_dark_config
endif

if exists('g:loaded_vim_depoxy_vim_after_dark_config') || &cp

  finish
endif

let g:loaded_vim_depoxy_vim_after_dark_config = 1

" -------------------------------------------------------------------

try
  colorscheme after-dark
catch
  echom "ALERT: Dubs After Dark is not installed!"
endtry

