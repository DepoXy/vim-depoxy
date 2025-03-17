" vim:tw=0:ts=2:sw=2:et:norl
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/
"   Copyright © 2024 Landon Bouma.

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_vim_depoxy_vim_save_close_quit_maps
endif

if exists('g:loaded_vim_depoxy_vim_save_close_quit_maps') || &cp

  finish
endif

let g:loaded_vim_depoxy_vim_save_close_quit_maps = 1

" -------------------------------------------------------------------

function! s:CreateMaps()
  " HSTRY/2024-12-21: Was <LocalLeader>dc, but made a little
  " more cumbersome to signal it's a little-more "destructive".
  " - And now I wonder if \dq save-all-quit should be \dQ...
  "
  " CXREF:
  " ~/.kit/nvim/vim-scripts/start/bbye/plugin/bbye.vim
  " 
  " CALSO: <LocalLeader>dC | <Alt-f>c — the same.
  nnoremap <Leader>dC <cmd>Bdelete<CR>
  inoremap <Leader>dC <cmd>Bdelete<CR>

  " Save all buffers, close all buffers, and quit — so next
  " instance starts with a fresh session.
  " CXREF: <M-f>l → s:RecreateDubsVimMappings()
  "        <M-f>e → s:RecreateDubsVimMappings()
  "        <M-f>x → s:RecreateBuiltinMenuMappings_File()
  " ~/.kit/nvim/landonb/dubs_appearance/plugin/mimic_menu_keymap.vim
  nnoremap <Leader>dQ :wa<CR>:only<CR>:enew<CR>:BufOnly<CR>:qa<CR>
  inoremap <Leader>dQ <C-o>:wa<CR><C-O>:only<CR><C-O>:enew<CR><C-O>:BufOnly<CR><C-O>:qa<CR>
endfunction

call s:CreateMaps()

