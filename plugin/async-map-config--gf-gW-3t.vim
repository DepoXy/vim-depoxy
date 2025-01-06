" vim:tw=0:ts=2:sw=2:et:norl:
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" Summary: Async insert and visual mode maps for `gf`, `gW`, etc.
" License: GPLv3

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_vim_depoxy_async_map_config
endif

if exists('g:loaded_vim_depoxy_async_map_config') || &cp

  finish
endif

let g:loaded_vim_depoxy_async_map_config = 1

" -------------------------------------------------------------------

" An autoload function does not exist until called, or unless explicitly
" loaded. Using `runtime` to load it, however, smells of an anti-pattern:
"
"   'This is definitively not the expected use case.' — Luc Hermitte
"
" https://vi.stackexchange.com/questions/38490/how-to-check-if-an-autoload-function-exists-without-calling-it#comment70364_38494
"
" - Alternatively, we could try-except each function call, e.g.,
"
"     try
"       call g:embrace#async_map#RegisterInsertModeMap('gf', 'gF)
"     catch /^Vim\%((\a\+)\)\=:E117:/
"       " - I.e., embrace-vim/vim-async-map is not installed.
"       endif
"     endtry
"
"   but we're going to need the function anyway, and I'd rather not
"   use try/endtry throughout this script.

function! s:check_deps() abort
  runtime autoload/embrace/async_map.vim

  if !exists("*embrace#async_map#RegisterInsertModeMap")
    echom "ALERT: Please install embrace-vim/vim-async-map to enable async mode maps"

    finish
  endif

  return 1
endfunction

call s:check_deps()

" -------------------------------------------------------------------

" Use `gf` in insert and visual mode to run normal mode `gf`.
"
" CXREF:
" ~/.vim/pack/embrace-vim/start/vim-goto-file-sh/after/plugin/async-mode-maps.vim

function! s:CreateMaps_gf() abort
  let g:vim_goto_file_add_insert_mode_map = 1
  let g:vim_goto_file_add_visual_mode_map = 1
  " (Don't) Use `gf` (instead of `gF`)
  let g:vim_goto_file_use_simple_gf = 0

  " Tell WrapNav not to fiddle with 'j' or 'k'.
  " - CXREF:
  "   ~/.vim/pack/landonb/start/dubs_toggle_textwrap/autoload/toggle_textwrap/wrapnav.vim
  let g:toggle_textwrap_disable_kj = 1

  silent! nunmap <silent> k
  silent! nunmap <silent> j

  if &wrap
    call g:toggle_textwrap#wrapnav#EnableWrapNav()
  else
    call g:toggle_textwrap#wrapnav#DisableWrapNav()
  endif
endfunction

" -------------------------------------------------------------------

" Open files like `gf` but in adjacent window.
"
" CXREF:
" ~/.vim/pack/embrace-vim/start/vim-buffer-delights/autoload/embrace/windows.vim

" MAYBE/2024-12-16: Add true `gF` support, and honor line number postfix.

function! s:CreateMaps_gF() abort
  let l:timeout = 250

  call g:embrace#async_map#RegisterInsertModeMap(
    \ "gF",
    \ ":call g:embrace#windows#open_file_adjacent()\<CR>",
    \ l:timeout,
    \ )

  nnoremap gF :call g:embrace#windows#open_file_adjacent()<CR>
  vnoremap gF y:call g:embrace#windows#open_file_adjacent('<C-r>"')<CR>

  " Now that gF remapped, assign gF to regular gf.
  " - THOTS: I cannot think of when I'd want to use gf and not gF...
  "   though if there were ever such a case, then maybe reassign
  "   open_file_adjacent to something other than gF so you can
  "   reclaim regular gf and gF.
  "   - You can also select a path and gf and it'll do regular gf.
  nnoremap gf gF 
endfunction

" -------------------------------------------------------------------

" Add async 2-character insert mode map so you can run `gW` from insert
" mode (and use async plugin so it doesn't cause input to briefly pause,
" which is how a naïve `imap gW gW` would behave).

function! s:CreateMap_InsertMode_gW() abort
  " - TIMED: When it's as easy mapping, like 'kj' or 'jk', it's easy to
  "   press the two keys quickly, within 100 msec.
  "   - But the 'gW' keypress is a little trickier, and author finds it
  "     taking ~165 msec. sometimes. So set a longer timeout specifically
  "     for this particular sequence.
  let l:timeout = 250

  call g:embrace#async_map#RegisterInsertModeMap("gW", "gW", l:timeout)
endfunction

" Also wire visual mode `gW`.
" - CXREF:
"   ~/.vim/pack/embrace-vim/start/vim-webopen/autoload/embrace/browser.vim @ 267
function! s:CreateMap_VisualMode_gW() abort
  " [y]ank selected text to `"` register, then paste `"` contents as fcn. arg.
  vnoremap gW y:call g:embrace#browser#WebOpenUrl('<C-r>"', 0)<CR>
endfunction

function! s:CreateMaps_gW() abort
  call s:CreateMap_InsertMode_gW()
  call s:CreateMap_VisualMode_gW()
endfunction

" -------------------------------------------------------------------

" I originally had an abbreviation for quickly creating a reST header
" using the current time as the title, and over- and underlining with
" pound symbols (`#`) as the delimiter.
"
" - E.g., given this iabbrev:
"
"     iabbrev <expr> 3t '################<CR>' . strftime("%Y-%m-%d %H:%M") . '<CR>################<CR>'
"
"   If you'd type `3t<CR>`, you'd get:
"
"     ################
"     2024-12-11 02:06
"     ################
"
"     {cursor}
"
"   But I broke the abbreviation with a CoC <CR> binding:
"
"     inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : '\<CR>'
"
"   And then the `3t` iabbrev would no longer complete with <CR>.
"
"   - You could use <Ctrl-Enter> instead, but my brain didn't like this.
"
"     Or you could type a space or punctuation, but then you'd have to
"     clean up the extra character. Also, the cursor would be on the
"     line directly under the underline, and not after a blank line.
"
" - Fortunately, I made the `vim-async-map` recently, just a few days
"   after I fiddled with the CoC config, and now, a few days after creating
"   the async mode mapper plugin, I realized I can use it to solve the
"   problem I created!
"
"   - As an added bonus, the new map works *without* a carriage return!
"
"     (Though hopefully I won't keep hitting return anyway!=)
"
" So here it is, the glorious `3t` iabbrev reborn as an async map sequence!

" MAYBE/2024-12-11: Add async mode map feature to restrict this abbrev.
" to ft=rst,markdown,txt
function! s:CreateMap_InsertMode_3t() abort
  call g:embrace#async_map#RegisterInsertModeMap(
  \   "3t",
  \   "i################\<CR>\<C-R>=strftime('%Y-%m-%d %H:%M')\<C-M>\<CR>################\<CR>\<CR>"
  \ )
endfunction

" -------------------------------------------------------------------

" Set a reasonable default async mapper timeout.
" - SAVVY: The plugin alerts and hints at fixes if Python 3 not available,
"   which is required to set a timeout under 2,000 msecs.
let g:vim_async_map_timeout = 100

" Enable `gf` insert and visual mode maps.
call s:CreateMaps_gf()

" Open files like `gf` but in adjacent window.
call s:CreateMaps_gF()

" Enable `gW` insert and visual mode maps.
call s:CreateMaps_gW()

" Author's reST header injector (like an abbrev/snippet).
call s:CreateMap_InsertMode_3t()

