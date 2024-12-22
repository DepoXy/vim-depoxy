" <Shift-Ctrl> bindings kludge.
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/
"  vim:tw=0:ts=2:sw=2:et:norl:ft=vim
" Copyright © 2024 Landon Bouma.

" ########################################################################

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet g:loaded_vim_depoxy_vim_shift_ctrl_bindings
endif

if exists('g:loaded_vim_depoxy_vim_shift_ctrl_bindings') || &cp

  finish
endif

let g:loaded_vim_depoxy_vim_shift_ctrl_bindings = 1

" ########################################################################

" KLUGE: <Shift-Ctrl> Vim bindings.
" - CXREF: See Alacritty substitutions for terminal `vim`:
"     ~/.depoxy/ambers/home/.config/alacritty/alacritty.toml
" - CXREF: See Hammerspoon substitution for MacVim:
"     ~/.depoxy/ambers/home/.hammerspoon/depoxy-hs.lua

" CXREF: ~/.vim/pack/landonb/start/dubs_edit_juice/plugin/dubs_edit_juice.vim
"   inoremap <S-C-D> <C-O>:call CursorFriendlyIndent(1)<CR>
"   inoremap <S-M-D> <C-O>:call CursorFriendlyIndent(1)<CR>
" CXREF: ~/.depoxy/ambers/home/.config/alacritty/alacritty.toml
"   { key = "D", mods = "Control|Shift", chars = "\uE003" },
inoremap  <C-O>:call CursorFriendlyIndent(1)<CR>

" CXREF: ~/.vim/pack/landonb/start/dubs_edit_juice/plugin/ctrl-backspace.vim
"   inoremap <c-s-w> <C-O>:<C-U>call <SID>delete_back_line()<CR>
"   inoremap <m-s-w> <C-O>:<C-U>call <SID>delete_back_line()<CR>
" CXREF: ~/.depoxy/ambers/home/.config/alacritty/alacritty.toml
"   { key = "W", mods = "Control|Shift", chars = "\uE016" },
inoremap  <C-O>:<C-U>call dubs_edit_juice_backspace#delete_back_line()<CR>

" ########################################################################

