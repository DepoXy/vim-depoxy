" vim:tw=0:ts=2:sw=2:et:norl:ft=vim
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/

" -------------------------------------------------------------------

" ABOUT: Wires a status line clock on Vim startup.
"
"   https://github.com/landonb/dubs_mescaline#🍄

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_vim_depoxy_mescaline
endif

if exists('g:loaded_vim_depoxy_mescaline') || &cp

  finish
endif

let g:loaded_vim_depoxy_mescaline = 1

" -------------------------------------------------------------------

if has('nvim')
  " CXREF: Configured via Lua in Neovim:
  " ~/.kit/nvim/nvim-depoxy/.config/nvim/lua/specs/group--most-entirely.lua

  finish
endif

" CXREF:
" ~/.kit/nvim/embrace-vim/start/vim-command-line-clock/autoload/embrace/command_line_clock.vim
call g:embrace#mescaline#Setup({
  \ 'clock_enable': 1,
  \ 'clock_rate': 2500,
  \ 'git_icon': '',
  \ })

