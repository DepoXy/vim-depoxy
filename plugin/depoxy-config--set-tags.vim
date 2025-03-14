" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/
"  vim:tw=0:ts=2:sw=2:et:norl:ft=vim
" Copyright © 2020 Landon Bouma.

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_vim_depoxy_depoxy_config_set_tags
endif

if exists('g:loaded_vim_depoxy_depoxy_config_set_tags') || &cp

  finish
endif

let g:loaded_vim_depoxy_depoxy_config_set_tags = 1

" -------------------------------------------------------------------

" Load ~~Exuberant~~ Universal Ctags tags file for DepoXy sources.
"
" - I.e., for the dozens (100s?) of project symlinks under ~/.projlns:
"
"   ~/.projlns/depoxy-deeplinks (aka $DEPOXY_PROJLNS_DEPOXY)
"
" Default |'tags'| values:
" - Vim:
"     tags=./tags,tags
" - Neovim:
"     tags=./tags;,tags
"   - DUNNO: Docs don't mention what the semicolon means.
" - Per './tags', looks first for tags file adjacent to current file,
"   then per 'tags', a tags file in current working directory. Though
"   in normal DepoXy usage, you won't find either such file (unless
"   you add your own).
" - DepoXy adds the ~/.projlns/depoxy/deep-links/tags file last.
"
" CXREF: The ~/.projlns 'tags' file is created on `mr -d / infuse`:
"   infuse_projects_links_core_generate_ctags
"     ~/.depoxy/ambers/home/.projlns/infuse-projlns-core.sh
" - Note that even with modern LSP tooling, the DepoXy tags file still has
"   merit, especially for intra-project shell and Vimscript functions.

function! s:SetTagsProjlnsDepoxydeeplinks()
  let l:ctags_file = $DEPOXY_PROJLNS_DEPOXY .. '/tags'

  if !filereadable(l:ctags_file)
    let l:ctags_file = $HOME .. '/.projlns/depoxy-deeplinks/tags'
  endif

  if filereadable(l:ctags_file)
    exec 'set tags=./tags,tags,' .. l:ctags_file
  endif
endfunction

call s:SetTagsProjlnsDepoxydeeplinks()

