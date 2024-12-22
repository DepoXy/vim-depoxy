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
  " LATER/2024-12-13 14:33: But will you use this instead of <M-f>c?
  nnoremap <Leader>dc :Bdelete<CR>
  inoremap <Leader>dc <C-o>:Bdelete<CR>

  " CXREF: <M-f>l → s:RecreateDubsVimMappings()
  "        <M-f>e → s:RecreateDubsVimMappings()
  "        <M-f>x → s:RecreateBuiltinMenuMappings_File()
  " ~/.vim/pack/landonb/start/dubs_appearance/plugin/mimic_menu_keymap.vim
  noremap <Leader>dq :wa<CR>:only<CR>:enew<CR>:BufOnly<CR>:qa<CR>
  inoremap <Leader>dq <C-o>:wa<CR><C-O>:only<CR><C-O>:enew<CR><C-O>:BufOnly<CR><C-O>:qa<CR>
endfunction

call s:CreateMaps()

