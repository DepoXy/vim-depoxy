" vim:tw=0:ts=2:sw=2:et:norl:ft=vim
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/

" -------------------------------------------------------------------

" ABOUT: Wires a status line clock on Vim startup.
"
"   https://github.com/landonb/vim-title-bar-time-of-day#🕰️

" -------------------------------------------------------------------

" Age-old answer to Quelle heure est il on a mac with no menu bar.

" Note that the titlebar title in MacVim does not update regularly,
" but only when you are interacting with Vim. So you might want to
" consider an alternative (or better yet, complementary) plugin to
" display a clock in the command line window instead (or in addition):
"
"     https://github.com/embrace-vim/vim-command-line-clock

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_vim_depoxy_title_bar_time_of_day
endif

if exists('g:loaded_vim_depoxy_title_bar_time_of_day') || &cp

  finish
endif

let g:loaded_vim_depoxy_title_bar_time_of_day = 1

" -------------------------------------------------------------------

if has('nvim')
  " CXREF: Configured via Lua in Neovim:
  " ~/.kit/nvim/nvim-depoxy/.config/nvim/lua/specs/group--most-entirely.lua

  finish
endif

" CXREF:
" ~/.kit/nvim/landonb/start/vim-title-bar-time-of-day/autoload/embrace/titlebar.vim
call g:embrace#titlebar#Setup({
  \ 'titlebar_disable': 0,
  \ 'clock_rate': 2500,
  \ })

