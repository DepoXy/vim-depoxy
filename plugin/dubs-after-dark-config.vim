" vim:tw=0:ts=2:sw=2:et:norl
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/
"   Copyright © 2024 Landon Bouma.
" Summary: https://github.com/landonb/dubs_after_dark#🌃
"   https://github.com/embrace-vim/vim-webopen#🐣

" -------------------------------------------------------------------

" ISOFF/2025-02-01: Now called by ~/.config/nvim/init.lua or ~/.vimrc
" so that it loads before any plugin.
" - Not that author has ever had any problem loading at plugin time,
"   but at leasy lazy.nvim documentation stresses that you load and
"   set the colorscheme before loading other plugins.

finish

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_vim_depoxy_dubs_after_dark_config
endif

if exists('g:loaded_vim_depoxy_dubs_after_dark_config') || &cp

  finish
endif

let g:loaded_vim_depoxy_dubs_after_dark_config = 1

" -------------------------------------------------------------------

" NOTED/2025-01-23: This call unnecessary, as it's done by
" depoxy-vim/.vimrc:
"
"   ~/.depoxy/ambers/home/.vim/.vimrc

try
  colorscheme after-dark
catch
  echom "ALERT: Dubs After Dark is not installed!"
endtry

