" vim:tw=0:ts=2:sw=2:et:norl
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/
"   Copyright © 2024 Landon Bouma.

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet g:loaded_vim_depoxy_vim_save_close_quit_maps
endif

if exists('g:loaded_vim_depoxy_vim_save_close_quit_maps') || &cp

  finish
endif

let g:loaded_vim_depoxy_vim_save_close_quit_maps = 1

" -------------------------------------------------------------------

function! s:CreateMaps()
  " LATER/2024-12-13: But will you use this instead of <M-f>c?
  "
  " THOTS/2024-12-21: I don't actually close files that often!
  " - Especially not some of my 10k line reST files that take
  "   a while to repoen (at least on my underpowered Mac Mini).
  "     nnoremap <Leader>dc :Bdelete<CR>
  "     inoremap <Leader>dc <C-o>:Bdelete<CR>
  " - So let's try something a little more cumbersome (but still
  "   easier than <Alt-f>c).
  "   - Which makes me wonder if \dq save-all-quit should be \dQ...
  nnoremap <Leader>dC :Bdelete<CR>
  inoremap <Leader>dC <C-o>:Bdelete<CR>

  " CXREF: <M-f>l → s:RecreateDubsVimMappings()
  "        <M-f>e → s:RecreateDubsVimMappings()
  "        <M-f>x → s:RecreateBuiltinMenuMappings_File()
  " ~/.vim/pack/landonb/start/dubs_appearance/plugin/mimic_menu_keymap.vim
  noremap <Leader>dQ :wa<CR>:only<CR>:enew<CR>:BufOnly<CR>:qa<CR>
  inoremap <Leader>dQ <C-o>:wa<CR><C-O>:only<CR><C-O>:enew<CR><C-O>:BufOnly<CR><C-O>:qa<CR>
endfunction

call s:CreateMaps()

